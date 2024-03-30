Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5BDCD1293
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZMcyUqBR/k0OnBPZ/xItiFTsULknE/cvSgUpIGsEGs=; b=FeWQH1hz3dYQpQ58yPawD7qYW7
	Dzi+3q4VCOauWFuoGAh5KsYEGEtuZNcYiqNNg703v++M8spqOC55378WET4iqtZLqY4lGcodU2EXJ
	fHGGR1gQ9c7Fef6hYW6PL5aPSx6RpN/VFezcZfRlr6gP9YrfUIehaBOpl67ja2neqfIYtUyY9nWgi
	8g4Ie2PFVpO0CxSFMb8QJ/ej2N69pRheYEFN4BpFr1zZmA8G+hz2PXQIFw6LgbNl5BKErnmMmZoq3
	G0MBs6I1zhlrBPfiCmLI6TK5QQPmZtgK+3vOI2TZCZ0tAGVJ2q/7YXTlfM5GWjODuxH07Lt1775f0
	9q1QqBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYM-00000004Bzw-0hDS;
	Sat, 30 Mar 2024 20:43:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY8-00000004BqG-1qEs
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1813933f8f.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831415; x=1712436215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZMcyUqBR/k0OnBPZ/xItiFTsULknE/cvSgUpIGsEGs=;
        b=vDcUArS7zPxeuAsvTN0GWiPo2L6cuGc7uamN5HHnMRcd84NUAOr/7HvMc7TBsnMupa
         +UtIyne3//Tx2B/bXSRcF2Eq0QA3fP7qq3fJ++7Z3/YwvYYJY1W43MZESWYWCA5KqdcX
         mgzydBLtImggOcseIYNhuhd4wOjaBrbegO/A1McPtKtXjPimSSZUYZuF3F2v8hZIXRPe
         Updq+sRrSbPvMnAWVqjKsWEfoaJfFiDbM3/nfETum9I+P8ty8Jzdg4Jo7CNHeHOVwPpj
         GfdOqJsFv1eQwcsMifw0rGInV/KPzWKesb3D0VZFfMm/0LepMH14YmGAwnVKsS4O87lb
         aH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831415; x=1712436215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZMcyUqBR/k0OnBPZ/xItiFTsULknE/cvSgUpIGsEGs=;
        b=T6ExVzpwXuiscwitcZnQZeWvqYWzuWafxTZ+cmE0F1vMJ4SucIc5GSNtNpsnaJDDSN
         KaBIl3Gf0KCFU72PFyL2sH/HyBfZT0L33YtOwZ53VcECPU3kHuwGpUYz0FEtuN7kb4Lw
         qq9WpPxn4jMkqjmeKehOjNK0qW6Y01k9CJkHzdzRUeM6lpI8fP6Es8IRrLLpQSz50YqO
         8XNMx8+U6fToTRCWnHkeWpctCIwPsg9KQmrkoLa6T7OGSyU0dXzsJTCERgd6iYFU5we/
         Y5BfQUj+MB0Bipe4DEy46jVDZwQdmnFLawNvceHM2XgvVVRsw9/QbpQ4273NSLQxI7y0
         vxgA==
X-Forwarded-Encrypted: i=1; AJvYcCXTLu9+Pnd9fKcDrTCku3Smkmycy7tLkPurUF5tv1h2KcljnL2114waYkXwGYTLReL7he/ou956yfENmiI/GQmN/5NuRmoiHhIh7vuXvydATQF+
X-Gm-Message-State: AOJu0YwfcHrkpt/Kk1h9OZR+Gml4m4RLxdLyYC0ayG1C4ONyKQewki0m
	7/oWyO78jfrpWniwJ7zvDqNP1wGeiifvJoLk9eGs3jUnRDR7oa8mOwnNLebi8S4=
X-Google-Smtp-Source: AGHT+IFOPcibh7RcxYoE+yKeTFuJDxXx3Ni5EVSpl4ErQkQW6bt0OOu9CjiSEgZ50RNBf0gaqrtggA==
X-Received: by 2002:a5d:6d4c:0:b0:33e:aead:af07 with SMTP id k12-20020a5d6d4c000000b0033eaeadaf07mr7795224wri.27.1711831415254;
        Sat, 30 Mar 2024 13:43:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:16 +0100
Subject: [PATCH 05/11] drm/mediatek: merge: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-5-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b0EHgo2CSjStKtKnfeIekdpJQ/pX6wxzKF2lo+63Woo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHloSNtO1tsRRuakSotnUeOaQAA9DlbxPKmI/
 yM6r0Xqsp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5aAAKCRDBN2bmhouD
 10pCEACFpCtrkjDrwu9QOYzz5bM9bqeh0KBhf+W1dALn5Ht/30IX/W+7jJvPORKHVniuYO33gGT
 a7BwIHK09dyu7aOdYL5bUGjXT4g6KqG39elMjWNnqKcBNMftmpStHOk9Fd3RXhJKhUiHnl7qKjW
 511LU+UBWbypp6yYmFowuMaGHjJZnnUJWyevgX3qZAGy7iED9B/Ce+tRZ1U+mLehS0b5D0rD8Ls
 81mmBqjGtGBHpLZoFERou1ioCvQNFpCWqoKkmC0PnPwyj7EtUguiOd68josP26+PBWX20XczeTS
 3fwqoktAmFp06fxQ/J+3o18p4s2m34/y+8pH5AAfdi+TIkkUyg7VNaAqyvYM4wjx2+YiVXpKoUO
 9FTLgL+Lai5oQkbncV57uYm1vLUBBAavV7gWqkv10p0HkRahzhsOKaETxQ9y/q0nqU4QyZNCbjK
 VR4CLTcWom7HtOI9y5Bv3GPsndZupDz0Z5iivrwgAFiDLvpkgfgjvWKA2j6+AdZDXojZDGYaJxC
 jeztkiDPkfw0L9you3OfEQWVpU8tqLaAu8Dso14Xzg2B833AJUVMP28JGe3iGFc9laMGGtVtEoQ
 lM4DOMK3NNL0zRkr1XImXb6UOqS0y5YupA6yln9qjW0llyaFneRfnkiG/OgKA5n6yJiT+ck4T71
 dEE+TSySv/rG3Lg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134336_575217_9EEF85B2 
X-CRM114-Status: GOOD (  10.48  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 32a29924bd54..a04f76dbef73 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -376,7 +376,6 @@ struct platform_driver mtk_disp_merge_driver = {
 	.remove_new = mtk_disp_merge_remove,
 	.driver = {
 		.name = "mediatek-disp-merge",
-		.owner = THIS_MODULE,
 		.of_match_table = mtk_disp_merge_driver_dt_match,
 	},
 };

-- 
2.34.1


