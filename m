Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CBC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/8S9zAhITTz9ARvUIM6rB3SshY/72TljcOdk5LeQ3Q=; b=OLWn1Iiys9rzymq7rD5cxn39Am
	/CMJp+cq93blBZM9zXDV3v1zwdG0aHGA2IU7QPM3uduwpzCCF7ocWBDwxGPRCAjuobDzuKhQlPVpq
	KBqYwYvyFDcrijTPW4c+9hCZekYq1NGtEBEk/DhaKcM8SuYdT0hzvgVRFJ9anTfP1uD6p8Ubq+aRk
	XBB+IO7MggQXghA63wBZNcwug4aqqPNS6XyzaYWkTyg00j8DWxka+HwMARGAj344IS7LQNGOzAa2S
	wNx4RxGaurpBkcq1SbIP/Z4uU9j2i6tC5ZuL76wSwNSdBizvMg66bH3PTm7ZVVCLx2jf+Xcx1USaW
	S2rrNEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHHF-00AX6t-2n; Thu, 09 Mar 2023 14:29:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAh-00ATfE-IH
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso3723790wmq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/8S9zAhITTz9ARvUIM6rB3SshY/72TljcOdk5LeQ3Q=;
        b=Paw4lE7rgteiCmJbbCRSeVVGrswcjh3BFd8nPfVyBZ3qdom9iSJHtdx4mBHU8s71/G
         M+T5o6EMJy8BABjhb9Ep9NOpZpgHbYyOQuzm0hcfi1uXS3fHungtEqsxb7G7TMBKpadj
         dq14YlhWe5BfA+ubm9gQsad2YUTGsbmpq96lPY9MMY0qqmOLubh9rZGMnujrIoKZDF2c
         jscwueBQ9tM5SlsFHiJkgg7gu8MPXGIwDsjX0DBl0vzxK+WRqfZZMJl31eN6ElPolkWs
         I8dDxaKxdZX9rKZKEveZ9rrXk3nfKJnvmwlHT9z0kNJ1cmuTqfOEAuencjDWmeOjGagB
         BwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/8S9zAhITTz9ARvUIM6rB3SshY/72TljcOdk5LeQ3Q=;
        b=OK7ZUu4cGrDmvBdSwvbncpOBASCpuTsx9Sx5J6gSzaOt4QBJ1sb4LV9fEj5fvHKz+U
         zeYcMjjqYmFCTHfKtlLfDLVU312rqlk5jO4id559oD1cxs2rroi/IADNr+ZjscI6tGvu
         EAXx94IaLiu5dFWjs/UW7MylygyGacyQX4hsq64dFSol/ajv65K+1zpwKls/iRNVmK1q
         AGF/0wbQVOFHSfJpAraosAG5YToZhR+jNTwSKhmZQzVRNlVdRwKBR3ul2FOBygmCwvlc
         FJSVcQ0MyycXLfpV03xLFD3rkr6pirynVjTSPL6YoGago2IfugFuBzs6LIFOmVvDD78N
         J0oQ==
X-Gm-Message-State: AO0yUKVOKmUS5KhYutfPcs4xWWP1QP1zFNQfLNzI1uvAO60ijA5yirXa
	5iiPdjPGBgxBimLBF6fOK3xeyQ==
X-Google-Smtp-Source: AK7set9TwqlVJpH/8L0NR2uEUyatF1sOiuRce+ItUudlwqE8a6hDQbfysi1GTjePfgyv2cl9fWrcEA==
X-Received: by 2002:a05:600c:3506:b0:3dc:405b:99bf with SMTP id h6-20020a05600c350600b003dc405b99bfmr20382301wmq.15.1678371786930;
        Thu, 09 Mar 2023 06:23:06 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:58 +0100
Subject: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=f+LlFWqL4iGgBIpxFelONT6kK+k+XvcRswfNvN3MNAo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+di7JzQQWl74+GKipXG0KRdPPts/MfRxqEUVj
 mCLLlwKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURYYNEA
 CiXLD4ykIDwMU7sPiuItu/LUUcOiha1Izgc6NlWsxwBtccyIEZOxGxwTYFe/zYzCasLTRY/ux4E0F7
 /B75r5GMN3ef5WSWHAmw/1ogSmADe9IN+pIyoVoyAYewx+upkEDW9iXk9IH11rGJ3xxfaQSy5/Ww6k
 4kdB20shkoPrF4yHBs4kKBKFwHMf0gnNqxG6SwGqiI/hhI//4jMAE1//hUbefOCylvKZk4dUdA7gwV
 VjAISC7+SEmpuYuK84ami0QwftaIgZq9XZsjdV5N9iJXIxIOcDcpynPSR2EgZmTmFjg0Ce7I2Cv8ua
 3M2sY5K7ovJyJ6Z8aN0zRdj46P2n6XViqiqD9vi07vJxj/yQCcJeCgPvcRdel8ahAuFiaTL/sWxdGm
 8g6ldbUOu+JbKnteOZQtwp5vifrRz75asn0P1YuaQkuYzGVwLGt4Qj62xTtWkdM9qPkfa5mGmAKI8v
 BsoPIdLdz16pcViwP6bkRftEoP1y9+URkKPYore33ra9xLX49V4pTuPhMVoGmaDZWCKqz0CtYtiUb6
 uapQIS/7ycwhGVDvTYtg2DiH1gFld9VWQoKjqwDdbrqf5pQGfwQOmrZqexT61gdtajcNn8PzoUXVC9
 My54ek3cXzXKpB7xh/HxWpqAprRIskSMxwuKvvLPhPbUThj1YvCFXTdhYoUQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062307_639962_0CA32FF8 
X-CRM114-Status: UNSURE (   8.80  )
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

Display Overlay for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8192 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a2a27d0ca038..20e4ca4fc915 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
b4 0.10.1

