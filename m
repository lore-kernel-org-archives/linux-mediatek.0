Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEAAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 12:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+Pcg0UW3/VpSmufABE9WQF/YkxxJySEHksD2l7TwL8=; b=XEczz+FGDB78M+0qbbiar1GBPB
	NlmDEgNN5i89+3lzmQSNKafB68Ob0ET8NWorBqiR8+1/IcWlXzULfuvRJLOzBB0ZkbyoxJs/yCFu5
	tAflMDZHibvZms+JpIcwx3nwsjuPuVR58SD0m/4JZ5alKv+XtKf3A9qPBvd8xl7QSj8kH2pnNUZyt
	AyiL6q56to9GBIIYTYxeyuWmotDJWHQn9IFPuoYVDxhto1Qb4IgURIHMUeR/puaP0ltKpddiG/HM4
	gHP86qfUv9LFTZBQnQ5uQJt4Ztb5+8Re+ZaRRXi+9egk+8iXsPylrqCT9Rrl6Ek38ZgDCqdZ1jDHQ
	qP8bg4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUtW-00ExKh-2z; Thu, 20 Oct 2022 12:43:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUSy-00EdFm-H2; Thu, 20 Oct 2022 12:16:08 +0000
X-UUID: 5277435b267241d281e438efc5a2d516-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=u+Pcg0UW3/VpSmufABE9WQF/YkxxJySEHksD2l7TwL8=;
	b=nKIKVnxUkwO5X/qgMzVkjSmzKzv2Nh8TcMz/y1CtJaxwURXpL05VD/7jmG0BNGTToi9KiGpgTL5lpCoiO2QUoDeuB9p3jvEzyGTIjt2SCTNy5jCre0YK3ZNlws/PDjGgqXjnJuta2Y3QdAQC8bGVl6zHtRtT10l5+ewdBa17fOg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e443eaa2-8852-4145-af4e-9811bd52423d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:07917333-7d3c-46b3-a6e9-0ba03eeda632,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5277435b267241d281e438efc5a2d516-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266603588; Thu, 20 Oct 2022 05:15:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 19:45:56 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 19:45:55 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2,0/2] Add dpi compatibles and platform data for MT8188
Date: Thu, 20 Oct 2022 19:45:51 +0800
Message-ID: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_051604_672979_34F37C05 
X-CRM114-Status: UNSURE (   6.30  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

Rebase on linus/master v6.1-rc1.

change note:

v1: Modify variable name.

xinlei lee (2):
  dt-bindings: display: mediatek: dpi: Add compatible for MediaTek
    MT8188
  drm: mediatek: Add mt8188 dpi compatibles and platform data

 .../bindings/display/mediatek/mediatek,dpi.yaml         |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                  |  2 ++
 3 files changed, 20 insertions(+)

-- 
2.6.4


