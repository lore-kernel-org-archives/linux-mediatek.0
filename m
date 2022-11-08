Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C4C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=; b=Ipg5hzBGhbH9IBcYUNk9rZv8X7
	QH5J6exB26CmjeAXtnFznPIifTEYIL0RwjaNKzKpWWwLnBGtNZqyjdnzUMhNxJGfvICJp1g1cuq7N
	ntE7TPgYGmt/mXnTEgLiacTf/+FoMe7TzJkD3iJle+NkOCqjdrmhlpAo+WV1R8w5hQqx/OT8nAMDg
	sjsrCdRfKs/y7OVQhQEE9SD0/Uw7JTbDccSAYoiqKBRQ/kzifwxKK7aX0Yw2AneE/hBd6ltw66pee
	ZBJDY/L7a9zt96M86Voo0gBHEHecMFPpZI66Pod5ajbWrKtMXiAd8E0BrtsAntYzucwsUPqETVUC1
	JqcXUlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTaG-007a1Z-Pg; Tue, 08 Nov 2022 18:44:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa8-007ZsF-6U
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id z14so22431612wrn.7
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=;
        b=biv33dAVK0U5i5MEa6CkrodxDxu6a0R66D7XCMVyBy+AC2hO4Z/3FFV36HoASetlDy
         pxcnYqcwwNkpTo+UAzKkhQa3Nof7BbYTR9fT2A2KLzNxA03r3UCGauI8r/fPhj7CZKGP
         D3TZVM02YmTe9JiNbklo3UmcwzfYWmI32gMUbuiohUiL27fYamBwcFfBievvKJYUqqiN
         Zc2Bsq3qZCjmNZTwzdtm4dF1WfvICr2wE/iTY4VkUbmXI9fewuY3O7N+3X/i7eLcSNy8
         vXthvoPeyyVAYgFBzLTI6Dx9Y2UP7P7Nnkiw8zEw/mJelbjCS3EEIefDyL9KNkqaajX+
         YETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=;
        b=aYr/JveQQQuThaaA6q6OkxM76Ar9aQkgb/PwooWMvACJjrlxDNZxRlJaWGL35JJPmh
         yuzXcARDTnQ5VGgF6qlOd3ipyhDS7AM5945iRSpNB1HJ5tUb4JLdlGn2PT28NieuxeYL
         IzNCrecQ/swBKgHtieQ17k8dQaHFZV4M6rj4qLq884kguoTVRFgpwgJFoRVv8a7Bewrs
         Y40oh/p068JwSemJ9a7jCBA+Xo+OXB+ln1AiFJKliM4YlcVIKMY65XEqy+2gf3QQQC4n
         BPe8yPip/RrAIyd3kIvEiRwVHi9+zWbJnHEuET2/sOk6nfZtDEteycmhwYHUc6zkHB5V
         e/XQ==
X-Gm-Message-State: ACrzQf07y62/j/5Y9tZizBEMGreD9d4dx9huf6UBPf4wWAVDpWBxfaEM
	U42OEOqNlVU0NLRzXGRxgs5usg==
X-Google-Smtp-Source: AMsMyM6IXfeEQpvmpO23cacYwl39le9IUzWdtAfJe6RH1eNBhFjuncvHaTiUSkUY8dJEkteYMwXRdw==
X-Received: by 2002:a5d:5711:0:b0:236:598d:83ed with SMTP id a17-20020a5d5711000000b00236598d83edmr38047119wrv.190.1667933058935;
        Tue, 08 Nov 2022 10:44:18 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:41 +0100
Subject: [PATCH v4 6/9] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-6-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=c7wPKy75bT8ebg54aEIMfSMAkZtNftilP/SW804aUPE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6jeuBbx1egeCFBr+5jX9bet3A4Pwleqhx62Kq
 W/Ijc4GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURf3LEA
 CF1Xpb/hnOAfCPOPFX4/cEosoj8b+gWVDOXucqf5mES7uM7fB/63fjBR64lOwygfpfgtD8mQVJZajm
 4RmqRjRtQDXMLCV9vdTAc9WXJuMkgmy0VSFbCccqD1ATI4Fx1Wj48QHPoHL0HMjvUKe11ZQGMVi94g
 Au8t43WCgXn1kfSFPHZZF4vfevlovrT7DrAe8ySWJ8LRFc4KM3l6oB2+JFJzVQzip01X0mYaqIhSDN
 I+ZRUVKLKpriTI/IHkHySXgupWVds7RJnHYDKanWCDuS8zHGg/mNsqll3vnikVMl6+RfYtNabJOx4g
 FuTjd8+YdnDQwgLwGuPc+H6O34JCcjw1OA/DWu3u0j3mM9YUAaair3dPPISfqANCoAgAhSV0enbswd
 yvBSqmU/3PI2ybS9DAGQdKbkBPIq/qlbIqVNvtBnu3t32kvkYg8jVuYSgTLipUMTkmFzQ4bnNeA2pa
 vAs83nMOD1ppd5VVy3SKFkHAVZybS0TcjftKjFxNKlX5Hzp+PLZjOjRXmZQ6g6xHvmjJ7De3u90Kh6
 iHHokLSky59s3h6UGCyvospzR+BtUN4jOvbi/50qtCvv8L90FrBrc9EMxmU0bWmwxrA1RJ8dtaCHNn
 xU45lFbJdLN2m/z2bcgC0imzHEbkPA853MdanRw8fT2NPnLXopYqhb9XIsZg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104420_256582_AA1D2C21 
X-CRM114-Status: GOOD (  11.86  )
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

- Change the node name from "mt6358" to "pmic" to be consistent
with mediatek,pwrap.yaml documentation.

- Change the node name from "mt6358rtc" to "rtc" to be consistent
with mediatek,mt6397-rtc.yaml documentation.

- Change the node name from "mt6358keys" to "keys" to be consistent
with mediatek,pmic-keys.yaml documentation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1

