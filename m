Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FF9CAC5A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=; b=FFx9XDtWYorTYBJoehyKkGD/Ur
	X/ydU9gKSal+c1ND1w57WcQvoE/QJKbdNyPR1qe/019/tzPaNRT2QI8HR2r9pk8caYEUKLvJWWVB4
	my2wV6G13qYJTJSvyqzDggtURQ/YEHdPZ7Byix5zt0+Px3tLfcTZwH9tZs+B+E691iCO6RB3CIqc7
	DV5uGlnLDeLVCfdCghhNAQhfLZiyJv74zuI4EhXS6PpGE51Xb5Zz3so7WZd+AfvxKJp3Ieq8akwqJ
	roAwHDatbNtdMJQ4Y4kbs8K+d278AkmXh5JoMz/Rfglfj/rFRFdKVVv5qVoavQJr2d4XldcNyps4w
	prl2fSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hBM-0000000AbwB-1tf6;
	Mon, 22 Sep 2025 14:06:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hBI-0000000AbvM-3BLm
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 14:06:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-77716518125so2252989b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549976; x=1759154776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=aD/BtWmAU3hXnus+wbWXPNhtDy298MdH09WRqBrhPU3uVGmuxLU2kI15KM/eSrRdPE
         6mkFTw6cHjPHnyV7Gv5hmRZs1q4123IqWACKqOzmZ5qEnrKzgijGzoAk9ljAtmR8SVF9
         rVmlG6HL6Y2LYz3L6zzSh7SJNok80vhD7kY2304J6mwU9mrDbGUG2Ft9WAT07F1TWZ+L
         YqLgMVWoBuODS970UYaU9amf7cVYeJ0tYK45J36aZwoefCo2wxd2kNb/swxuDU1tEYBj
         yovdxas8s10AkXpo4IRCfvbRY5brp1DojpLdLJggRvn8jIC/UT6EZz3eHAp9dJmQ/II7
         jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549976; x=1759154776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=EuKyqPdHe/1y5wJqBsrh5T31Sldjff6b9hzTAmTL+qHg4KpGz1WrXxDjguELiQVQzk
         Vbziqofp9vLQ9biTcxSxwNCwIJpIz/1F6wJF8XLtQS22S2c64VAt3R005dWd85E8iE5J
         aqmGPsNrPJ4PmRPl7ne1Z9yTkr8CMoOUNZK4tYQN7GxWy6InQ6nHJKPXsTGUtdDoEWIQ
         f5/Kleo1jUXW4e+NLUG3CEka/HiUSKNQo/re3vLwkCMyB0EsLDhGwoRRczAWrgwYG9P8
         0m4mmvNiIdlQOchDZFp/diUIACKX+RGS/XzRayoAoMnxZ6b9ZfF1C9Ref+lkHQhx4cqj
         ZzHg==
X-Forwarded-Encrypted: i=1; AJvYcCW+J6efSq0tNQWzUjKDTVUbLMCtg8640zvbqXOEqvHUS0itx0iM6fFvnz1dnjFE6Q9Vw5cr2ONROMv4clOrtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztWwOvmvmvUaYuKcjrVqwduVziXfSN6TZ/34uwv7puxfWEzHQk
	SgPq67Xy96iHfTb5qvVpuwjEcgSBL3Mv71096ktpCPR8owOoKDslOFTE
X-Gm-Gg: ASbGnctN0xC1HHb2FduwjhW04AzAvUOiW4OpCvgMgMIPjgUrk2W+a8QYYuFw7rP1UHD
	J6ZegJKSwTUt9O0+pLtl4dOZQ1ycIdw+9I5Nk1Atsqd5+bk9uFmDo7EBf/+Q9X3BBn5emi3ZiEp
	+SxtCBwNJhSsOIY42Sjs7wH6VekZ4mJlBwFmaPVikUnmMu87iy3qVfEki3/+lZdxwB/VzO7uVtI
	Rxz2kkjbakR7iLF52iDRy/xPlVOHWxBthT94Jm4Ves9dtr/qBR68dar0/Vrx3nBNa4+Qc/n1pWK
	fAp2/4PPgHt1f+sA7YKzzNo4X0zWX/cwYn75BAWGe+DiEdpebGppARyek2ZYd0JUu+9mfi5YAB9
	J69YTJH7pO9HkxWNJR6kedCJ0
X-Google-Smtp-Source: AGHT+IGut+RghUbyFn2F4fwYbZuwj/DFVn5Cf89eveAp7C+mVNUJEdBY4DbdKoQyXojSDqZ4ufxz5w==
X-Received: by 2002:a05:6a00:c85:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-77f472bbe3amr1851305b3a.6.1758549975348;
        Mon, 22 Sep 2025 07:06:15 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3333:9fe1:c4de:4cb8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f188dd4a8sm7177799b3a.39.2025.09.22.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:06:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Mon, 22 Sep 2025 22:05:55 +0800
Message-ID: <20250922140555.1776903-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_070616_827335_37E74240 
X-CRM114-Status: GOOD (  12.18  )
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

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..eaeb14e1fce9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1979,6 +1979,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.43.0


