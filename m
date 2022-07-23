Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCDCCA48A
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BOeBmXs5p5bKHfKV1y8UBHz+Ll4m12FsY3aZi6VysEQ=; b=cbC0V3Sq/nLxQE4DYjC2dGjApW
	cO4bUgTFIYDKzqaMPOi16VCaHshurATjNdhG6pilZNcIQXJLSFGvZX+hRnn8T+KthCttwBME0or+k
	c66o0169mdRBX/IOFShrIVZOaw0hxOxAfmf/HPowgI86zoLJ4QDz3KdKdnHVmFV2ZHMX1ORlt9bLq
	ynN96pzmC9caT++6IW9E8ugCOYdJSabiWl+dJXkdMr2CkoiMO1fujcgkRdRCQ9tMR5gMRYbrfvHVg
	puWsFCxAPI1u9KX65ftsukdo737H1Is3XYNyHmr7q/shKOSe0CuZkG03D839Nq+fKZ4MH1z6cIAOo
	6MwK83PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGyE-004oce-BW; Sat, 23 Jul 2022 15:23:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGy9-004oUh-TG
	for linux-mediatek@lists.infradead.org; Sat, 23 Jul 2022 15:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75BEFB80CCE;
	Sat, 23 Jul 2022 15:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38DEC341C0;
	Sat, 23 Jul 2022 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658589783;
	bh=LH2Of0Wx5h0UboOdnmNJUAMVRyiUOibXCWwAw5YTGrA=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=03Cm9GDZHSkEcPyca/wKYD+NXBP+WwN5ppCiwmNx1nLQNVnvJaXLaHza1l0FQa6Q/
	 oL1mUGfLWd0PZlSUsf+Z/tVJP0HgoUyH/eCccEJ29UMlFX99nUpuD8Vc7mChBMzSy3
	 DRB5JDw6P+wFBuWhwhHdEwseKSYzF5bNw1k9nRAo=
Subject: Patch "Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"" has been added to the 5.15-stable tree
To: gregkh@linuxfoundation.org,linux-mediatek@lists.infradead.org,sean.wang@kernel.org,sean.wang@mediatek.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 23 Jul 2022 17:22:46 +0200
In-Reply-To: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
Message-ID: <16585897667696@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_082306_269844_B158045A 
X-CRM114-Status: GOOD (  17.00  )
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


This is a note to let you know that I've just added the patch titled

    Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sat Jul 23 05:21:21 PM CEST 2022
From: sean.wang@kernel.org
Date: Fri, 15 Jul 2022 12:59:22 -0700
Subject: Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
Message-ID: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

This reverts commit 663457f421d41e9d2fcb1e84baf43d1433f80c08 that is the
commit 44c4237cf3436bda2b185ff728123651ad133f69 upstream.

Because there was mistake in
'649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")'
that caused WiFi reset cannot work well as the reported issue
"PROBLEM: [Stable v5.15.42+] [mt7921] Wake after suspend locks up system
when mt7921-driver is used on a Lenovo ThinkPad E15 G3" described in
http://lists.infradead.org/pipermail/linux-mediatek/2022-June/042668.html
So we need to revert the patch first to avoid the conflict of reverting
'649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")'
and will be applied back later after fixing.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -254,10 +254,8 @@ static int mt7921_pci_probe(struct pci_d
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops) {
-		ret = -ENOMEM;
-		goto err_free_dev;
-	}
+	if (!bus_ops)
+		return -ENOMEM;
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -266,7 +264,7 @@ static int mt7921_pci_probe(struct pci_d
 
 	ret = __mt7921_mcu_drv_pmctrl(dev);
 	if (ret)
-		goto err_free_dev;
+		return ret;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);


Patches currently in stable-queue which might be from sean.wang@kernel.org are

queue-5.15/revert-mt76-mt7921e-fix-possible-probe-failure-after-reboot.patch
queue-5.15/mt76-mt7921-use-physical-addr-to-unify-register-access.patch
queue-5.15/mt76-mt7921e-fix-possible-probe-failure-after-reboot.patch
queue-5.15/mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch
queue-5.15/revert-mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch

