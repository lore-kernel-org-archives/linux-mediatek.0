Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8147ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jmnaY7L1qSorp3e4Jkx73YeKmlVyaKeYcmjeT+75RFg=; b=DNRP3GVSU/LZuXXkPI5Z1jDdHX
	REubwnc+izbfLDTnIfiON9LayZYdRKZhYMqutrboyFt9CEVnE2QWFi5iYtgta85MZmub4IBpJyzBy
	CERoKnpMHLUxFi0FQlX5A115OYsSjqN+Q3mhDxI2kWUdkA+CfPBaiW8S+FzjgqIJhOcJ32lGwcFnJ
	J5kaKD7EPb+CpUkxFNFv/XPRsGIgvLxtd/PoA9xFE5SCKHGl44ULHmDxmCBmtOXWlen2DjEbg7VtX
	2apOWwGrY7fP8CfomRIpVIjAPcUXMmP1gVSUQkJOoymbkYf5bO5ao7+2OFi+/gDuJHTRuzq7qVkiw
	R0mJ7Gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjox-003Dh4-32; Thu, 15 Sep 2022 08:02:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjoD-003D2d-MS; Thu, 15 Sep 2022 08:01:18 +0000
X-UUID: 248b7772602c4703a6c85f7f76ef94eb-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jmnaY7L1qSorp3e4Jkx73YeKmlVyaKeYcmjeT+75RFg=;
	b=WvLIob0VqYA96E8BT3DxfwQVaROfxhSEVvgBIwAebdPNrozjtXrVEmyDDiNMH7mciTeAHzTCJoV+MR5FR+yf317XZqq9qQAhA4xRkcojjwuS+2ist1goHTUYnU5np/+Sd9Id4deUNSENxVJhWFQdWt0146K2d2QGKEEp431uF4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a2790327-398c-4bff-959a-cd89926cddff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:258eb97b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 248b7772602c4703a6c85f7f76ef94eb-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1652026746; Thu, 15 Sep 2022 01:01:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 15:50:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 15:50:32 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
CC: <matthias.bgg@gmail.com>, <granquet@baylibre.com>, <daniel@ffwll.ch>,
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH 0/3] Refactor MediaTek DP drivers
Date: Thu, 15 Sep 2022 15:50:25 +0800
Message-ID: <20220915075028.644-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_010117_745757_1DD204FB 
X-CRM114-Status: UNSURE (   5.51  )
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

For this series, we do some clean-up and fix a build warning.
This series is based on linux-next-20220914.

Bo-Chen Chen (3):
  drm/mediatek: dp: Refactor drivers in mtk_dp_bdg_detect()
  drm/mediatek: dp: Remove unused register definitions
  drm/mediatek: dp: Fix warning in mtk_dp_video_mute()

 drivers/gpu/drm/mediatek/mtk_dp.c     | 70 ++++++++++++++-------------
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ---
 2 files changed, 36 insertions(+), 40 deletions(-)

-- 
2.18.0


