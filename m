Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E19CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7peNiBqnjYABlP6c0plhTX1+3yLKyIplEk3Q7CFUV8=; b=iKOGer+ZU/8jdg
	41wxqSAE9CBL6o7/cE59MNbDljJ5g0h+RC6NUu5d5jN722c1XSJBoDQV1VwU1RSY37Y4UXjEPQpYL
	7WgUTTEuxV76JEgCjd2FS8FWXW+x/6ITmK/IDLyd+BoUA747EvRlYsqR/E0kH86TsBOIUylwL0/Yu
	5HZOjD45/udD2qmr+IMjcNb/KHxIFXdS4KupnRLBUlfz9jqwrpxt4HBUtFAR5F7pA6R8ehUq84v0F
	NWzUspiY1P8Llxj+v04o9Wy8h/GpxNJm9Whq8gnSAWISdzyhCdWfkJSaiDAIZO4l3L/Pi9s1L4sd6
	D2zZwTh4kY3Eq/RvEKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEFP-00AljM-R4; Wed, 04 May 2022 12:36:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBr-00Ajau-GW; Wed, 04 May 2022 12:33:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id z2so1018437ejj.3;
 Wed, 04 May 2022 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqWHfh4DenBhYZWygCRQbAilVjZPwr6A8uSbGQA4n4g=;
 b=EZzaLJio+J3mjbbdhdVzx9o+zyM0yUBmXhCHYMUe6sKGiZiRW+p2IPAa4xWiey50Yj
 CZA/rkUSAR3XnRJmilJxvBcro6ohrkcqM5V31qy35yeG1jUaNWkfH3OZEzB5aE22Fqvm
 qK0drlQdJC5dK0OpNtbGrjEnX+WD/M1fLvHKcgQ32xvorx4antbKnPiXByg/y2fZhJwg
 StOIjjopQ9QfPL0WfTtMkA/lnTHUSomeZcwtAvqr3gLaEWjwG/BRJQWAQEjCE4/V1kEm
 KmK5I/BRyRr0KEATiU6yNSY1N+AP74b1yWLPzlnzdEQ4WuvPb+IHNojcmh49oGarhL+F
 r6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqWHfh4DenBhYZWygCRQbAilVjZPwr6A8uSbGQA4n4g=;
 b=Nzd3Gp7KPfusIbcS/iyMKsmvZySG7xUxBARnVuof1D6dPik8InEMHzEq5A///6CQHd
 KvFeRjGGfnvENjpyC2184d24Zi7KTZ4YVcejVO5J4YxynEjcx0zlMZob+HUBM0jnq7c1
 IX6QSBk8qcR4tpjOIQwXyKgTRsL4D4xqbmk/rM7kLBLuMmImC/OWhNJ0z2PbWUrXONB7
 r2S9xbtdJFUTfMHVCNxVM+kYlEUaRUDeSNdZ4ZN2EO3yZFUYbRjczSKhjSCJQx1sFgi0
 B54s9eNpetmd8t5LIiVNPWcVTsfHWbykl2He+m5BKpgoToDbgnHW5A4RmL6+KWO4hQBr
 /E5A==
X-Gm-Message-State: AOAM5333KYFOK/d+yWze9Dcvc3tH80xVwMwy5vOv77C/QR2lIuoAYBPZ
 yAtCT8fgBf+XD76dgt5KbZ+70Q02raU=
X-Google-Smtp-Source: ABdhPJxbSCmy6aDiEsDO0UJSjgrOhwaYA7A0tZ1JNTIpOydZSEMbnGEGdNrmCdIAjrEcL2PW8p2vaQ==
X-Received: by 2002:a17:906:2ac9:b0:6ce:dc0f:9139 with SMTP id
 m9-20020a1709062ac900b006cedc0f9139mr19979129eje.206.1651667589400; 
 Wed, 04 May 2022 05:33:09 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:33:09 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/13] clk: mediatek: reset: Implement
 mtk_unregister_reset_controller() API
Date: Wed,  4 May 2022 16:26:00 +0400
Message-Id: <20220504122601.335495-12-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053311_606980_8A1FAC16 
X-CRM114-Status: GOOD (  11.29  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a function to unregister a reset controller previously
registered with mtk_register_reset_controller() or
mtk_register_reset_controller_set_clr(), and do the necessary cleanup.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/mediatek/clk-mtk.h | 2 ++
 drivers/clk/mediatek/reset.c   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 317905ec4a36..1a0462d9c20b 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -196,6 +196,8 @@ struct mtk_reset *mtk_register_reset_controller(struct device_node *np,
 struct mtk_reset *mtk_register_reset_controller_set_clr(struct device_node *np,
 	unsigned int num_regs, int regofs);
 
+void mtk_unregister_reset_controller(struct mtk_reset *data);
+
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index f853bc8a7092..7201e1f5e07b 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -141,4 +141,11 @@ struct mtk_reset *mtk_register_reset_controller_set_clr(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(mtk_register_reset_controller_set_clr);
 
+void mtk_unregister_reset_controller(struct mtk_reset *data)
+{
+	reset_controller_unregister(&data->rcdev);
+	kfree(data);
+}
+EXPORT_SYMBOL_GPL(mtk_unregister_reset_controller);
+
 MODULE_LICENSE("GPL");
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
