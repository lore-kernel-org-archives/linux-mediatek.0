Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49ACCD1290
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIExVlRuthKjEW06MrlFe0iZQElsYGeKhHET6Bz7z/I=; b=TklQxAKsat1ZGXvOzwLLLa4r11
	/W8bAE1BewOIchVQsT4RsqflgPKSsSnAz534JRXmUTMh6sG+Eftdk29DXKY8+AoHClaUwFuMpLW7T
	IT3MZCbz5Jailm7Xv27AnuBXYrNLdRxtPOCG0k5WdtjxjOaoSzSeF9YdVU6KUH2CRPCebHFncWmk0
	xlqwmLI08dnuClrfcnidPdXKv37oGWmR0Xa+X1qyRfgkyDbHsoRiJmBkN5xU5rp+6huIofs6g3+/G
	iPMjcE1R5Gw1zUNkhRoM0rxZP7U/Xfx4cI9xfyOh7wggDCJKFWPp2aEf6bGVwEzwa6gB9TCDb1Bgu
	YX0nLuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYq-00000004CNk-3rNZ;
	Sat, 30 Mar 2024 20:44:20 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYF-00000004Btg-2Mdj
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:45 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-341c7c8adf3so1993675f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831421; x=1712436221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIExVlRuthKjEW06MrlFe0iZQElsYGeKhHET6Bz7z/I=;
        b=B9h3sJ7S99HFcEtke6YcpUgUrFaw0mgnuzHZ36qLu0tO0fxus1z0ZvTsNSp57/faeW
         TKZCjXOjZlj/ZmdgHfuVJmxCgIyqKZBVWp6Na5EtfTfPKBaXxQDNpfeD7kmUFiJE155i
         /PjglQJ8rQKnFEo27H6u1yifOiXRcmpmICx3/BLSFZoeKDhwyjqbE6/a+5Ln+2cgfwIi
         WNUYtFEI4qicT0S4LCVjgrkPfrzffb6ZlOpK4t+b/20Y9AqtTGjhbRhvk+84z5TUcKbS
         4sZJO97e37vSZom59rBFnwE+zWWd/ltyaSbBSXNN7MyUmJy3B+b7yggE5G450IscUkDT
         yC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831421; x=1712436221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIExVlRuthKjEW06MrlFe0iZQElsYGeKhHET6Bz7z/I=;
        b=TIlZyKBmDuTO5Ge0+UQMGuA8t+WdNWPYp8DW4ZmD0btFDT1b5TXn4Hj8vPTwfuVW+B
         VO5i/3qInTeOqUsHMeyLitlMGFCRbEHU5b2KL3tn+5+IATdKRaTs77coqtX2QtVJtyUK
         4MZX+IcNlcFfE+fJaRvV3HpRPqDgWdo7j8VtZITVZW5RFX21mOi5y4yMDIy6b2oEIIOM
         2VnPtdclLIhtImi3N5VwEQy5vcTTnIEUqt5QySUeIDqhO26HhDcXNQK0oLJ1hmgX/XhH
         0mCVkVIjIKRbVQ/yBKW+rsUeNRFsyb7W8K+l6hDaflVenlEiQ9TLtXty0uOHdzI8WoF/
         9Opw==
X-Forwarded-Encrypted: i=1; AJvYcCXm+FIQbmz0VajuZ3GLp05GDh5cSgEIRY2grPeJubGVBQJY1CuHsWWAKvvt+ApjVZ5db5JIeCs1uAEraoN5FjWAhRmZ8l66TMAHK8ypHIwu034G
X-Gm-Message-State: AOJu0Yxnim08xSdXBWwIS1MiWRUaZoZlgkxghoYzd0LvuYKO+wKCccUK
	uEllYV8FUOANfN1odjl9vDwjjM9gFICKlA6v0CnGiDC6zrhpoBi73Z9rHLu+Q5I=
X-Google-Smtp-Source: AGHT+IG9iuoUde1lAoly9jtwe67T5QJoT0i6GOQgmU6/FfQpixJJco2dyJL90gG9kOa3T1xDTvVHUQ==
X-Received: by 2002:adf:e4cd:0:b0:341:843e:6e4d with SMTP id v13-20020adfe4cd000000b00341843e6e4dmr3393582wrm.41.1711831421105;
        Sat, 30 Mar 2024 13:43:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:20 +0100
Subject: [PATCH 09/11] drm/mediatek: ethdr: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-9-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gYuLLFBbKL2GTlBDQbb3uSAqyMopOooAltsdvgRD2hw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlrjXt3AFiYBCnjyA6IB2F8XUw/XHWVM7c8W
 LQ1OsJvhACJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5awAKCRDBN2bmhouD
 15RhD/wJdwHVbjfn9rfbn1/qZXPJDRjD9Y/CdHrL3zlzjsCuWuN+NrLnzSMijduiHF5jRWWsD7e
 M/qUoK7ZFgeX4NUYXPwnSv+FgBr+FT6hbwz3k79heTqQK2CSyV/QrBmkNcXOdy2B/Q0L+UonRnm
 EhJcvOhvdT4bgYcU890eCarOpT0cgdqwTsazJ86Kt3ZqGTQ89iRxzxlYTJxbG8ysTx9kyO9whWL
 S+tU84AnkxG74cZbo0xPzkkE7o/Z4nUCgPcAchM0LBhvnTXRagikXGT0Dw9WWT265sNjSMzfHaG
 1zndHVatcxz5Z4vYbekZb2KOV1gjaTJYoRcx1gCFw0e2KzSxf6DQp8lXnyhX7H2UzgqXpeDdnhD
 BQr2Fqx7Q45NbO5rjkAxQtqm9nxl7k8529Oryzz+kPjdgyYGLZJoZslxDXdWYzx2mZuK409xQwB
 XM8NCUWUNMuNS0QXAEE593gsy6PXgwgi/8jEkKzhExH2EsHD4dAHe9eYtZHdwZ2OiE5wUKGNPMN
 ZJQNs9NLukWNKuHLEm4nMmYm1Hy+gS9Vhu/8HU8HrX+wnM82gO/VcXF1qMzPvIXZLH5N3YGzu03
 KJ0hkQRxKV7xEpxLP5PfimY6CMYKvM4PPDrb9FmgYpYwyPKr2w1vRg9NrD/DR5roEIMm0sMT3gy
 nZVnGFLIwFd7lDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134343_802517_43350F5A 
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
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 6a5d0c345aab..434ba8b055a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -363,7 +363,6 @@ struct platform_driver mtk_ethdr_driver = {
 	.remove_new	= mtk_ethdr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ethdr",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_ethdr_driver_dt_match,
 	},
 };

-- 
2.34.1


