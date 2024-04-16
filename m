Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2897CC04FF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9UK/IswjdivlZnvlMzYH9SOhVxM/8lGMwpTnAVDf5g=; b=JbpjPz3V/rr/47p9H8EuZQwy01
	MpAy7ZI6A+XwLETITpIfZP1pqA9h11/7qcH4IsafogeVKtR6XzYDmXH602F1ne7H0soxzc33UFyYg
	cKUWppnU6U6ptkjiMSJOJE8J50qERTZFKk86pzHTSMTAXfrX56h0U7nyx42F9zR6ChMlkZ4ls2kST
	ZWzOTNiIdX0R8o+viyevFqgGRkKoLj0hiUPiFjT5dCc+YmXU9faaCvHRA/oJ18faoiSvZ2wlUkRJj
	M15p2m1+ufqqiO/o2g/JZriwykXN/a5968+ANY/vAUO7C4BWgKxtzwAHsc/9lmw2z/SdNJR9kl5xF
	m7Ukhbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl8i-0000000CrOC-1boJ;
	Tue, 16 Apr 2024 15:54:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7l-0000000Cqh4-3PiT
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a5544fd07easo117170666b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282812; x=1713887612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9UK/IswjdivlZnvlMzYH9SOhVxM/8lGMwpTnAVDf5g=;
        b=hNBUghP1DzmS6JgQei+aPmser3NeyeO1sYLyFNLpJkdMs0m6L+qwGeADQPzMrtaPJe
         OgR/O/uWx0LnkM7LXX7QynFNPcmy5svPMbuADFQjRxGif2259pASKPMY1uMZXJAdFtq+
         lIkRAgtJEePAYSvgUjAW3QWiqw/OWrkPXsyTEJ2Tc1YkgB3gbqFns/2MwKq6fxjO+hl0
         /g1JxE6xxXOqcYax6s2OMArqnyJ3zZsBgOC+JCxuizqLexZAJWhzmVElxKgA6aSD3WPK
         iRrIz4MQQyj13Y/peq3nkUxLKxB8qvRYjLu00hIA0gM9AfnYji62kPWXauOL6H/2Lzvi
         hGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282812; x=1713887612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9UK/IswjdivlZnvlMzYH9SOhVxM/8lGMwpTnAVDf5g=;
        b=R+aCEjW48IlsJvbLqbx/VgPhro0aigKlnW3fgv28ZLbDP2EdbqJ9OkMM44WqUuVZ4u
         XU+glbAJVkfxUa3bkKAwRc1Mc6V1ACQXWy2Fc6qOQCMVQuWUpDyp8NlCDkHqcmny3CRe
         PZGk4V57RyK/N7YikaZxTFgMIq6zldVi8AqR97sgITTfEH2zbNErr5nvycUMTaH5kfLb
         E6/MtUGvOQwPvkFvaXZTNDoeeyW0t4Ry8Cg/Zi9l8arFj0BS4oGp4CcMBnP9k8TYAg+6
         YkRs2fESrKbHLlsuAILWsCEUQXZtAPaartrikceCRKOReUgo0hLUzofkPuO+f/yedq3T
         Tb8A==
X-Forwarded-Encrypted: i=1; AJvYcCUPgAD928DxIF2CraZdRobjTywImib12EsUHIbOQ/X04PmNbdWZhnnS/bk5XWKQnLeCyeYsmoyBnXOV+X1LHqpmE4B7HZ2knMB1xx4I7aQctakS
X-Gm-Message-State: AOJu0YxQA+8wrEUGTkala51Eh+xzcRjcO68PeBm+f0MEy6aB7TCdLW1v
	3uR4/GGo5G0Rsq4efcz+jLXMtSXecKFJ1SjwKf9JW1ZMiOhiAL65cqNo1uS3Oek=
X-Google-Smtp-Source: AGHT+IFqfbM8k+GVv1bZnKX+bAKFMvQtDXmkeAj8oUzOTJ47JyZ+JLjUDqJoEtJaYnagjyBvM5NXLQ==
X-Received: by 2002:a17:907:9284:b0:a52:5a23:3c2e with SMTP id bw4-20020a170907928400b00a525a233c2emr5917386ejc.43.1713282812609;
        Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:10 +0200
Subject: [PATCH v2 09/18] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+xyac2cFKfXL7SEy4I+ItDZmKjuQP6rtH9cJMga1OwE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qK/cbddaKH/+p1Qdvx84jOYg2K1vzKIKSS1Sc
 x5jA1GSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURXsMD/
 45ehwMPBNwK+gMcsfnl3yGkL99YxRTk53D4gBwYrurtTfGf2jISxnqikQtv8LMasjLeJ2JlfjLqcjD
 6M9/gRGy5p/ulWRftZOocYZAbWH5YQPXj7PRy2syaxBdVRtP8O61fsrKK8ikvXoMxKpy8WO1Bsjq+j
 5a4MS54/0kcznLZwu4DeEsfvSHjRYdcFnxTQHYeEYfZN1FxgRloCTv7hSt5AWNfj1K427zimu8rut9
 LpawESAIs9cC9jAAJb6CzhzoM41a2VBav/bkCfKGH9tIb6wluhbluz9HuboIJBsp2YEI9YUF17HiF/
 iiX3j0ENc+L8GyCudQCoTfEHsIHCJmH4I3hBQ5ObScyO4gJIlv4j/3CFusPtN78NiKzzyHBZ0GEjCu
 pBvRBJKoitIGIpwsVxvA1vwWQ2S79mCzYXUrL0F+mMAEl2MZF20fwk+CiWWOkgNDEwrTMz4SCqRNaJ
 sts6N6qibOFRBAqGK+cgzlfKUBe1ppDKAQznI7E9nL6K5JxT/jgpQJZE/ciL6voSGy6IdzYPzVhs2y
 /F+i5IoK8IPqcXrXoEJd4JJeqs4hwOmwc8AmjfsSE9sZPjF0ZEmWMf39urMj6gU7tBlPgdWCtOiMKm
 BUFtMqc+dtHiEI15o4TKWJt0vr9hOJ2kYXhJA77T5fRw02DbDNFrEE5u6s6Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085334_150636_658C2053 
X-CRM114-Status: UNSURE (   9.61  )
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

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index c471a181d125..d55611c7ce5e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1


