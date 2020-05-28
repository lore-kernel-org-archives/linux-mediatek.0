Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8C5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 17:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004A8207BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 17:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SlbjQfgT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UOa/EiCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 004A8207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11odeKKi8Cu9FuowlN0v2o/Ii60H/jsWq6Y8B1EZyeM=; b=SlbjQfgTHcugo+
	aJ2FCE64NISYrofz2NANNtoZXmrSuEN/uZPSFRoWf16CobWLd7n3B2oCKaQNp7lcNtlRtqF8FNL7Z
	1uUnefTZVmmdmirPesbvLK5DDWi0sAzVyqSJoZZCDaYvTZneJmjIab1RgxuaxBlLDivSd1Bwp0vHv
	aI2LbPXxGc4WzsaNPm1dn3UkDO3b3TKZmKnfyLRR5v4iWX23fwel7isVGgFb8fAgN9tiphGPB/v+9
	BPAWPRdURdFEWsZPOU5JoflNkJyqSjWcHFDfICnomd+XMblZansFixOHgGAhHv7/huvg3A4Stl1SH
	WTTVzKatDWu9WKm3gvfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeM8J-00029H-C4; Thu, 28 May 2020 17:15:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeM7h-0001RB-LZ; Thu, 28 May 2020 17:15:19 +0000
X-UUID: 3585ec1f171a47a3b78c577c1145f217-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ji9H1E5vbwxd7CeKqgjMppwKo2IKtgv1TNRwCWXxzlU=; 
 b=UOa/EiCnWTC9qBK6b8PGeaRixUvMKqMBXEmjOuwADmG/zazcWSBdebYBttAbBtg5/YgXFaBz0CIBg/p25LQEfOFr0dIZVJ/dSQZ2aYsK3tnTae9Ldd3YFlBNcRjfva7KZv54LrUKt5VwpJJSnqKdXbUvySmiQ/dB35DBbQJn4Oc=;
X-UUID: 3585ec1f171a47a3b78c577c1145f217-20200528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1142398328; Thu, 28 May 2020 09:14:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 10:05:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 01:05:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 May 2020 01:05:09 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 15/16] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
Date: Fri, 29 May 2020 01:04:50 +0800
Message-ID: <1590685491-17107-16-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_101517_709836_F69B8CA3 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add clear parameter to let client decide if
event should be clear to 0 after GCE receive it.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 5 +++--
 include/linux/mailbox/mtk-cmdq-mailbox.h | 3 +--
 include/linux/soc/mediatek/mtk-cmdq.h    | 5 +++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7daaabc26eb1..a065b3a412cf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -488,7 +488,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	if (mtk_crtc->cmdq_client) {
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
-		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
+		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 5cf9e71b7900..9e9a4c81553a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -315,15 +315,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
-int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
+int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 {
 	struct cmdq_instruction inst = { {0} };
+	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
 
 	if (event >= CMDQ_MAX_EVENT)
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
-	inst.value = CMDQ_WFE_OPTION;
+	inst.value = CMDQ_WFE_OPTION | clear_option;
 	inst.event = event;
 
 	return cmdq_pkt_append_command(pkt, inst);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 3f6bc0dfd5da..42d2a30e6a70 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -27,8 +27,7 @@
  * bit 16-27: update value
  * bit 31: 1 - update, 0 - no update
  */
-#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
-					CMDQ_WFE_WAIT_VALUE)
+#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
 
 /** cmdq event maximum */
 #define CMDQ_MAX_EVENT			0x3ff
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 9494b293bad9..3216ccfff4a9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -183,11 +183,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 /**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
- * @event:	the desired event type to "wait and CLEAR"
+ * @event:	the desired event type to wait
+ * @clear:	clear event or not after event arrive
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
+int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
 
 /**
  * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
