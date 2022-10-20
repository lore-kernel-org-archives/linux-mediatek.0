Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B65C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2/QBs75OcbQTrkvBIFamH2kCxToyqzotcYVba2r5Ms=; b=cff5s0wVPYKZEWYrPFXgZcP0EX
	ldrYnF0pt/PPpCsbhNfdqe/vWZCNUDbEGgVc35SDdS6oi44j9ws23CR3jmeBnHAAMUKYc2osaXFz/
	f4sWSJW4mdKhrAiRPUz74vUrOe9lI0ke9I+udfAGoV2uFLWhCTLm1k4SjlPCvGEy8vfHE8AVb8mBD
	B1IBeUG735SaTR303UJdmyINxgW/KByJkPswHvV+y5LPrzvRfJ10HwYfUO3qNcBNtxnG1h6rEjHxc
	JzjOyDFGUuXsQ/iZ9yzNn7ruBMTpGIAYgxy8f1Gn+KmIZV0Yd3gt4QNZ7epOYwuIPvzh5eBAkr5xE
	joGqy1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPnD-00BZcw-Ds; Thu, 20 Oct 2022 07:16:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPmh-00BZRf-82; Thu, 20 Oct 2022 07:16:09 +0000
X-UUID: 9fdca068ff2c4088a6664136bb9551c2-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=i2/QBs75OcbQTrkvBIFamH2kCxToyqzotcYVba2r5Ms=;
	b=BPagKtxU9j1W8hpyBTRnoML1xMEoeWfx4TZlxLcQ9qqnC1OkONOiba5iT5jkpMlsDCHApQ1nzLE7UwScgi86Ki/fMk9tmvWv5xUfPWPsXlFFgh9nkuyPpTYKKyCMRgKx0dkAFhqEt+C/v6qq6kugjS02GFxt09KzG0Y+Wlc4XQw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:fbfeabd3-a284-4171-94da-9aa21b17a4cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:9ebd64a3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9fdca068ff2c4088a6664136bb9551c2-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 581543118; Thu, 20 Oct 2022 00:16:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 15:05:57 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:05:56 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 0/2] Add dpi compatibles and platform data for MT8188 
Date: Thu, 20 Oct 2022 15:05:51 +0800
Message-ID: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001607_564128_9C32683D 
X-CRM114-Status: UNSURE (   6.53  )
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


