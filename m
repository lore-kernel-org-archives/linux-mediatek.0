Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868ADC7619F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:20:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59AF220725
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FquW6GhM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GY5SB8VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59AF220725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVS/KbWyHxCHRkUx0UEL0AWD6GRne9+H4dg1/Vq+byA=; b=FquW6GhMv6PMw9
	v/jNUTv8Bi1jXpw+JTMiCLSC0+BM7PLlF2JgqewHv1bB9AS2t0r6aZO/eex+Pi2DZ+A2lkBRAT+aL
	vsa1GuKr8FPRYkgsuq0Pg9WVHgyWEvT1RW5lwgcO9t28PTYNXV44MUZ06YSEUCKEG39gRT4PkkWOK
	yky+sG3jnFGNJNbw7W+Y++nnD8ASJntdHGSi+5IjpdYjXXXOGRe2jArqouem9PhYzusqLJKXm7rHZ
	x/FjTo2blXm+q6oiL5lMUTnQMTG8PpUzt+sS2tq7hTzcLoAtjICcYhCVZc9HJEmM3kkwq++Rs3pDi
	ZH9kPvBW5DW7qyuUqo4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ca3-0003bL-6u; Mon, 17 Feb 2020 09:20:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cZp-0003N8-FP; Mon, 17 Feb 2020 09:20:31 +0000
X-UUID: e64a22b1a7ce45c3aacf8be0f795b837-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ImCAz3u2E546r3KAwme+zGo6Ai4bCEGIJM8L5+zVMqc=; 
 b=GY5SB8VDZ9eAcJzlE7RSXeXvfdBsq6cOcz46TPvfP64WNpNY8Nn+4BMNJbyYDQT8zu+eaIn49Fy2IPY+r8ppOp4M1XcV+PgwOAEA5cfZYW2eublcUJ9cr7BXyad54J3tN55nFSvjlPDBlvHgjKn1yZYGnbbsCW+q9DCo9t+UjeU=;
X-UUID: e64a22b1a7ce45c3aacf8be0f795b837-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 155295366; Mon, 17 Feb 2020 01:20:25 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:10:42 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:09:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 17:09:57 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 2/3] drm/mediatek: make sure previous message done or be
 aborted before send
Date: Mon, 17 Feb 2020 17:10:19 +0800
Message-ID: <20200217091020.16144-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217091020.16144-1-bibby.hsieh@mediatek.com>
References: <20200217091020.16144-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_012029_557454_E47D344D 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek CMDQ driver removed atomic parameter and implementation
related to atomic. DRM driver need to make sure previous message
done or be aborted before we send next message.

If previous message is still waiting for event, it means the
setting hasn't been updated into display hardware register,
we can abort the message and send next message to update the
newest setting into display hardware.
If previous message already started, we have to wait it until
transmission has been completed.

So we flush mbox client before we send new message to controller
driver.

This patch depends on ptach:
[0/3] Remove atomic_exec
https://patchwork.kernel.org/cover/11381677/

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3c53ea22208c..e35b66c5ba0f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -491,6 +491,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	}
 #if IS_ENABLED(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client) {
+		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
