Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A07CD1288
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrZ4GhO9wf44T+ecEEcNLW7XVBn6abcNvXfy8r76/zw=; b=d68HcMvMjvzQm/Xi/IgZuiKhU4
	isnM4qW0nEOLw0/8U5mGRL2mhz6cXYLcb5z+tYBWUFzDe5F59vIgVA/LWahION1VKgcTqs0vwII+N
	2Jqs/WL25/s2Mz4bbTfWOUSdm6czu5fhTefAJZY++mQCfnNeHdtijDACUThA+k5GINS/8vogchdRw
	uXX7XVQKG8HCkzgBEAFVbUeGKGojw827Vpz/4AHirjh/Tuvn8c2prZueFlozZZ/PRTiR4Dso5wu1O
	pcsg0mskPqKxONAhLjjCAUgC/DVeqCDg/1PAdkeJw08SemFU6uO/re9J90q1tiTxIvII6um4VJkdC
	UI+vk7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYm-00000004CLD-3Knx;
	Sat, 30 Mar 2024 20:44:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYE-00000004Brt-0SuJ
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-341cf28e055so2169323f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831418; x=1712436218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrZ4GhO9wf44T+ecEEcNLW7XVBn6abcNvXfy8r76/zw=;
        b=nKHd7ZAngteP5a1m6E0/W588gUrmzRNRJkBjxGhe075eNZoLv6MIuZbzkvV6KYCKdc
         yeyfvz+JOFt8Jm33GSkejadO4SDI/awGR5D346zGBwOcQ5rprOXI457yC2nHe4X/gPJf
         b2dz3kiE8+Vc3nO5EkKRz8cYESGU02wA7VcBZLhmFtxGaRWIpsWShjenkZ4eUCVwLSqf
         vQiJxpquPg3DpoJABHekoN4z9Jb8dChPLspP+mnDUajSPXc89cxj0Kqnz8shjrEkWFSa
         SKw6IUfANd0b9Jxy0WzSO5titu0tGKl5q1GuuT2I3vazgdA4ZauG4qtfm3c5SADxGnZA
         Lmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831418; x=1712436218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrZ4GhO9wf44T+ecEEcNLW7XVBn6abcNvXfy8r76/zw=;
        b=VrIIO+kbZ0FabADQWeDM30q+aYmnPLfxFgAIBnCTuTyxKq2ecdKJwRrl9qaTFOd+6R
         +6qxHyfkKaF5D3fQ0aThkVYNJefwZjvWEc/F8m76PqhI+W8cvctnzKuffNUeJstWyvPX
         7SExd9V8J3Rnqj1W/ql+DhwNNX51Q3DYxl5XP7K+32EGX97a7eL4WuqNViXGni55TKqF
         qVSQfu3fzhznjxWJQ64tlP5JW4CVRQ1JPAURKTLhsl1Lrxg1lX9mtZtv5Jw1Luu+I29m
         sHSXB/g036BJHMq8LNYk7T4wcICA3y2/MJZLpA/oOJtvV2KODfbhyY1BCqpPl3ZGhij8
         MiRA==
X-Forwarded-Encrypted: i=1; AJvYcCXnBkJHqjiPN4qxXuX2CtoWexgkg7tCWu2/wElxY+vU0SOSiVP3CuTcGYp26OaalhpABdSWefwVL2c66Hsj9vNvpdMWnLJ3GOWoXNjeWTv15S52
X-Gm-Message-State: AOJu0YwvC02+jR1zKPea6mz+HAUh4kj1zB1SIxN1FuW6dgNrp9zwJDgZ
	OUrZ87GE4q6QUJHDnZIp3tEwDjQo7ZxpekRDflARfI6u/0FENQeqePuSMPNRMPc=
X-Google-Smtp-Source: AGHT+IE0PKWcklEiY/N3DN55kHettlS7ue1JIpmWZl/a0EdNno4I1Sh1h02er5fS9u4AqXd8tM05HQ==
X-Received: by 2002:adf:f645:0:b0:33e:c522:a071 with SMTP id x5-20020adff645000000b0033ec522a071mr4191961wrp.51.1711831418298;
        Sat, 30 Mar 2024 13:43:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:18 +0100
Subject: [PATCH 07/11] drm/mediatek: ovl_adaptor: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-7-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=851;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Xx8KP882juDZyxUVOCDSGgYxDLvUN7i/bRZCWIrU9k0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlqtSIEZvgyYm0QNmdSoI/0Wde11KsnG/jUJ
 m7Cc1tVbx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5agAKCRDBN2bmhouD
 149aD/0UGMkv565y8FhNpp9HZfNQ34nUp3vU7wEYkdZOgitnzav09vI0i7+j+yW47eieNyoiE9y
 3+qIAbw4PT2fQ63Zm08uVzvJiTQSq3vQ5qfDgqWqcL58EbJBxZaWHMZRdeX+v5MTtkqAx/ahWsS
 /uzTY8BAgaOtMXkuvjnsAK09Mj0uY0iMXCuS50aS8bgTVV5Lz+XkAO4De99j+XB/SLetcPoHwmh
 Fw8sZDXVfJvQrnT8KeavVse4dsQQYaMAnADfsS+JFmqn+38zoDpM3trwMisX8g//g7smDvTp5z9
 hgvEJ3W4nnUzhoPK5UCux/ukE1TDZMx2TkQzCzsWacw/siMas8BedF9aEQLbwWisucG6Q6zJt40
 Bw+eoNNzya6MiljOu/7qB7XjlIEU2PzXI3OW+mp7wsne5CPK3sfyi3xV4ed4jebTOjKcrYy9tPA
 3NsOmpkXbPhwdRT6MRxHgCXjyJtL54cMp9a/xUivPijNbW7wrHweepjHL+8Jq+DKwJp7DYAkiJA
 02Sg83YMIfaaiyBsvHD8sQ1kXwEhmkTIC0y7IKFI67urmorvN3REG0tF8zznMdp+eUfn94KgNuJ
 CBMenub5TWPNVI3yF/8Fd4pSU1z+XD7xMZPv7NAjF2eeeFWyNo87r+hi4f0V65Cs9xn8xHp2J1r
 EFmG3PHwCdoDlMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134342_200546_93F8311E 
X-CRM114-Status: GOOD (  10.38  )
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 034d31824d4d..72fd5a095960 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -629,6 +629,5 @@ struct platform_driver mtk_disp_ovl_adaptor_driver = {
 	.remove_new	= mtk_disp_ovl_adaptor_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl-adaptor",
-		.owner	= THIS_MODULE,
 	},
 };

-- 
2.34.1


