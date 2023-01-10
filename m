Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E0C54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWLgk4eMZAsD/bVVJsuHq4USM6+AlpxQ1BjwEy3BOtI=; b=BaD3UnTa0HHAbDxZ9vpHf42q/U
	agXfl3AoBQL1qDzMGc297c6EKK7UMladRrP2y5KXPS2HNrnms0mQqaauiUq7DW8V90rUj8F+PgSIq
	J9ivWQRFAUq7tI6W0UOWCqYDkC6Idzp6WdTKv6v+HNNyXAhRx5uTpvEEJJD0rKua5u0PJGcdCUA5e
	tDdVwFyWaDq6H0APNtrgzpOfwHQ6NcWtMP/r9aODu2ErmcgeDgYLRDN9J9cNepEk30hPrxzx1zzWI
	2r2ZTPwycv+Tqp0bg0UyCpxw7XTgnWMh0l8zFcWF90DNFvH9aEq9FGB3w/o18vIGZ2HSy8jWpbl1Y
	KRXN4i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7vF-005RrO-NN; Tue, 10 Jan 2023 06:15:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7vC-005RqF-Q8; Tue, 10 Jan 2023 06:15:44 +0000
X-UUID: 33636c6090ae11ed9febb318cfc39896-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nWLgk4eMZAsD/bVVJsuHq4USM6+AlpxQ1BjwEy3BOtI=;
	b=AjoFMeWjSTcaoplCjp0Nj/sQ/wFeU1vDV8nmxX7Cu7KTN8PDLJxaCQv8MiAjiUOO7T+a4gcpctuHz7LD3RzPrxH0pgEfRcL3twUSHHC7mqYTs/fh+NnciZ9sxcnG7C+zMS8moVa3BkydKnB1JJcQDdC5IwAA/FXyPN9kodytpig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:9d13638f-a14f-4c92-8ff5-01987c198403,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:31053254-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 33636c6090ae11ed9febb318cfc39896-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 886996971; Mon, 09 Jan 2023 23:15:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 13:55:00 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 13:54:59 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2 2/3] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code time
Date: Tue, 10 Jan 2023 13:54:52 +0800
Message-ID: <1673330093-6771-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_221542_868597_0F7100F1 
X-CRM114-Status: GOOD (  11.82  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Since the panel spec stipulates that the time from lcm_reset to DSI to
send the initial code should be greater than 6ms and less than 40ms,
so reduce the delay before sending the initial code and avoid panel
exceptions.

Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 857a2f0420d7..f0093035f1ff 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -780,7 +780,6 @@ static const struct panel_init_cmd inx_hj110iz_init_cmd[] = {
 };
 
 static const struct panel_init_cmd boe_init_cmd[] = {
-	_INIT_DELAY_CMD(24),
 	_INIT_DCS_CMD(0xB0, 0x05),
 	_INIT_DCS_CMD(0xB1, 0xE5),
 	_INIT_DCS_CMD(0xB3, 0x52),
-- 
2.18.0


