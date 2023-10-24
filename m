Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F525C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQCik8KGy7uP0HMhVPEmAaiZ7pU4ORlIvGE0VGAdLew=; b=RGoRp+VCTGbXBy8jec14XS3URi
	IVtbMc3q6slipbkiFJP9wZDx4D9ItogmcmPHOZjWmsmKyNoFsycW6M2FPYuQhKYEsaRhbJRxLx8fY
	QL018ZyHmn0NN/yjvpj7+MxZwrEftU1pn/J7SSDLQc7pMuU5hdEqXLtZy+3L5zgaBCoeeT5bWfzGA
	r99+wf7uamrgb6Og03zfY6naeWANf+1UPKsv4UY9qUKY9V9PEjc5DBl/IehcniWcg1XFyXggfvEIm
	ThSLqVy1cbMnJFaIIFbCH3wrznBAoYjEDTFZDJFcw4qzpRcLckeSmGO0Nl8WQuOibEewJSRsmDqs4
	0X7Sgx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2X-009r3E-14;
	Tue, 24 Oct 2023 13:01:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH28-009qiP-2X;
	Tue, 24 Oct 2023 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qQCik8KGy7uP0HMhVPEmAaiZ7pU4ORlIvGE0VGAdLew=; b=FmMZvibDmNwSgYZ7iQt03BYwNi
	Ws7weNNzyrx3xEDgchq0IEjcHIowfZXIt7IEr4OPLNfQmca66DMicaoynxBXMuDEFSdsCQLnoZlRD
	Mix+ZQ11nwAhvWAhEDMyZMA6PjdZTeJAHHYKrtaSROHCaZxSiYSjUSV0p7xokXPw1sUlqAj/jV9eU
	JY4VvMs1DIQFqAOku1gVEuOJh34/1sfOUnSY6gfMzL39AsKRh2x3aAWhwrVKhAXtnb3c2Jvdv75bE
	iCJvaS6MA+se0SgAykGoIebWA/3QnRd1EsViM5EXAXni2PW50d2iqibhXu8IvHKY80DkbxtZ/JYDo
	3YNQJQ9A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH1z-00FVUG-2q;
	Tue, 24 Oct 2023 13:01:19 +0000
X-UUID: 60684bc6726d11ee86758d4a7c00f3a0-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qQCik8KGy7uP0HMhVPEmAaiZ7pU4ORlIvGE0VGAdLew=;
	b=VLsZJNu7elUyA/AOhKdom3CehaXvFPwChR9OkKe5aAMW8CAgF62Mi/og1W8I1lzaqfH4xKxvtWdNuvf0KIp6kvhYZJtA69qhTvBavxDWePM1J/bDh41utPfEBHMzUE0FFzrz97p4NUTQW5yszxekfgI7Hg6hxCjQuT6pRq6rBPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:746fe8a6-6f9a-49d5-8f50-f63f1d90fe7b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:34dab6fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 60684bc6726d11ee86758d4a7c00f3a0-20231024
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1507463786; Tue, 24 Oct 2023 06:00:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 21:00:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 21:00:56 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v11 22/23] drm/mediatek: Fix underrun in VDO1 when switches off the layer
Date: Tue, 24 Oct 2023 21:00:47 +0800
Message-ID: <20231024130048.14749-23-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024130048.14749-1-shawn.sung@mediatek.com>
References: <20231024130048.14749-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_140113_353633_660AA111 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Do not reset Merge while using CMDQ because reset API doesn't
wait for frame done event as CMDQ does and could lead to
underrun when the layer is switching off.

Fixes: aaf94f7c3ae6 ("drm/mediatek: Add display merge async reset control")

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index fd14a59bc951..c19fb1836034 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -104,7 +104,7 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);

-	if (priv->async_clk)
+	if (!cmdq_pkt && priv->async_clk)
 		reset_control_reset(priv->reset_ctl);
 }

--
2.18.0


