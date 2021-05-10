Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A31C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:25:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A47C611BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A47C611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Q06jsMlv9plgJaLS0u3KU2jgrTKZ5QVcPC2Q0sl/24=; b=jA23y8EiOUs2rte8uVtAPjWam
	lN5sbmAm0pwgDzK3F+NnGDFgmf0ZKsqSeU2ExbnUaGPAQxK895FHGBCZ6gOetEmHLy9qY9mtKabC7
	pma640ribY3X43BBl/Z09Lqz/YXyCedBxhAWaLk275lgo+d6YBRXHRuYruu+l4WqNRDLaWsjnTZjU
	XkUkg2Xt8LtzycAQgvKfEJYexGE2rIWsl/FjDLfd51nlrgb73wPYR35f+y3DBcZuXS1hoHtPtyx26
	IUysvbts+nKN3EQjyLYQ7zrCgnYtsemY4BaNpROX9SZl63W215h0ixU7mJECJFn+SJv/QnvKsGTDJ
	S2vYYl/vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7mX-00EmLz-NT; Mon, 10 May 2021 15:25:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7mV-00EmLX-Ab
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=aapmB1vT7DiHVfrB3QXwCLGrCo3mQjhDvFxIcQ146+k=; b=S1r3oOkqhdgbjHTZW8pVQRHUw/
 tOvKbPa67JOXcZvQbePXf464EcdJs0NUfA4HPie1N4SIOLAAtEc8LGjhXmx96pXHuFFzxhSPfS3Fn
 H7DW4oZyxgXjUVZ7msb2F30eRkpbWbXNyiukPIp55cgdc0lNx6/pN1Gsx8ZOa25PPHYrpgaIm0j30
 ZDjQrnXVLO9OvAmvGO4m5N6roAQtgYMXWZk7TRGlZ8hcWb2EdJ3r8vEBaKTXsJkcZAoCb9sdkrbeQ
 bJCAtDthorrvzPldnSFFfJZLLtzPXh8TwJ0mPi5IN+6NC2YY3NWnxeQ4/4Miayv2iqzcEfEC6ahn1
 QnanjlCg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7mR-008rpG-6J
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:25:13 +0000
X-UUID: 90f245f6139447d4988cddaa78b291d3-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aapmB1vT7DiHVfrB3QXwCLGrCo3mQjhDvFxIcQ146+k=; 
 b=PvhNPaD7X5uSnrsUTqKjWClx+K0xpBJyvh36dSfKC3OWyu53TYELuhR+FFZ8IUCBZTYGnsi12rs1JlyKcKMz4Ka0mTCxIPj3EWNhic8HmHtrmogMYCfLK/ZQocje6dbMQyAhEvbO/49Ajf7WbtZQ0NAkmuUfQ7Zsh2hqQuGuDRY=;
X-UUID: 90f245f6139447d4988cddaa78b291d3-20210510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555336688; Mon, 10 May 2021 08:25:09 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:07 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5/9] mt76: mt7921: add deep sleep control to runtime-pm knob
Date: Mon, 10 May 2021 23:14:53 +0800
Message-ID: <1620659697-12048-5-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CCBB3211708E0EF760A2CB976ADB5631F7BA46BBC0C58AF42C74A748AE02A7212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_082511_266119_956FBC5E 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add addtional the deep sleep control to runtime-pm knob to
allow us to control driver switching between the full power
mode and the deep sleep mode the firmware is able to support.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/debugfs.c    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 6ee423dd4027..b41d70be948b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -247,6 +247,9 @@ mt7921_pm_set(void *data, u64 val)
 	ieee80211_iterate_active_interfaces(mphy->hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_pm_interface_iter, mphy->priv);
+
+	mt76_connac_mcu_set_deep_sleep(&dev->mt76, !!pm->enable);
+
 	mt7921_mutex_release(dev);
 
 	return 0;
@@ -264,6 +267,20 @@ mt7921_pm_get(void *data, u64 *val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_pm, mt7921_pm_get, mt7921_pm_set, "%lld\n");
 
+static int
+mt7921_deep_sleep_set(void *data, u64 val)
+{
+	struct mt7921_dev *dev = data;
+
+	mt7921_mutex_acquire(dev);
+	mt76_connac_mcu_set_deep_sleep(&dev->mt76, !!val);
+	mt7921_mutex_release(dev);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_ds, NULL, mt7921_deep_sleep_set, "%lld\n");
+
 static int
 mt7921_pm_stats(struct seq_file *s, void *data)
 {
@@ -355,6 +372,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
 	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
 				    mt7921_pm_stats);
+	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
 
 	return 0;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
