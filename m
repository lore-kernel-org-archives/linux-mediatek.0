Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DEDC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=; b=VudT4rhZ6JzrusALiRK5xQRlJ7
	ojvyg9CksKeHquoGQyROFPOu7IkmPWLjmsC18qCwijCKj0s6QJL/pZdHsPZ5cPpMbwlF2BR8Z5VXJ
	b6VtSL77Bil79BNaXg+kqms+endjsYrAq2y3SVWX2/2j1OYqGc6IjKUEeqRgaPLAnVe2uDj1EciTt
	vR0HI2xjYvH9pO9zhZGfizebj13nHv0vng/sydL3tnvMa20qmfLiNtiQbWsp0ofL/faGiV6Mnp5N3
	0kks/U4nBOLxrPMJlsB9F2mskunTg8nSwtSslD0mmVblpCgck7QtGCsMPBoqXP6bvRam5mWHRRONq
	Qq6G7+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHcu-00AgnJ-QL; Thu, 09 Mar 2023 14:52:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWv-00Ae93-3p
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=; b=ps9bI+ec0yvzURZlqta+usnxYS
	QDkKJ8A0BiFwXizVXIQyfoEkFbWB9wJfl4YMbIYUmQSxlUuAJDA3568K/9N5quaaSM+934j6s7zRo
	8ZelUwp+WpICb6+JmxwUezAV4MO01LkZrae8EcHs3+gppcdXT7ZXMqCJx9kCSgJCcv9MvFfAdD61G
	biiIE/jA9/fanDK2CIefgBSiDD414yOFj4Vd+nnGwfsdOgxM+y6hFHmsQzI4BlR2lnVjy/MZFnF3U
	R5nz6v1PJ7SE9nGgEcQih5nbD8RaFKylXBk44MHjjb2iLIpY3H0+17b4Mo5ZJMhOiOPuUn8d4Wrb9
	YlrtV+BQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAm-0008Wc-2M
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so1358715wmq.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=;
        b=ndfvLtOXYALHaDJoXtdSp49ENX7vae8EKYXuZFkLtNANAPIAw34WH2YzswD/Nooya8
         3ebhfQvLhNLuXY991eVi0dufC1kR0NJQjyFafWcknNRvOk6qWvsjPYMTnnLUGOhnRPxp
         XBamqA2qJLM5tfm8kDGm/L3lZSPFFDoO0vSgdKDq0rpU9S7KIX/NQrw3scveeaH0aocX
         PWrHMSaBct8mxhXYatGIDHQaJ87pKP31naX6KtwQWEONyI7U3fNqB5fivuL17n607fMD
         9NN187wt/KupgjKichvlHjv+ExNGdwvTXMVQfMAIt24lt1BRmC+LTst+jCBPSz1bFigX
         gtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=;
        b=x13jmQfPR0Vk5xEhA673TxRxgwV9cKBBcDNwkPELjsOcSEaQp8WUVjAJzsNdTNjMHF
         QhR9euTk4cxSoiNQ1dC780Ejnxp+6BAzUWplllM3f9HWXU4mKtJ8Xr2GnFrLAnIAnv80
         rj+nm+uukuydnn9Wyal6zyOb2eUgSmoNonaDD5CALrKg5kIbWmAtzAaz3P9yPu92zIYw
         LGsKxJC4gqWG4JvooP1NoyrQ178MNtkdf9V3KffkjInwCWCatelRkNAMjRuZ4fUNa4Yw
         XPPZAg9j38GoRw+NbuSvAm9kG00/aCK+LBS5toIdqRn5ISrVPBoNa+lYxBm4R7cSVZ/O
         IcYA==
X-Gm-Message-State: AO0yUKXZyShMJNMpZAdnleuCeCN1o6F1yClet9ACUo2X2Da9idWd/TYT
	TwM0QBRakMysLlfEPE3MTkPTxw==
X-Google-Smtp-Source: AK7set+ZmmzWQ3/OgN4ZN4jVYsGr7tlWPXJoWbP47hxERR2B4SJlxzP0Kn/jCQ5T5s3oDQcnLlQkow==
X-Received: by 2002:a05:600c:470a:b0:3eb:2de9:8af1 with SMTP id v10-20020a05600c470a00b003eb2de98af1mr19799735wmo.32.1678371791471;
        Thu, 09 Mar 2023 06:23:11 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:11 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:02 +0100
Subject: [PATCH 13/21] dt-bindings: pwm: add binding for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-13-45cbc68e188b@baylibre.com>
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
 h=from:subject:message-id; bh=kwXNFyz1fOvgD/9TFtO82uJ5GaLXf7euau/EfzDL2xU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+imHhsQxqvhUMp6CB6RG/Z7QlHhbuEB4qhZ/W
 nCE1zsmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZnDD/
 9HyJuOJIaZ0hAG+nBq1j7h6AbNDdMcZdzmMsE49awO2lTEJkNp4T+infRuAwKaenvmQT9F6zDOxBu0
 o8RSBTjcQYdNMN7kVUuNL2o85Twc5+iWy0kqVR8UNgBpQmdMds6ecyW+Z5dc0R3J/ZAn4NcUN1j4eQ
 2vueV9asBfmi6YN1FMJ2BKItAMlzNIqG9mQhYxbazbBaBnBESu3Oz159/le0uwfk/0fx4XXtfngJd6
 vAySbbBaZnRVep2Ky115GP3RlNXblBeN+0RpA7vPaINCFIT/s6tvDrYHrhio43mPAoUDR+p+iQh8BY
 btjIAGQ9ot/n8GC7VFnPK4NRl8Fex+PisqrF35RsvAos46iLMGf6QR2M9edbehXHhJk3UzB0EbDX/r
 vNV6qLdoaTf6d4VQtVNIqHi866Abd71ICI8cQ6+TTvXde/InqVYIFZ3gCGacdqbfZg/YBvCTuYuh/7
 LXFlMrLKWCgWOeymxy8eNDpvJgVxcloszuk+mj+YpimxwXMEvfbP4+97FhZoh7G0MynbBQO0s2HeDS
 145C5YHOxv9Tq3ouPIoJ99UgRyTUvrmS3PtX/EFB7C399hmrZV3ucxamRojktLfRRUE6ZB6mJ8yoqi
 fuBJGEBkA6C9sDxeMsACrza/GY9JsEcYJs17H9A6KIBU7dD/VjFS97DnkmnA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142312_953151_80C8795C 
X-CRM114-Status: UNSURE (   8.81  )
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

Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 8a0005a8bf40..889d2b376212 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
b4 0.10.1

