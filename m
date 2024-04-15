Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2FC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=; b=1tMCUBd0pxdqw803NHyWQ+LQZJ
	RoFeDLtfhobgWO/or/Xc5tzo5Hkaba08w527w7u2uPyfAk8dwdz6cT5ZHtLQS+LQ7j1FoIGXxZzB1
	mcVeJoIbc9ojF1P+Q3qpsVZliKHXMqOrBEsKrPfYZFDrQA+pwbKiKxF/1x0zxNtVIQqiIkklXcjge
	R33oaV2XeO0tnK9HV0aGETkIk+XtmfdIusR7i3E4v0DHEzgxkjInTzj9b5mEYutSlk7svkOcvlmv5
	Sa5JIYtYcwr15qtPmzXXW0GuOvB3VEyGRWXecrMnx1nwdTUzyLyVHVIZE4L9JEZMFZEx0hah2R9nd
	rNknbO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSAs-00000009evq-2w02;
	Mon, 15 Apr 2024 19:39:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6v-00000009cWp-2mb3
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=; b=KkzaUIiiGAe2uwh6tdZtZWFaad
	TSH086aztdCwBe6qoP+gw0WYrn6xSwMzPoaqop31NfNvvxb1Lo1X7UhW6ky/sv5r1zbF0/K6wSMW2
	gi5LRqMPP854MCW+06/kb+3NGKUrQoXs+zemC08ExM7eF4EIyLb3ByvlUE5JI807krLmSi6siVijK
	3+dzgfr/vY0J4dWFwDh6b/6v00qQNADe04l8/SLPCkpzjoLJtwugM2H01nMsDek/KimnoNLgYkg4K
	HpzEbJHUrukhoDMBPAdSmR4C5Iy8GY0GSBCCdbaxBpInBJgPXhY8LO9b1MfpxVW7UUneyQEbmO4RV
	UCBfxK2Q==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6h-0000000AioM-3xRI
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:20 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6ea26393116so2998830a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=CGm89d9lGE2hd3YcKB+F2MDzgh45Sh9YdO4jlYrRyy2N4/cqLI7zR9K8XyyLnvFlpD
         x5Qc8PUexAWGDfuW/yH/uzcFIF+Ur7kS1eVCZOJytN4kB4qZaWT3cW6ZyxQuwKcGAUZT
         u5WOY/d8w2Bp3RgMEc0ADTRAAUMBc/Z7rbbRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=tFQreBRAPPcYqC5Il+B2haiPIObocCq0udwVyClv22/ybIc9g6EQ7t2W5Ni+XerK2+
         ef1AcOxf9J7XF7uiZr7G3i+vNidwhKgGdlyju0bb2eQ+kGbDzrRdWtOzmu4+lXCmQOlW
         zbt2zqkL6gVRj/GsEX4WnnIzI8WLgfKyPnFJwdOp/eSfRge62DqiK5bqujq0/NS9f1z4
         3EEiYGrmUFmGHBpyQPKN5QxTpxpXFDHpOEt2f6K54xnilwpokJU85sGpWJvqj3bzQOdv
         NQkEmr2ftXTREKkU8FFQC/ZwWn7VIwTlQeiKqSduvyLun/r22b09FPZRCOgpVQ/KnCoQ
         sZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDfQ2kQ2hNodThUmGu4HLLgRIJfrggJruNrMv2zYRceREhpOMr2H6qeYWwnt2mP0DuqxQAW6WVHyJAQcRAJdma2J5EZLhMmtoY5Xhkv80KDycI
X-Gm-Message-State: AOJu0YwQdxbHKyenN9wM/ScGoh44gywuljYUYZMZFd0+6RavT+QiqXBW
	q/nm/Z/tZ3cnQjEUft6p4n3Qbf93uo3H6Vojqsx39h/LIKsqALh/aKJNMF4ErA==
X-Google-Smtp-Source: AGHT+IFpNLbWkYy4T2kNtWWO3Krrkln4WZhxhxOvSx17rkc4ihK9bZ3DdjfUrMbHC9Tqsq3KJ+SA1g==
X-Received: by 2002:a9d:6a15:0:b0:6eb:7c52:ed04 with SMTP id g21-20020a9d6a15000000b006eb7c52ed04mr5573331otn.5.1713209702690;
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:48 +0000
Subject: [PATCH 31/35] media: cx231xx: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-31-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_203514_767152_D309BFF3 
X-CRM114-Status: GOOD (  12.53  )
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/usb/cx231xx/cx231xx-i2c.c:353:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:262:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:326:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:176:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index c6659253c6fb..28de72856c90 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -173,7 +173,9 @@ static int cx231xx_i2c_send_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -259,7 +261,9 @@ static int cx231xx_i2c_recv_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -323,7 +327,9 @@ static int cx231xx_i2c_recv_bytes_with_saddr(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -350,7 +356,9 @@ static int cx231xx_i2c_check_for_device(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog


