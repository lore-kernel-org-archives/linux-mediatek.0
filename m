Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D25C04FF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edg7ntX0oubeVIYh5vjQBOw0CX8pMqN2LX3X5tU8FAI=; b=FiSw70bHpcwCtAj5PicB2OcqiY
	VVH4Z3ASd8f5MYkfGo7FH+nWF1mhEweyVL2kxC9D/zXL7hwSi7DyDFMNW0U8El1ddJnmITOWhT/Qz
	npXlryjwMGFUuXr9k7TcpnReYwbOZKRJJTWYbT1B6Mz0sQAHhNQxCGRvGFCWGhd1yPmPi6DBp30R/
	CQqgzh/ILJz/NQttpBI49tats96JBj/dnOaJ6GS8O7O9E8vl18ROPYuhGoihkBPkpDradWVWFXKxK
	7L+XYpO1aj8cCI08+s1/IXHWao5pbXLXk5ozzLQdtKu0YC9R9dRXeJOjWNo6ypPTJSsSfdH6byQBm
	00QPOiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7z-0000000CqtT-0WIm;
	Tue, 16 Apr 2024 15:53:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7e-0000000Cqan-3jmN
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a52223e004dso519834166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282804; x=1713887604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edg7ntX0oubeVIYh5vjQBOw0CX8pMqN2LX3X5tU8FAI=;
        b=2/lVdyceQxq/h9gKdbB8KGVf8TNyzstD6frZPjv1eppbrLelVsnrAon7strK7HOUtU
         SnhBDpb5kA1u8x7W7SJfI5wQKQ4btoC4/2zBlmCRg6ggumgpGs5wrRIkKh4nJtseShGv
         JUeaXTLfLt61q6Q5oABSgixK65uOqnG6HgxwBXuUq9q0/HY8hgTUBGVISCytbXk1qJ/w
         lT0hjZW5HJfpaVwNZm2Jf1givCYoJOXnfDMGgNMdfh45EN6uJiaTYWo3dIFUI2KWTDZC
         XsQyuysVKI4XfzLgjjQQqThvuJ5Eq5OM5sOVnNV40xvlDJZijHqUg59klsN8M2T724bC
         8bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282804; x=1713887604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edg7ntX0oubeVIYh5vjQBOw0CX8pMqN2LX3X5tU8FAI=;
        b=XjgrTrmnX0MDSO5OdlfqO73PADkRJHtAJIEhbUf3Sz4OJne47uxLK6ucevJ8uknrdW
         4SjV3LZvq+EM4QT1DuMA7h3b7iCHlp9pirltNpT1E60pfsWpSakOAxsUdEhbF2fyej8e
         mIoRMCxlL8Kxtbm8qfdju2SI0UOkEz3E0C+O85aHma3CJGZ7I0Hl9F4FV8UDcP9k/NI2
         B3nmaZBDYMvPp/vip2bw/wfj12Za/WEZvJfvqz5ijlnzpI6u/5tg8u0GOR3OrAJM30O/
         JTiTRMTghSFzcDqFwJNhANzENjOVMAkjaIlIdaGZK8Bxjsx8nO4NTegcJ1ndmSLX9WXF
         IHvA==
X-Forwarded-Encrypted: i=1; AJvYcCVB9gy78EBvqomPwFT6RxF/VM4OEL8LdWFQyut4v8feRtOdxV6z/iblfgSZA7n0/RzjlEwL7KiCC4nEk5ckc6mpljRcCqfobsub8NQffGLtLoh+
X-Gm-Message-State: AOJu0YwVLYisI3vuByTRDFt3rIOTRVnMPXoEDyOOUrxVhdyMjgY015LS
	bjUfLM2MeZjdnWn/2bak7QSZBDtnCloL0WVJyRRRX1yKg3JaE63sL6RaR0Kmssg=
X-Google-Smtp-Source: AGHT+IESXQOC2i2I+1wisKEvX+KfecwnRuK4o+TRRtDRQMuqOa5FvcWoQ2sFX9HYwV/C43qufmzJlQ==
X-Received: by 2002:a17:907:97c6:b0:a51:caf7:ccc2 with SMTP id js6-20020a17090797c600b00a51caf7ccc2mr13320552ejc.34.1713282804210;
        Tue, 16 Apr 2024 08:53:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:05 +0200
Subject: [PATCH v2 04/18] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=r68e1who8MIzDoQBthjo9X95W2QHnDC/iXtL89xaYGw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qi3IRZ6AoTAH3S26Bc7tgxEDlvX0zSClY5rSE
 FqixYlCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURW4bD/
 47it9KmX6jUMPorNt/fwXA8Yd6HyIWjHlDU6Ov+ZOq7aNybp+K1Z2ZWa/Id6Wx8n2RADeA8ZyZiHnM
 lHBARvya+AHMri2/Gno2bUGhA6g5XebKqomhEOZBlvyEhs0Sbx8EjK64wr7/Bsvf590gIzwBenBLLf
 gTq4T7hlswVdTEtIK5HVob+1P4pP/SifQGm0GyGVcuvyEGjO8jPmAEzaUgLP+ZIBl2h7ikU1S6YHFJ
 +Ikt70M3YfqB8QxP4AIAVrYiep8Z1kLno9PWvFYcBfzLslx6YqotiQ8mhKvzS8cRD2Q934IAocwJio
 iqY7ZbGUAG38AQ6G8QfYjO6cy92roRY64A2f8CdMsPJKhYfp9msT8wIuSiueIicgJpb+X5rw9sYRon
 SLmCHghPj/DEYgwpPKG45v/Bdh8gWH0AhZRAX+s/mIE+OuWYUPJmt92gcp/ho46+csXkXGKiUUgyta
 y5OmnEwhnstm3Smv4R9hsoKbht8soPnK31q1eHCZyeo8L7t2p/dtCWURvNwsQ3KGR78y6/t3/q6MGI
 mDAkRaGvebNzoS+aSbK6bjvwERLC54boEOWH1GlycC02Mjzoi1IuQlSQK4Hj3YG7LWdZi675DOND+S
 B0qgPjCZaWEgtVB3l8cs1/GQNpsJaAarulInreNNnw+9gZZzXvgCNQ8rX7pw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085327_032926_D53B3185 
X-CRM114-Status: UNSURE (   9.61  )
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1


