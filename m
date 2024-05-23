Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A9CC25B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0mi1WL/7iRSdUpRf2YRMSaJjir0sEMp/gQx1uv98kI=; b=rv9nEsJkdvP3NEwCpqcIRlhVoP
	owu2alDLsNrSUlUW+RBRtGS3gOwTB4LEwWSttpjlle3rrSyEpSAUGirRKSB+79DMY6eqi4bNEeL2R
	lIZXJ4RIKFOUBj0ZIKVkzspFiF+MYS/uRoGYsmBn52HgHReElNILxThY4twsL+tcL0iB+NMToZl/+
	9jlcSU5wc/OLvjVQUiRsPhuOK08tCizE1qImLv/Gj//HxYUcQB2ffZEliMgoF3FTj4AjgCCNBSubC
	pK/zkWtouYiSw7ybQui0/sA72/TZSvW6SA0hiejs+tu+kk99ynfQL6dpUFC0tfKSIJroYOxZJh5fF
	ueQ5fNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA90t-00000006R8l-1ldH;
	Thu, 23 May 2024 14:01:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7sv-00000006Esy-2vyH
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-351b683f2d8so1646618f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468568; x=1717073368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0mi1WL/7iRSdUpRf2YRMSaJjir0sEMp/gQx1uv98kI=;
        b=RhwMuu/iyZXvUlXOusy9GyEU5bhUktJVadFmrJxb/igBMgJrLCuYHvyx6VzYFlQOso
         j2zhGONOT4LhCPT75LYJliIggIsbI1U5NONJg5KgFB4wDbzOqr30SnkUZFEZeuvMQMu1
         EUoaYtu75ChM0/+G1JPuSc3b2ELfwO2/9xLJXrb7mkd2B5CVA48zamV5HtgIUEvOdxuV
         wO4bDCTGCrksK2DnINdozLJcsRqkMfMkfGN+c8InWgvTgm5lYVjBBi/++MTRjgh6/XBa
         oRA8TOecIcLHTZk0hrLwkeeV8oDwrPin3dtPIg0rEDc67NHT/+lMU2K3cbOK4YcvLSQs
         VxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468568; x=1717073368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0mi1WL/7iRSdUpRf2YRMSaJjir0sEMp/gQx1uv98kI=;
        b=LcQFdbEuCQv3Gb6+SNdW1QQbQjgNxzU1qrBjOm6eBmFR5VsnHE3DnQpoJpG1dpuAsa
         VOPouv6Po8pmh1ej8ZngU4UDrODo1kNbpbF1NNx6BHgcxj6ZyZxFjgYecGCJw1xDsfGC
         orNjvwWZRFVE2nitBPfDnGFbL3xiK83hQRbgC2mBZa5XqXxWvp4vOo7F1m/Llep6hhfT
         pKTI3tWhXVQ+mMQ8b0jh317sC2D4APFxfDgxzmm+y6Wx2X8ndLrQgR3+gMGua3eXM6aT
         oVhK6KviGWalio2Ez5K3X0iqkWRqOJhas4/GpCzqNsqgxbiKZGosen0eW5OKIQM/ZWA8
         Lkhg==
X-Forwarded-Encrypted: i=1; AJvYcCVzyfjHIjz9KEJgPcXXDtZTgXPT6+D3Dz6duVV7MKdooFu6rBKl80DUGszT3/cLdUaechMXWALMDQXqkCINT/VtCHYSNUMVXWm6fGAhwRssINu0
X-Gm-Message-State: AOJu0Yy2c0JXPwSZXdvOJUFWWgdR+z9cG0jpsQ1szY40/GH9f1K6UGX+
	4Xbz54xbJ0xhWOCbnFCTdLgYCtkVvWQSMRk+XbWTP5IKPcXJzVXMGHgYAfa6ELk=
X-Google-Smtp-Source: AGHT+IHBLKdIYYu6QC45iqx4D28BFWQ2Pl61zO4qgqZxwAe7jzaeeQgHKXs3Sob/u4RnkADQNkEQLw==
X-Received: by 2002:adf:e245:0:b0:354:e04d:13e0 with SMTP id ffacd0b85a97d-354e04d1478mr3622189f8f.46.1716468568326;
        Thu, 23 May 2024 05:49:28 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:27 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:15 +0200
Subject: [PATCH v4 02/15] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-2-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=upYLopDUv2sREO316+2x/IDyye/JUMDkTsLPG4uVl6w=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztThGaQtVT5PRllT6P21gaIDXU8tLB5/ByVKkE0
 BePaKxCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURToFEA
 CNjvAKkIUW8c7JykffXwJogjsEowvMJNe3HDTc7LOREneBMS1az+BXGjSgO5blmyB7fGtgJsL+Zv0R
 xd0wNYYfAMLEXOp6KAn27MVcpfvIJi5NfP1SEwoEM222Y76QhHvMa08kSyxTal1L/cTL/I3X8qu0p7
 ckqMnSguyi04ZTm26UrzewnhaRayEqUUFk9I42ErrJAFj405GkoF+4hzqnIjKCITsH0t0Mj5c9c7Jl
 pVE4ly7f//JUU7dERFcqF4w+ajQu0eObx4T11VmSa3GRscWZb51v1Y2dh15JzJIZ7EDTtxD4z+CTxo
 GUNuzimI53FIMnh/pA6pwtIaIIr3Z4P/ql8LnNhf0/RZBfu7w3UgygJTJJdbsyFH2IEW56i8wOP043
 eGkiiE72dAhNyUMULnTHC9g9Gy4rh8FJFpfz8jOCnM8OUg7ZDQNnCGcVk+y8vq0gXBMZzoOKN5ouCl
 EyxNT5BGpLftb7AJibOGth78FavsW2MSW262b7XlnKPtR57/WLLKzsZqsX3Lnc8UrhJbxDN6a3EWyj
 HgVak1ai3PMyArhLZDYYGuvYLNUVdBljvCp96QgIapouQdmjQpjEchRTg3pn8/EggEKdxkFyK0D+AZ
 mQdy6aFqRFMDQOgv4qOpetSxiRH6ixvp6qQa08GGSz2ITAv8spirsDS4TVew==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054929_751996_8E5B27D3 
X-CRM114-Status: UNSURE (   9.42  )
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

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 71ea277a5d8e..fca8e7bb0cbc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1


