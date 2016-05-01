From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Sun, 1 May 2016 09:32:07 +0200
Message-ID: <f887fa30-2205-c102-bade-0071b3ee6b1f@openwrt.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

i tried V4 just now. result is as before

if i set the ecc-strength above 16 it will give irq errors during boot
as shown below. values of 16 and below will probe without error but
hexdump on the device node will then throw ecc timeouts.

[    1.964296] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    1.970603] nand: Unknown W29N02GV
[    1.974038] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,
OOB size: 64
[    1.981554] mtk-nand 1100d000.nfi: eccsize 1024 eccstrength 24
[    2.481827] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    2.988919] mtk-ecc 1100e000.ecc: decoder NOT idle
[    3.491818] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    3.998907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    4.501819] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    4.733511] mt7623-gsw switch@1b100000: port 3 link up
[    5.008907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    5.511817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    6.018907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    6.023671] Bad block table not found for chip 0
[    6.521817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    7.028907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    7.531816] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    8.038907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    8.541817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    9.048901] mtk-ecc 1100e000.ecc: decoder NOT idle
[    9.551816] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[   10.058906] mtk-ecc 1100e000.ecc: decoder NOT idle
[   10.063671] Bad block table not found for chip 0
[   10.068247] Scanning device for bad blocks
[   10.072769] Bad eraseblock 1 at 0x000000020000
[   10.077384] Bad eraseblock 2 at 0x000000040000
[   10.082017] Bad eraseblock 3 at 0x000000060000
[   10.086631] Bad eraseblock 4 at 0x000000080000

when i see errors during probe, the core will have received 2 ecc irqs

 25:       2058          0          0          0  MT_SYSIRQ  56 Level
 mtk-nand
 26:          2          0          0          0  MT_SYSIRQ  55 Level
 mtk-ecc

to me it is ambigous what FDM actually is. it seems that if FDM is known
the ecc-strength can be calculated and the amount of dts properties can
be reduced even further.

what i dont understand just yet is, do these erros i am seeing mean the
ecc core is not brought up properly or do they come from the dts
properties being bad.

	John
