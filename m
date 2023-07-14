Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36394C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4uR7sIcsW0oD3DH3/+YWiBVGi54OMGtSqKkjMVXam0=; b=ndnln1ipkbVEDWxzWI0JbysM0H
	lxK/1q58zBgMdqEhcoZRzIUXTgoIjyfcmrFWm6Uryn3g1gqFuLvepQpR8pflMm5XeNfpUtMGv+fP6
	Zpq4Rf+qqaoOdSjo18FUhpotaC+hCbS36LWkC5Oe8/uI89dxPhf8VSG73cnGK25fDNla8KRzpmWUI
	7ntRp5nhpeP2cM0+SXJw9j6Fzyb5XX32XAl0fVHKcnYsnNNNtWz/khfmq3hAGS980WIN7D7mGjUVK
	oxlIfbh7pjxRkE5pBDcTvwV42ZRbDsNTaktH/WBQpj/3EQnG8yuel7hbvuAbNm4e3Z09cPwWnpDof
	/ORcxd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFQP-005iUm-0H;
	Fri, 14 Jul 2023 09:49:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFQL-005iSb-0t;
	Fri, 14 Jul 2023 09:49:18 +0000
X-UUID: b026659a222b11ee83ed1395ce914268-20230714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=h4uR7sIcsW0oD3DH3/+YWiBVGi54OMGtSqKkjMVXam0=;
	b=eH9ivg2hXh7RHTT7hYHzcU48QlHUa3l1JxoJmg5SW46EBpdHY8M1wbX8ocdUszdzuro+0VMqCrQpfGD3pg5HHno3/so51YDZPinoqhZBUCvCeWggg2G+m2kjZIYb1SJB1vtaU0gVDessXalLhhA0IJUW3Nw80RQ468WmuBk6xQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:c9af0f9a-7580-471c-bc9d-6619f7078be2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.28,REQID:c9af0f9a-7580-471c-bc9d-6619f7078be2,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:176cd25,CLOUDID:fce49e87-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:230714174914MT7FZFKA,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: b026659a222b11ee83ed1395ce914268-20230714
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 630866324; Fri, 14 Jul 2023 02:49:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jul 2023 17:49:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jul 2023 17:49:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/4] Fix mediatek-drm coverity issues
Date: Fri, 14 Jul 2023 17:49:04 +0800
Message-ID: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_024917_317169_AC32A836 
X-CRM114-Status: UNSURE (   8.69  )
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

Add this patch series to fix some mediatek-drm coverity issues.

Change in v4:
1. Fix title and commit message in [PATCH v3 3/4].

Change in v3:
1. swap Fixes and Signed tag.
2. change cast (__u64) to '=' then ' *='.

Change in v2:
1. remove kfree(pkt) in mtk_drm_crtc_create_pkt().
2. change the statement of cnt reach to MAX_CRTC.
3. drop the mtk_gem_obj initialized patch.
4. change casting from unsined long to __u64.
5. add 'int offset' for multiplier calculation.
6. drop the unrelavaent modification in dereference null check patch.

Jason-JH.Lin (4):
  drm/mediatek: Remove freeing not dynamic allocated memory
  drm/mediatek: Add cnt checking for coverity issue
  drm/mediatek: Fix unintentional integer overflow in multiplying
    different types
  drm/mediatek: Fix dereference before null check

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  7 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  5 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 28 ++++++++++++------------
 4 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.18.0


