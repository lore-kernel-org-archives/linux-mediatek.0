Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4310C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVa4KO5V3MOh9D7t6Jk8yOsnTI/CasXWUl0Trcd93Xs=; b=CG1f2Fh5awdKw0gomVl4C7uBsY
	GMhiYEpNqa4UtjtQfGm0JbPu97AiEbyjT289lJxuTBYV6eB371Vf2GLS9dfmdHac8WFlBKcCIHd8j
	wvEiGD9WGO1yaFTa/zTr6DhusJgmnTNeafjp0LjCZvL4gdKaBNooUSYvuo/wy72VomQrekuVmw6nS
	kIoqZJ7TAKU3jc1DH935roL3XinxMnHB8Dq5PVbGgs6HordphtyKEXskdch/ZdFPuY/OmJze2BOmW
	OTSls3xJjaCZfMVleTu180WwzS6y3ZWnMRZFptCABsEvGggoJFhyx6gvLOyIS5TK50eEY/t7TNTyV
	I+/ivt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz5k-00000002D7Q-1P1Y;
	Wed, 19 Jun 2024 17:27:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz5V-00000002Cwc-29w3;
	Wed, 19 Jun 2024 17:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D254261F24;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6281EC4AF0B;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818032;
	bh=Nao5IZ6gS4htHNI4Bs9XEbYk4qFYkFkjgxxw6oHgg5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LL/fLTO29QX2UaABYk2m4jwVlQpE+Z2f7JkQUuxFbIwkjHAYmrqg3xpJ8y1RfPSk9
	 OqRw209EfLXmF31R67OKclMXtzlg2tPyEj5DsjcTBCKzC30lgjm9oMCfiQSW6YtX0H
	 q7zwfpenEx5FknB6phOrM0DSyLLMg1o6OCL+SSSRSAY98xcMb9Cx89E3IVhWzTOjqv
	 Gk7GOkP+RcMknB7TDFcJD/KhJPQZEQH1j0vBT7WTaPF0isgJM11RFASC9eT9P3aueG
	 zprewtlOc6fKGK9WLy6HFMcya8z77ypCfAgq6G+lmUgzo7O2DiA/26cR7+WnjDAW/l
	 raBOBxSXKg3Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55424C27C53;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 01:27:09 +0800
Subject: [PATCH 4/5] drm/mediatek: Support "Pre-multiplied" blending in
 Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-blend-v1-4-72670072ca20@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-0-72670072ca20@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718818030; l=936;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=3bQjcoj+V0e9su0dM39EChvPukc7zStbrzEBWWh/Frw=;
 b=tmGg6oENStsgX78tH+bSHouFVDAfE2H7VBaEIK/gPa76rctdyJWSPy0rnc5TkdUO5Jnni8zSK
 fbpepZ4ykebB0sXZivN86VVGHO6snBnajwCVvviUw2iYjuEzcz//B+b
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_102713_913121_F8056074 
X-CRM114-Status: UNSURE (   9.22  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "Pre-multiplied" alpha blending mode in Mixer.
Before this patch, only the coverage mode is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 48b714994492..bc43d0d760c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -177,7 +177,8 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con |= state->base.alpha & MIXER_ALPHA;
 	}
 
-	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    state->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 		alpha_con |= PREMULTI_SOURCE;
 	else
 		alpha_con |= NON_PREMULTI_SOURCE;

-- 
Git-146)



