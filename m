Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB3BC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ANMO22MOCLOseMHqz7b8w8mZ7xvIu6QEfchh73NuPA=; b=PbpuSnKUWzP67RHMzgkDDsy7qF
	sP1GDVtLrJ1q26XBGx3qsCPgTOyuiPDEkJScqOn0uYosIdqI+IyotDiiCIRzv+T1nkCd47wAAC8oy
	ln80KszDiwLdeELBpzxSZuj5HpwLgZ67MuErBEQMDoHtFOZigxEt+oWogdPMH+NWRUoIeYwCDIF9Q
	P0cOpGFslTQgm9feTmQQ3r8jFOq3riHhSZ02C88ytdyBW9yynprSdPtlgP1dAvQw3ejDa4WRcqzrV
	EsMvGNZdrjzXLSWDjwgE/vuRg0yhi6eylHDd6GOV2NLSCQu5BHV7RY1BkiEaH8Mc1hyNm2xlwgzgo
	1DwQmQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1An-000000001BC-2F5p;
	Fri, 01 Mar 2024 11:35:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ad-0000000015S-2Ot0;
	Fri, 01 Mar 2024 11:35:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a446478b04bso184042566b.3;
        Fri, 01 Mar 2024 03:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709292918; x=1709897718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ANMO22MOCLOseMHqz7b8w8mZ7xvIu6QEfchh73NuPA=;
        b=aHL1RGV3eRQXnvQqa+m2tlThLDSbehNjEx1UZ0jFSZvQoUOjAavO8xHlmNdlYVUQMz
         fp9BzvCPNNz71AU4xi+BG/WlnvXSU26+bmrs/u/MUyp+PxyDpOSL6e79yZDykbJF0qXb
         53+uKytznxR7hXKmggTgZPyk6o74GwZfXpGricwFdIuIlUNzeY/FxhJw0WwOC4Mi3rTK
         E/rgnTKDKjWFQOjmDUwAdsUTY8fuPnNSL8ogXf6RJ30Wi29pxuZpP0P1tDEr8V3ZnNXo
         PvhIgBNdIpmUwSzumNYSpUVmTQyeb7rV2hNk4Cbg/QIKkOhz58WFcYfbJexftjnVrIaK
         CdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292918; x=1709897718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ANMO22MOCLOseMHqz7b8w8mZ7xvIu6QEfchh73NuPA=;
        b=jrprqfxckS/T4U0pUVwQPxfhOnDoEShiN43Df62+EU3wdDtInjwXFgevjddroteUuW
         8CatrmW/F1GwJNctLFzM3S8bxyU3wMLqiqgRclcAB2cd4ykgRuI4B+4kljAs/ol13ens
         NGQoSrHkNtZFQm4wZeJ12t8fpyuD0GkOXgavbMaMPiwVkxrSl9f+aFZ46A/rH6Wx0rrf
         XSNE+lgS8s+avmucNkjFuIboS/EfTV+2ZV3EVK5NK+oHb8YGLSw62loQPswsL5AhTjaV
         M228VdqpiGcj2ckavtMCU2PhrhVqL7LJ60udHuK77+/U5w1ydWIPMQP8RGjFQltiwkbK
         DKEw==
X-Forwarded-Encrypted: i=1; AJvYcCUbRi9lRcK8jBU1G0F/RKZ/tvVC3HR+vrLwXt9K0HLm+W9kERKbBNKItBfmQ/9EyoOdeUn5RhnlnSGfyRXmqDPxRaEmwhDJOX2WWBJRGiM42JYyfUlrWeb4xdJT0oa4On/1OvGXO2PkrCHWOUN3omYoGalX2KV6H4k=
X-Gm-Message-State: AOJu0YwPQC+hjMUqitHZUTh83ZAjrlYlOwuSYpFXDvmxkpTjYOoJzDey
	+sgoCzd50qdqiUwZ+XwvKbJrB9MdXkRwqDgGa/+mc/m1um+agGE+
X-Google-Smtp-Source: AGHT+IElLhQLIeI3YoRkTcHz7gFe9n+M5dds8sXk3F7WL148eZoifYZznoFyilWXwc16gxZ714fQcg==
X-Received: by 2002:a17:907:20b9:b0:a43:6cd2:7a27 with SMTP id pw25-20020a17090720b900b00a436cd27a27mr949733ejb.19.1709292917317;
        Fri, 01 Mar 2024 03:35:17 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3f5c39bf2asm1618457ejc.0.2024.03.01.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:35:16 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/4] arm64: dts: mediatek: mt7622: fix IR nodename
Date: Fri,  1 Mar 2024 12:35:04 +0100
Message-Id: <20240301113506.22944-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240301113506.22944-1-zajec5@gmail.com>
References: <20240301113506.22944-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033519_685293_F49E2A3F 
X-CRM114-Status: GOOD (  12.51  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: cir@10009000: $nodename:0: 'cir@10009000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 283fdf7d2d8b..7714775d1bd0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -252,7 +252,7 @@ scpsys: power-controller@10006000 {
 		clock-names = "hif_sel";
 	};
 
-	cir: cir@10009000 {
+	cir: ir@10009000 {
 		compatible = "mediatek,mt7622-cir";
 		reg = <0 0x10009000 0 0x1000>;
 		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_LOW>;
-- 
2.35.3


