Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90CAC4708D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 03:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LrM1TjJhEDXqK3mki6dkj5bVxRVhHMMcBw0cAXwlPN8=; b=l1RQl7uvKsWDnOj0BftuWwn3wL
	ygcCTE6OaA5mKFxHcwxHVBsBSNxhfjfTNBTtN72437nN7J3Xu0jzy22Ll+qqWhGw+31Mjv7xtNBTz
	t9NXQsQx3OF3+iKg6WiuGOeH6SKKoUUrkN5J7JBlQsGAEW0G+1x1zyPDKStyjtBzLuq+ach+H78ZT
	72KE8QZGVkoEJ28FzWOAYmZdJrft7M5HpAS2ljcJHMgsxfws1TdRwjvA/OuWG9rmuM1Yp1qqWO1Vz
	41hAoiJ7qbCVoZW1HJg/9HqO/OxU+cSAF9e17J3TaNOvhox/6fhDIaf/nlpgZhvyNFhTwuq+znezM
	S0yG3oRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDdWb-0001Ww-FT; Fri, 06 Jan 2023 03:36:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDdWX-0001Vs-EQ; Fri, 06 Jan 2023 03:36:08 +0000
X-UUID: 6a199303a8c7413f855acc384ea8c999-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LrM1TjJhEDXqK3mki6dkj5bVxRVhHMMcBw0cAXwlPN8=;
	b=P3Q4t1n67uRShDLGPO1gJ0AbG2sh0gVIHs+xG+XIZrKAkFa650hFPpUa5GOjbgdVd7txnEmPvFc0DNYQIndflxgGYJtU+KYOt6WverLL8iKw+kYYfCKl3zPELiQ7VP/cCwHH5G+XTKYbl87Z2ccOS2RJ7dFmohvHRHxTn099Z5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:110a61c3-64ff-4a1f-a471-6adfa71155cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:9c876a8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 6a199303a8c7413f855acc384ea8c999-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1819932426; Thu, 05 Jan 2023 20:36:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 6 Jan 2023 11:05:24 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 11:05:23 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 0/2]Reduce lcm_reset to DSI LP11 send cmd time 
Date: Fri, 6 Jan 2023 11:05:19 +0800
Message-ID: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_193605_499882_89EB88BC 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

The panel spec stipulates that after lcm_reset is pulled high, cmd
should be sent to initialize the panel. Within the allowable range of
the DSI spec, this time needs to be reduced to avoid panel exceptions.

Xinlei Lee (2):
  drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.18.0


