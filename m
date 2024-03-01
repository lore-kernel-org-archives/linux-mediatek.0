Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65357C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URy1vpIJ5f5vmjJkt9UJsw41aHt3Xplgxq8vgpxbX3U=; b=fHg3Cq3HunG025hHS2JWdT/Tps
	v6iBi6eaE7SL4BzWErwFCdmDy3/lljc5qVopeWJbmtMrbL/wDgcI+n8BiQmRRo6RTrKbLYPW1rPzt
	8iscJomBwxRpEGov3lMbbOVAlNkWH3sfi/W82VWO1dzffhHtycac6zXAz8zN8O7Jw9KyKNsfRC0py
	gPm9Z0vXYnUrMTSdRWrQ/B/Hfw6pt7qRQWEyoFqD8WpHKttPErce49hfKtq05sH3PT1p40Z28hUQp
	ScBiBl7u7tQ3UCbFXiZXRXxoXobRtrlTXomt/P5392/E3hsNxk30bKK65Z48xu6t6XGRW/qyj2LJz
	54krVrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzAg-0000000HA5r-3YnP;
	Fri, 01 Mar 2024 09:27:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzAe-0000000HA4o-3f3t;
	Fri, 01 Mar 2024 09:27:14 +0000
X-UUID: def84450d7ad11eea40fa5ac21cdad35-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=URy1vpIJ5f5vmjJkt9UJsw41aHt3Xplgxq8vgpxbX3U=;
	b=Hy/D0RAJ98wVHYPKQDHB+3rBm67EOPJV3Tk9rOKzI3486xUiBdbKsOZ0pPWz2ysQFrE1TuK+X3DmLlU+I9EvYfqgQJk/9e376bjE8WjzKTng2OSNjnB51i3PC/KRmUwcJkrbDUwwBjqwpDAb6kf/YkiBSvcDmg7PCusEQ8Hn9vA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:fdfb704c-84d6-44cd-9789-689bb88ee4ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:614b7f84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: def84450d7ad11eea40fa5ac21cdad35-20240301
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <qingliang.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1468802476; Fri, 01 Mar 2024 02:27:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 17:27:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 17:27:03 +0800
From: Qingliang Li <qingliang.li@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len
 Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Johan Hovold
	<johan+linaro@kernel.org>, Tony Lindgren <tony@atomide.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Qingliang Li <qingliang.li@mediatek.com>, Dhruva Gole <d-gole@ti.com>
Subject: [PATCH v2] PM: sleep: wakeirq: fix wake irq warning in system suspend
Date: Fri, 1 Mar 2024 17:26:57 +0800
Message-ID: <20240301092657.15528-1-qingliang.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012712_939292_ECCF6733 
X-CRM114-Status: GOOD (  11.39  )
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

When driver uses pm_runtime_force_suspend() as the system suspend callback
function and registers the wake irq with reverse enable ordering, the wake
irq will be re-enabled when entering system suspend, triggering an
'Unbalanced enable for IRQ xxx' warning. In this scenario, the call
sequence during system suspend is as follows:
  suspend_devices_and_enter()
    -> dpm_suspend_start()
      -> dpm_run_callback()
        -> pm_runtime_force_suspend()
          -> dev_pm_enable_wake_irq_check()
          -> dev_pm_enable_wake_irq_complete()

    -> suspend_enter()
      -> dpm_suspend_noirq()
        -> device_wakeup_arm_wake_irqs()
          -> dev_pm_arm_wake_irq()

To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED flag
in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/base/power/wakeirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
index 42171f766dcb..5a5a9e978e85 100644
--- a/drivers/base/power/wakeirq.c
+++ b/drivers/base/power/wakeirq.c
@@ -313,8 +313,10 @@ void dev_pm_enable_wake_irq_complete(struct device *dev)
 		return;
 
 	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
-	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE)
+	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE) {
 		enable_irq(wirq->irq);
+		wirq->status |= WAKE_IRQ_DEDICATED_ENABLED;
+	}
 }
 
 /**
-- 
2.25.1


