From: Petr Cvek <petrcvekcz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mt7621/mt7628 PCIe linux driver
Date: Sat, 22 Sep 2018 23:06:50 +0200
Message-ID: <8fd595af-53fa-c100-c369-8c7a30eba8e3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, sergio.paracuellos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

I'm trying to play with mt7628 PCIe (and it's old driver mt7620), but
the system keeps freezing. It is probably because of bus master access
of my PCIe cards but I don't see any memory access controls for PCIe <->
RAM in the datasheet. The same problem is with MSI. It seems the root
complex supports MSI (it has an MSI capability field), but there isn't
any mention in the MT7628 datasheet too. As it seems the MT7628 PCIe is
based on MT7621 PCIe, I went for an MT7621 datasheet, but sadly in the
datasheet the PCIe section is missing completely.

Does anybody have a working MT7621/28 bus master setup or a more
completed datasheet? I would like to get some information for fixing the
mt7620 PCIe driver. It is possible the MSI/bus master is controlled by
the undocumented bridge registers (in the pci-mt7621 they controls the
manual oscillator settings, I've found a link quality register at
0x101490c4) or in a PCI config space of the root complex (around 0x700
offset). If you have a working SoC with MSI/bus mastering (= mem access
from card), can you send me the dump of there spaces?

Thanks

best regards,
Petr
