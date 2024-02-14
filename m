Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7227CC48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp9yTCv8Nkx/po83XyeQipiHIFHlL3sjSTw5FvYRdgw=; b=yds4p2YqApzkpwDIcfTacvja/v
	+lp6dxzv6LZgdHRIrFda3zqhIscIjf4OiiCpa7HKAFPGI90NokQF6e7zWXOnd43dXqqg+2hobXohM
	kIsKz37aVC+psxTO9v+O43B/V5/JOUBYWVVEMJ7JgO0GqcR55FCjRHFdwdHaEAdotAlNehIbR57Em
	3PGJ+nrqSvV6pVmZjVM/35OpSX5yUzjgZFA1RcubaI0Rn68Gu8WYhYeDUfgh5LNDYm6/alixWTlfs
	K8oE0J5pAagaNQhjH7GHQRVuRz3oGvfRQ7UlgSvs/Ko2Maf7FAk6tcbsOsx8Wx+iqF4O2GY+20R4y
	eRfy+Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFsv-0000000D7C0-01ye;
	Wed, 14 Feb 2024 14:05:13 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFsq-0000000D79k-25Sj;
	Wed, 14 Feb 2024 14:05:09 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5600c43caddso6653833a12.2;
        Wed, 14 Feb 2024 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707919506; x=1708524306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp9yTCv8Nkx/po83XyeQipiHIFHlL3sjSTw5FvYRdgw=;
        b=lDRmibaTzM5ovonyqo5x9jWp8u6Gc6CAryjlmYIlPRhPYpeKsfUSJgeeLekmotGHTS
         jfd127/DlWkHvvSAb+d5g2MvL+EkLVDIq0E6XvoPRY8P/LmnDPU/moa3YGTi78lSx2SE
         EOTTRt8LqJfUZE59aLVlaIlV/SRRVTDPqzBQ/XDUkmKSI/4/8IJ8FRY0YI38uukvMaaJ
         O6GDEhVquS2mGuqfRAjQS/jbMdmKvn90gFr/AHkcEUdbJUMMAIlLo56HfxpR3o85ewY8
         KwPi3SSXXfIN4XcthZk3GpyPTLiJ4fHag5Ak2HmQtUnAJaCCeosCLZuQOb9GYO0JwyPR
         6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919506; x=1708524306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp9yTCv8Nkx/po83XyeQipiHIFHlL3sjSTw5FvYRdgw=;
        b=huSc8+XfDL7LcuPVq2mfZLqDVeHHIo2Dhn8a3OBUrxzdXCha0TK/yRW7NlLs8cahvh
         Q0z1zTNWvOlONHaMmkjbuBz8BMcoj+mWgbQw7qSFXf6ku91JuI8wtVId5Dq4CUThi3tu
         AcHkfmOUtYrDiNVjCIHzm7T/s/jRVThthlol+XvKV+oyU3C1EY2nd99VjJkJYMqUBjQ4
         5ZNCHDOSC1qvhrWr1LXzo8j2YrK8vXsyecSrxzqtlAy4FCLYwuIhK84UbzqQv21IQ+OQ
         ZuYVHgJYc+vsbDapYm7uekEVir4DWfqJ767j3MwrV67p3W6uL6Wjc6DVWXcgUBjN3CgE
         RRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHQvM+3zqs4kvcSfo+tt8Ee3t1Z58Hn4eWQM/k/38c8mCOtBqMvx1ViMaoDw7NFgeptCRFLH37yHxdUI60FOr0fJyYgz3rioHXCRF1gwcRUDiO9uAUmJTE0PsKyh/1nHXkAWIdMrKh/TTkPV+aK1PX/7XOVHrLHTY=
X-Gm-Message-State: AOJu0YxaS24AkO/DhV0tCC2rDXCSy3GHfNcMoJXIyVq120spml0yjcmQ
	EwGKGVc97mzgWaQO8YpVrdhGk+lX3NeZxLD3h5+DTDCmZuLcP0vO
X-Google-Smtp-Source: AGHT+IGd8MaMO4iogIBuFJz8TmdoIxMvob4CDHybYmI+oXS2kWaWWHs6MOISz80HK5iFOoRO2UzsnQ==
X-Received: by 2002:aa7:c441:0:b0:55f:c5b7:5855 with SMTP id n1-20020aa7c441000000b0055fc5b75855mr1908358edr.6.1707919506394;
        Wed, 14 Feb 2024 06:05:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuZaHwkIiWbn2mb38Z67j0i1WOdtMavF2LwMIhs+ISKRDeoL3SPtJfhfpXrqP8xyBJtN2liwmPWeZgHqVpXUzaMtOzfHSMc+Ta6bhQIuoLGhbTHAIXsianp6EX9ql0tt704xppvax/L+ji3m7NcTqOPHEtWUgdZsIhFsv+t/Dtq654PuFL05UAwO/+hpwpbAGWbSTz0vAADuias4zMTxv67C5f8UF9lmRhoCC3kxjuJLRV159K+opxXWaxIrTsc8R5vCP4HCYFGT21x9FRO871Fzt51mYZiO+QULaS6Y12ccanNuE+dP0e2FDcmLqBxFzkTE1fQM3AcwA4eE8idTAfOhg6Vefx5KsuX9MHqgHOWYCS1JhRjO1m6uGiBfAwZQPRSdQMCrtcS5UGvFEeRfkghzPWhbfuKbn3pYM/hzOeDX6Z+sE6WsODL699ZGbX9NuHP5QkKqCiPJ5UjzneSvILjjPIHEQ1eK56akkER0ZnYKxxg/59WSqNEfPgX5UG9A==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402501700b005614409022esm4700646eda.63.2024.02.14.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 06:05:05 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] pwm: mediatek: add support for MT7988
Date: Wed, 14 Feb 2024 15:04:54 +0100
Message-Id: <20240214140454.6438-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240214140454.6438-1-zajec5@gmail.com>
References: <20240214140454.6438-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_060508_572111_EE2AF6EE 
X-CRM114-Status: GOOD (  12.23  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 uses new registers layout just like MT7981 but it supports 8 PWM
interfaces.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: New patch in the series

 drivers/pwm/pwm-mediatek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 562102a47ac0..292c8bd5b343 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -339,6 +339,13 @@ static const struct pwm_mediatek_of_data mt7986_pwm_data = {
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
+static const struct pwm_mediatek_of_data mt7988_pwm_data = {
+	.num_pwms = 8,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = false,
+	.reg_offset = mtk_pwm_reg_offset_v2,
+};
+
 static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
@@ -369,6 +376,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
 	{ .compatible = "mediatek,mt7981-pwm", .data = &mt7981_pwm_data },
 	{ .compatible = "mediatek,mt7986-pwm", .data = &mt7986_pwm_data },
+	{ .compatible = "mediatek,mt7988-pwm", .data = &mt7988_pwm_data },
 	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
 	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
 	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
-- 
2.35.3


