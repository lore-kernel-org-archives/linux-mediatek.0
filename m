Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CF7C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGzmq8QnAnILeJxkfq5XlHyhyuBWc/rv+PBpofcSXVw=; b=kzOKfqdSmke/lUEsTtcN++Rlfd
	ea/VdlzKHOL0Zq62vK+WIF38N0xQj5AaxgulOwTGekGv2QLE8Pxe+ECoCHrcwDReNaLGhs6Hu2cEj
	Tz0a1tp/sENbAguQH3CKCMqF5g/kr0bYlDbr9Low4+7pkD1ubQWOG+1TZ9XkxcgD4271tksxWfrib
	kSO/yO/4OwwsonraAV46cgrVhfhl+oGVamKRN8pisY32OY5C85uABgnciJzXbrCXvmk6G3y8u5mQ4
	mSmdSR2vG2Ok+zDnpz/QVys6Y8hCz9dlXTvbYJks/bu/WxDWeAa3jjgHnzCRjD+eiek/0oiA8RWnh
	KKUgfHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSb2-00000002ZNE-0xS8;
	Thu, 18 Apr 2024 14:18:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa7-00000002Yol-0MIi
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oGzmq8QnAnILeJxkfq5XlHyhyuBWc/rv+PBpofcSXVw=; b=HN7R4rlYs4FCLHJYxkAerXv6CE
	M5QWhc6lZ8rGdbvm6/zgqWlOtjMF+gg4z7WuKJvlRI9UBs6kbxof2jB8/CyC1l45Pxpae285Z0RdM
	wX2802RAcLPzr1nNGvwgycNCT3qNnZ9lMILPvJQmf9N1djH85I9ZRnuHwhh1sF+SdiB9EoGS/4LBW
	Uud7cQB1eCckBdxi/vKiaHJzZjitJooCn/QYYwJpgLhY+zgEdf1RdjdSs0qD0femLIl7nKfCsQbwQ
	GeUvUrYjaMGlqjGjrtnT60krVIJICJEwti/obASmBAb0IInLOlUf9bgQtlwQPXomud7OrLJ4NLULw
	lqyqcodA==;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZt-0000000C28W-3qfw
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:41 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418bbc690e1so7947995e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449848; x=1714054648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGzmq8QnAnILeJxkfq5XlHyhyuBWc/rv+PBpofcSXVw=;
        b=IF2cvUrLSz+0enMzHoK3A0vLU6vsC+zxf4t7qJqmMOG8s18oa7sO6aN7LD23gAi07L
         QU6PBqBetzXk9UKXbgVj0EhZ8+4GH+CMo4kyEiqTAUctlnLRzD65dC00pd9xIbqOAafd
         8jAgWHo8oEWVCibPpuN4oUVEZ1aXdGFk0eEy8zVLG9neQrLVuUQPjBfS+bXifySnIit5
         czpouJ8bP2jRPGIKM49ZOJmvprT1LuT+qIF92C4NmwJ6lDA6Wd/Rgwyl/6KGLn4sjo5c
         Vg1B6ZTkSFWW16Sa+JnJESB0IMtTqHehmKtLLfLHdd8R8Bm3H1ZderbbC8WLa4kmwjtK
         nnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449848; x=1714054648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGzmq8QnAnILeJxkfq5XlHyhyuBWc/rv+PBpofcSXVw=;
        b=k9g/2TxT5vupIXXE9SRsUf4XTURFEJh4Sdul7rI9NnXyO0ql0Wr3ChpdtIiyYfIeV2
         zHlzBuKMELm8ntpl/p5rbrV033jY+LcUBNa3Zw/BXZAWZFPQWawK35iD/8Q4Z+fZv3jJ
         fm3Nz04l6QzDHv4Iup1/ZEVXrGwMoGnQlZFcFLtsPD2xjBkblCxfx2OsYCTYwGl6cPYV
         5l5daFqJoZDsZKCqvMo9qqpoNvQGp8xCnAQBRe60udyJDdRLSKyNdsvLtetYZcr1mc3/
         3bBjNKN16KFw0Dbq1FMd8YaFQSAVJC2NWpJk6QUu55rfes8ngs2beVUzX9x1rvwKlyEc
         XXLw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+vew9sOQNnCBUH5jvmpVOKuM78feZ/QdhA6bXxBmWfEpTST1n65IKJLFihRc7NDpuJ1adhVQvGdsqBO/ukU4wNhELlLL4W4vDlpfKWEOIJSE
X-Gm-Message-State: AOJu0YxYz45nl5UjuoLqsmDeFgAohHbU3/Iw01o6j5wp/WMVQvYeqgFI
	R38+TyzQdEj2r0DEUADTylMXvzLN+eAvPrM1tU9yXwvBWGz14W94ag6fMIsvgFQ=
X-Google-Smtp-Source: AGHT+IH7KCEY/+ul2khGMzI5unaRDPYns3Jufon1f5mBA1gxs8y+0LQ2wo1qRc6yrxJLUkRxT6qr2g==
X-Received: by 2002:a05:600c:5106:b0:418:58ac:7477 with SMTP id o6-20020a05600c510600b0041858ac7477mr2195309wms.30.1713449847851;
        Thu, 18 Apr 2024 07:17:27 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:27 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:59 +0200
Subject: [PATCH v3 11/17] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231023-display-support-v3-11-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xfN+lyYPuhvRvUCTQ8fIHMVrlQBTO9USYU3uQp876/k=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjTCXO/kUbOBJES8/4FPPfBPtu5tsAadASQJ5Q
 ma48FsSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURcnRD/
 9fuVuGB/ZNl/NDOctvn/uK8rqOLuzMTsxWThurH5KOOR3wLElRmnLPlCZJoOY8hPH8ky9VCDmvOeie
 Ov4vV4n3KpWluEDpvlytyGy0011ck6nSh1qurg1gM/r07AzRPwTtb5QPI4lzAsI0xu2K6KVhIq0XOO
 olXckfxw3cZE4UGxhRW4GVhnzk0r8DACbnzzUbZiKq2UIjRv7ClEhSEJrA0e+NEL++VgYh93BWo1w8
 kYNsqiKsJA1ISRgkFbnV/Vt7w35U7dDd2Qi1vzSb7ua3SzoDFJdcFPVmXX8K5r32wWoPtCLLv9CGA0
 ZrwAZrQ9q7zcUCuuRhtRB2v8MEligo9yK68lNYH4Bm5x5A+cm54SYPCzRoPBvHcDI6CGYoItoHDROT
 sXb5KSDBSTU9f7THTcdrwWpKjGo3XdWIWe9P769nRoqdMfs72hwNnODLryn4k3sUT6WokdzLv4GNVJ
 rtHB6TLkYhnBk7yVZEcjZhdcF5SWiboLtdAzwbN08A8RT/ITXSyJUvgh8MMB6lCmGRdNL6f6UkveAH
 e5TS2MIPoNyayjfZXq0sq3HdX3jwNakd65BKkKwFs7U9VX41sABjcRKWr+gNedlDD6hDXJSKo6Rgyy
 RbkGMV1CVMQyqFyYPmby/z4U4TxeSVSxS7q4issBY3actLHYQ599rGIehXpg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151730_168716_9D3B42A5 
X-CRM114-Status: UNSURE (   9.59  )
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

Add a compatible string for MediaTek Genio 350 MT8365's display PWM
block: this is the same as MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index f8988af05287..180dd8366935 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
2.25.1


