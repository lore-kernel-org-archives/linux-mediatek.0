Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B2EA3F09
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=; b=g+nVV5rK8sduejwkIs1mYIpMuV
	X5r0FNobxelhbxiPSVmdMxtGV+wh4QTmbi7XuJAbv1DibR9xoyiOIaSgFY6YApmqGJ8xoBk8hxiM5
	cau7mnrUoInPQBRmvPFvh0FVgmVb4kAYy79fQcyXtcfyO9f0Is4m9G5c2omoSYPKrkM9b2PEUGTqq
	yyoQ/BKK70jV/xRlBW+PsKmDXRg0yWmKMqfB4WMs+lqYZ/zOhDUKFa3X2d4/uugu16Vrj7T022GHa
	DSvlYTYHIfDnpOngWLNc4yezXq7DheqL/Gov2LBjaQDOs9tXGUWf5WjkittAa+BD7UZ3e+rJOlWcZ
	aFj7zpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUo-0000000GUAm-2F0C;
	Tue, 10 Feb 2026 05:41:10 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUg-0000000GU3c-0s4P
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:03 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8c7199e7f79so529308285a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 21:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702061; x=1771306861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=Ui1xAAZjxQkD+dzr15Qz6s85gIQdJaJ+hbKPJsMd8C0U6vA/0Sfd56A6tqiQG9e9Dq
         oVwFtxK0TApNFu+hXbddrgrEqkaYY1CDeEpLhXnjVjHP7o0rZk0LWfNdhB7H89Ud7m5m
         g0G7LqW6YhhfbNYQn8dUCdF5PoVX797ZAiLzscpzipmbrDSoOW0AyHIXuH+cX0cTMjKg
         IgwTmrbhArc4j6nMJSjlnEAfUedSVx+ngZ3wTl3G/Zy8LuuRLqHvKY2W+nSrjHABOHkf
         GSGYJFMVK6NoMlxsYTVa7/lDN6WZqRchr0PFTX6mmU+G2Fuyf9/hX1nOvGurGXUlRpMR
         Clng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702061; x=1771306861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=BdzfD5jGvKQyydZCn9DpC6zORQSpDIBQFJKsK4DRdolu6to2pzhBnf8e5vYGMY00D5
         mLa7M7s6auEniNKSU7zT2gt26VbZhzP36Z1Ve8MQ2+MYhqnKsIiJlfVFGYBtsfY/850W
         CE9/LYGEG/mnIF0mmsZQEuNsOPv7vZ6+wEFHjoP5pqjpyztu5lyXg4lx9IwLJwCbZjvt
         Quw2HTeL1OJfEu9srjRsXuMrXlgVquhVWg3KP060zi1bdDda8t3bCsbFa7rGkCawaOaZ
         cHrlEFqp6ISIMa/X18r4iJk0IaU5sZHeKWQnb73dC/bEMbQkIifXPOUoQjMnTG0ikKh5
         pD1g==
X-Gm-Message-State: AOJu0Ywp6l+WcxhDywPjCtj8h0GQhgarazyNnUZRULvEzFuGEdBkS/gy
	TcFE2fZmPkMe35OHxLgXQgoXe8lnwz6cjCJVTQGgjv67W5MlT1+T/fIb/q24pyDh
X-Gm-Gg: AZuq6aJ/b7SRmHugMYj4sRhdS7ZNz0DqA3n3V1Lx2mmA9zkP6xwm7FtqEb8erKt8g4N
	ZxxJONsvAm5G+XMHtMWwsFSqAD48/Ymu3CSvepelPLH9DZFaLIRMj2WGoWv3Z6OL80uoNHrRKcf
	6zGTGIqeWOVXaCbfrHxRBpx6l9AtxU7pb2YbNSXldaK6fpqY1XyHORKC8w0w4KZMc+5KXjeKdlO
	3OAP3SkniDRGXYv5pzcCwy0PKWZU4xAjYOiL3qP++LujciCsPhIB+GFJOF5y0E4k59tGXc8VkDq
	6FQPpemkRpRDPCp1mjLh9cOeOxy/8nRp8Eaz66g7ybPmJY4cbZVK7c92JjCk3tyZTpge3BUu/Y6
	gI6VBdd0nJx1YW15IYX7LwwGIQQ7Ct4UjcO/OOt4L3r3OpjUivjCP4BABqr3KC3tMAChny9YLfL
	V3iCMDZGjrnSs8Kaiboxyh8G3BAexc5IThV87eLMf7F7KOBVdlyQAQsD6jGFW0jQo5egze0Gx6f
	borDQSsMsM+
X-Received: by 2002:a05:620a:4708:b0:8c7:1952:789f with SMTP id af79cd13be357-8caf16e9e9emr1736522885a.71.1770702060868;
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 5/5] drivers: clk: mediatek: Fix error finding regmap
Date: Mon,  9 Feb 2026 23:37:05 -0600
Message-ID: <20260210053708.17239-5-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214102_520074_DE747418 
X-CRM114-Status: GOOD (  13.98  )
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

The clock driver for clk-mt8196-vdisp-ao doesn't use the same common clk
functions that other clocks use.  As such, this clock returns an error:

  Cannot find regmap for /soc: -ENOMEM
  clk-mt8196-vdisp-ao 3e800000.syscon: probe with driver clk-mt8196-vdisp-ao failed with error -12

Fix this by using the common clock calls.  With this patch, the following
new clocks properly enumerate:

  mm_v_disp_vdisp_ao_config
  mm_v_disp_dpc
  mm_v_smi_sub_somm0

Fixes: d4fb7e15a520 ("clk: mediatek: Add MT8196 disp-ao clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
index fddb69d1c3eb..070c60f40b64 100644
--- a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
@@ -67,8 +67,8 @@ static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdisp_ao);
 
 static struct platform_driver clk_mt8196_vdisp_ao_drv = {
-	.probe = mtk_clk_pdev_probe,
-	.remove = mtk_clk_pdev_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-vdisp-ao",
 		.of_match_table = of_match_clk_mt8196_vdisp_ao,
-- 
2.51.0


