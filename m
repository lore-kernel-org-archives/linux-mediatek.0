Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A2AC2D0D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ved9pZHSLvDLUPYxuu5ADz4/DRMPqTel82rQmFgJsv8=; b=bqeh9hJBkQYo6V69WpXTo6MBq9
	GzWTGp7RvgE6YURPuAZcSetbQivQnN4+FiFD48HpGibQ2bHcYeyZvMM4HJhHB5SWB3f3ueZCcEqfB
	9tr0CtNbb4846GhR7hOzx2W8L3b08jWmz6LAXmcYKA2TXjMrMQj+j1F78h7oFFBUInpL+aVwF+yUl
	rMSUA84jHCFC15mG0qBgk1cLF4XUiafYp+AKjgTWHs0yc82iEmvYd6qoE9HoyKB1XXrTfabHaEU2Y
	NNxqNeJCn2iOy5brGnEF9UfFxFYgbcuMiidwWptWL/O+HaZOsj0IJsTQtmJg1Uoln42XxCSkPGsJG
	7vFqLB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnj-0000000HZSY-3k7n;
	Mon, 24 Jun 2024 16:44:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnZ-0000000HZLY-1IR3;
	Mon, 24 Jun 2024 16:44:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso33156355e9.0;
        Mon, 24 Jun 2024 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719247448; x=1719852248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ved9pZHSLvDLUPYxuu5ADz4/DRMPqTel82rQmFgJsv8=;
        b=I0mt3I9XNLP35eFEqZ+LjBNFx/4ZkwAs5lez3wG9IKwjohA5FMbeZJAuEpHZqvLij0
         1ZnqZ9SoCfTqr47wqawojCjfZxFP4awaWfMu0FvzMrwqmzmAdD+eb4xQFHB+XwyK+lmk
         BLf9m38HDCFhGn06BeXlRVyW5neWnFzP8SKiif1hMXZmglAP9NhJNb7qjZGx6X7XHyfc
         kyypcaRJU6qJj8jXtZbv7IYuB31dTrZ9afL2nGaU8k1zYJ3aCDEei83HeObdezlFcs8e
         HVqHUFKBD2i2h+yce67CvrhHyBesLCEVf+LmBpandYPxcTqBM6yMQzxit52li4ZIMF7L
         GItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247448; x=1719852248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ved9pZHSLvDLUPYxuu5ADz4/DRMPqTel82rQmFgJsv8=;
        b=X1KQWkvPzpz0qhVmyCYKuSpfKlYta2dx+uCzVpAFoL5bSZ7wKg+vrEwJPKv2/nl9SG
         psfXJTpfta9Dw9B44yxDDuzf5Ju7FnVwmUN/3tm79KejZGUDvS62ga+gGV1hqNzy60Rl
         uIDwG7XyZlr7jxr9KYH0MMpOJtMm47zVtfG5CqhWC6aa+G8SqzqLoIYJ0LcP4G1gW12i
         wC4BewTPdnRLj2k+iJtQc8GzYUfXQ0nhIBNYLINSrnZXGCy9Lt09vgF+pOZZE6v+9Pig
         VINJE7zHGHArHhinmr2E1FCvrSSvJVJ3+pYPpiNZJVr12Fn0/zE2lV+pDZhaf8jRJ4dP
         mTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdvLa2yWg/1+VJWKNZFywvt6CO/kflH+zWw4YvFSw9i4SfcLzGG+wbH0c/c5z5QLKDRWCVPl+LEAXdDkfNHe6hBcA2q8BL65mJPGii7Q/z1XC5gYKDQqwqpe3zAcL27qqOUneBL+IPxYVfrCRH9GCNJ0+dl9MT/Zc=
X-Gm-Message-State: AOJu0YzwfeEcAuwMVf3CBV1roi/38BiRXKsOXYaqdkC5N0tMTXrIOdln
	YcRj189uSs5clKOY4WuMoWO5Mo5XAlMkd0IjKSyOrTASmY1FUrYRRxrN/gY9
X-Google-Smtp-Source: AGHT+IFxufk+8bZWSFo5H95XETmbIR8xWYc74lh7Lzz8/zakL9+PW+wJ3qLYXaIxadr7Xc+Z3bl8Bg==
X-Received: by 2002:a05:600c:138e:b0:421:805f:ab3c with SMTP id 5b1f17b1804b1-42489533effmr61514635e9.14.1719247447674;
        Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:48 +0200
Subject: [PATCH 3/3] drm/mediatek: ovl_adaptor: use scoped variant of
 for_each_child_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-3-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1676;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wa0T80IF/y+nnAamP5x5ocsqIEtI9E9JOf3ilDfD1yo=;
 b=M9kK0ImZkRyD1NOWZet5N+FhNkzhbstvrwy7I96XW9Qwjr5TGDy8zsCLgzUzrxPsLZTtpED/X
 cFIZmEu7appC+67/uzXN9oG5FM74e5jHbRgj7YIRdMdBI8ar0b/8ytM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_094409_432988_5168865B 
X-CRM114-Status: GOOD (  12.82  )
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

In order to avoid potential memory leaks if new error paths are added
without a call to of_node_put(), use for_each_child_of_node_scoped()
instead of for_each_child_of_node(). The former automatically decrements
the refcount when the child goes out of scope, which removes the need
for explicit calls to of_node_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 3faf26a55e77..aec927cce468 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -493,12 +493,12 @@ static int compare_of(struct device *dev, void *data)
 static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
 {
 	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
-	struct device_node *node, *parent;
+	struct device_node *parent;
 	struct platform_device *comp_pdev;
 
 	parent = dev->parent->parent->of_node->parent;
 
-	for_each_child_of_node(parent, node) {
+	for_each_child_of_node_scoped(parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ovl_adaptor_comp_type type;
 		int id;
@@ -522,10 +522,8 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		}
 
 		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev) {
-			of_node_put(node);
+		if (!comp_pdev)
 			return -EPROBE_DEFER;
-		}
 
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 

-- 
2.40.1


