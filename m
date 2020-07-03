Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB82C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 09:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF61E20870
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 09:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nix39BUm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qS4t1aGR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF61E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSeB4BiavCDY8oOFs0hRbm8Mro6PV9oQgERaAQwXxRw=; b=Nix39BUmNA6pSbttPlfnM2Zab7
	5AlYYpZZpUeRLof9OUgcNcrCmPrNET4ZqrF54Yu4ky0FY/ikL9jQ09K34iS75NkyafRr3mqkd62gt
	6Gt6EEfrRcI2Sv6l6j5znAxegvqKvLgPzf9jiI5GVw9Ey1M7VU3ukd8kO+c0yWa9Z9W9uUSEvkeKQ
	GlYsnFt6Pal0U20idGZPj+PdrLwYG7gKNcbCz+sjZjoyiS31g4lxsNbaRSdGdbH1oUVyBi3K+OXDD
	TMCqysPEH+vtx3xpuBlDbGC8KOUd3enWygqYBwN/s4RkW0ymsYacLAknmQLFUKWpVMdbAXPKGcdKi
	re1Q72FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrIM1-0001jZ-2q; Fri, 03 Jul 2020 09:51:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrILy-0001iW-3b
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 09:51:31 +0000
X-UUID: 0701385e794e43dd88aeb8281f589155-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jsMFJtcW/JnItlp79G6hD6yY/tk89ErR3jd+rCAsl/A=; 
 b=qS4t1aGREGKIYkBDX7FYsJa5N5tHKwJP1kvJjAZGhbGePXUKI/gMI4WBWsPjzyVlpAJmS8Mcf/fSh2Q70PQ9JnqgBXRty4TaPUbwPCO+2tUPyrj+SBsl7LE5CNt0Vh/cSjugXdpw2/3T2VRiSvKsubTdWGfYfBD0CntbCEKTJcc=;
X-UUID: 0701385e794e43dd88aeb8281f589155-20200703
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1961304950; Fri, 03 Jul 2020 01:51:21 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 02:51:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Jul 2020 17:51:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Jul 2020 17:51:14 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: auo,b116xw03: fix flash backlight when power on
Date: Fri, 3 Jul 2020 17:51:13 +0800
Message-ID: <20200703095113.55712-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5574DF20B4595058467B711402DB5E47F26C70718F5EC942B9184F35BC2AFF532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_055130_291537_21769659 
X-CRM114-Status: UNSURE (   8.52  )
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
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..18f34f286d3d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -734,6 +734,9 @@ static const struct panel_desc auo_b116xw03 = {
 		.width = 256,
 		.height = 144,
 	},
+	.delay = {
+		.enable = 400,
+	},
 };
 
 static const struct drm_display_mode auo_b133xtn01_mode = {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
