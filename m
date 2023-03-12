Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC07C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=; b=g4efoYIGm7N+I02kxMRz2XJ1dw
	GcsF5lwkT0PjtFF6fpRTY6ICt/12tUrissC9VfBq2aYeEHuRi+VmtnB2JoJaBGwdnHfi57WVFdh4P
	vkLOXNTbi2iXjyYPE/Pdhj+FRvTiUs/cPR9DM54zUWUSu8KMIplSy4nTbSFFc4ij0cohxRxadeQBC
	L5WPFkD1Oa1hdca6GQo4mM6w8Tr9N+22rLvIvv4ZaG173e5mK0DteIJQo7SzP1YXFJWsNX0giY+uC
	0mhoNhje/Jg8JmuV/hyMj+763zgWiWSeuc+CBOCyJiJN4aN9Cn6U463ZbSAWLyG9R0CUvJbDDBrbd
	72BPdXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWe-002Iwe-3G; Sun, 12 Mar 2023 13:14:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLVx-002IMk-Ue
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s11so38490944edy.8
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=dufU2ZEVvJS9S3PuzmfWSiaKt/e7oKmEif/HcTwiDm1Y71Lj42dFTktHXvA2w4XjAm
         z6CgADU73/O+QVxdKfCgfzGdd8q4LJXRA1NAMkyp64omDj5lG0pyjwGLSEUy3YRLQw1F
         jbhPrxxPiruJ9AwZDeljYbj05SqYwHoEeRai4CpSh/z6WTebeg/5Vrjbf2NIr5CzrKuM
         9qiaMAOz27bLtb+MQWNr6IPfIJ9u+UOg7hONEIKoQXcti8nfWdHn2vaNqLwCT+mhFL13
         lxBRmxlvU7xnCcaMng+7C4zdz2s2yxnEIqvlx2C5sHF3menjlKTG6uQs3n0MQ+fjsU1a
         kNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=y9/GqKCMdX74nhWtL4vnE87yoaPfnMhE5gKG+SYw/ZQxeoJJBf5KqBVv2cxbq+sucs
         UPsSbk6aABzH/Abl+qqGK43yx16q9fNuGkTZl4+nHW9bUNppmo0wDhDEw+h3M+JnS1l+
         DTQAFfSIBOAAIh1+j1+1iVkB0ZZ0mRtEH4B3htesoXOLxvHuc99g99hhWjc7d/aL+79p
         DoZSf2CXFBdXZWjf7F7VejtSaLjs9+NpcQvOENRZdmQ+ZL0iY87lhyJmy/ZxodsXS3fl
         O47VJ40zgvvREvhvjiCztQWUwIY9fop67eXqf4nxcpAm9hsGBYFVYBRoOZWZSXwM7lds
         Pm1A==
X-Gm-Message-State: AO0yUKVogXZ1dBBjrLwfBljCtZajOgRWET4noNuDWE1k2RZwQ1WMAOZ1
	nnUz8W0YCt+6FSsXHBeCzyBufQ==
X-Google-Smtp-Source: AK7set+ziiDk/Iecc5/4CJWrBGIg9OTBhTAoqLcBDI9ZAK6SPp7SnqnL3CHjfonNxYjxcPQIpQfdww==
X-Received: by 2002:a17:906:f6cc:b0:925:5705:b5b8 with SMTP id jo12-20020a170906f6cc00b009255705b5b8mr2100962ejb.58.1678626807629;
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/28] media: cec: meson: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:52 +0100
Message-Id: <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061330_029611_490785D1 
X-CRM114-Status: GOOD (  15.06  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/media/cec/platform/meson/ao-cec.c:711:34: error: ‘meson_ao_cec_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/platform/meson/ao-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 6b440f0635d9..223c092dbb6a 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -719,7 +719,7 @@ static struct platform_driver meson_ao_cec_driver = {
 	.remove  = meson_ao_cec_remove,
 	.driver  = {
 		.name = "meson-ao-cec",
-		.of_match_table = of_match_ptr(meson_ao_cec_of_match),
+		.of_match_table = meson_ao_cec_of_match,
 	},
 };
 
-- 
2.34.1


