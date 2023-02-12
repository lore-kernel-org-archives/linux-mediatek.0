Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6DBC636D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lkVRJ9xqkrjXW8zGj3W60LSQ5OKgvmhXVCbi/Dr6uXo=; b=eRlGBWEtl54tTG
	XSRe4s07PWLKLFMuHRuQqaGiv72+xfjMLST/8z/i0Nws3U6PwS7RpWoH76MN4zQshlSHEGYp+V7vb
	EAi5J90fKuLO0mgAwVXpVVTS5D/9CkcTJIRp2+U2Uz2P7nhynMQQ0OuWQIE1YXvL2ueP0cHBebzX6
	BVI0kAO5SLxW4C1YFWdRNm2OW+kM+ODcRIW+eDBYFV6Fdxz4YWJV9DYR9FUpFSC3HCjNt/STMmTjq
	VLeLWJyoCfR1UP5BeGx5d/wKc6xF/J2Wec1Nm3JSVdyTIe/odMn4vtBWX465FNkL0gk84m1m1edw1
	HunAPjk+TLobK/3887/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRBFl-00BQco-92; Sun, 12 Feb 2023 12:14:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRBFa-00BQbA-9F; Sun, 12 Feb 2023 12:14:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id u21so9557612edv.3;
        Sun, 12 Feb 2023 04:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkVRJ9xqkrjXW8zGj3W60LSQ5OKgvmhXVCbi/Dr6uXo=;
        b=TS3G1yE/apRlRoXVSwpEfjuqpPQlZmaIH/tRFqKpIP3AeMFB9G7cb5qODKZ9JXAk8c
         IkS18fCvKP/EkcJEuwInxnr6l0O2kTOBmlQ4eCVx/JjUcAsvYPYLccDterVJNDc8Iun8
         6FOZhiwPvPvzqf20mq+gTl8C6JW0Z8njMGvPA0WmUicZFh8AZTlb0Bb9xvU5ReySprfX
         ycOdFuAwcCw5+fhbrmEAlCI5rzK7xVNaWuHG3VxySLRp2GE2Qf1SnKoICpL54e5137uy
         tavVZKvWyxcZ2hRbRxV5BTtukk0lmDttNpcXQ3mt0iwx8y1WuOyoTX0TTYxt02I1546K
         HKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkVRJ9xqkrjXW8zGj3W60LSQ5OKgvmhXVCbi/Dr6uXo=;
        b=KDFeoS0J+gYyHKI9HuLtrpRYCwO9SZofNVC1007V5SaOzpP8m2tfZGREg3eVeuci14
         8rXu5U9PjT8GEM3Pf5eX+QQGyPjypllbhAjIR5mPNTxHD8GZZLTJlWX5fhjyyN0e00u5
         C1Tbn2wwJW3mfirliFM+vojOoY58M70ENp0l//6r57p1LWgiTl1wWLM93WhyZ0TritQx
         gLEZdWPlRFnn/KpcpVpsInjZWRF9w9/dXZxLwbD8zfPHfXAshu4JWTt5fmegw9gH2vxn
         +9nGfF3l5p1h/LF2CTWq7Ju2smzRuKTuKnhrw5faKFDgoA8QXjf/F85W+9S86gamw7Vf
         VexA==
X-Gm-Message-State: AO0yUKUBdJHTH4KTrVlqAUDhjkM17AHS6FDPPQL3D3WF2bxtbKas8HWa
	3Nqv4zeXMN70gXryt3hZmst1024DJuCfG2i3
X-Google-Smtp-Source: AK7set9DUjDRrLSFJk9iyTooW+hGLFtMZQ1i/na/cPtoXKwQn43tVDK7EiCsSnmEB7z8BRUOTuRwEQ==
X-Received: by 2002:a50:aad4:0:b0:4ab:4d55:6f74 with SMTP id r20-20020a50aad4000000b004ab4d556f74mr7792798edc.13.1676204068620;
        Sun, 12 Feb 2023 04:14:28 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id a14-20020a50c30e000000b004ab4c28a967sm2976320edb.44.2023.02.12.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 04:14:28 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm: dts: mt7623: disable home key on Bananapi BPI-R2
Date: Sun, 12 Feb 2023 15:13:54 +0300
Message-Id: <20230212121354.44590-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_041434_349167_D22022E8 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There's no home key on Bananapi BPI-R2. Disable it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 642b1c0a96ba..a37f3fa223c7 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -345,6 +345,12 @@ &mmc1 {
 	vqmmc-supply = <&reg_3p3v>;
 };
 
+&mt6323keys {
+	home {
+		status = "disabled";
+	};
+};
+
 &mt6323_leds {
 	status = "okay";
 
-- 
2.37.2


