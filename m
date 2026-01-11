Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F4D25032
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 05:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=; b=aIUozIYuCYquwKImS7MbwngVU3
	sVAbqDGBdaac0bsSdQF5KCU4lhjP/D5y3Mk5eacayRsLdIY0isLPKRanrZPL/EZU6EPtYEc6LeFY3
	48lmUTSmRLLjnuH6JYL4aZA1RESmPGNGhRXiETIQObAIjHsHvbuvjvwx8fS9OtcAPBOCKDsUfvK39
	EJDZKOWw7Q9dOHUAXGOrdgbKjK0+zzmytNFO5dLxl52v2t3UUGzzpCUMlbuLkweT1y4zoyoq29OGE
	y76SBG749hdArNq3O2ZiAxHk9SwP+W0dg/AvfuQwxOKhnaR4L5qF1cCmtE8OEsbtPHBSZdYrj1hCB
	gfOdzQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veo2C-00000003tMj-1XGN;
	Sun, 11 Jan 2026 05:30:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veo28-00000003tM1-0tio
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Jan 2026 05:30:38 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso122856b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Jan 2026 21:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768109435; x=1768714235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=kWW2+g4ikf8/umPBRXaP0lETZCrUIbm3Zy3O6Ej60Zd3mqbeFi3SoQnRVgxkj2prcI
         KB1GmACpegGSn1PYPebyQau4HLEOUSlAnLkuMy0gW2JrI6yWcWQysd5hVxr5gOBSV1Ww
         JyrgfTHFReD7M99wJaWAySy2NIlym6e29BdhnDiyUNxxcjDlvf79thdP4sPw9GOxSKwH
         0k7CiLLEvUpbmbcMOJU8Gjk1l47vhJUSQqFGrvv6/WgLO/cl1sBWtbsW4OlIhN9rcJof
         k7uoqrZsV7v37JanQKND65snq9Zy0glHk/+yi+2TkM+4B226Omj/1bnZyqkBRGCGPj/L
         A1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768109435; x=1768714235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=QrdJfmf7RBCpMl8n87t5n1qdBr08GTKCESAd6cId6hWP8sdZ1Fu3R3J9aLuDfcfu0a
         WHfpm4aCMMNVFyyljCTgtqA6p7PiM8vsX99FIbgCVlTFqHI+23WMmsvtFffjRC6Quz74
         vCQX7E0vAvDIpml+jubM1dupuetmR+ixf6idj5eS/uuI8vkSDSuW818tCvxEIgoZDbOD
         JRJ/a47uXzwGiBJXo1oFH1szY6KO1ou9UmcLclb1LFuFPxUafthZzPizmzZ6wnKH8Glv
         CkM3/TwF2VuAE2mMYWUMJn/Uw/7LKntL2dFSnY1A7hEHa1Ju/rkFNOokB7pF/JmbcEZM
         Oxtw==
X-Forwarded-Encrypted: i=1; AJvYcCVImo2bhsjK0x0ujuNPjm1h+bW0k1Fcn5ablXTjb6FvCouGdXVaEh9VegG2H8CQ3lCwN0867wxLIySYt0lAVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTApjgQw7ojbI0/NDg7QTfodQnsbaFryc+JOkYR9Yp9OV76xdq
	bdxFUhrYjLW44tT6anSHYE31KNkFizDpfC9Q4pbYovJFGPZfDllNq/WG
X-Gm-Gg: AY/fxX5GiqhwONd7sJqrhrh1k+rE0DNOxtUnqXo7NFGrZHWbNIHIysSKrlSngMUPu+5
	+++ojFkVoa4xMvl/amzJPqCBAxNFSOV9kCbq/a95nhKCDeIHdaziX6tNez3xQf9llLCcncBd24S
	TyDBcqg4T0EG4paAltTSDAGm6rOK7FtC10ZGknHqiBtHyEr0IwQuUUI6blAHveAQv2M3j8/E3IH
	o36kJ29+gvljxSQbKqcrOUKy2ClGxQ14uZS5OeweBlB/r2uvtFBUkHoM3sj/R54NBbWgmOx3kCU
	5cOUQb7RBB6A6w0lywBPVYIhy3TexFGSq+DBlzPL1bcHTXso1e9USAVzPyk7MWXX9D+TY1lFESd
	8/KZefhFX7nmHuMpZnp0InN54tdrXRgmW1DFgDq9m8xCAhXTHbDNz7P4v/xpeABDsEqy7Zt7oip
	NCXsfnQKQ9pmv4wVB0b09k6Ch+mSjQRtaXliTwrRZJUg==
X-Google-Smtp-Source: AGHT+IE9IHiQq4TCDxDRjV6As4aVF857MZMsEhTnrigePlGm/VD2v5ON2VzITLK2WPgiPhdmveI4qA==
X-Received: by 2002:a05:6a00:bc91:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-81cc98cb603mr11097939b3a.7.1768109434679;
        Sat, 10 Jan 2026 21:30:34 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f36f88f4bsm3503490b3a.36.2026.01.10.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:30:33 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] pinctrl: mediatek: remove unused drv_offset field
Date: Sun, 11 Jan 2026 14:30:24 +0900
Message-ID: <20260111053025.251983-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_213036_266572_2CC433DB 
X-CRM114-Status: GOOD (  10.87  )
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

The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
since the driver's inception. Drive strength control for MediaTek
pinctrl drivers is actually configured via 'pin_drv_grp',
making this specific offset field redundant.

Remove the unused field from the common 'mtk_pinctrl_devdata' structure
and its corresponding initialization in the mt8365 driver to clean up
the code and avoid confusion.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index e3e0d66cfbbf..c20b9e2e02dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -456,7 +456,6 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.smt_offset = 0x0470,
 	.pullen_offset = 0x0860,
 	.pullsel_offset = 0x0900,
-	.drv_offset = 0x0710,
 	.type1_start = 145,
 	.type1_end = 145,
 	.port_shf = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 11afa12a96cb..3b96f3dd338d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -263,7 +263,6 @@ struct mtk_pinctrl_devdata {
 	unsigned int smt_offset;
 	unsigned int pullen_offset;
 	unsigned int pullsel_offset;
-	unsigned int drv_offset;
 	unsigned int dout_offset;
 	unsigned int din_offset;
 	unsigned int pinmux_offset;
-- 
2.52.0


