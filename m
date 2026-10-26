Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BBC60A2625
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJqa0W5b;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UFVscEaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=; b=FJqa0W5b+yOJ2J
	nU0gAMkLoPwNhvSgHVkt+EiSGmKMWU60rN5JIj6PiNliGug41xYnohYV0YZK9No9mLaZW0sVWb9hj
	RRFLb45bkStTlNH8UXTZC0NHngJfECckD15mUL5sxXspA+2A54/jGu0Dlw7x8u/6itF242OUgnMnY
	SYhaCEr8fYsyVgczSjubJCBrbctCUaNH7HPw2UAL+0+2GaHJ9tvrQQIeVNerDbLai9J0H6ltpdiU3
	ilH72WCx2nnxdPpdGQZauhmYRNRnnJAp2y6fM/YdYoLPYl69qcIFZMOQr7CvtZh2cckBN6CFND77s
	PuGmCbjhkVzR5xxwQZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSi-000000029ZE-2Z6W;
	Mon, 26 Oct 2026 09:57:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSZ-000000029M1-0QPt
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4956869750eso18220555e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008661; x=1793613461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=UFVscEaRTKYRwfOiY48jT1/P5SO+0SkTQfi2OrBuVjGflDTcZt20S14J1yqQmZXEzj
         LsyyDkrHOtDFgmi/NK021QhOYMtvRBH0aCGw9dp3dJc/xfNHCtuCV8q46qU2WuUDgOJX
         5DZ0uPsGdlA5QgU1N2pYK/N2MrbcrSMsn0mjfVG/tkcjFjFKWs6TT1kKlPu1KsD+N+EG
         JMG+z4PmMGnJGMuraPCnyl9BWP4T5wb4rn9KfYGaQct7XDxiNhg97kxI88Q6Y2hJHR8n
         WI0fuyKHA8wUK/XaVXWQ3YXsVr49umSi4RrTxztSG1XSDjKfKGv7fSBdCT5+qhbcx2yZ
         T4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008661; x=1793613461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=MxWmrRKqUNH8UFmIluaDHp9tkdUiyCpB7ultZLY4qK8WIOOcrLPV1agYzdfKmC/TDF
         dhBJ4+Zc4mRN06tXSwFC5EmNSWZPGt7F7OiM43ZrDd2BD+dznqTBn+iXvXOTX3Zc6m8j
         3gV/jBVA/HOb96RWKwIUix//eZlOreyIo2W4uBdhioUVyBslQMEzrpDKkcLJANys9Rp9
         EBfJPqDHELLBf/6jN9CbUZ6VfIiN25jr4KQT8JLj1Rfe5KUInrCy3pafBi/bFj/yDcg7
         2iLxIlW9pUvoOnen/yYRzMwN62OEYzP5TmF+7KlqaX2DFqxvwouOP7jsq33y7cPt4NjT
         HP4w==
X-Forwarded-Encrypted: i=1; AKwUvBzud+dxX4PvbO86pT5N1d1nnzzUs81CthOYPIjcW0Ubm0+WnQzHHDk6a5958n100usv27e98z+sfum63b39Fg==@lists.infradead.org
X-Gm-Message-State: AFq9FYISRCIriYrPjFrr09rSDdh+4NYpfrsmmTOiKEVip4ofP7v/ALo1
	9YkEv4tDQLCuo+FmOj7KLvJu2MS5oUjr0fZrF0+mKs21oyPDJZ9ZH5AS
X-Gm-Gg: AYBFou2l79EotQgn1+NcMefLfnZ82zqr9kKpQ/4RZNbMpx6kfFKXkeN6pF6L9DpSOfj
	jfJaSw2rqRzSm3fOCwgb+rstsnpb+/JCaFVDM+RGZVA37WIUn6C3cyT41H+eX9pRVS1Hqtb5BEA
	edzbwDHAqT+5yMC1nkqYzPa4WujPkb7qjIhnN96n3bjLTm9cXjqwwJS7Vme7KzNh3c3C1zCOIwD
	vyKDrgM6yGDkTW6717+6BU6yrg6WWsCQusKwYHf0n9y2LoUlxhFsR23DOQTzbWS9YcrHqPVxyBj
	MCXnfL4qAH3IJynZ9EiTpzvgtWDjgcUavsgZiKqQcMz4sLdnW5mMXcJWs9zTJEFrQWZHNZYnohh
	8C0JTVJ+zXs+7HsR2rxwzTsVrnwSTuDn+TWIRyTMygt1tYMogrCs+cbuNBO7TNMRbKRLi6U1KbU
	+2uXzQ2Mi4yKn8NUXGzmx+EVJIB14Gq0jCuwXZV53u6PneIuV+smpCND3og4dmu8BK3xtcqVvwE
	M0jprdLKhoStbKuu9JbLJbSnGVKTZINPQDBjnoWe+H7hnjpVyduqKbIsJmPRnnBLp5IbiRcyr8J
	99RkWyu27Y46zU4qh63P/DYgoA524JwGfiwG1rIO5CFuIXRqA7B1Q6JuNREJUD7AWslkpA3y3ou
	UaPvx18Q=
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr112485855e9.30.1793008661422;
        Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: airoha: en7581: add watchdog node
Date: Mon, 26 Oct 2026 10:57:11 +0100
Message-ID: <20261026095727.31708-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025743_206280_743D65C9 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add watchdog node to catch stall and correctly reboot the system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 58bd8b318910..3a4a4fb0eba9 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -484,6 +484,14 @@ uart1: serial@1fbf0000 {
 			clock-frequency = <1843200>;
 		};
 
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&scuclk EN7523_CLK_BUS>;
+			clock-names = "bus";
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.55.0


