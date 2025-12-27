Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81355E9270E
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Dec 2025 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kuPI2aNgLX/9o6inXHM98ejerk3xQ9ReMe7Mbvn14gY=; b=MF+Z2qRzaTN1ihLYUKWutijt4m
	AIvGTMBHtJjIULVZQaW9c8M7HR2gDleOf/3+UpUeJ2P8Yl9seA0iKBQgUlinR1hE0C9WKIBQS4l4U
	xEbL+hSknOicyVx3og5PBMFYmCg8/lieNH9jSJ1StQ9ezeZl7VjEW1Fl3fcK2xZyfZE5hdgQ/4mwU
	+djNPFkE+UQeTk8OtZGYP7iR7IBmNPd8lBULHtwpijU0tMLdNrx+B+iQhDHIkPwMU6aMYOMJOIitd
	yovJf0N5KHcy7NHK6Ge4s/Q/YjNarNTLkb7fQFTiKOBTlInuf9okSm50nPDS/enM1lp7SiTGuEHJF
	gGbqgubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTMm-00000001y5K-20Uq;
	Sat, 27 Dec 2025 12:25:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTMk-00000001y4n-0L7F
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Dec 2025 12:25:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so13360195e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Dec 2025 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766838348; x=1767443148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuPI2aNgLX/9o6inXHM98ejerk3xQ9ReMe7Mbvn14gY=;
        b=SnuYJOJKChjpZGgDgW6KjaBQJw7f5TclDlp1AnH1QV7xhv2cyLeUWNREa0JCJw2JVp
         l6QkRxIatADBmpFyyh9EZRGJ0UXQ5/HfcJ1i+CmtjvCY8ykSJ/tBRVTsm3mJNZl7iILW
         zHe8S3/m6jVWr7lAkMMaf2ugqpd0Xc6UxV1mV5xCSfzb/XG6mXXxDGfCABRb9yCyHX/6
         XhPCKJ3OnsLACF3NPj1C3ASOCJ7NuzsqPUUJh2BH+ASxLov2YvXD3kdjqCFWHgTcTzC3
         szGJxZcxl69FAziXLhIJtomTbeabBdEf0MG8Ivf+b2Wma0igkD/8QEEGwR2H0QAVP7f0
         aE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838348; x=1767443148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuPI2aNgLX/9o6inXHM98ejerk3xQ9ReMe7Mbvn14gY=;
        b=bNQ20A5zo6+7WRTX7On4YFL89O8f4LTFPHCZT29Q7S3LpXTMDFTZIlApdRO3tJOa+X
         mjYB11Uz0d64rxzdcjikgi4xO/Ey6XcLP5KGg6/Ta4N75Z3c7c6CE/0mU1J42gXIYU0C
         AqbqwBwev/p3aYACmK6WrL2VNKFghJhgXpPSfBegMmRDmDRx63tfIsKZfWDvd8XkCtaU
         rE9qMV1CLlsyRmlzbwkI+o9VyGJ9jC6twwPPSJ9kdotiEh+GMZ6geAd9KHJnw/aePkLO
         cBJSp7AHDlNkVowKSq7WGTRIHNYWumi7e+agVpiqzR0MTkoZSr8PFDH8JkxZfC0tIR3G
         TEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgnyRpahlJlkpKF0gZsvd6fVeg1Ur8nOXeNpr6qzMOwrebqfqM+fdHXqnyzaGdh4tnbNt/erxdp4Kziu4ifA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5L/va3p2W01+jD+Kjbny8jIa90J6GY+bJOaLSK9YSvR4yurNr
	DakWrA+wRWrR8M50l6ixKcGg7TiaHDmhjbiyLyATPOPmB5PJm05hylUk
X-Gm-Gg: AY/fxX6+WMFP51jhLPL7F2CqSjl2hzKjLHJzHXEYk7i3i7gTy1zZik+vaTf39YpDQLg
	27kNyOvsDHT7uciXllAymzsMY6AQbWodwp9nMk2vcJZ3RDi1FgeyH6n0HQYxPIIsLL9DvimKjrA
	6jw/bYWYzEdjqMfsJiCoY/lunZAwP0i4SVKrUEejw5MkQzUXbPhumn9CvMLKko1RzdaDGUIQzaX
	kIaCM3i6tw1srYMRLmNko3TNESRB7/zCqZs9/mb9croktvnuiqSsPeZPEDFvRRMGSFl048j5bb+
	XLoUiKby6Czk5xvnkOw+/AtW9E9IOEAS777zTlsalDOmb2NsGXCkclindwg9HzryRlZYr0d1d1F
	WSM8Mml6GeakeJ3yovpZo0tecWH5o0zfWktDNu9dTpd8Zib9FW4bDYhCRaeHvYQZFGlfeOQ4tNI
	GAlZFuxYZntGePf2ore7epkzKzsu6POc+gsjr4po0T7Kt5cl4T6YLwNjY0DnE6eLkdGMKks6Xkd
	vna8WpX8N5eEw==
X-Google-Smtp-Source: AGHT+IEIguQB0uXGfKo4fm4DJC+yzPPu45X2Bza3OL/IGVtnEDjPWFUZwpWwFO9ZDFyXjEUZ4aLtXw==
X-Received: by 2002:a05:600c:1d0e:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d195a87b6mr305079455e9.33.1766838347448;
        Sat, 27 Dec 2025 04:25:47 -0800 (PST)
Received: from ivan-laptop.. (cpc92320-cmbg19-2-0-cust3144.5-4.cable.virginm.net. [82.13.76.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm451520315e9.3.2025.12.27.04.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:25:47 -0800 (PST)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: Fix strscpy usage in mt76_connac2_load_patch
Date: Sat, 27 Dec 2025 12:25:24 +0000
Message-ID: <20251227122525.5474-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_042550_157488_B03F45F6 
X-CRM114-Status: GOOD (  10.57  )
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

Since mt76_connac2_patch_hdr->build_date size is 16, copying at most 17
bytes into build_date from it causes a panic when CONFIG_FORTIFY_SOURCE
is enabled. So, make it 16 bytes instead to match the corresponding
field of mt76_connac2_patch_hdr.

Also, since strscpy always adds a null terminator, remove the line which
adds it explicitly at the end of the buffer.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ea99167765b0..01362b097a40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3101,7 +3101,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	int i, ret, sem, max_len = mt76_is_sdio(dev) ? 2048 : 4096;
 	const struct mt76_connac2_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	char build_date[17];
+	char build_date[16];
 
 	sem = mt76_connac_mcu_patch_sem_ctrl(dev, true);
 	switch (sem) {
@@ -3126,7 +3126,6 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 
 	hdr = (const void *)fw->data;
 	strscpy(build_date, hdr->build_date, sizeof(build_date));
-	build_date[16] = '\0';
 	strim(build_date);
 	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
 		 be32_to_cpu(hdr->hw_sw_ver), build_date);
-- 
2.43.0


