Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3986CD1288
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=; b=dP6YuNWkdRjSiJdOS/Em0pyhQG
	tYtcyCRUhg4sUf4tqxuGgx9ncZyDAL75LjSmUrXDpRXSAFrWfzxyudw4fhyqWE/TdSarPt1KBgPKJ
	ytlWcNX1/C8ZRacDVOgyOsqAP9iu7FJG2BnviuOzWDoezZ22AAUNniaTHX5dUKaTQ+LgQ73Zw+qO0
	PKlD6sUFWJDauGTuH7xJYUnb4em4MclV97cIEdR//QWbmus2NllojY0+qnWDpwn9cQG8LlQyV/myI
	2gWXf5aa9/yw8nFEoUCEBUiZtXg05FGGm6pU3teMvgYeYsgWpEfoN0410afBaIRpYeTEl3C02jXT+
	h+RLdEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYT-00000004C7k-27TO;
	Sat, 30 Mar 2024 20:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYD-00000004Bsq-3G0D
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=; b=Qyxee1ILbaFXctGLlLleKXy2iT
	PF2m3jUu2m9i0zxh+XAxRv3/OVtt4FOrK/2QLl01JWi7oxwYv83IvNE3diFw1l8zc9XfMRBNUKydf
	xxgGi0aI+k1LJ+nI4hXsf5v9X21O/dmPGJf9MQYfEgElT0HiwvgsI32wqSNP5mBiAGN4/6qjTmYbb
	4doscjbS0dTyLn3/RqYuwbJZCXqeLvJW8UiN6YcNw5hVjPxaREL47tiHpgFJ47YQu4HMT8jw3P30r
	PZCtCB1NmccVCtGTwr+CG7vk3Y5Sl/5FfUiew3hA6tBkCeZL+3v09PSCOvnll+qwMNDmTycVxW6fT
	KVBW6cLA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYA-00000002EHp-0nnI
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3416a975840so2330547f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831416; x=1712436216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=;
        b=smGOoHmH3qfo3poTE9J3sd4hVMpIIhNcIY9ZHddVbEqSW2BhaPeg/KDfvsO8mtEAtU
         CeuBrAxOJsobYQnksV+lXlfT93/GCTJEkucFBuD9/eqwWyc7t4Ewrnd3+qcGnOv09pYs
         Y/o+4Nk82TxfZmhFLHNLKeYR3ry8gx2dHzyqHUJv7woTDYiIkfeQ3uUYHJXcrVzy9Gkj
         moLCiHpV5Q1ZwO44jeo/Z7HjXDeVnBjgzx5q3j9K7mAQ0ymrGQITQ92yJYx6A9stvq2h
         BJduNpKQNLH2GUNgawOPQe9qfDLHmPsKZcAZ/544M1Bv3uLWynlP5y207uWcQOOVXmFB
         dxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831416; x=1712436216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=;
        b=XDGXwuiyTLcLmxrZdx0YhA8dyZ8fRSRvhE5fODjqLt/IVMZjYfNUdtU2itU84rmpST
         6bXfmid3u0XxwtAemRaXF8CkZEyn0X91T5Erun5CZL45AeWYP2R5y8jAyZyTuN/xLsaO
         UoOUlkfyb3+5JeAePNVKjaJapKG6mQ/ccLisGqskOVUYhvZOEuifv6DDZSRkKwnglLQk
         YUMqsNP4MIOFx6cCFxnIYW1ZVG5sG2PkQpv5r7V8hHljE7v/+NLGkltXSqkflqt4ph3z
         NSJDPQQ1lPYFnD/kLKAxqn+h2RlNBtUpexinC9mLJ+ojyKWsP4ZN3LHI92+QqOmbrYSe
         tWvA==
X-Forwarded-Encrypted: i=1; AJvYcCXiWmor5UjHUhZPTvFmsCB3zJgTNruCSUy+8jCAfgJGRkoG5/87DTfZef0E1oBK2A72rBIScwq/8FfF1XEYiBuEZ5NFFS76ZQmYKX/gogX4dh46
X-Gm-Message-State: AOJu0Yzfk+pUK2PtJum2+Knaw0nN/e1nzYlent6UW8+qjT0bxfi/aNkq
	Tt+DcAsTj2wAkVpwwlAs+OdoUouEM9zl0borOwAkRfRVRHi7fksVdqiDPE3HPJ4=
X-Google-Smtp-Source: AGHT+IG+hFfASnhq0/mKQq/p18W4G3oaCfPiHAHV8QkPFTQ+2T8akxT/w8IqahTgANQV4BXyYuOElQ==
X-Received: by 2002:a5d:5f8e:0:b0:33b:87fb:7106 with SMTP id dr14-20020a5d5f8e000000b0033b87fb7106mr4541576wrb.55.1711831416697;
        Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:17 +0100
Subject: [PATCH 06/11] drm/mediatek: ovl: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-6-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v30/7g6LlGP3tVcCZHt2tO6SJcJFhbx0VZHT/xHvl3g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlpH/nOsD9iDkauUFajwnyggNRWK7nl4QHHO
 o9wKXLw0N+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5aQAKCRDBN2bmhouD
 10pyD/4gXiChI6eF/nqOH/ByxwmwE0S1I82agd65uR4+66SlR5/x8yjVJbZMPxbRVdKFW34oGWu
 7zQx78eDNJUdj46hPevBL9YyxLU0DDJBKIO3lGnBvA6qTdFSnZDgFll0udt/PYkxrspnFtHi4cF
 /a+Qzmbqq1EJ2+/28ISHGz1d4XAnQiSAgiz+4QKGonnvawsC4aU2349Sfy8Qz4tfCrceFDzGTCd
 BEOYpQIoFflOxMVHckm30bU2OYWEqgM/juyXtBSUu4pFXpTRUwg6Op3yVf5bP1Mdq5CWliPQ5EZ
 FdxhOs04zmesoB8zUgwCWtvsXPTHhpwUi83dPXcn7W9CQjFGoEvENiBIh4e6n3sdixZn918En+p
 ZM4YAh7nTJWmSY65NhgmyoQYR4J6F2asn8OAGcg5fsbbXr4nU5MiicXLdd52A7k4VQYOrtj7zH9
 6VuAr2NoToeiNKO7Hp66WYuTNrF8OwgAO5YheqWsZiNqcNXIfPwbNx/1AXFyOKz2LoKqDMMzfC5
 ujOy7SKcKH4vpeUd4362htI7DjffLSta+CzOpI8wPOneKTkqJONlmJUA6/nzgugyXzaEAkB+/nu
 Tolz6MHQRTuT5FaBr2Ehg55v/aDb6Nqtmn4G7QFoUgO3KimXRvOQ64eZfqFY6adVlfAcMBDSAyy
 W5TouLFV3wQn9Yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204338_550915_30E3AB15 
X-CRM114-Status: GOOD (  10.43  )
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..c754dcab716c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -659,7 +659,6 @@ struct platform_driver mtk_disp_ovl_driver = {
 	.remove_new	= mtk_disp_ovl_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_ovl_driver_dt_match,
 	},
 };

-- 
2.34.1


