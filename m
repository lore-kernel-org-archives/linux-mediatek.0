Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E1D0E6C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=; b=ynRWRM7IaXCKheNkq2N3MUTZbr
	dhElt0wxhs9QvKpR1tarln1h6gC6UVmGjCfh0WcgybbNG9FIC5Rmg1ayQLVO1kOOcO77d3ixc400N
	qh8rnTB40AH6+nk6s/tcH95/v4QS11lAI5PBeLHz2uN1hykSBNcHrENIoohfvrJUBvaActksOsmBM
	JlM+tDZRhDPRSNpQkpAYghME/eHEX2XcldA1ELujH9rbdkSjPq5foBZoj5kdl5AMiZlNRWrY9uK9z
	/srdUmRiEBxAX+4MT0FJqIxN6IYUlVRq2yFpDxm+tjyG0e3h3t8e9af3xfjCx+d0NCtrRIRcOmSFe
	7VIiK2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mzQ-00000006Oj0-0KOZ;
	Mon, 21 Oct 2024 07:38:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mpJ-00000006NJV-4BXY
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 07:29:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e5b1aaad96so220059a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729495661; x=1730100461; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=;
        b=JCiGfJ2d0xG+eKMlAFNaz5hZeyHvclo5oP/gL+gJHNkMKItDLy1t4vfwrTyCmOIg3U
         vy5bMm7mnq5nt/B3GpSC2B7lIlhg4XJt94uRo/WkQzvyvGDTe3kO3H0zWX2ecRsVIMd5
         rcaGBsgX61fUUD504kVBZc8eFbHLXGAqvcg1ug+jgpdc9LkmUfjTTiM7fhqM5SQWlV0J
         C2HHutCSSoFF+7Gc44tTJMLeTbNj8PGYm/b5V0Ef/S5t8PPFu6lsrEOx3A5+haPUL9k3
         tMAxTFXVZ0q9A3oVUvFlGho8uUYydNUK66jli8TqRxx+N64ZIgXdAEoJGdjB5XuEukFe
         1ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495661; x=1730100461;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=;
        b=BOA1hKTgj4VKiKvba3EMhwl1NICsGCy2Alk5L7/hbda1UcvlD6LarFNFReswlFk9eP
         MzYvGoYZW6CcGor48bJzZGrlEZKyAhqh8A3qAbCscCYmYt6rVEcEaaXPa54Xp4ApmDKy
         o1m/Jmq5EdIof3coSf/YzC10c8/QWdhyGCfz4qUfcXZNP1gN7Nz07A64eyxTanIlbLKg
         4tbTbTvnDsNaGl3Kysjq/S/G2fy/PU50nf5wNmdDDpRlXtt7+FTiBzQZm2Pvzy6lDy5/
         1kUdKzEwzHle5ZVMT0QpMzSG2DwB2oRCA1giSxZyVmH65N3jauSru7ay4rdBoH70w/2Q
         HjPA==
X-Forwarded-Encrypted: i=1; AJvYcCVQSpQiq1KALauzSNUVGZzdxRE3MrJnpX+8WE5ghnf7hP8Z+NdzeXLOFXH1eWM12ZeVC4C2VunS1+A3jZ6v4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVGQ/vQt0HJxvZRlr3XtRNCYMd0ro+dFKD0wj0nZYuRySWUXTO
	AiG0EY8xQmU4r27fGocQY4j5U1MgZ+oblBzlX21V6Lty+O1iN60Hk5OFdRPECNM=
X-Google-Smtp-Source: AGHT+IG7O4MTB4RTMZwzLlrbW/3WFjdoM5Duu6oLxtC3YUEZUKgcz7nk76eEdwRy5PZ8e1hJ3H2RpA==
X-Received: by 2002:a17:902:da8f:b0:20c:9285:e951 with SMTP id d9443c01a7336-20e5a71b46dmr62715575ad.3.1729495660913;
        Mon, 21 Oct 2024 00:27:40 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db2desm19749595ad.203.2024.10.21.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:27:40 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 RESEND 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Mon, 21 Oct 2024 15:26:26 +0800
Message-Id: <20241021072626.15102-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_002742_047555_B671A5F6 
X-CRM114-Status: GOOD (  10.14  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 943837f20377..13e464dac1be 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1


