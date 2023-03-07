Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5BDC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5bAB6WZAMlbkNgJ9w5uWn7DxLC3xwG+bewS6OKki3o=; b=hc5fRp5EbmUG/zaxBWI4Sj0iHP
	3s1hKiP3/LuCCgVgrCt8D8e+3BgHqNRHmkngmBfKxC7y5BwSvdHq2/9dcdLGBL+ZBLHzNRTvsP+2P
	+RblufzDgJGRcd53zU46j/z3ON2EwKVYJrjEtgwX9ZdKuyY76kFtw4yVft3dpdxASNsZt8Xz0tcK5
	PopK3uRnoXfiaW30R2IqOz+y263davQgEx/llusEiDDtfv9Iay6CiSIy/MpTumOeI9ri0noSksIk9
	0sB6jmuC1YSidpNFALRIrOdfU5G1ji5VedCRXfmMFbfrsQwOzVsk+jyY4ZeW+AU3wtmCkv89Euj77
	aSAQRWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXEY-000KX5-BP; Tue, 07 Mar 2023 13:20:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCe-000Jec-Nq
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j3so7751829wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5bAB6WZAMlbkNgJ9w5uWn7DxLC3xwG+bewS6OKki3o=;
        b=lnkdxqpC3o0yHqoR9tn0yLiEGQ2D9u6ajoNeX4QPgFvKGJSVmc0BAFczzL9DbDQ9Gj
         PVMNubwp8cGWjCuv20NlC6RuvVQkeUtM6wp+roIdSMfmQKVhs0GPg7JGTqxWCfPXXpWo
         7eXa6LAL9hoKkZhvVWZE8Pu3NYemAam4HmgwoPDUKz18aSr1g1CB33xk3s5/reQKB2Ri
         aDDO7qz5z8VnW1rnOIiPXue33QY4L0JAzqv576CkZAE5qOphplZoCFmVrHIxp6gmyhTI
         +Hdi4k45nNI+78asv8/j7neo1La0Aq9CRVR6wIR/w6A64hdwYIpHDjQ7brG4lnvTAlUO
         eMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5bAB6WZAMlbkNgJ9w5uWn7DxLC3xwG+bewS6OKki3o=;
        b=EtLUE8cxQD9cYdhkwHYFFE76Pmxltt0tR6sdHZ40TSqFI/zK+K4Q8IlveJb46vcQ7a
         RiZHEzt/iJte46WSOApX6+TguhQVEZmNseEG0ZVcAWGOI198b1aNUpmsemw9iS3UixX0
         yG827pC2xqS/+Bu1WskJkiOTnipksTQfyV5IFxdzTzxtWEPdaQMg+bN5nby44eH6T9Y8
         uWs4Ki+shGgnvVEAj/xuHLBYAKDT+7+knLVTerOcpIeS7+c5a/C0TlA6y3Q84EtlkMCD
         elqRaogpEVTVpWWdMFXTGFyhkeJMdThwWSBBxDa/5B5UBy8K9OEAJQ1ILcCX2BDwBxQJ
         onaQ==
X-Gm-Message-State: AO0yUKVfvyCR5S0uQAL4jm9TOKPiwsLWhV87ObwWuGZ8N40At3i0zvJS
	r9QEo9kt2O/6D9lSWwRLP6NwTQ==
X-Google-Smtp-Source: AK7set+OuRm56tiBcMKspPeS1VKCb8WPOKwstMJjPE3SVhUpuN798fjxg9qwLUakLAR6OBf89KZJYA==
X-Received: by 2002:a05:600c:a48:b0:3eb:3912:5ae9 with SMTP id c8-20020a05600c0a4800b003eb39125ae9mr12821750wmq.24.1678195080755;
        Tue, 07 Mar 2023 05:18:00 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:00 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:31 +0100
Subject: [PATCH v2 02/18] dt-bindings: mmc: mediatek,mtk-sd: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=H9oJWLPXIe/1UwqnlEW841JqyejoQrW44xorw6dIer8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmESovq51VXjKoQhP21uPq4SVFH/KuHY9gl3IT2
 bTTkYFOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURQHlEA
 CHYUVdIFnoGTSgxWa1LI9j/2byyACeEd5erkQFL9enSzSmNKJybY4xnLQ1/LnbaGLIC/2Df2Ehq/hP
 QPsKCdnJlygn6u0DXEz0CMVdk/tGdSskkKBorToRHwatkDJ4a4OrcPI9GemiGDsRvznDg5Oipmalq9
 V2/jhXCTtzv7vSeDqWzQLExKpUAOLJQTA0pS7+AK9mXltrwBmZhCA1OsNyNzs5vqFBDx5rE97iUz1h
 z15O2471YI50Nv8brsNFRh9p8Netw8G0Hhp3+8XYgq0KKxpwUwGEhPEi+Jd0hUvC6NBb9rryMEqib/
 rYvYSJzFnKC4W5Q4yqEipKh4TeBbTX6gsBjImk+us1kv5H8rmzB/iCAHuiSVJJR5Mlz0sZ4pkdmk6x
 g4zB5zBRhLCr4OoVxoO7KU84l5Jg8MtZs7d1Jh9QwaG6jj7uzHuhb9zMLuG4e8r16huTWjF0p5sCYX
 8uFwr4lXKyZtaMSPWDc91ExDQQUJ8OSOMumnzMiB5EMZ9P+iUsvV9MNsqwVBldE1cJmYEihcJutOMR
 uwuct6euJ1noFQJQOeYsm4Ppvbi9TTNKDfFbTzcMlihoI23EmaZ/3Ep5TChjm8rde3+5eGwXgxdydC
 pAlXaqorV0B1L7AyQTLkUldMhmX+49XV2AegFT5HgvWn5nz082w9ZzRNAguA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051804_805438_7FE396C6 
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

Add binding description for mediatek,mt8365-mmc

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 7a649ebc688c..46eefdd19a2c 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8188-mmc
               - mediatek,mt8192-mmc
               - mediatek,mt8195-mmc
+              - mediatek,mt8365-mmc
           - const: mediatek,mt8183-mmc
 
   reg:

-- 
b4 0.10.1

