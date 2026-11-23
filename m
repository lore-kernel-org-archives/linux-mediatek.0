Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA025606A32E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QVeKjfwQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhjtcNpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=; b=QVeKjfwQexJ4CW
	nWrurXiLiSgEMR26xWe6Hup3dWnIO/9fYy1mJjY9Yv2lY30KPWmdUVQP7IUlYk0qKYlhZj8ga+xWX
	cWFkEAaqlV4HmrToxvGmdslSbdI6CWk+RGxAdSsKgAops66TtLdtobDXrX4931mu+Sc8jMnAwmlFy
	bEMokMbXoqHIbtmynPGrKOfLbr4l8MzTyNC9E3vF6/MmC6EIi7sTDVFpzUCkmSNeqaD7ib1bFTHM9
	2pu67gwNZSKTp3QtnmwaxoXkoS2cJ/F4o+BzWWuU21Lt5xcMzRspaRsF81ewGqw2QnuIhKELoH/U9
	nbEKPVFf4nKV5qA5eviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4h-000000036ib-1xuT;
	Mon, 23 Nov 2026 11:19:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4c-000000036dR-28mo
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:04 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c50a4a2132cso438890966b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432741; x=1796037541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=xhjtcNpVL1+7E0Se6oCnT0KcQPo5nXJ5We+u/oLKGIRwFO3ilKRxhHq/xnPUYkra2n
         R6G4Sa0DDE1dlIOGp8kJR0TQ/qDPKLtxxTqqHaoDsrIOw3Ak22tk1OBOLsOxSYT6NfoA
         jaJkdUdJXfjfxTaA6oXUzNn52Uf9Z06UV21lWzYIv21bDZgDzmySh3298FDr3JGs0K1v
         l+tSeLBQw4XiOkAQTNHXmyqwLpKwWP7RxSjF39ZZTR4PRVORLe1YUxgGTlRyeHqHMxzr
         NjZ4+VtqBfAs4JWOo4IhBJB14qIUk+VNNbzvnQOkrrbVwAgl9xqGxLitUDSD0qlyksEH
         Yf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=FJO5oPFO5s8UKCyg6DeUcC5JCcOGhh2Im+X+SXFF+b9yw3L0tCbgLMOsqz+VqnHnmG
         tIz5Vu8b9b7PwXbrOvc0vEjQ4GlS51Hqq9ROKFFikpZFnqB9QkxdSXBBnXk5BqFDoilM
         XFg3a2orT8zyY9Rnkz1rGGIw94q+rdEcz26xt+wW/wP+yamsOmVkG2j/yaK1Ces8WgKZ
         vJyBx6oozyWeK8Mm7e6Hz5UWE2Zyu39PICDBKqXd51MFSDEw9v1QWqIVSmG2jHxYT48w
         D8vjfUHpAxQk4/Y7fa7T88wi77KJTDUIf5eluwxpZRKND/GWEmw8LM596D4QcYRnvSGp
         3Bcw==
X-Forwarded-Encrypted: i=1; AL+hErE8AxshdII32hwLzBsRXSihEJuLuolzAhiZnxvTmbvF4MlL9wXMYB+L50NRybnJOeXOd871KXZWZZLjV3pSUA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+5IAvhlM7TYeeiEEKMryXHOeNg74Q5cJe/vDQJIqRI7lADQNyv
	nTpxXz5Ou7V/1XoScOMkrLJ9/ID+1MBpaDoAI/9xBLQ2ATFIk1hIdBmN
X-Gm-Gg: AZFdTZe8IE3W9eTVumuugbQEl9ZCGgV0S40a/w5Sw0tHFrO2Kb3zfI7lyj8eHoaCsvu
	oMvrw1rFCJ7kGmCzQ7OtFSaF72/ir/GnqoMsqO/x1Shim8znTMCW0Qrv5qzO9PtBavg4jhTifAG
	Br8Li2bd92G2Z5WKzr0fXgR4xDA2BTyFQRfVVZwMptSFlXfzYEedrnOSPzHhgAIqsapli9H9mms
	Bo2WRqWN7AUSX1apr52RvnvKbI6vQNenDNVzmBR6MmaPZm84BK/VW3MmF+dtDqqRxBchK6JuDxI
	rrYsHvLn/3FiDWtjo45lKJhHyMi/pFHKTgbL44aCyJyOFxVcirT4FOGWn5QY1v32JI/0luDBBEw
	I1HbCWozWMMwtxyJIwm55TDNq3FSUywFgQqYrJpy7epEevTXACi8/Gk7AZa3pRO4Z1r8w26AsK1
	SSyKWYutPAzQsqnea6uHAtg0SdPYHiiyY+0C6deKj4JySVJ1NHxDsqe/SmnwHSMK64oD6PD6/9r
	dNnk8YMAxZR2Y+D5CygXrAIXtJaPHuwOMb+3sULwpXpQBfJd50HC8AChCtDx3n+49DZRxzwbJqr
	TB4nTFNDjlIXs6xOs2NhmuwYnLXqs1Pu6CQZsAglNIyLLsYCpAsSZk+CnmnAJnqPdw==
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr586385266b.16.1795432740595;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:34 +0300
Subject: [PATCH v3 1/7] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-1-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031902_580091_881CA9FD 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..13e5c31cecba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


