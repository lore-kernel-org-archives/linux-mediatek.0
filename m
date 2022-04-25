Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2805C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lyWzApTWwqKkcyefS27YvH2Ths3YP9+OOzpB7B7t3Ak=; b=QEHDuHyhree2Ax
	N5VKieLma2VkHLTZxMmJnuYLUyxkgHBPLvq2GABiH2qLCJsGlOIwm9Fq5Klqc4dxF6rnPChhVxs8R
	zn2SOwMN4CsGQwTDdEUSW4LAjkrqZF4s9ahBq2VCtjukadZlMw/0AuATHj51Te94wZSVbhyafH/NO
	eFD02VSdp0vW/XXD/p+dpqFS4wY6jXD1/2nU8e7zEPZLQqNkU4QfZGYJJmgzDvtuQbAryutYrNhzl
	AE6RhqlE8bHV4lSMN65JfcpN0ErJ0NmL7dI95/C88EtDNR0uUDlOv7c0N+tEMBE0mkTz0psqj6Og1
	RYLiizbV58ORtJh8OLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizkY-009wm8-4o; Mon, 25 Apr 2022 14:31:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizkT-009wiy-TW
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 14:31:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id d5so5935943wrb.6
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
 b=QiN4139opvnc7CzgbwFybNYp1p3HrZRT5GCNAgla0IVM2Zrl5QTbNwNt7O6QWpiq5c
 q6aozGBMEuD/hUZ+T5epxetNThR1L4cIfvuoI13PXL/jFD9gZ+VWcNjBmz70A5PG2rci
 e2/svw3agvKn4K+x9FgPUk07rU0TEUq2zSZ13z1b6qtrofG2F8ncB1eGFCBfcKE/zv/q
 Qrur4q76PDloWwTneErY1Pd0sUCFQ0EwN+sg89GAJm8TpnbEI+PdLLmXj5xqKnHRAXK2
 2jfMMqmjoahdP2tEKgAy63jvuySR0jTe3oGPhe78+TIoNhxvnbDVkGUd+d9Ju9h3tkES
 8P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
 b=o8Kmik5Mc4wSfOz7snAWmV/6P5kr89rMp01x4p8Ey1Rgvhw+HCy+BvkjWmlwxHNW+/
 3t3rBEsBc9aDHI+jIMAKkbVoUTqC470OgNk0cEDHUhJwRrZQZPJDZA6ZXc6EwDoNjGtY
 7iimCcHv8IUp8SEkvaTezIy5qEqboaJ95esLubwKpWcIpFz3sKD89eQXGJmSuDAMPKVX
 +627fuymAxGFrrABcTpVXVRiabD7C8DO/pv/wcdh18B0JVXRudN3AHPVPMB2jhXsL8V7
 KHWqdve6TQlWSpD5ETmYC5WtMsVtsRwQWuDruyCXCz1eHr4bPyPtEG+Z8D3Spz/cQBR/
 xdNg==
X-Gm-Message-State: AOAM533+MAD6qEaOI8Vh/q3EpUYShxMEO6NCBdC+5R9XJ6EAMJ0BIzkw
 m+vY7dKUuUfwChEO7fB+Xszgww==
X-Google-Smtp-Source: ABdhPJwVJGTJ+1Rl6zqnCeUHjHWgEqFfE9hWxTo8PFA94FMtT7qnou41+6gxfsBIHbspyhCxwJpuxg==
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id
 j5-20020a5d4645000000b0020adb5d258fmr4355178wrs.135.1650897092310; 
 Mon, 25 Apr 2022 07:31:32 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d4ecd000000b00207b4c92594sm8679525wrv.59.2022.04.25.07.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:31:32 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] MAINTAINERS: input: add mattijs for mt6779-keypad
Date: Mon, 25 Apr 2022 16:31:25 +0200
Message-Id: <20220425143125.163799-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_073134_005283_0E4A407B 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As stated in [1]:
Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Add a dedicated maintainer entry as well for the driver to make sure
that I can help with patch reviews.

[1] https://lore.kernel.org/r/20220421140255.2781505-1-mkorpershoek@baylibre.com
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5936f2d9d8ed..d092414ae7be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12139,6 +12139,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
 F:	drivers/media/platform/mtk-jpeg/
 
+MEDIATEK KEYPAD DRIVER
+M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+F:	drivers/input/keyboard/mt6779-keypad.c
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
