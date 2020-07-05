Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C95C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 09:55:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BAB6207CD
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 09:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lzdR4daw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HiAajLMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BAB6207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yo4nSp+53iWBeVskB1Qo9GQGHORSxPSTGgQ2t3OCOtw=; b=lzdR4dawV4gw28T29ZTQ1ohJW9
	dxIfclYZOK8rCaQN5L5WlRIvd6wc4A2+dXgio5C/r5iNpMsNyqbwnma8Lo2MQEh3zp/0Q/l2uEOS7
	+oXLvlsdWj6cIPpxcqaqLxiZxgS04A1DgihJVj2d5XbReSdU17ufgitPRbYEgBnTwMtJz6aSkASfN
	5393udMGrhBx+MGyjh3uaacvpoeUUrDDSK1ybqF+Ed1kugSZfmsavUabhCy+M659RjoWmtejpzRp1
	xVHzfvnIdKQAUIiplR7XLIRbS79poQdvD9T0RiXTJ/gHMfgp/NPeGpdkO1+ArxNwiVHAVxmZuFRL9
	BjE5KV7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js1Mp-00063N-7f; Sun, 05 Jul 2020 09:55:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js1Mm-00062j-ET
 for linux-mediatek@lists.infradead.org; Sun, 05 Jul 2020 09:55:21 +0000
X-UUID: 338f3266470d44e3a4f6d11a59dc68fd-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QLXFgb8ipruaYvgJKRS7Q6ukuCrrcRqCGEhV6ucS7zw=; 
 b=HiAajLMNjaXMw8PKwsFvnhhjmiD1xG5++uTtU9Pm9P8JCDt6qBaeKgX8nMOkz3qCL0fb31ecLkXr82FJ2dY03Gpd+TYrzb7DjEiJqttSnkJEyUt0BUR95EZVwtHxCv3oaiqlNLmenXL04UsOMWKaaXFdVy0qSsYdLetDocRHtN4=;
X-UUID: 338f3266470d44e3a4f6d11a59dc68fd-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 810167810; Sun, 05 Jul 2020 01:55:12 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 02:45:11 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 5 Jul 2020 17:45:08 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 5 Jul 2020 17:45:08 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v2 PATCH] drm/panel: auo, b116xw03: fix flash backlight when power on
Date: Sun, 5 Jul 2020 17:45:14 +0800
Message-ID: <20200705094514.34526-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 17185F853249A3A30FADDE7A20621E16B03AD050448041C032CAE16CCD00B50E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_055520_703452_1897276F 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: ck.hu@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-mediatek@lists.infradead.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Delay the backlight on to make sure the video stable.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..61781ffa7840 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -724,6 +724,7 @@ static const struct drm_display_mode auo_b116xw03_mode = {
 	.vsync_end = 768 + 10 + 12,
 	.vtotal = 768 + 10 + 12 + 6,
 	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
 static const struct panel_desc auo_b116xw03 = {
@@ -734,6 +735,12 @@ static const struct panel_desc auo_b116xw03 = {
 		.width = 256,
 		.height = 144,
 	},
+	.delay = {
+		.enable = 400,
+	},
+	.bus_flags = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
 static const struct drm_display_mode auo_b133xtn01_mode = {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
