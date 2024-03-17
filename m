Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A1C54E68
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZxjhUkiqFkClpGT78n0zWyw9JFAZozf+iRUYHp00LM=; b=2KbCAbhH0Q+W1fGfCzoT5RjHVc
	/D1i1K3b+4dgmeP4X8a+N26oSw763GLsgplLyCuF+G3SvMDZmjYHRf9DVGRoDGLY80UKbZiAT0vyF
	pYkj0v77v0fbEPK3AHgNzggJ4YCFssyASxM+vi3NBglNGd6x4bEuNBF28qzeYxoih5rQZN9++t2ry
	G4IyOrge3p6X+mjh9OZYw6c5dpudwU43tt95BCUE0y561ZA60uF2JxfmOElIRNt531o+vlKsNP3zA
	ebAtgn1VrHuJCDusoWphRPhWFrP/6t4ptYkFOTvWiJqfF+7aC0jOrdzYxhlKFst/p+1X0KzCtozl3
	PAeVQVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjY-00000006bqt-1YJQ;
	Sun, 17 Mar 2024 22:12:00 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjP-00000006bg1-1EQr;
	Sun, 17 Mar 2024 22:11:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-513e25afabaso967558e87.2;
        Sun, 17 Mar 2024 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710713498; x=1711318298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZxjhUkiqFkClpGT78n0zWyw9JFAZozf+iRUYHp00LM=;
        b=k9ARPmIOD+MuWbQqYHxVoih72SLz4suJEFB+UdTFqwqY4R7/1Sj1ZRuCY2iO5AwlCj
         0wR8hJeYQ+IhOyVXurlH8zxCevhkjtvbmevUOTAJfuHWf2PT9k08498NUBqSEnqnBL17
         GZlb0KK3elUTbCTrWKikOkC+dzbsxQfhLrYmHpLro3/HYIr44/H/ifrqWHWhQJ7uhUmj
         XGO8GnGw1WVSI9SDBuRt3/JaFnPs118aDNL6w/HJ3eqtFtZjTf2bcS1Ts2iIYRAJVMhV
         kpHgKvHNs4K7xdlNBQlQqqpUXQneiIqNWT/EYY5q+it/qCH0XcNKdLK7fafjC6czXdtz
         imiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710713498; x=1711318298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZxjhUkiqFkClpGT78n0zWyw9JFAZozf+iRUYHp00LM=;
        b=tNb7XOUNHlmeDg/ZB1RUFZT6xwGjuUfrlNV3EcS+w4qDRivDxNE8AMKOb0g/KgDxGu
         zm7O01Lfuuhxvbm0VZeKW8WqBzTOvlnTJQJdzboc5KxagkZ0CKZVMXXNE2DNhBrKvz8h
         yYpxKsUAca6oUaoFx61OD3faZ7JwKGbC2W5KoGfSDopI26dwihdksUubwt3Fs5PtcgIr
         IzL9Kx0eW/N2h2M+g6cjx8LCyRvcNd6ntqrTgey5TfcieS52t1UmAW98lylpdqroZc9r
         slWD08eKjvU8ZbT1NozdbBXMiW5pSVGplBzwnr92S968exZ1alhBxy6pJpBP1B5iPX4f
         N5OA==
X-Forwarded-Encrypted: i=1; AJvYcCX1NGH2Vd4HXNygGRQhGSbAF9FcU1gZUynX++Z5v430siNNtVD0zXo1YATxfED9u4Ec0w4mfqMCJbmd3CZP6YfMCvU4ZnxCaOpq9vpSz1MSICIw31HBNbFjJHgDfaqbtbngA2+cm5IB+7fEsqfY3EWpPdWxOSW9YUg=
X-Gm-Message-State: AOJu0Yx3xWGjqEg3pgTehGvR2ab9V0MoOIszMY65TRf6RiUI1+sYmgSh
	g/7OhVLySm0p/rIwi38FRgE5p3ektTjy/HTmW5RDull/VspaMDjD
X-Google-Smtp-Source: AGHT+IHDc5SfkGYQVm+IZ730jSs+MzWYmeVVfiTOParJ3XUUCgcIV05kxzRF/+gGgCUsr1h64CZbcA==
X-Received: by 2002:ac2:5b03:0:b0:513:c596:713 with SMTP id v3-20020ac25b03000000b00513c5960713mr5733785lfn.28.1710713498423;
        Sun, 17 Mar 2024 15:11:38 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b00513d8e5a088sm973049lfe.140.2024.03.17.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:11:38 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 3/4] arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
Date: Sun, 17 Mar 2024 23:10:49 +0100
Message-Id: <20240317221050.18595-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317221050.18595-1-zajec5@gmail.com>
References: <20240317221050.18595-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_151151_498927_8BD50D41 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000: compatible: ['mediatek,mt7622-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
        from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
(and other complains about wrong clocks).

Fixes: 5f599b3a0bb8 ("arm64: dts: mt7622: add ethernet device nodes")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 4c8a71c8184b..8e46480b5364 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -963,9 +963,7 @@ wed1: wed@1020b000 {
 	};
 
 	eth: ethernet@1b100000 {
-		compatible = "mediatek,mt7622-eth",
-			     "mediatek,mt2701-eth",
-			     "syscon";
+		compatible = "mediatek,mt7622-eth";
 		reg = <0 0x1b100000 0 0x20000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 224 IRQ_TYPE_LEVEL_LOW>,
-- 
2.35.3


