Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52859C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqAGsu6kz2S6d5SCKmvmZs5M2BTVRYIjfIVSTz6lRA0=; b=smvlCQDjaOMx5d
	46mKy4wBEqQLkbL4+jgGZhohHc6JZe1yF+wDyyYP5TJ5Lp8FSjuxnRWQlY7yxnsshxceXKyGT9FSE
	Npfat70z6C5qVw4Sad96uludWsz92i5b/Q8WbHp1U5tBjsRFR7vSAEM6OSL2Zeob9kjCy2EmZtgkS
	rj2EKGs1+CdjpUgXGbyeFDSjrd9b3ko1gqTzfvq59ckCNGqSa2sAd+eKmMWvNrECRrwS8ZaczJ5Je
	w183+Fq/BLpC4+YJMLmN0cW9bh8KIQjeA/zpQPt0/np+Ue95Q/zzvUDkRrMKwESNotM4yCX1+5ZHo
	od9crRa2iPY6hXZSAxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npX4X-00Gd7L-KV; Fri, 13 May 2022 15:19:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npX4C-00Gcsi-8F
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 15:18:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q23so11886573wra.1
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
 b=WbaTQ5aq4Bu4b0YVerwkrsUQ/6yQQDzdf9GHE7o+pCPX8Q9dXiQ6fGs03IGd8ehlpa
 4EVY0kMcqYzcn0+9w753EwsvopXpcsahI25DgLj9K4wEDRRTPNaAW1ZUYHB4pFdEs7Jh
 UVIl8fAA5Phne9mZdSot0U8dIVJ+0Zw8amcpbIPXZsCjJ2BaOe32Jo48dZLzUQdSofO5
 PpxtbI9D6eB+BhQxbsVoYb5dXyuVQ3m67ZUGdCeM6/ZFGRFlcEOi9jeQZYsz3GeGUYvj
 w7VVfb883s0T3tI/Cz5uVe3NmzpDlV2MnZMfWL0F50XN9f7Zr4QQ9tcYc+myg/Ez50qv
 RnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
 b=6G0Usb4e4clCyPF9SzVgWKq7p0XdS3h/V3UUVx4XDvz2+PdUw3qJIEgoFluaSEhiM8
 L9QiGcV5n/68Q+w5mtsU0SZoMiV+HIxKFjrH6TI3nRhjSNiCzJ5KornomVqkDluw+KCI
 O+cl9Y9VHGRnghk6ykacEgxPytzKLtwttQ1wynZesdPBUIAXzmfIDBZoHmUICnk393iN
 e1KsSCx/1TUPTAcsVhgnDX/2TitX6xQ4XWFuI0sk1+4gq2+ysFZOw3f7GjkHnO3kg02l
 zL1IsLkz4YX6q+oB9AHD4CalQR8hpKO7T5KDZPdCzwMj6mg58H6UwQl2/dQrwe0gk+LF
 DQgA==
X-Gm-Message-State: AOAM530VbSAGapSALrMitl5ehmyXYG03fR9FmJEVEt3tee0X9TcDLdM4
 KU+q+NwcGxjjJ8K2B1faa2H+2w==
X-Google-Smtp-Source: ABdhPJzGVx2mG3uLphYaJQBr5kbv6MOSDIoEbKda8p2pJEzCBY0bGQx4zlgJAp7c21wm1FvRWpZkKA==
X-Received: by 2002:a5d:4f8b:0:b0:20c:6970:fb3c with SMTP id
 d11-20020a5d4f8b000000b0020c6970fb3cmr4449912wru.554.1652455132391; 
 Fri, 13 May 2022 08:18:52 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2800825wrh.99.2022.05.13.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:18:52 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH 2/2] Input: mt6779-keypad - implement row/column
 selection
Date: Fri, 13 May 2022 17:18:45 +0200
Message-Id: <20220513151845.2802795-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_081856_356098_D5ECE376 
X-CRM114-Status: GOOD (  11.59  )
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

The MediaTek keypad has a total of 6 input rows and 6 input columns.
By default, rows/columns 0-2 are enabled.

This is controlled by the KP_SEL register:
- bits[9:4]   control row selection
- bits[15:10] control column selection

Each bit enables the corresponding row/column number (e.g KP_SEL[4]
enables ROW0)

Depending on how the keypad is wired, this may result in wrong readings
of the keypad state.

Program the KP_SEL register to limit the key detection to n_rows,
n_cols we retrieve from the device tree.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 23360de20da5..653dfc619696 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	(MTK_KPD_SEL_COL >> (6 - (c)))
+#define MTK_KPD_SEL_ROWMASK(r)	(MTK_KPD_SEL_ROW >> (6 - (r)))
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -171,6 +176,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
+			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
+			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
+
 	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
