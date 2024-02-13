Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25414C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 06:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xU96ytnGGcxSAcqxvNbh0M7/JHhcz9bM8B0eaNoETfA=; b=Qqt7ENyp7qGknm
	2DOU5V/ewhTp1QfDIe0MgRNZjrk5euBjKUvg1GyxeulILPRflG79DDMm592qyVEOMRAsZb6HHDTiw
	s2wBXfWXYE2dOfkaRw/V+vyvlC/eoMHq8huqUCaPUTkBNSXqlpn3NkIkoHas2JQmy4qdDQUFuo19V
	MoYtDZJmelpVRP4jdiKS8RysZJFYA3lgem8Rkk0Atpb27uKm7bYlxY0NEy1y2+09z1Hzp3TmMuhAs
	kMgPOfE47IrtypPh3VPgOi0jaNcdsT6jViVFntXm0ZCujWH80RZXk/Xd4tcNdMFPrfRBKfMvg6Xe3
	ZJnDwG7CjTqPiggruzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm4W-0000000865n-0LnE;
	Tue, 13 Feb 2024 06:15:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm4S-0000000864s-2plv;
	Tue, 13 Feb 2024 06:15:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a3c309236c1so325616066b.2;
        Mon, 12 Feb 2024 22:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707804907; x=1708409707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xU96ytnGGcxSAcqxvNbh0M7/JHhcz9bM8B0eaNoETfA=;
        b=d+oRyw/YgOTUx/7M94QG3NguBmANXvweiw8eWiLdRKtVYIoDkdw+/KXg5zOWFtmM4f
         VJGGrY1o5mz7P1sleKuIhhwdeS23j+aPWE3cIU6AQ30DB7AlhbD2lcR7v9Hky/gZ6zVk
         ANuPvppL85JCgDre5tlNw62u2YU2RNZbRzsE4irtl1qkEJE78hwICXqIoJd24FgAWPqN
         lbvcNkhyUDw6ySuX0txH8uyIctv7hpFg1Vki3+o5JFiTzeN7KaFpxTy05s5xzjGgFLs+
         EM1oGgeV/GnG1M4dxPOquRydooezxaqG8pSKqUIG/8869HRRbEeEJGOEeCb414/BwR3V
         9Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707804907; x=1708409707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU96ytnGGcxSAcqxvNbh0M7/JHhcz9bM8B0eaNoETfA=;
        b=sBsnWnIKeB9+dtXzOAXTcATkbxvog8sh1FXc4l4msaQaPJQaXduOqmE150Lu3lMF31
         MGdJyTvyocP8hF5KzsX60GLu3VIo99xx7LUKH/MbkDLBUATjb/YguRRbnTYV5ie044lP
         DZAU127ZZiQV9yoCkm7XHtC2mMaHP6jyvPtOXX+eQYte0wvxCpYlzgVSTWFoD1KyKPlI
         8q5VcKP9sDGpyCicXVo1iAio75lDcpJhjoB7wP3uYmXIoxZzXGkgf6YxJCDMJnQtzbCy
         +TFQeEPdSx8xyAEH2KDhqxTDG3x3xiFmIqv4eNdSkB64c1GoamOiirP5sZszTNQNU4La
         Z0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ741/TqV71azZS25vk/DI2ZNjPdDcJhVme2Z6f8rycUbbRG3sILXE7Cqfoog0pqNeTuLXh7WC9gIduDbusDY9hE+W8pfvX2DJwEVoIz+VG3jYMtgvRpsqDubSzKvelqBgjwqPLSvwxbF0/2AuD7Fsdv1Pev+PA7A=
X-Gm-Message-State: AOJu0Yyj3rzkPW+OJ1VASbHyTtvR4Gs4kPLQmeh0vl2dQirJfo9otZaE
	Yu/WhR+75QtPYGDyRgh/msmCLexoo7TL0NWyuvswT4LbQBDfiGr7
X-Google-Smtp-Source: AGHT+IFzSg0OICApgiUNwb4wnigBaoMrIrGDV77w26PaubZJj3Ppm2rFAgElGTRB+vEGLfTc3Y/z5w==
X-Received: by 2002:a17:906:cf86:b0:a28:d1f9:976 with SMTP id um6-20020a170906cf8600b00a28d1f90976mr5110872ejb.65.1707804906663;
        Mon, 12 Feb 2024 22:15:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXA0GOg4AbFYK+3P17jrNUNemuktljTy4SPxvPykPgsseH74kIius1m5cEmLlM9ilsehaRtioqzrXyzv/WAZrNkyBJ+IiQMD6wdrYRQCdWyxJWXB7cCxmtfSRlHLFUMDhT3zdOzP/kLbI/MiJR0WmVM+SdB225+UzC775dZPjttNYjCzylKu8N9jWXnHqgO2xLpncu+wf7hZWa8REiTC85FcDj0FUMySEE+VH+HXEmIY+HO0ykNxOXP7wjLDKt8ZQymypghJiPM1JWlyiiNmPkRvAta3+SXLi2WhNIbH8Ycvu1YeMF9BddVWrIL652YmL6NvipWmFykdgbeaoem8e0jYAlc0R75uhM4TNLJVj8ssLSP9RxfArfgOkG5pGH7sAj7ycMLtEQ7D0jvpqCygfGtUYrsLUw/Kc06BinSu7z5NpSsDvwq/zmnJ3BJhK36cA==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b00a3cf243de37sm508679ejc.111.2024.02.12.22.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:15:06 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps with "map-"
Date: Tue, 13 Feb 2024 07:14:59 +0100
Message-Id: <20240213061459.17917-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_221508_747538_5496C7CD 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
Cc: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index e04b1c0c0ebb..ed79ad1ae871 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -146,19 +146,19 @@ sfp2: sfp-2 {
 
 &cpu_thermal {
 	cooling-maps {
-		cpu-active-high {
+		map-cpu-active-high {
 			/* active: set fan to cooling level 2 */
 			cooling-device = <&fan 2 2>;
 			trip = <&cpu_trip_active_high>;
 		};
 
-		cpu-active-med {
+		map-cpu-active-med {
 			/* active: set fan to cooling level 1 */
 			cooling-device = <&fan 1 1>;
 			trip = <&cpu_trip_active_med>;
 		};
 
-		cpu-active-low {
+		map-cpu-active-low {
 			/* active: set fan to cooling level 0 */
 			cooling-device = <&fan 0 0>;
 			trip = <&cpu_trip_active_low>;
-- 
2.35.3


