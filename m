From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: mt76x2e hardware restart
Date: Sat, 12 Oct 2019 18:50:28 +0200
Message-ID: <20191012165028.GA8739@lore-desk-wlan.lan>
References: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
 <c6d621759c190f7810d898765115f3b4@natalenko.name>
 <9d581001e2e6cece418329842b2b0959@natalenko.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5633521994383968640=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9d581001e2e6cece418329842b2b0959@natalenko.name>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <sgruszka@redhat.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org


--===============5633521994383968640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 19.09.2019 23:22, Oleksandr Natalenko wrote:
> > It checks for TX hang here:
> >=20
> > =3D=3D=3D mt76x02_mmio.c
> > 557 void mt76x02_wdt_work(struct work_struct *work)
> > 558 {
> > ...
> > 562     mt76x02_check_tx_hang(dev);
> > =3D=3D=3D
>=20
> I've commented out the watchdog here ^^, and the card is not resetted any
> more, but similarly it stops working shortly after the first client
> connects. So, indeed, it must be some hang in the HW, and wdt seems to do=
 a
> correct job.
>=20
> Is it even debuggable/fixable from the driver?

Hi Oleksandr,

sorry for the delay. Felix and me worked on this issue today. Could you ple=
ase
try if the following patch fixes your issue?

Regards,
Lorenzo

=46rom cf3436c42a297967235a9c9778620c585100529e Mon Sep 17 00:00:00 2001
Message-Id: <cf3436c42a297967235a9c9778620c585100529e.1570897574.git.lorenz=
o@kernel.org>
=46rom: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 12 Oct 2019 17:32:57 +0200
Subject: [PATCH] mt76: mt76x2: disable pcie_aspm by default

On same device (e.g. U7612E-H1) PCIE_ASPM causes continues mcu hangs and
instability. This patch disable PCIE_ASPM by default. This patch has
been successfully tested on U7612E-H1 mini-pice card

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mmio.c     | 48 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   |  2 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wirele=
ss/mediatek/mt76/mmio.c
index 1c974df1fe25..8e1dbc1903f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -3,6 +3,9 @@
  * Copyright (C) 2016 Felix Fietkau <nbd@nbd.name>
  */
=20
+#include <linux/pci.h>
+#include <linux/pci-aspm.h>
+
 #include "mt76.h"
 #include "trace.h"
=20
@@ -78,6 +81,51 @@ void mt76_set_irq_mask(struct mt76_dev *dev, u32 addr,
 }
 EXPORT_SYMBOL_GPL(mt76_set_irq_mask);
=20
+void mt76_mmio_disable_aspm(struct pci_dev *pdev)
+{
+	struct pci_dev *parent =3D pdev->bus->self;
+	u16 aspm_conf, parent_aspm_conf =3D 0;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &aspm_conf);
+	aspm_conf &=3D PCI_EXP_LNKCTL_ASPMC;
+	if (parent) {
+		pcie_capability_read_word(parent, PCI_EXP_LNKCTL,
+					  &parent_aspm_conf);
+		parent_aspm_conf &=3D PCI_EXP_LNKCTL_ASPMC;
+	}
+
+	if (!aspm_conf && (!parent || !parent_aspm_conf)) {
+		/* aspm already disabled */
+		return;
+	}
+
+	dev_info(&pdev->dev, "disabling ASPM %s %s\n",
+		 (aspm_conf & PCI_EXP_LNKCTL_ASPM_L0S) ? "L0s" : "",
+		 (aspm_conf & PCI_EXP_LNKCTL_ASPM_L1) ? "L1" : "");
+
+#ifdef CONFIG_PCIEASPM
+	pci_disable_link_state(pdev, aspm_conf);
+
+	/* Double-check ASPM control.  If not disabled by the above, the
+	 * BIOS is preventing that from happening (or CONFIG_PCIEASPM is
+	 * not enabled); override by writing PCI config space directly.
+	 */
+	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &aspm_conf);
+	if (!(aspm_conf & PCI_EXP_LNKCTL_ASPMC))
+		return;
+#endif /* CONFIG_PCIEASPM */
+
+	/* Both device and parent should have the same ASPM setting.
+	 * Disable ASPM in downstream component first and then upstream.
+	 */
+	pcie_capability_clear_word(pdev, PCI_EXP_LNKCTL, aspm_conf);
+
+	if (parent)
+		pcie_capability_clear_word(parent, PCI_EXP_LNKCTL,
+					   aspm_conf);
+}
+EXPORT_SYMBOL_GPL(mt76_mmio_disable_aspm);
+
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs)
 {
 	static const struct mt76_bus_ops mt76_mmio_ops =3D {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wirele=
ss/mediatek/mt76/mt76.h
index 8bcc7f21e83c..e95a5893f93b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -596,6 +596,7 @@ bool __mt76_poll_msec(struct mt76_dev *dev, u32 offset,=
 u32 mask, u32 val,
 #define mt76_poll_msec(dev, ...) __mt76_poll_msec(&((dev)->mt76), __VA_ARG=
S__)
=20
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
+void mt76_mmio_disable_aspm(struct pci_dev *pdev);
=20
 static inline u16 mt76_chip(struct mt76_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/=
wireless/mediatek/mt76/mt76x2/pci.c
index 6253ec5fbd72..06fb80163c8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -83,6 +83,8 @@ mt76pci_probe(struct pci_dev *pdev, const struct pci_devi=
ce_id *id)
 	/* RG_SSUSB_CDR_BR_PE1D =3D 0x3 */
 	mt76_rmw_field(dev, 0x15c58, 0x3 << 6, 0x3);
=20
+	mt76_mmio_disable_aspm(pdev);
+
 	return 0;
=20
 error:
--=20
2.21.0

>=20
> --=20
>   Oleksandr Natalenko (post-factum)

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXaIEUQAKCRA6cBh0uS2t
rMgMAP4gYBsBVaqrrJGeL59RvPIDCtDh9B4Cal6r0cZiF8/eawD9E3a71sAvXQRq
77lBM018hpb2RI8zaAU2j9ddT2e6HwU=
=jGHZ
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


--===============5633521994383968640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5633521994383968640==--
