Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB0C54E6A
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJJlhZxC3DnR9uX0BGL/zK0LyaSZIawKZpI8/wEQi7I=; b=A2lC838N4awgDDZjHFULQnewHn
	F39irPOg8VU3mtgdWcObqD/bmung3fi4zsyKal7B+Cu5RxxgMMRt7EyR1y1Gvs1qJOKOFxgZEccyR
	WiOX4qk+wvn5wqTDH9R6+NwnYA/alDPqrsVJwFqBocHCQ1/70oSWq38LHjpzQN50HggQNvWXWzM4x
	tFXxZaxTilRBKyOV/Zgh0h62KgR5ZbGtjft6E9KjA+k1BsSFXPZydR/+wftmZ4LAg7RF/czFBvWWq
	z8rcq5nNroxadkBAvbb/5eQrBcMWVTxeOTbJcDUDA9S4wkh3ljkcHPZQ+QZCPhz2+1q9gyycgEwde
	LlxsGJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjV-00000006boy-401R;
	Sun, 17 Mar 2024 22:11:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjP-00000006bfi-1EPi;
	Sun, 17 Mar 2024 22:11:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-513dc9d6938so2487189e87.2;
        Sun, 17 Mar 2024 15:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710713497; x=1711318297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJJlhZxC3DnR9uX0BGL/zK0LyaSZIawKZpI8/wEQi7I=;
        b=YR1Zt9nGxR46W+TncFRSy9opCdaD9xBGYgjUY/6JsT5VUi7pRGdSHDXA6MaU5TVavQ
         nQcmNylFa+g5QSk62H87gYtKWxwmxkHu8csJGtgpr2/ch5WxpONRp4fHzGGZzvhe5j4a
         EgWlThKftIq484DaNhTjTebHIg7nHwfYyrr1krrgC1zjNJp6ldzgfwe17aIGzqWT/JQ0
         aCDt/ZiRGeuCAY/rpVETtAQYwLR+U0o3opok3JWityznXex1no9Zb0eEJNSg7zrz7p7j
         J4n1XqzdRFE4rgzDxGrrya5Eyg1sA5bs7czcWRfjW/ndVbN47wLogzT5yeig7fb/ttpi
         Z8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710713497; x=1711318297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJJlhZxC3DnR9uX0BGL/zK0LyaSZIawKZpI8/wEQi7I=;
        b=YyoidIUqT0zy27vSpQ8u0I9EPnEFacLWDECT6iF+mgY6DIxr8XYw1RQKA3IlNQT5UL
         rpKdAMbjqgXV5dyZ/Y4Uq9YO2G53UekAUA8fVJfNDmDfpaDGg6dO7MCIPLQ2TC5CxWsD
         9heklFH4D2skLLK8vDHXxt+0huht/0eNO7oWk5vWmu65yVqBDZEJkpXYFKMF1ROEUadw
         T3o4qv48pzfUqkhAzfBAJ4eRNcmrQfdcFEg2/RPkB758ZWV4T2d73hKkIZxHGfHQiHE6
         qxhtq+YhGqbkwqOFOsmSpzauGjxF8leUt/DXo9R5pdvQmI29ZQaLJJAb2v3iAcH29+nM
         KU9g==
X-Forwarded-Encrypted: i=1; AJvYcCWEz0JqXW6G0ry+Uv5KIakmDzcGzWWEvPudos/jqQCgH2Jns/NnwZXvcVTAFgBI2AK6i+D3dbunoWzREa2thv+ooiy3KgE6ain2Nkr29ddTwZRoI2AkSiNJjrApi2Q78Q+T/e+PFuvPX/+PxpL8xMo3kSw6SFsVjRQ=
X-Gm-Message-State: AOJu0YxJjwfrzgQeV0QMpN47JJhzBF0eSEsdMOffb8wY3Zi9uwvN6Jf2
	wGynnDCZLYst2u6J9bBoAPVlXoT8inA4DIN1wo7n10OSyI8Igg5z
X-Google-Smtp-Source: AGHT+IEXKW6w/S9xZrIWXAJ9k0QE6UUURGDn2Vno16aMewydSUUDduAE3GWNCT8nkfpu0OchnhFDWw==
X-Received: by 2002:a19:740a:0:b0:513:7e83:b3f5 with SMTP id v10-20020a19740a000000b005137e83b3f5mr6426158lfe.67.1710713497094;
        Sun, 17 Mar 2024 15:11:37 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b00513d8e5a088sm973049lfe.140.2024.03.17.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:11:36 -0700 (PDT)
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
Subject: [PATCH V2 2/4] arm64: dts: mediatek: mt7622: fix IR nodename
Date: Sun, 17 Mar 2024 23:10:48 +0100
Message-Id: <20240317221050.18595-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317221050.18595-1-zajec5@gmail.com>
References: <20240317221050.18595-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_151151_401821_C6935AC6 
X-CRM114-Status: GOOD (  11.05  )
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

Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 283fdf7d2d8b..4c8a71c8184b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -252,7 +252,7 @@ scpsys: power-controller@10006000 {
 		clock-names = "hif_sel";
 	};
 
-	cir: cir@10009000 {
+	cir: ir-receiver@10009000 {
 		compatible = "mediatek,mt7622-cir";
 		reg = <0 0x10009000 0 0x1000>;
 		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_LOW>;
-- 
2.35.3


