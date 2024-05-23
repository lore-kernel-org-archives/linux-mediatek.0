Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7793FC41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=; b=O6npTIIhv6w1i35n9uX336cEkG
	ioH8jg7WEXNMnMekycCw/Bt3PhoWwe/nbR5l/KyUOJVY0CP4I/VJx8Xp4hR0N6bAjMp0fJiVPSKGH
	cR2ElFQK8Al0CR3uyBBClM65dnqnyB6EuHs8OSYOB41Af5Cdshjd66aSVAG5PwdbRLiKDsFmjSTi1
	BzfBMchcNJxjqnJM53HqrWXGTun4oDP7Zm0x3twpQvA/I2CBKrCoJENrTbp33kFVwm+DdncvzGmOg
	YpGQ3u6GMGG5I6Fqxc00WLfENH7j2wxJbRx2vERq30cfuL+pnH29p0IRNJQqGL0hSAnMl1TKTs5I5
	v4RNP0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7ue-00000006GA9-2Y7N;
	Thu, 23 May 2024 12:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tB-00000006F6E-0ury
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 May 2024 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=; b=LubnTgtW5PdtgXI5z8rKocmgaF
	qvQwtlbqKlkD9wnKMwogrx9elk6fCtPp6QcmmCePcvNEYuLHEzeT3bPqPzEaVDdLuSEebkv2fPvgh
	HU1SnoSoDGw4q8AjIkKsD0akMcH3KOqwFlTOWnWrYytb34MO0L1XXZBJrYL4oKJ0eL7pDGdDxqwd9
	PtlWaTbxWcwZL6QdFBppP/xmsBTiREoDhIN4uooBjeCQCqMbf2iOqwfpQzEXIQf6cGzF7M9yi295N
	YM6g3eF8GF4HkMuRhbkQl7SPxZqIe/GrSzvkgq4S//tVrAyPMSVlZpntnUJ7tRcN4k3L97Dlt/qE/
	RJvUZ8Aw==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t7-00000009JFC-3qfc
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34f0e55787aso5017963f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468573; x=1717073373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=;
        b=fwFlyhAMSmnYceboDoM6Q46uHdkNT5PlFxRZcAGPqm2rHv3HofgFlYI1UNSo4cGD+v
         a7MjItZQGe3A8afM8j94NM8l7HnSM3M7s/MeFhNdZn31TjFmjAtkyGGcL80Gg8oOIRck
         DgieF7R+iC22cbGWWerNBoIf4AvNgMfSLtdKvTwjTn54n5UOUqt9bgKmWI+Grp7m4Ncs
         gafF5A9EEwhp6CgMvGlAOtKZt9dJLVp59vz03/GpqyMbLzjkWKXVHuj6p/eJIdwL6Ita
         qPn2yUxLS0ph0PRXMxG+cCaXlibhW3BLUsfv7zyU7MeW3AFCdcdlCsXE8MKpZZr23hoQ
         lR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468573; x=1717073373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=;
        b=fwHGv5nyGwYYGrBybvi2v0E+z0rgCrlvV9ki8hFCHV3Lt+bI8TnCZzXk3eroQNtEiy
         Mtj6ZCJrEC9g+34bbRJqmaa2nCRLgHa5DPMKrdMjYz29PheHcJOfmzdfd/OajoumW0DS
         saFmJpNuOBJtHnv1gA1JpSP08FdlyAxlIZbqjalR2e+uRjkgPD7OR0mu8UgZucRQ8IAr
         wL6DoHd8sKQffZONniI4WhuOvGzXQccdUfs2yZF/pVRPpd59F3rMXTFmgPPDCuhFQLn3
         u0Ie0CCcLBjmqv5uLWs4eJlzCp3RzUy5OEGvXYPrux0GPqTkRO52CF6meITrI/lyeNH5
         0Lew==
X-Forwarded-Encrypted: i=1; AJvYcCVJZdQ0oqCirQKFc13muQspo8+nd4Wu19jD4HCMj7e/nrRPIyeXeCIc7zPnglBQ/siPM44GANtP7NDcdJ90XktjE5NeeMgwf5Jw2nsUGuV0R26l
X-Gm-Message-State: AOJu0Yxjg1xdDZG6e08DFZTjMM9W26hL7pizPR91oc22+oaVtiP4gUJN
	hiKfatd0v8VcDCnQmIWKWOsg98/uiZkJoLLbRjseVh+Fyq6sno6nk7Qf7dASbqA=
X-Google-Smtp-Source: AGHT+IG8b4YiHAdHYRablfZZQ6Dn6FlVS/F/SaioWLZ8QofReLYA7LtmbLwTsCsrz9Ysprqw4ksAAA==
X-Received: by 2002:adf:f207:0:b0:354:eb2d:be00 with SMTP id ffacd0b85a97d-354eb2dbe62mr3152513f8f.62.1716468572639;
        Thu, 23 May 2024 05:49:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:18 +0200
Subject: [PATCH v4 05/15] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-5-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9kh6UGARON/UIfmPWxGK3T+BbLphijrZt3nYZp9vdEk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTXxqS0hmmz99kc6jIQPW0PAPiCFWxDDtx6P/n
 7AXn33OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURRbHEA
 C/PkBLP8vnZIf422AHZD2BfrARu79PMnaDfqDKnbla/IQshdf9BVJjs1L4BAXEA6TTpx+amUNn7Dc2
 9jwTLa8jJBcfFWRUV7TS7TYh2Cv7iUlFTXR0e/iYs0cVraWfpa+aJUSKJHM/+M994kskXCHFLvFq+8
 lTKzqpjzGkE8TX53gzag+3E7axudpA04GS48/fo53U5i9N2nyQhwjh6kS5RSFxp+G2UCjRFWCKsHY9
 uLFywRRlJxu0yJLN75GWz79zfVp5kPjxpTVroUms5GwioA7mp/NGlJwClop5dotRbE51BzhxUub6N3
 8uwIcG9Y2DMrhDCE1DCFiuXyMVDGjz8Knw1u0JEQuzCRIfV13wt7VRUsnI9EuynwCdbB2vw1bpqYa8
 I3HR1OdVZc6CT+7FBDGIv+9I6PJTbFsB87H+iXQzFpkfUmDmjBf5LBYbbPTZe+lUGkkPRE/sj7pFjm
 xCM8N/nqjYNPQiSoAIriUHuf/oiSqjbiX+O1rDSYgC0Dm5W4SLUOz5Mh2SzbJEYWf6CZcEg8kFcsPn
 jeeuPe/HtutARF0lGyaZ9bcb9nYYBgmgM+hvF6c1hLzd9C89tWyZrq2tgbSfLZ8ZTNd7TGgbWAcSjQ
 4sq9lPWc75OJQMVKtZfxRs3nUPCRPlUmTuHhN1lMqD3ooqGUTmuARdOWrjOg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_134942_367095_EA551A71 
X-CRM114-Status: UNSURE (   8.93  )
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 2e9d3d23cbc1..27ffbccc2a08 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1


