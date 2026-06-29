Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C447C43602
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PnkTGV/nH6e70Wn8noO3/L4aE2s/K8jiLLk5T/vfk5c=; b=xiPQK0caXbzNwiXCG9mDadgPDX
	SvoSRiVmdbyht9/o4BPxRqASObX5s+71idHmJHJMSHsxpRlhqMUqJewppkJV1/4wrlVMKi5yJYzdO
	2lPgZx9FhoD+5ChA2eJbVB/xNCfQ2PXgCavuyw924N4aPMeeV5kvbY+767uymwb3HkG50eTJxD9aZ
	U+D34RxFeVoIPuqIIL1btNB5QRIKuecL4OwUHdZzIWExggiR8AUtpW45SXLqFhGH+RJ9V/EERrd+c
	WqYENZJmAORWGWE6HcmwV6ZQ3bKeqxgjNfNWZbFxIB5sqrXGWuHWFjxMDbJTB6hKNUcMYmuJmTVw5
	5yogtmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGJF-0000000FKP9-0ecL;
	Mon, 29 Jun 2026 18:02:17 +0000
Received: from mail.schwarzvogel.de ([2a01:4f8:252:1806::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGJB-0000000FKOU-2aAq
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 18:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=schwarzvogel.de; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:In-Reply-To:References;
	bh=PnkTGV/nH6e70Wn8noO3/L4aE2s/K8jiLLk5T/vfk5c=; b=Srpshzp0Kx7hCZ42t/jyKztTKe
	OeVumzx6BwASHi7o1/wfpSde/GdT/YTxABgXFsziUMXqklcNzSdP+3qKKwiEt8qq98XEaAO4KpoGp
	e7mimrUpGUxdW+r70NemY3PQ10XTUQCh0MlXL+zp//wrz8yG74mJ5/95qqHrQ31hazplX8COT5xi/
	N4Y8qrW5FWzzbyyCcoJeadNr/TnER867+Tw9H6vtStuYbGoSXiBbHx27LdiTP2po0cCdJD0KWIA0B
	W+R7+30PEGnLI0aory2IN37m6wvJOd1gc+l9rHb1G0+dP4puuBEE7oFmVBJOqyWiJXG3Ih/oo3NY+
	Pk6+F6vw==;
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.99.4)
	(envelope-from <klausman@schwarzvogel.de>)
	id 1weGJ4-000000003k2-1g7D;
	Mon, 29 Jun 2026 20:02:06 +0200
Date: Mon, 29 Jun 2026 20:02:06 +0200
From: Tobias Klausmann <klausman@schwarzvogel.de>
To: linux-mediatek@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: mt76 newly rejects formerly working MAC from EPROM
Message-ID: <30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_110213_974500_51FAE9DA 
X-CRM114-Status: GOOD (  14.52  )
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

Hi!

As of 7.2-rc1, my mediatek USB wifi dongle no longer works the way it
used to. I now get an error about its MAC being wrong:

usbcore: registered new interface driver mt7921u
mt7921u 8-1:1.0: HW/SW Version: 0x8a108a10, Build Time: 20260224110909a
mt7921u 8-1:1.0: WM Firmware Version: ____010000, Build Time: 20260224110949
mt7921u 8-1:1.0: Invalid MAC address, using random address c2:4d:ae:23:29:38
mt7921u 8-1:1.0 wlxc24dae232938: renamed from wlan0

This naturally breaks my udev rules, interface naming etc etc.

So I bisected it, and this is the commit that started it:

commit 31ee1582717e220cc5a3fa8f3940d5693c5c9169 (HEAD)
Author: Rosen Penev <rosenp@gmail.com>
Date:   Sun Apr 26 22:17:46 2026 -0700

    wifi: mt76: fix of_get_mac_address error handling
    
    Check return value instead of is_valid_ether_addr. The latter is handled
    by the former.
    
    Signed-off-by: Rosen Penev <rosenp@gmail.com>
    Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
    Link: https://patch.msgid.link/20260427051746.954704-1-rosenp@gmail.com
    Signed-off-by: Felix Fietkau <nbd@nbd.name>

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index afdb73661866e..b99d7452800fd 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
        if (err == -EPROBE_DEFER)
                return err;
 
-       if (!is_valid_ether_addr(phy->macaddr)) {
+       if (err) {
                eth_random_addr(phy->macaddr);
                dev_info(dev->dev,
                         "Invalid MAC address, using random address %pM\n",

SO I thought that maybe my device had had a broken MAC all this time,
and I just didn't notice. I changed the code a bit to emit the erroneous
MAC and the value of err, which resulted in:

usbcore: registered new interface driver mt7921u
mt7921u 8-1:1.0: HW/SW Version: 0x8a108a10, Build Time: 20260224110909a
mt7921u 8-1:1.0: WM Firmware Version: ____010000, Build Time: 20260224110949
mt7921u 8-1:1.0: Invalid MAC address e0:e1:a9:38:96:29 err: -19
mt7921u 8-1:1.0: Using random address 3a:ca:1d:51:83:f2
mt7921u 8-1:1.0 wlx3aca1d5183f2: renamed from wlan0

To me, e0:e1:a9:38:96:29 looks like a perfectly valid MAC, so at a
minimum, the current code's wording is misleading: it assumes the only
way of_get_mac_address() can ever return a nonzero value is if the MAC
is invalid. However, looking at its code, I only see one nonzero return
statement, which returns ENODEV, which seems at odds with "broken MAC".

Either way, I am looking for a way to get a stable MAC again, either by
fixing this commit (if it is indeed a bug) or fixing my hardware (if the
bug is there.

Best,
Tobias Klausmann

