Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF14EC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869FB20671
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 12:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OJyfORUX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhiDY1Dx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869FB20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/inp6unu4E91EyPv01QX1kBDK7mGQHA8ut/4imN7xGo=; b=OJyfORUXtolUUX
	rNalvHEuo6X10XR3Uwf4g6KL1PdK6UXzS2TdQARS7EzhM5bXGZOOXgQH6siw/vcOkvpSiwLBs6WCd
	rJmJRcf5dFq96vRvWyhuUwdPVN/ZIxFGVavsnOXov2UMZndIHI8sAAu+fWD5adfjFd1i0DK3RtALU
	WOqLnscQxReNxXRHyn2xH1yKiMVXAzIGjc1bYtnMHVBykscDJYFvDgSt8E+JC4rfRYe1C6T9FE9yY
	wcowzZUwagzYyjdYUqO3r5TtepL/aY6cAdzWk3SgGcE1bajRNrO7M1PcCZJwsp9js3yvolWxMPBLU
	Aff/Q1QURdgb4JkDxTmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZwMt-0002Ej-2q; Sat, 16 May 2020 12:56:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZwMq-0002ER-1S
 for linux-mediatek@lists.infradead.org; Sat, 16 May 2020 12:56:41 +0000
Received: from localhost.localdomain (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C71620671;
 Sat, 16 May 2020 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589633799;
 bh=t1XK2P4v4ACNzk5jRcoLJ1olEixLcO+jtsKU3wNsse8=;
 h=From:To:Cc:Subject:Date:From;
 b=jhiDY1DxcEh9Kp7JuGGL8g+hqTEANRYTTVS4NF1vKpmnf9LEAUh/EerjZ5RaVWw0G
 AH5ohlXvCIIPiYMEwMSY4xzV37twS1jbGmfGHtatAZzMQTyjin3f4Pf29hMx+TCeOg
 dNXYUj9VCFAmgffRvPF2FKgLVC8XUDcOINjmq5t4=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: fix NULL pointer deref in
 mt7615_register_ext_phy
Date: Sat, 16 May 2020 14:56:33 +0200
Message-Id: <c6f649da8d09ca2c879a9f475a097c8c38b18963.1589633280.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_055640_124792_6C40B260 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix following NULL pointer dereference in mt7615_register_ext_phy routine

[   27.648860] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
[   27.657697] Mem abort info:
[   27.660495]   ESR = 0x96000046
[   27.663549]   EC = 0x25: DABT (current EL), IL = 32 bits
[   27.668857]   SET = 0, FnV = 0
[   27.671910]   EA = 0, S1PTW = 0
[   27.675040] Data abort info:
[   27.677918]   ISV = 0, ISS = 0x00000046
[   27.681751]   CM = 0, WnR = 1
[   27.684717] user pgtable: 4k pages, 39-bit VAs, pgdp=000000007d8cc000
[   27.691156] [0000000000000060] pgd=000000007d281003, pud=000000007d281003, pmd=0000000000000000
[   27.699857] Internal error: Oops: 96000046 [#1] SMP
[   27.774939] CPU: 1 PID: 701 Comm: ash Not tainted 5.4.41 #0
[   27.780500] Hardware name: Bananapi BPI-R64 (DT)
[   27.785108] pstate: 60000005 (nZCv daif -PAN -UAO)
[   27.789897] pc : mt7615_register_ext_phy+0x60/0x2c8 [mt7615_common]
[   27.796156] lr : mt7615_init_debugfs+0x99c/0x18e0 [mt7615_common]
[   27.802237] sp : ffffffc0115dbcb0
[   27.805541] x29: ffffffc0115dbcb0 x28: ffffff803e309600
[   27.810843] x27: 0000000000000000 x26: 0000000000000000
[   27.816144] x25: ffffff803d936928 x24: ffffff803d936950
[   27.821447] x23: 0000000000000000 x22: 0000000fffffffe0
[   27.826749] x21: 0000000000000002 x20: ffffff8001e82620
[   27.832050] x19: 0000000000000000 x18: 0000000000000000
[   27.837352] x17: 0000000000000000 x16: 0000000000000000
[   27.842653] x15: 0000000000000000 x14: 0000000000000000
[   27.847955] x13: 0000000000000000 x12: 0000000000000000
[   27.853256] x11: 0000000000000000 x10: 0000000000000040
[   27.858558] x9 : ffffffc0112b3eb0 x8 : ffffffc0112b3ea8
[   27.863859] x7 : ffffff803e400048 x6 : 0000000000000000
[   27.869161] x5 : ffffff803e400000 x4 : 0000000000000000
[   27.874462] x3 : 0000000000000001 x2 : 0000000000007615
[   27.879764] x1 : 0000000000000068 x0 : ffffffc0088ccc58
[   27.885066] Call trace:
[   27.887505]  mt7615_register_ext_phy+0x60/0x2c8 [mt7615_common]
[   27.893416]  mt7615_init_debugfs+0x99c/0x18e0 [mt7615_common]
[   27.899156]  simple_attr_write+0xf0/0x178
[   27.903158]  debugfs_attr_write+0x4c/0x70
[   27.907159]  full_proxy_write+0x60/0x90
[   27.910987]  __vfs_write+0x18/0x40
[   27.914379]  vfs_write+0xb0/0x1b8
[   27.917685]  ksys_write+0x4c/0xc8
[   27.920989]  __arm64_sys_write+0x18/0x20

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index a9f4a2286454..caefa4d37a90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -373,15 +373,6 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	if (phy)
 		return 0;
 
-	INIT_DELAYED_WORK(&phy->mac_work, mt7615_mac_work);
-	INIT_DELAYED_WORK(&phy->scan_work, mt7615_scan_work);
-	skb_queue_head_init(&phy->scan_event_list);
-
-	INIT_WORK(&phy->ps_work, mt7615_ps_work);
-	INIT_WORK(&phy->roc_work, mt7615_roc_work);
-	timer_setup(&phy->roc_timer, mt7615_roc_timer, 0);
-	init_waitqueue_head(&phy->roc_wait);
-
 	mt7615_cap_dbdc_enable(dev);
 	mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7615_ops);
 	if (!mphy)
@@ -394,6 +385,15 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	mphy->antenna_mask = BIT(hweight8(phy->chainmask)) - 1;
 	mt7615_init_wiphy(mphy->hw);
 
+	INIT_DELAYED_WORK(&phy->mac_work, mt7615_mac_work);
+	INIT_DELAYED_WORK(&phy->scan_work, mt7615_scan_work);
+	skb_queue_head_init(&phy->scan_event_list);
+
+	INIT_WORK(&phy->ps_work, mt7615_ps_work);
+	INIT_WORK(&phy->roc_work, mt7615_roc_work);
+	timer_setup(&phy->roc_timer, mt7615_roc_timer, 0);
+	init_waitqueue_head(&phy->roc_wait);
+
 	mt7615_mac_set_scs(phy, true);
 
 	/*
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
