Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393660A261F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JzF6hNWC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CF37+iYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=; b=JzF6hNWCJvswgs
	lix6UqiPp4uxeayUSmoGoN2GgQjHDVjSREAtn5j1EuFfMy4iMiujM9qBXmNwZOh9e2LUdDwkwG3Ta
	8qDyLEri8PSffV+hksHe48l2hRZKkhwVRO4iEv1d8tUmVnp2YNsFQ6Qu5bXmqR5oLI8X4jtmTPdeb
	omUpZG3rk0CjAahRdcStvwuURAjXTQuwQI/LSNbAZaWIhNS2fGqRVKVONiXxPUKE+qEbJOJZW8b1Q
	qbzYONHdayq18sF1v3eUU/Eu7HnsaVZVpG1/6OG8x2N1A+x2hzwvCRIWBT1P1KbM6Y/K+r3BQyMIU
	FLuy9EZEezjbCPpY+KtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSi-000000029Ze-3SPo;
	Mon, 26 Oct 2026 09:57:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSa-000000029Nk-2bZC
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22896155e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008663; x=1793613463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=CF37+iYiyhe0mKwJqk7uQHTu0nHlEiDVZQpK5tKCcDsl3zjQBQRxnbXVLxIfYC0nTj
         CFYxRltfBYHr33iBjYQQnD4MrHc1aCRzMoZAtUou4UG5145lC5/xvU5IVbpiMgPQ2K3p
         5Ht+WdPMj9Wh8XrkrcAU3ZrR3aH8zhCRZyt+freBBefJwxFZC8HdD3A+G5RwEYcVgGTg
         3tsrbMvSnB8DQNgBkh2PtTW4a8EjxT4kNJmjVIbrWCGNv/EpfVvVhyzKlPE4G7gS3XHC
         pTMsI+edWfqCqySFyEwU5cbalImfKw0XO5780YlUA7MnuKzE4H8otKYlfswK5m2vFx44
         1dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008663; x=1793613463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=Srj1v+nF3/5abzjewlD12MiB3nLOO0mTaMJM350ehF7eaQnQoVdqTR7zhPiRFp1RLs
         JIEAw2UFANLZTpWy3f7Qmb1XITvIwLSEibPK3yOdh0fHJXImhDGbmEOVWuP3MQ0mCd3N
         NwW+rnz/sfg/wYKYZmcsBOW8WUhjBq1ku8Xgz2oj36ghOzb+7dnucZ1Wl1ve9mMF5R5H
         bKjyJI708AjDmvOqRDPuCDNFP+/s3W0T5YCcbjiUY9NhZk+YUD1gDTqOQgrhGfKdLL8h
         nVcANMzQAVX8J2Kpm19GANsdYEdP3ssLePwiHllsEClh+d/QO1+sE7MrJQWh2SQ7mgCO
         dRxw==
X-Forwarded-Encrypted: i=1; AKwUvBz8ut+64WDDL1SVfI9sO18oEJuaJy4JOak5BRRwcRCiF+Y6zfsSwFTgGboiKUe25wH2lAlx/svHCDavcKGtfQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYImjbffULqrBG2MzHiwYAmniWFYIa6miXfKviu43xPf93Y6sw11
	SgfBDYI5NcZsklVhD6DPLSGXdPBYiZF/ChBa9k6i6SSD37mU6McZo8Ol
X-Gm-Gg: AYBFou0heWyqz0fwPQOxYsgbkHF5o9N9Gl3dPDiPa4v2yMxZahukD0zwbommE46uxXJ
	vF2ZlS4bLRIJCV5PH851h1tlIFQVuPKG3+Sg87eceAmCesRmE1Emp7SP60Vn6IOWYV83acqVD2O
	H6YwPOL09WNBTKngnJIf5hpG0ootJ6UYvr7yqhFrsUMeCTcNRu2HSJzKafuvTH9lhCUUJz2HNNe
	4JQurzu8YRswfqIWAiw3IgSWrHVPzwdcJIm55iwxyEM+qr0Ifpl8xX3d182k4CI8R5eQcyAta1u
	H6GjcE7A3LXlRAd69q4ya04/yH9j5cc04VOKb+oMNxOG5FUMwLjS5nIZQCUcJlmg7agGpoLxzcW
	PRdINGOy75d6hqfCYP1Dpe2WWxi3vQ/3hehiixto2w3Zx/2NjK00nrZO3KCg1SK4DGDEtABQHSV
	OORkvCsR6k0LrpyZnsGWis9g9n1twHSikCyf2u6T/lwOv+g5ZBMtKjHQ5wdBKbH9AI7VE4DYLFj
	ol04hY0I8DLDSlOfS/bxnz6CgB9PDPR+rJ0czhVgvduD7iU+TSni600ICAtVCHbTy8HnQ3wodO0
	QFIKtO4hkq/RCwz5A8o9NdIgiEug8aA5UIlHuaFMKcMi1ePfDeC53PDHX5Gi4XvGMToEw2YDEse
	iK3uCxA==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr115674445e9.24.1793008662683;
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: airoha: en7581: add PWM node
Date: Mon, 26 Oct 2026 10:57:12 +0100
Message-ID: <20261026095727.31708-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025744_669662_45084CB3 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Add PWM node to control all status leds generally attached to Vendor
boards.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 3a4a4fb0eba9..760f0c3e6090 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -509,6 +509,12 @@ en7581_pinctrl: pinctrl {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 			};
+
+			en7581_pwm: pwm {
+				compatible = "airoha,en7581-pwm";
+
+				#pwm-cells = <3>;
+			};
 		};
 
 		i2c0: i2c@1fbf8000 {
-- 
2.55.0


