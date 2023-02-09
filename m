Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16670C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8K5BTAdm/41pw2lI++GgH00C0SE0jCet8VtGW2Mqre8=; b=hqeumFgkFVCjQcqLQGW1aBBjM3
	P1WHe4+TwCXGaKZXo724EpnMRvFN/u1UQwi4zftVFMYfLzofU4SZqFAgvrixroiyrI8ckVlm/jcP8
	V11YwT7zvJYPziWNbTOrkvOxMZd7O8rqBnNVLQcEjnAZxmsPU/f3bHXnzjt0fg+sr/7b2HQggp0lH
	Jmq71SiiSUWuvGc5N49zBCAbuNJGoWsuOqWpcPxP+kIp+yxkUG3tgElL+a13MKxeUfp308g0YqfiN
	O23F6z5QDIUWBlnXS8bqIHxL69Ce5Sexah78/qjZ4RhJk9Mb/z1tBhfU6/U1e5k6aZi5jHu5Duo9r
	vGlsIlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5bX-001QNH-HO; Thu, 09 Feb 2023 12:00:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4bV-00162j-C4
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 10:56:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1205927wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 02:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K5BTAdm/41pw2lI++GgH00C0SE0jCet8VtGW2Mqre8=;
        b=Zef6VMLJZcfIVwCEekVCGv46hyyCGghuKPKSuvfPuQIezDx0/rQw54pw8u2yiN+WYp
         TTf1AUz/4bTwe8hSJwa8Ima0TJ5CCAMKpQhfOyM48yqlU2u++7JCly8TWrbhbyYy+4kB
         bzftMcStydIOzoGjZu+WwOpzU3PgoUXfa7A8jbqqBZTyMqyDxQSfLn5FRNdbphnaGTQG
         zd82cxmc8KGuzaYxru54ywSbpldfm56Jc9bsRYSFG8CZcIq9MdJldOc5riEqVF0rlZU7
         cwdPkYA3myNUisWVWPJW1AUcZONHlBxuBG6VDYAnyEmyZkUKXtyV9iiILoT4V68NankR
         9hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8K5BTAdm/41pw2lI++GgH00C0SE0jCet8VtGW2Mqre8=;
        b=ZlHC7A1C7/1DCznoZBmcyzitqWSLhpi8CiqVeGNThllclhxEMMtt3CV1AqrBvTXx73
         n1p4YzT3B/kv3YcLDFdiAF9TT6SMI+Tbahm773QgLMDBZmgFxjlnwly1eFrtPv/daZ84
         qqzr3pdwk3khfyCjzlmcFRMTsvvfKVcMQcmTPbHhQvQWGSTD9WLGkw0rRleD6KbNOhfa
         5yeAnbRUNWv/y2EMoJ6LWiC896XpuXQNcK1JLpXzKYu3UsiLq9yfY3XJMqzuYdfuTXRY
         RLma8B9upyhB28Q5eb0dFplJPWblLd3ldskvI91cuPOCZlbT8BkC+ftuCG8Cl2FzpZ8P
         pTUQ==
X-Gm-Message-State: AO0yUKW0MxHrPHh5clJ1PE+FTPcY4Lw2bGKKwK7+qHL9dE5x2c69H5UL
	sw1IU+M4M3PANCZ+0w8rjLn8Kg==
X-Google-Smtp-Source: AK7set8J2kRY8jrOhNBF+a/ygnyy2766CJqX11hnvdRms+/MtEyECj/QlPAhN6+Rqaf0oo8W9j5OmQ==
X-Received: by 2002:a05:600c:3198:b0:3e1:12d1:fde0 with SMTP id s24-20020a05600c319800b003e112d1fde0mr2357401wmp.6.1675940195567;
        Thu, 09 Feb 2023 02:56:35 -0800 (PST)
Received: from t480-bl003.. (185.173.185.81.rev.sfr.net. [81.185.173.185])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm9140466wms.1.2023.02.09.02.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:56:35 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v14 3/6] arm64: dts: mt8195: Add efuse node to mt8195
Date: Thu,  9 Feb 2023 11:56:25 +0100
Message-Id: <20230209105628.50294-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209105628.50294-1-bchihi@baylibre.com>
References: <20230209105628.50294-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_025637_632481_2AFC854F 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add efuse node.
This will be required by the thermal driver to get the calibration data.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230124131717.128660-4-bchihi@baylibre.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c486..09df105f4606d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
 			dp_calibration: dp-data@1ac {
 				reg = <0x1ac 0x10>;
 			};
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


