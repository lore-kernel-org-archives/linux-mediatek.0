Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FAEC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgHM2XdtmrQGUQcf2y9Ae/95OQamjNw4mHl55O/fJak=; b=b0Af6VL0mahAJaBta06y30q8mz
	HINzOhvPLwNRzXo9e7k7VOx0A6LhAJNvstR38g/qTzP/a7PNDf1x9P5MQn500P+ZVOcuQeWZipp7q
	UdEZmNyVlaJeA47gsZC5VC9n/SydjZBTD4Uf6FTnWP3zHCdORqkLPDz4USVIERvmvpZAKigVYccQa
	5iHvBloHGdrmyVmLOqDodjKLqCv6C3sowLoY1RQoR+xxqwjdEOlvf9Ao/zoUxFJZuNpcrhsg8Pmut
	j+N+Vs8bQmZgVzXeVVZ06V9sJhSDK8MsCWVKqgGZEp3NrGiPgBr5rmezOQCBR2LV6oNSfIL9sg3P0
	qk+JAWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXDg-000K7Y-Hi; Tue, 07 Mar 2023 13:19:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCd-000JeO-4t
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso10425577wmb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgHM2XdtmrQGUQcf2y9Ae/95OQamjNw4mHl55O/fJak=;
        b=XN/2OsrnkkeksWU3cnhMEiDIAgmOuq3mjQYtYY7XBT4xmF7VZPvdPOqowj4SoFjoM8
         TDyKOoK5y+a0Ghno+NPGs/oTIWlUl5m02sApxEWboen7z59LloJ+87xvEgnvK1Wh02t2
         ROUKr1vCWDHWhGuEkddUE2iFDGh9qiB+rG1CXvjJN8pqqwleH7eyp1ctkr3DwqUjyvyY
         wzedgkyOQzqrMfc0LbtsB2A4NFLM7kO73lxOmhBB9kT+EeAamgxYIYDw18LFKwan+Quo
         r9/WeH7XG+fPXWkzMJElLatZ9tZ//esMp6NbJSLGe5KcJXLVoEy+SLjm+4VnWnU73jYR
         nZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgHM2XdtmrQGUQcf2y9Ae/95OQamjNw4mHl55O/fJak=;
        b=of+QCyou3Zv3HlEwNes5eyIB5If3IQ5PFPkg0Kh3V970vBnjOCnJEIZxbEWqEt4sZN
         YNREoUn4FfWy52QLEBJhSGAtUjmIAvV/ZgdSeqPmyFjcIGxQ5YErIRGSMfXbsb4osz0y
         sIC24gl7TUDxnF2C9YJldnQNBkRYpy62lOqmgcF7EP2PaJ9Q1vN/YsvPbVjMaaubi28x
         NB8m4+aBuzEOu9Fxydd8CJ7+q6MHmOkqqQDhzjNFZTqX0udSpoJ7hSZEhWoBmNo9vAZd
         sy7TW3hN08QVNVrIPgnrqA6gVRMxfkVU96SJepz7AJqa61J7sNvXUqlCRjMMV9idDkrU
         zQTA==
X-Gm-Message-State: AO0yUKUT0YoukeNH5m0m1fFDITX9o4dpgzd0GAjyEhWicCnxYwiGHlDG
	bnhLsFq9uY6Q3psVewliwOiBCw==
X-Google-Smtp-Source: AK7set8kCeRlJpT1Oy3DDNkzxDlPoDxy2rzFT3AyKtHg7ZPPQ57GIxfu0fjkVxULwuISGGw/gq5+lA==
X-Received: by 2002:a7b:c8d9:0:b0:3eb:2067:1141 with SMTP id f25-20020a7bc8d9000000b003eb20671141mr12899311wml.38.1678195079730;
        Tue, 07 Mar 2023 05:17:59 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:17:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:30 +0100
Subject: [PATCH v2 01/18] dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-1-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=2cM7AWg3td7QUM6zP9EeR6IUsiE88IPmYNlqpfnVk8Y=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEHRdjug5o6mEAy+2TtOid+xDJkgTiZ4Stxe+T
 rkNpPHSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURZISEA
 CUS3kq01V+uWGRw/xKEwrlEFROmuwn3EV11yPwfzptbDvjlhiZxV6mYK8DVwSmmXgfZM4bTewp4AyQ
 yCHLRAfUsSB7poFYQqLUByN5HX4LBHJXUo2EuzCMj7FHKbrpuqqkHvzT2lS3X7wJyvZr7Toeuzx9nn
 xYfaaaJL2cu34M/9T1j/ta56xiGUkmnr4ORuzr9jtcxCm0CZOR1PAeN4IZMhuJNZKGYHUMElotUGYq
 vt6VtYmcPzHkdO3K6xWLD8Jj8rjS86OkA+XTLB+2/lmPO+kqoFNCZGSjdx84qxze8n33961rem9Bqa
 czxKQvBgR8i/3klr6QGmIi8Hgo6drD6bsvQ3x+MpHI4cIXn+Ffjezba9El2cfxBD6obqMhu4oB4MBZ
 4CXbeuwKhp7AuWG+0UxE8aU3lpA0TF4PZvH0q0vuzaH7mKt1HsOqpAkNQiI//78qYDL5Ue6hoAASpy
 9kkLXfNsLn4vbIcnQcVW0zj7OFpeDBylEIJTQ+/nQm4aLsVW57wcLP/KdaOYfCImo5E5MTMylneRLJ
 ma1OBZsOsfKklmexu8oIdweNXi1IREMa7lbcSrBCJ/ZMKvxF0HDA49lpKyDJO0XaWXFPxh7O0hMGvq
 G2BkHSABQWdEBowNOhHFECRcz8ANGcHcTHOTbY+Ttr6//I/vIfavc1faKWew==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051803_223059_3EE8AFD9 
X-CRM114-Status: UNSURE (   8.71  )
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

Add binding description for mediatek,mt8365-wdt

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 55b34461df1b..66cacea8e47f 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
 

-- 
b4 0.10.1

