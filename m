Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB79ACCF9F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i52sX0HHotFg2XyzTxZtJ+4INSV4quoFx5kmuHs4B+4=; b=Stak86+uFrKvLMxeFzNkalSVej
	pFAuM7+7Tu7WIrreU7UnhRnVrJ+/B/Ji9nFWQ2YFI5csUPTV5Zq9t4z/AeB/HKFKIOh0qg86M7iyl
	mFGDq+/n6OByaBTKXO8JRMi3ziZ7NFMPkTBFZsM4OCC+RnRPKkqVy/97V6jd6xgHnoyq9qOJk8uAS
	TnkcN8t1NJVfj5quHtIymZslRiWf2HJOhv9O9DDS+y0+G45k9EJXhjW26V1cuF0wq7xEemyABqfp6
	Xg3mj87stmKLs3vJ7KyZfryYJZOyHVA/N+lCmE7n8FmUtFbI1hbDQkyAH67tnBr9RGHXAqmFHsHKV
	TzHvMXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ34-000000040QH-2WSN;
	Thu, 30 Oct 2025 10:38:30 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ31-000000040PI-2VPP
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Oct 2025 10:38:29 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id A7A7D403B8;
	Thu, 30 Oct 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761820702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i52sX0HHotFg2XyzTxZtJ+4INSV4quoFx5kmuHs4B+4=;
	b=sE9IHtUA5USnlz0AGJrlK339KDTK/9G4jXNlYDHFZLJnef71hlOnGgcpM5WxE0gbPH9J7y
	C3JaZWld5KxAtgUx1FXc3Y4I4wf5yqGzRtstUyY4YOApX7FWBykqH+QTt5SWwQWkN7hujI
	pWZTCZtqQJX4b0aqkd1zoIoKNxA74WQ=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 1CD8B100610;
	Thu, 30 Oct 2025 10:38:22 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 30 Oct 2025 11:38:22 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org, Andi
 Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
Subject: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux on
 i2c2)
Message-ID: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mail-ID: 99a49484-24ae-4c87-857a-8feba7f39e65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_033827_838827_65E7E4D9 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

sorry for html-mail, my main email-provider (GMX) sent it as html (have 
enabled text-mail as default in settings) when using web-mailer.

i've noticed i2c-issues (i2c2) on mt7988 BPI-R4 with 6.18. On most 
bootups the i2c-mux is not detected.
 
root@bpi-r4-v11:~
# i2cdetect -y  2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --
 
i2c-probe is completed successful (no errors and debugs shown before 
final "return 0;")
 
sometimes the mux came up with same kernel-binary, and i see also other 
devices on same i2c bus, but mostly all devices are not shown when i use 
i2cdetect on the bus.
 
root@bpi-r4-v11:~
# i2cdetect -y  2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- UU -- -- -- -- -- UU -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: UU -- -- -- -- -- -- --                         
root@bpi-r4-v11:~
# [   58.594846] sfp sfp1: failed to read EEPROM: -ENXIO
 
6.17 seems ok (have not seen the issue there yet).
 
i looked through many commits, reverted some for clock (my own, lauras 
clk_gate,...), pinctrl and the i2c-mux (some reset-related) itself but 
nothing helped.
 
One strange thing is that i have noticed no issues on bpi-r4pro which 
uses same SoC, same config and should use same drivers and configuration 
via dt.
Only diference was the reset for the mux itself in dts as far as i 
see....so tried to disable it to have it nearly same as on r4pro without 
any effect.
 
Maybe you have any idea how i can nail it down?
 
root@bpi-r4-v11:~
# dmesg | grep -i 'sfp\|i2c'
[    0.000000] Machine model: Banana Pi BPI-R4 (2x SFP+)
[    1.600387] i2c_dev: i2c /dev entries driver
[    1.605291] /soc/i2c@11003000/rt5190a@64: Fixed dependency cycle(s) 
with /soc/i2c@11003000/rt5190a@64/regulators/buck1 #i2c0 seems not 
affected
[   12.685157] platform sfp1: deferred probe pending: (reason unknown)
[   12.691440] platform sfp2: deferred probe pending: (reason unknown)
 
# dmesg | grep -i 'err\|fail\|clk'
... #nothing related to i2c or clk
[    1.623805] pca954x 2-0070: probe failed
....
 
wondered why i2c-clocks are always disabled when i look into the 
clk_summary (also when i2c was working)

root@bpi-r4-v11:~
# cat /sys/kernel/debug/clk/clk_summary | grep -i -B2 INFRA_I2C_BCK
             infra_usb_sys           0       0        0        125000000 
  0          0     50000      N               deviceless                
          i2c_sel                    0       1        0        125000000 
  0          0     50000      N            deviceless                   
             infra_i2c_bck           0       3        0        125000000 
  0          0     50000      N               11005000.i2c              
root@bpi-r4-v11:~

but looking at the driver the clocks are disabled on probe which looks 
strange to me
 
https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/i2c/busses/i2c-mt65xx.c#L1477
 
i guess it is some kind of timing issue where clocks are still disabled 
but not reenabled in mtk_i2c_transfer, but
my debug in this function shows that is called and ret=0 after the 
bulk_enable (and of course flooding console :p ).
maybe some speed-calculation-issue?
 
what i had tried to revert (also my own non-mainline like "convert 
invalid GATE to MUX"), so they seem not the rootcause:
 
d51e7cfca3fe 2025-09-25 i2c: mt65xx: convert set_speed function to void 
Wolfram Sang 
b49218365280 2025-09-06 i2c: mediatek: fix potential incorrect use of 
I2C_MASTER_WRRD Leilk.Liu 
614b1c3cbfb0 2025-06-12 i2c: use inclusive callbacks in struct 
i2c_algorithm Wolfram Sang
 
c90fa5493f7a 2025-07-31 i2c: mux: pca9541: Use I2C adapter timeout value 
for arbitration timeout Manikanta Guntupalli 
94c296776403 2025-06-03 i2c: muxes: pca954x: Reset if (de)select fails 
Wojciech Siudy 
690de2902dca 2025-06-03 i2c: muxes: pca954x: Use reset controller only 
Wojciech Siudy 
 
e504d3bdb3d0 2025-09-15 clk: mediatek: clk-gate: Add ops for gates with 
HW voter Laura Nao 
8ceff24a754a 2025-09-15 clk: mediatek: clk-gate: Refactor 
mtk_clk_register_gate to use mtk_gate struct Laura Nao
 
bd6f4a91401f 2025-09-02 pinctrl: mediatek: moore: replace struct 
function_desc with struct pinfunction Bartosz Golaszewski 
7a24f1f5b214 2025-09-02 pinctrl: mediatek: mt7988: use 
PINCTRL_PIN_FUNCTION() Bartosz Golaszewski
 
regards Frank

