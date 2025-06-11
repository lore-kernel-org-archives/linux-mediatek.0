Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C726DC71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=; b=45QPOKBSuzEQIGzBrsE+tpMK0U
	vtgqC8CgrYhzvuhWDMpbJ5hwk4xsRJgwm2DQNK+yvSsO8qaBNVdjc6zte7er3uFjXvkhnUvs5PwA5
	/Zpyb4+SqbutrDScj0h5t4I7gC9jRs3bS9Jg5ehf4b7ukmyWUhLY86GCbtSr+Dc9ILpQpQ7qV4/Az
	5vOp3HmIFOuSaKXKS/G+f7YmXQtyFXPoCy+VkCWmgsaDIEKnKXowPGAjAunLZcPOMywdpkP7/Bp6w
	wWwSSToYFlvtKu10u6e+ICZfisxMeczE2KfWQ8l+1Ob6kAcTLHhnH54jUm3t0N41LKi69E2+3xiiT
	r7Erh+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUdc-0000000BeVk-3fxV;
	Wed, 11 Jun 2025 23:13:44 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9B-0000000BVIh-0FMC
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:18 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-40669fd81b5so206100b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681736; x=1750286536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
        b=t6QMfENppwM9EnqR/bTk+e6T7EC40bO2ZHuAsDFsNZCuJqZqniVVI2kw9M8CeuWwgI
         yjSBHTRYf0SBHcHcbci6lCdrp8rBPAHU73WuF34rXjMb7vZg9z0zPL/MvFHgRWiIVdk7
         C0K/UMvIq8j6dk58mo4BQ1awceepNyeEKMBY1Ro80srlQ8Jp9LcYi2h55WKIiNZVoXns
         L6mS2uipE844RqlPajPt03wuO7HhTxj4uyAUKgI2Chd9fOl0YIU6PxR6L6cgKr4/4Sur
         XlvNOuHR0jgIxQTeXHNjXKYEiVmhzWhuksWpG+j60u9S36GpKtYRNE3VuegsNUNvcrgN
         UymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681736; x=1750286536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
        b=aZAk+r8+Ht9e/s+D10RUyzkwyf7ykWxClFDd+ZaZNjfg25hTvRqGYikUlEH8FgWwIn
         osCe93UWtNv25854sfkQ9Al8mS1G948wBrsp8SVtcW2w8Gi6MIgol+70YLay5pm27gqw
         THHeYuSkJlqo6BeYiq9/FBaUm//QgADJ7Vj786lPxi8BtK5gFV0wgBP6y6MwylEhgnC/
         w869M81fcHnrpqAIcSLxmWpTpGQFpfFSk46B951VC/TohJ5IuH/vf61LKpPz1VmK8X/q
         GNl8cbAljALFhx0CCD8Z371eUYmnxOIkKmQN5AsJROoKjU9HKt6o3bTut6cAQLX4IQPa
         0VoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnQ4hPybc4q7Nl6Sf022ppIQWzLH1g2/s/VUy7t25OmDnm0L3H34My03N+3siFoZO5dMswPOdbFGaYS0LRsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKuwtwzV3qoJYJOYgXTD2GJy1I/cSVQv/swbPHYPMOG69MYeRv
	xZKe004g1cSL5No2E6/bVbYbaq4QNmBPyEyNS7xLZejP11bUjmDrbdin+BEzTdX6BgM=
X-Gm-Gg: ASbGncuRjbV7+x/zivNDgrnce2whHnD9L+xBna3RucRKG5eGcVW++n9Q1IbzNbvnHLR
	sx0I9uXU8xXN4ZXnMcX9oKDuiy/IXL3ZfEB6+ngZGaxJlivkMacqN+XQa8H7w0buD5PC2uit0yd
	l4W5kGU7EJgkIFxNMYYRq3dYMs9DtwnmlOcFe6wNpm14rWWHj8F3A/Kjntry7bTpuiCW0uL3UsV
	wxVqY5tGt3Vtg2nfgya4mkqM9UY/9mbI73c44EBtMauEGtSn2xl6PdsYwSL3hfqQeAaNiCEcua3
	L+gaLJ0Pl4MFXCMWTAWf/P65e02m2TaGM+0EuxFOcs2sAMY81oaE47WNubLZruN92ca5
X-Google-Smtp-Source: AGHT+IGIpzPnDrmzBmfsC4tKKskTV7D3wfzLsNC4g3WTLnbA1Yephi0RklISAXQUfRO/ncM9aBfPJg==
X-Received: by 2002:a05:6808:6a93:b0:403:3fb7:3870 with SMTP id 5614622812f47-40a66a5b32emr592491b6e.10.1749681736398;
        Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:53 -0500
Subject: [PATCH 01/28] iio: accel: adxl372: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-1-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=OtTTIp23r83l4FPUg27mf0gCVgpkwXuq0SNiBdQqXRI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWKKhpCfFTksDG9gr+9eawR0jxJfSx6dAJNM
 0SZmsoqdzqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFigAKCRDCzCAB/wGP
 wCJwB/4gUJ8t7UOdIfHCp1gF5oikHABa4eS0J2FUBt6zWTkee4P4bV5tDwfS1kcYHllaJBX/CtO
 7HxkjtZxmdIfL2tBgPZCBP8S01Mg+OXaLOQaEx17gLl45c23P1lCfWSYP+PhWq/8KoX2NIR7n4F
 9oees3ltMwkbduWFqU3iEDQB0oXjzl94CRk6aPeSRv1xieFkbXgD4FSutJmNiyViLOv2q4OqnYa
 4gaqd53Li0HDnpieOacuZPGeu3GoPzOXOtMsI7N1pk1zfWsrHFkxI3Yw04/HUQokzunQaFQaFF+
 HR9AsvwTdenSczLxmQcrifmcH2iDoIhYwK3xodh8KKtXzNMd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154217_101897_07F273D9 
X-CRM114-Status: GOOD (  10.97  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/adxl372.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index 961145b502934674e7655573b12121fffb2328db..46d518a2a029179bdd2cc2b9e98f09b6b9854fba 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -600,10 +600,9 @@ static int adxl372_get_status(struct adxl372_state *st,
 
 static void adxl372_arrange_axis_data(struct adxl372_state *st, __be16 *sample)
 {
-	__be16	axis_sample[3];
+	__be16 axis_sample[3] = { };
 	int i = 0;
 
-	memset(axis_sample, 0, 3 * sizeof(__be16));
 	if (ADXL372_X_AXIS_EN(st->fifo_axis_mask))
 		axis_sample[i++] = sample[0];
 	if (ADXL372_Y_AXIS_EN(st->fifo_axis_mask))

-- 
2.43.0


