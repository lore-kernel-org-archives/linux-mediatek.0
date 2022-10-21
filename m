Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9363FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbWZD88Csa/gnzCp+HMy/jlXVSOibosOwLIHUydjLSM=; b=Or4Tnat6MIjmB4cJhRHI8ZUDxk
	KpeDcFsnGR8nvtZIYiLrRyE83DYWsF/TwOakf52sCJCQj4HNHc8JavxgUkHrcY2OIiK7xW3FNbdHT
	LW2s7fJfu4IGivSiROgE5YVEF/0X7cji/w9E+VSyZN0q4svmNTQTO+IfazXv+xg+ClEfIqAyJEVjc
	VM0HpjuvWvzMTevIja5IU4Ga3eFaxr6BBF2xRDUm5ATZjJaddw0KHRB96Twr6VmqJLG0C+1/TUAlv
	nxdwYCvfjMewG7pllTbS62/1jN0jlF4PBcu62AiXUunXmbyKNM+Hw9IlLjFrFAj/FyWw8xjmKZr61
	XhK1BCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnhE-006VOu-Dm; Fri, 21 Oct 2022 08:48:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnh9-006VL1-Nu
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 08:48:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id f11so3332961wrm.6
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbWZD88Csa/gnzCp+HMy/jlXVSOibosOwLIHUydjLSM=;
        b=SsKIYrb7OvBJOeb8oL4usYLyXghenrQID5yZvH3pX0XKPhJN1CG7V6x/U0nKj8osd7
         d808EvZBNDx/cY56qI+NXMpb+DZzaLrmrtRmbQ7SpR8d54YEQ5RgTmE4ra4VDJib2jam
         vwiVe8T34UXKId38I0e2iHZddayU5VEz8LCYizNDMlp6tnl/0+bNIdU7H0z0I6BUpV+B
         /ucURVgVWqJQXc+l9wJO1fW/vtVg3qM4neP415ndQIgao5xb30HpKN4zkISS9cUNDHFK
         cCOliYL9hfvCH0QOuEltYQVMAU4liP5W10nmN5U/k1E2c37GVmxup5pG0eXlYky1YvTU
         Yaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbWZD88Csa/gnzCp+HMy/jlXVSOibosOwLIHUydjLSM=;
        b=o9D7TbshnLaO6tApKZuXWLs2oTqeMOlFD1QFfprZgxiVvq3xgJvec5f7x4R8Bc0XCq
         R9qEdzpt9IZ/mDnQnljnkY3acDrTj1Xwcq/5HHcoLEys8er3PZa5WywdfHR3gVv3Ehes
         xsnwyA79ezzL3KTlSZfr/t/P1okFPmkBhIS+tjl2fyXqYyHnbscj2XB08uT+5PA4bLza
         iYZ68GrUmEygqQSSxnvkpEBsga/lDra6OdpELmUyLCE8qUtULh6HLl5xTM4lYMDWo44T
         oNij1hhRp6q5b9MN0LMILqn4jWR8jbLCXhB+6fAZZzJP0LH4Fbwy9y2NmONWDSXv3kcz
         CzMA==
X-Gm-Message-State: ACrzQf3YEcGj/oNBsryZ7kedWCl2BBNphaDNyOsRO3SvawR7QDBzrx9K
	Yh3F4UCFZUEb2G9n3KEy8w0ldQ==
X-Google-Smtp-Source: AMsMyM7uFs9IFzNVInzdSUYlLwCAHeX5bF4kkYp9ut4AlH8VXFPaQellUjaw5YdFzfU/trLsLMNTig==
X-Received: by 2002:a5d:4cc2:0:b0:22e:372d:9c9 with SMTP id c2-20020a5d4cc2000000b0022e372d09c9mr11435346wrt.576.1666342077651;
        Fri, 21 Oct 2022 01:47:57 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c0b4500b003c41144b3cfsm2040233wmr.20.2022.10.21.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:47:57 -0700 (PDT)
From: bchihi@baylibre.com
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [v2, 2/2] pinctrl: mediatek: mt8365: use mt8365_set_clr_mode() callback
Date: Fri, 21 Oct 2022 10:47:08 +0200
Message-Id: <20221021084708.1109986-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021084708.1109986-1-bchihi@baylibre.com>
References: <20221021084708.1109986-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014800_061386_1B3B6F4F 
X-CRM114-Status: GOOD (  10.48  )
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

On MT8365, the SET/CLR of the mode is broken and some pin modes won't
be set correctly.
Use the mt8365_set_clr_mode() callback to fix the issue.

Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index 57f37a294063..42b48136ab77 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -416,6 +416,23 @@ static const struct mtk_pin_ies_smt_set mt8365_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(144, 144, 0x480, 22),
 };
 
+static int mt8365_set_clr_mode(struct regmap *regmap,
+		unsigned int bit, unsigned int reg_pullen, unsigned int reg_pullsel,
+		bool enable, bool isup)
+{
+	int ret;
+
+	ret = regmap_update_bits(regmap, reg_pullen, BIT(bit), enable << bit);
+	if (ret)
+		return -EINVAL;
+
+	ret = regmap_update_bits(regmap, reg_pullsel, BIT(bit), isup << bit);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.pins = mtk_pins_mt8365,
 	.npins = ARRAY_SIZE(mtk_pins_mt8365),
@@ -431,6 +448,7 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.n_spec_pupd = ARRAY_SIZE(mt8365_spec_pupd),
 	.spec_pull_set = mtk_pctrl_spec_pull_set_samereg,
 	.spec_ies_smt_set = mtk_pconf_spec_set_ies_smt_range,
+	.mt8365_set_clr_mode = mt8365_set_clr_mode,
 	.dir_offset = 0x0140,
 	.dout_offset = 0x00A0,
 	.din_offset = 0x0000,
-- 
2.34.1


