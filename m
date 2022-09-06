Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966AEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=; b=z4OaofDZ9WhbD9yhwB+GDQxgLp
	7N41yogboMmJA21A5rwumkLG18Z3bjmzhweybgDg8/0dWPt7N4minnAi7MTszZ+B/IJQl3NLvyHvg
	PaiRnDiCZ2oQ1rSfuLprRPyDGNwxZJa3KbYlIwo3BR2JhNaMJdt19y20Docr1ClrkON6PmA77IE2B
	J8YiV3bloBfIiBpYNoa2TMqYCe6+EyIc03V1B01RXB2tALZbXhRPe1gmN0VZjcenypGn6gFlvmqGD
	mUXK2qO1vsCqW7dwrIGcZI3CGEZNx3ScVTOVadl3X1oPOUNeApdKIeX0vemXDGn9lsgHBl59Yi9pd
	U0Bx/Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU6V-00BLET-1c; Tue, 06 Sep 2022 08:38:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4j-00BJqH-8R; Tue, 06 Sep 2022 08:36:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id 73so10041998pga.1;
        Tue, 06 Sep 2022 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=;
        b=iMG0S4zofl/DfVRmN8zUOquTtKl6J8uMm50G+Ub1HZrWIY0EA+ivHPMlCqT2OrglC9
         D4tFhZfIq+6PQudEACeyJG9ewydxsZMq1gH2Cu/n/CFrV8Gixo1PTXTXsh9hdAchHSvR
         RBXMTwli/wkm765TGK16OG8+0re3CpYkDwul96NHyCLIh753F4iwInM1N/by6yrmI5YC
         ALDhRvtggX2RETZEBNJqOrdBhDUU9hMdWrltrODDT0Xhs8V2F8/0o8og5cbBdztNGtYH
         TZEpiUTQvu1WzlN5Yie6G+46wcuS8gQAa2fzCOMcyAkgcaucZ/SCV1jn7Ip0PE+Gy8rc
         dSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=;
        b=IYg01nNsVKGAegZoJDEIRU/XCRjNhQaFhDsYd31RiQM/+NAN8PQVuG7aWA69wIG4bY
         zmMieveWGdCAVskq5uebF9HLB9TWND0+6acl+ZB4IS4bKOSl4/5zUOP2Z0kBxTMczUx9
         6SDiuimgS0yE8rWTSikrh6Li1/V9mQY0Zq9cuKwlLwybGlv46bcrgQ74s/O4u32Zghec
         8tBW1Fs8f3dHt8YxxRocX2e/HEpKLcx3vavdHvIkWoXDcaHZJ7Eph3fCcPama8nDYaMR
         fXngGsKmtwJaCm8azfENTX/+zx2WzfCX+QiTnEMuj9tUVBwd5HBT7WYo1mc3tyxGMRWZ
         Zojg==
X-Gm-Message-State: ACgBeo3koeZmp8LKTxgvSwM9oE4cc2ItPc1ZoTnhpYSLcWCEjsUQrf4v
	YPh08ZvJzRDQntMsMTVY49o=
X-Google-Smtp-Source: AA6agR6YBXOXWI2PPAafdZxRc+Vmw5GkwSeGIJwkLd7ubrEomLInuRV12ZMwVC2kJ7ZkegqiyI/hzw==
X-Received: by 2002:a05:6a00:1691:b0:53b:3f2c:3257 with SMTP id k17-20020a056a00169100b0053b3f2c3257mr21270799pfc.21.1662453409662;
        Tue, 06 Sep 2022 01:36:49 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-80-193.emome-ip.hinet.net. [42.73.80.193])
        by smtp.gmail.com with ESMTPSA id w12-20020aa79a0c000000b005363bc65bafsm9474506pfj.57.2022.09.06.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:36:49 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com
Subject: [PATCH v10 4/8] lib: add linear range index macro
Date: Tue,  6 Sep 2022 16:34:00 +0800
Message-Id: <16d18d1b789f83dd6f6dcebcd28ac8a2b9ca01de.1662476695.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662476695.git.chiaen_wu@richtek.com>
References: <cover.1662476695.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013654_214407_4D7F7069 
X-CRM114-Status: UNSURE (   9.03  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 include/linux/linear_range.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b3..2e4f4c3 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,17 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
+#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
+	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.7.4


