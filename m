Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4jlp8HIWV0/SRrpgeD2QZ+LASZjXbcoqy54oDuJlGI=; b=hhA8TsK/ntrb4U5fMJVen8S9tF
	3hnIL056/c/XvDJqGL31eIN6iDRH4yt2TkIwzD3gbGeOzJnQt/nOY90476IM43FiBA9oivnXFzp3W
	WdzswFUUob6ikyQAADBsUjW13Y8xGgDXc1gVwMFK98+oUrejmLPe2zwQgLrvKo/mKvf54mAWZVdus
	Tn6Jd6wt9B2H2qHDswuKrku92peDyHvkyLkC1ygt9BrbdVAIkHPFMU7drydpEb4CyxwShGUlvRW1Z
	H81pzctMp4xyJhUMxVm2Mx3AhyfzMXghjuFDwQs4eIOcOFS+kOXqNvuLKzILDEcmHGPWKuo/s/fdw
	Oquet0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK8M-00H9jc-A1; Tue, 26 Jul 2022 12:57:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK70-00H8d0-Qd
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r1-20020a05600c35c100b003a326685e7cso792292wmq.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=l4jlp8HIWV0/SRrpgeD2QZ+LASZjXbcoqy54oDuJlGI=;
        b=NADnXKatNswe0C+IvCk4tc03ZUzTZpk3sn84+xoWFiXrPT7GWye0NSZqFr6/NdWSMl
         9/wwttzMyxUIRsDBbIdZOICfo12+KUVdTwlxduE0LVIfJEwHRpjrP+BQvWIwD92wltrf
         Z4JeojrM6kR0yRjW8ttUZB/sxfUIk7INP2z2HcsbEotWV+FhQuM+6LyvEhnxFGpljCbR
         NhKwNEpYDi2Cb9wOTklQu+nhfHDsfKGzzZ5mOy6hKjHIiiqKP/4uRpuHa1sfZUTiMfgs
         dhjvKJ2JvtAya2HRtktEp9b/RfFy9SPjNLaezvbyVO7g3ruZvijW7iUTKtjNG/cwLDXJ
         f67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=l4jlp8HIWV0/SRrpgeD2QZ+LASZjXbcoqy54oDuJlGI=;
        b=sUJWZw+3tmC5SjiDd0tCT8A9BvW6QHNlwpT7LRckEwt8lr3w8/WUeatzDhmS7VoMSg
         We797rhGsle6oNNM2piNsSnWGsnbWg/4GpAlzLKimAHxLLpp9dfYFa54TC8tuuBpVcSk
         I+ztnV9fCnMWFl+l1zbwzRX30ajJt2kF0jkg0tDGLTMsIkHZCV23d80Oei6j231g+qfm
         kN+n4QW2s84mM22NFFPKS03q3R+G9SYKPishn7Kl4cVDUEIh8UAYsW6kB1kEGg+7az++
         EVvkkd12wZdkvW7YgTe7UeGz2xc1Jcyh9XntbJ1Ptc0i0ETc3zIqlMCPQRoXSc5qlTsJ
         J43Q==
X-Gm-Message-State: AJIora/flIKUV2C2PoF0j4r6pAdmXY2octZeNbroXCstDMyzpIU/yWO8
	owbEcKZui4zEu76ZYkP14Rfoow==
X-Google-Smtp-Source: AGRyM1tJyMC7Q+SkCcyxEXUMIyPM4vmZWiT2BfgqRy3V7c+2kZ2ogfDtq4Kq/q1vb7+t2z0rbSWCXQ==
X-Received: by 2002:a05:600c:1e27:b0:3a3:26dd:5757 with SMTP id ay39-20020a05600c1e2700b003a326dd5757mr3180782wmb.45.1658840192552;
        Tue, 26 Jul 2022 05:56:32 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:32 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:09 +0200
Subject: [PATCH v2 4/7] Input: mt6779-keypad - prepare double keys support with
 calc_row_col
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-4-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055634_927164_6DC83E88 
X-CRM114-Status: GOOD (  10.09  )
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

The MediaTek keypad can operate in two modes: single key or double key.
The driver only supports single key mode. In double key mode, the
row/column calculation based on the key is different.

Add a calc_row_col function pointer which will be different based on
single/double key mode.

No functional change.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index bf447bf598fb..39c931974bde 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -31,6 +31,7 @@ struct mt6779_keypad {
 	struct clk *clk;
 	u32 n_rows;
 	u32 n_cols;
+	void (*calc_row_col)(unsigned int key, unsigned int *row, unsigned int *col);
 	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
 };
 
@@ -67,8 +68,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 			continue;
 
 		key = bit_nr / 32 * 16 + bit_nr % 32;
-		row = key / 9;
-		col = key % 9;
+		keypad->calc_row_col(key, &row, &col);
 
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
@@ -94,6 +94,14 @@ static void mt6779_keypad_clk_disable(void *data)
 	clk_disable_unprepare(data);
 }
 
+static void mt6779_keypad_calc_row_col_single(unsigned int key,
+					      unsigned int *row,
+					      unsigned int *col)
+{
+	*row = key / 9;
+	*col = key % 9;
+}
+
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
@@ -148,6 +156,8 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	keypad->calc_row_col = mt6779_keypad_calc_row_col_single;
+
 	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
 
 	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",

-- 
b4 0.10.0-dev-78725

