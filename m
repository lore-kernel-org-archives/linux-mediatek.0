Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuL/RkzaGiiOPI//A9Zqgal6TiCXS35wksMPJTVt1GE=; b=rMVthMPw+BOJBV
	DyOBr5gcR/pvXKpzr4fFEQ+3jRn+hv6hRhiOBw4ZazRSrfDkHa5e9Xd9GsupJQNdnsG0jAICG8E8o
	6MVdWfThbaltLjx9upS0HZkMbGDImF57xIVR0i3mVFGqjBlvo7FuteP7yHSmpeJhVgJxl7FGJEak0
	WnsPMGUzHyhtaugEkjU6uqY32H2o/SCW+lPKWCoatD5JyFEeqw6mKM7CSfCqDtE1QFJwu/SCYXPnR
	mCp8OOP0XqbQ5NAnbBYl7qETTn4VgPmGDCgT4L1+eJjKchW8M+Cs182T/SxsaUemayEd4+OarR0Cz
	cTVge3i6irViz7iZhvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvec2-006WRC-UU; Mon, 30 May 2022 12:35:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveby-006WPx-1M
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 12:35:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id h5so6375640wrb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lbYsntMLq1GN0TWediUrrDdKB95gK6V8mOFIJ/plIGA=;
        b=6PIvfuSRJgpUpEkUtolL+elU452K0LIs/Lk0e8ySI1W8R7XRUH431mK1hLv3cpfqv0
         2ZivpNy+gpcusmBB8mk0Ew4hQQzierrs2JMj4MSTb5RaE1pnm5r4BB+rMCLfpOATrfQ1
         fdgRBLMqOOfK4fOdnWAONoFqqYZa441FyfaRHJHwcNmWWpMHldEdkBWgLnLLoV6jgILp
         UhF1HWrNlnLykhYQKA9UwLBePuuFaE0k468BQeVRY9pdlVrIjvnbtqfZHqI9FifYwY0d
         RBeEm4ojUdqz9Xr9zBAlKsKLKwezW2a8pkmUhSR3NeD6xwpo7+xnIR9BI4/jC0QQ716W
         7sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lbYsntMLq1GN0TWediUrrDdKB95gK6V8mOFIJ/plIGA=;
        b=Wimza5ZhvRZ38INBDzjtg3iKRyPInitpU1MLR9oD0h0RludO+qHiLtkrhX/SS8Z5C1
         YNCETsV9C72fcvRF5jsei65ynRUjPy14hpaDzjH9q1qNtJ/Br8vRRI5Y86vbowhpHetN
         Iif976GgMa1F9jaEBkPotbkIcY/7rRBsN9/d56l3Cit1t2R9sjQmEXRO76uRtsT9Ug5o
         kZnJuejLeyp1H4v7CrCt1kEYC1CJQ04mAmrDO9r0RI0ll7QB6jVPdgMdOkNs1aIn/Y5r
         S+vT27wBcL6gWkgV0Gpay5bA50LdnOftb2YpwyoICkw/9WYXwV2wy6+idf1g4bQL1S21
         NzLg==
X-Gm-Message-State: AOAM532q77HxbrGp5X6pSJ7XecwoUHPyKLIazW6oUC9ro2Z4oToB9xR2
	LIhwml6Jpw6fUZCu1y0GItSsbQ==
X-Google-Smtp-Source: ABdhPJylyu+I3dilKUdZVnw2PpnKf2fn0YNljSSTog9+EycAuB0MX1E9Uhj466cMXJhLxItBU/M5Yg==
X-Received: by 2002:a5d:648a:0:b0:210:2c59:a07a with SMTP id o10-20020a5d648a000000b002102c59a07amr7301097wri.195.1653914103914;
        Mon, 30 May 2022 05:35:03 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d47c3000000b0020d0cdbf7eesm9380895wrc.111.2022.05.30.05.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 05:35:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: mediatek: mt8365: use MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
Date: Mon, 30 May 2022 14:34:25 +0200
Message-Id: <20220530123425.689459-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530123425.689459-1-fparent@baylibre.com>
References: <20220530123425.689459-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_053506_342916_CD6B3297 
X-CRM114-Status: GOOD (  10.53  )
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

On MT8365, the GPIO64 modes cannot be set using the SET/CLR register.
Use the MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk to workaround it.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index 57f37a294063..a49fa685f5f5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -454,6 +454,7 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 		.ap_num = 160,
 		.db_cnt = 160,
 	},
+	.quirks = MTK_PINCTRL_MODE_SET_CLR_BROKEN,
 };
 
 static const struct of_device_id mt8365_pctrl_match[] = {
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
