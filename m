Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tB5AqJtG8OnNSQEKMXVQ9rkG3f6ByMDL95PyjPX/pco=; b=03pKq0R5/PmzsEowxJkVyFGZhA
	WV3kkZSxJK5vuCuXebPQ5ygKNRR76njWdPsQ1V0FQv5Cn7CtEErHiseE7hw4PdU5jQPftJfQBDcjG
	dIOXEYQg1NBY3RuCOanHnIYCse/IOOhx4hOCArBAIOzYYS5DBMlojGjHUhDaJ6xJ4JdV622nEu5cB
	6L10A8firwpMY3K8U6ZOtalodXSWhhRTSoZQSDgUvcM1ZYlrwYjAkHBlzKY8PgKOvOEDXozHEh6Ka
	sTSMWcR8fQEFDY/tivg1k7pUZpr4cQfRA+iE3T5F6ChPwLwg/DCE6M6+OVRAxe3X8meOI1fNLdi13
	o3fbTL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGxy-004oJd-Ac; Sat, 23 Jul 2022 15:22:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGxu-004oCC-MV
	for linux-mediatek@lists.infradead.org; Sat, 23 Jul 2022 15:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0CE060C1A;
	Sat, 23 Jul 2022 15:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A191DC341C0;
	Sat, 23 Jul 2022 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658589769;
	bh=KMGQAcy/T/5Wl3zpAMe3hRc7tl1I2RTKlbdkkj3K0M4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=bPhkzC6BYy0xCz6L2L8SzA7Xs57OoVuLWdoGupqRF3NDUh0GNfPdSDdHY9G3rkpdh
	 rmYUoRDNnvsIPCWkPwPD2zBBAXFD/8TgMCEVf+e3sHcWr6vRXGVr6fFKjyjutqMspa
	 sXZv0sfC2/RjkHOup8aUPLBV3e5KYu+TtIjhLKno=
Subject: Patch "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()" has been added to the 5.15-stable tree
To: christophe.jaillet@wanadoo.fr,gregkh@linuxfoundation.org,linux-mediatek@lists.infradead.org,nbd@nbd.name,sean.wang@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 23 Jul 2022 17:22:46 +0200
In-Reply-To: <768b04c445f39ad1fc166b98be8154bd413f978a.1657915079.git.sean.wang@kernel.org>
Message-ID: <1658589766151144@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_082250_840057_D12A0546 
X-CRM114-Status: GOOD (  14.76  )
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

    mt76: mt7921: Fix the error handling path of mt7921_pci_probe()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sat Jul 23 05:21:21 PM CEST 2022
From: sean.wang@kernel.org
Date: Fri, 15 Jul 2022 12:59:26 -0700
Subject: mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Felix Fietkau <nbd@nbd.name>
Message-ID: <768b04c445f39ad1fc166b98be8154bd413f978a.1657915079.git.sean.wang@kernel.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

commit 4e90db5e21eb3bb272fe47386dc3506755e209e9 upstream.

In case of error, some resources must be freed, as already done above and
below the devm_kmemdup() and __mt7921e_mcu_drv_pmctrl() calls added in the
commit in Fixes:.

Fixes: 602cc0c9618a ("mt76: mt7921e: fix possible probe failure after reboot")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -254,8 +254,10 @@ static int mt7921_pci_probe(struct pci_d
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops)
-		return -ENOMEM;
+	if (!bus_ops) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -264,7 +266,7 @@ static int mt7921_pci_probe(struct pci_d
 
 	ret = __mt7921e_mcu_drv_pmctrl(dev);
 	if (ret)
-		return ret;
+		goto err_free_dev;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);


Patches currently in stable-queue which might be from sean.wang@kernel.org are

queue-5.15/revert-mt76-mt7921e-fix-possible-probe-failure-after-reboot.patch
queue-5.15/mt76-mt7921-use-physical-addr-to-unify-register-access.patch
queue-5.15/mt76-mt7921e-fix-possible-probe-failure-after-reboot.patch
queue-5.15/mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch
queue-5.15/revert-mt76-mt7921-fix-the-error-handling-path-of-mt7921_pci_probe.patch

