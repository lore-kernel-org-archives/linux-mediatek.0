Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC761C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:19:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F2272085B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkXhzBsW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dw2AtYlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F2272085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aosN6u3jP4g6+UxrH7o95vxFZ+/J2b1VIhTHJy2QQr8=; b=kkXhzBsWt8zLFsnLAaq2XNRVK
	oF2Pqp+UJuV+IZUoYPkfXl+YzbhmhmqjZR44zQg7YYrolSIz9WPhZVQUeP4ddajqRXJUb3yzDu9Ch
	Fe3nNFAh/uaN3me1L7T4yaHdHIDdkouN8GKydNDJyOs+eXVb73vgGV9IhgWk2qMvHL5cprbN1wMFj
	4IdXsXw0PSfQ647JzaB4mpg3HyA+CR8vCY3ogjq8t8f+GK3m0RJqG4gfNhqaZiClB45XM6/PG9m1g
	tIicfRmwdoTx8WASBrY+qj5m9f1BfLB1VJu5y5Qx+Cb5X5ymDyA5gCDbS0R+Js6MFsB7uQj/HyywB
	nqyQl3EuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlsZf-0006Dx-Ng; Thu, 18 Jun 2020 11:19:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlsZa-0006D7-L6
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 11:19:14 +0000
Received: from localhost (unknown [151.48.140.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A29402078D;
 Thu, 18 Jun 2020 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592479149;
 bh=VMTjW3A5rM+/n8uTmhib5xc6DSyPNkBhwsyvBYgZETA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dw2AtYlUis3RrRvXICgjJS9KxGDTJj8qk6FfhNQqgUH4oGN3yA4YYqciaFJtCyJPo
 pJvdkvxTSzNCTq9oZrKXI6OaP57Bcs2S2bm6ELcG+Ufjs+jE1BjVa04Hr3iZDXQL/w
 3hIG/B03CAJSr59A/uIK6CZdg/mQqd2dRqKcljCw=
Date: Thu, 18 Jun 2020 13:18:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Oleksandr Natalenko <oleksandr@redhat.com>
Subject: Re: mt7612 suspend/resume issue
Message-ID: <20200618111859.GC698688@lore-desk.lan>
References: <20200618090556.pepjdbnba2gqzcbe@butterfly.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200618090556.pepjdbnba2gqzcbe@butterfly.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_041910_736187_03746367 
X-CRM114-Status: GOOD (  21.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============7656527663789798021=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7656527663789798021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello, Lorenzo et al.

Hi Oleksandr,

>=20
> I'm using MT7612 mini-PCIE cards as both AP in a home server and as a cli=
ent in
> a laptop. The AP works perfectly (after some fixing from your side; thank=
s for
> that!), and so does the client modulo it has issues during system resume.
>=20

[...]

>=20
> The Wi-Fi becomes unusable from this point. If I `modprobe -r` the "mt76x=
2e" module
> after this splat, the system hangs completely.
>=20
> If the system resumes fine, the resume itself takes quite some time (more=
 than
> 10 seconds).
>=20
> I've found a workaround for this, though. It seems the system behaves fin=
e if I
> do `modprobe -r mt76x2e` before it goes to sleep, and then `modprobe mt76=
x2e`
> after resume. Also, the resume time improves greatly.
>=20
> I cannot say if it is some regression or not. I've installed the card
> just recently, and used it with v5.7 kernel series only.
>=20
> Do you have any idea what could go wrong and how to approach the issue?

I have not reproduced the issue myself yet, but I guess we can try:
1- update to latest Felix's tree [1]
2- could you please try to apply the patch below? (compile-test only)

Regards,
Lorenzo

[1] https://github.com/nbd168/wireless

=46rom 400268a0ee5843cf736308504dfbd2f20a291eaf Mon Sep 17 00:00:00 2001
Message-Id: <400268a0ee5843cf736308504dfbd2f20a291eaf.1592478809.git.lorenz=
o@kernel.org>
=46rom: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 18 Jun 2020 13:10:11 +0200
Subject: [PATCH] mt76: mt76x2: fix pci suspend

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt76x02_dma.h  |  1 +
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c | 15 +++++
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   | 58 +++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_dma.h b/drivers/net=
/wireless/mediatek/mt76/mt76x02_dma.h
index 4aff4f8e87b6..6262f2ecded5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_dma.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_dma.h
@@ -62,5 +62,6 @@ mt76x02_wait_for_wpdma(struct mt76_dev *dev, int timeout)
 int mt76x02_dma_init(struct mt76x02_dev *dev);
 void mt76x02_dma_disable(struct mt76x02_dev *dev);
 void mt76x02_dma_cleanup(struct mt76x02_dev *dev);
+void mt76x02_dma_reset(struct mt76x02_dev *dev);
=20
 #endif /* __MT76x02_DMA_H */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/ne=
t/wireless/mediatek/mt76/mt76x02_mmio.c
index cbbe986655fe..e2631c964331 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -348,6 +348,21 @@ void mt76x02_dma_disable(struct mt76x02_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76x02_dma_disable);
=20
+void mt76x02_dma_reset(struct mt76x02_dev *dev)
+{
+	int i;
+
+	mt76x02_dma_disable(dev);
+	usleep_range(1000, 2000);
+
+	for (i =3D 0; i < __MT_TXQ_MAX; i++)
+		mt76_queue_tx_cleanup(dev, i, true);
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_rx_reset(dev, i);
+
+	mt76x02_dma_enable(dev);
+}
+
 void mt76x02_mac_start(struct mt76x02_dev *dev)
 {
 	mt76x02_mac_reset_counters(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/=
wireless/mediatek/mt76/mt76x2/pci.c
index 53ca0cedf026..5543e242fb9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -103,6 +103,60 @@ mt76pci_remove(struct pci_dev *pdev)
 	mt76_free_device(mdev);
 }
=20
+static int __maybe_unused
+mt76x2e_suspend(struct pci_dev *pdev, pm_message_t state)
+{
+	struct mt76_dev *mdev =3D pci_get_drvdata(pdev);
+	struct mt76x02_dev *dev =3D container_of(mdev, struct mt76x02_dev, mt76);
+	int i, err;
+
+	napi_disable(&mdev->tx_napi);
+	tasklet_kill(&mdev->pre_tbtt_tasklet);
+	tasklet_kill(&mdev->tx_tasklet);
+
+	mt76_for_each_q_rx(mdev, i)
+		napi_disable(&mdev->napi[i]);
+
+	mt76x02_dma_reset(dev);
+
+	pci_enable_wake(pdev, pci_choose_state(pdev, state), true);
+	pci_save_state(pdev);
+	err =3D pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	if (err)
+		goto restore;
+
+	return 0;
+
+restore:
+	mt76_for_each_q_rx(mdev, i)
+		napi_enable(&mdev->napi[i]);
+	napi_enable(&mdev->tx_napi);
+
+	return err;
+}
+
+static int __maybe_unused
+mt76x2e_resume(struct pci_dev *pdev)
+{
+	struct mt76_dev *mdev =3D pci_get_drvdata(pdev);
+	int i, err;
+
+	err =3D pci_set_power_state(pdev, PCI_D0);
+	if (err)
+		return err;
+
+	pci_restore_state(pdev);
+
+	mt76_for_each_q_rx(mdev, i) {
+		napi_enable(&mdev->napi[i]);
+		napi_schedule(&mdev->napi[i]);
+	}
+	napi_enable(&mdev->tx_napi);
+	napi_schedule(&mdev->tx_napi);
+
+	return 0;
+}
+
 MODULE_DEVICE_TABLE(pci, mt76pci_device_table);
 MODULE_FIRMWARE(MT7662_FIRMWARE);
 MODULE_FIRMWARE(MT7662_ROM_PATCH);
@@ -113,6 +167,10 @@ static struct pci_driver mt76pci_driver =3D {
 	.id_table	=3D mt76pci_device_table,
 	.probe		=3D mt76pci_probe,
 	.remove		=3D mt76pci_remove,
+#ifdef CONFIG_PM
+	.suspend	=3D mt76x2e_suspend,
+	.resume		=3D mt76x2e_resume,
+#endif /* CONFIG_PM */
 };
=20
 module_pci_driver(mt76pci_driver);
--=20
2.26.2


>=20
> Thanks.
>=20
> --=20
>   Best regards,
>     Oleksandr Natalenko (post-factum)
>     Principal Software Maintenance Engineer
>=20

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXutNoAAKCRA6cBh0uS2t
rGaCAP9seDnh+3I9x7qM0L6z+RmRhKym8Vj5D+al2CY0DHHnMgEAgvTcNsCPFMrh
Dj6aS0JZ6xV07SQNTlsUmV2eld+m6gc=
=Cp+H
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--


--===============7656527663789798021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7656527663789798021==--

