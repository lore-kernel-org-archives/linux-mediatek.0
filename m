Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60371606A6CF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PshCooSp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXCKX55f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=; b=PshCooSpl5wVm+
	qheOVwOHWznRrz02cQmla9ukw7i4UjPOwGKGYno2KaVDf3lbjdP0vQEkJktmCvCAeB9RWBnNAqIoP
	WdvcpPGimzYQvTW2ojD7IuR36SSeaI1em+oEnHsTs+jDFrmJtPDVrW1IN6mPMLhNtNSfGZq+ff2I4
	rMOarechef2JbYqcaigjAwif8ZfauVlslb3zgK7V/An5OSDc7sFG9ByTpJn1S2JxcEM7EuVrI38Qk
	oTTYRn90EbCUi/GonFUVhYvBTnIIgm8Q8BFzBI+OCICMXncVxbb0IYF2Ev9DRwF9g4E0g9xWBA5ku
	DZNHmA6BcN3ts7fS1Mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ob-0000000AOx3-0fc5;
	Thu, 05 Nov 2026 19:45:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3OW-0000000AOtv-1zhH
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 19:45:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18963265e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=RXCKX55fxR89mxjUUjtlwVimIaqLsfPc9/TZ2L+79c0sVhbHIm8js0Q57cUGN3lyLm
         /8L3ia8Ym8yEN6bj0ku4ELLjzTXjc9IXA2gAPnC3stMbzECG14scoUdWxdSrokC0r9jO
         jI/5xj1HF9nZ/RaNz7ZvaJ/xJebEJE0z8OxJq42PfbalteWj2B0gWtRasOVrFFNDuHNb
         1LuZF9X1RexJkHI8K8h6Ta4urU+4vVA8zfcOad9zbmzYh7ial63zEVZ7VrimuO5GWcy5
         QLPuB3HLSKA7oFBYQ/X3LwDmz0zGmxhX4I7wiM/TJa2YaNlayW4UKXmxnuuSDrSUBJHk
         87TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=fGMasH35UGFBW9zuZgSQs4zSMwrK38mU77D9elfx8g+IZ5wubKKx97b6LHWvPCBAUU
         9ri4bJYcduMxfbYnBP2q92FwcfY1ZbQJRu1dWbYFmFW+Yz/8c77YOFI3S4JzocsdP3eT
         Mfd3XKMeLzn68UZ4vAE17Q7xCwQWZku18bTS1K4oZ4DdROluvoHZ7VY7VF7Hp1DPWC//
         taZCsdUawIo6MM7Ybq6VrS7pnrEf2xEFjpytLPyDEzzB++lQt+YPPqQIn3T4MskJWmuh
         E9d+RwVnWiJrKQxYdDQ583ADTmJoMhydZCDSH8mS5MXwTCSEdPXyYaK2pKB9D+enensl
         747g==
X-Gm-Message-State: APuU4Z+0MzKV1tpDRQ1pXLmsTPJZEjeSWs6/jMIxa/bDhNPIUCxXe4lo
	Fgypzi5+Wg84cE5QDoL0UBZfQSpQUBHu20mNAC/kjy4u4ojlB9sT6sZW9c54yIsjAVQ=
X-Gm-Gg: AYBFou1k7CDlOassKoFCxOI71LqTz4NBBOGZeDzMGfa712rq1wHUJdFhAXKwxFFKsYM
	Ks3LGc/DYoCrcWroPfzOLT/21ZCk2XsJ9vaksqlp/nnMHHTvAklOBBPNzhhO8sIrlRCVOKSlVyw
	EvObbWSUKwB0H/RABpeWHPuR4wOCsUXovXCMSK9t3ST4L9IpUo132FcGe2rIVz7JAeo0BFXFdo5
	h87sPJ8W0T7zjpuIlRLaMrXpvP8INl6bmACGI7VqauCClu1dJfZXe6m6wSVqnkx+ZfSYWbKjixB
	EnwLUMPFVu15E2PwDoEDyyNrRm1vgCLUpnncOj1xAFq574cQwktunmkhiOw3fzeiXckBQn/BdvS
	l2lZJ512NVG0jXR/z2nrAFz4qBrJqzfYFvO2GS6Mi2q252OFsEWMZllX8kyFQET9dj/m7rETZRw
	gcSHaGL6NUQ30IMznAMQ2Tg66CjjY6wr/3kKiieDrcV0pa1x7syF1i/Tb8toSZjSRtyhYa2L5g4
	xRprdbFDB3RcfXhd+FW8Uv/Ew9RTLw4KeonmmZl5Wc0AAzQ6cuQZXKyJMDHyZ/emAhbqjc0L7Z2
	gqhQFqwfI+oi0GX/JCSWHEYZ
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_114508_618313_257B70F3 
X-CRM114-Status: UNSURE (   8.98  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..8ecc44a88a14 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -75,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


