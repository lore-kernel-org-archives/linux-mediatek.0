Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C62C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=; b=gy+wUxlu9etIaVcyfSPSjwQGfZ
	neHBn6XZqPa63eW19zg/ERrFdLKGQ/ZCyyEZhB4BXC2wwXWrFg2U1ytN980L7zXWz7k9tY1fOQy1/
	xl3ZpbXC8lMyh423u2Qn7Wp1duoT9Y/PhnoOAmq/3DkQPOXvPdjhfXYLzw8OEiV8NllhAb0zEBOB0
	zjebGqSuCuYcewXKLEpDG82+V30ZfGc61z31oqGTtMjsWb8Vb3Og6ia1a3pbpkaUPQ4jNQLTIoW+o
	8pUfalk0GU36AaJAjtjCMyhE7bwkhij6vajIu69krtUphLZdWtnOz95C+ik3Q3M+mfCD8IK4rDNdf
	hnmSuUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS9h-00000009e9U-20de;
	Mon, 15 Apr 2024 19:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6Z-00000009cIR-23ga
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=; b=AV6bJTuvtAFMBo15aW8TqaiiNA
	D8pCiwRKU1VeJqUAPRkZleS9LYgBZLH4+5fdZflryd3i3EyatB/S4HBz5gmkiAn1JH/naQT0+E1iH
	kumGsAqX4yeqaE7n7P72c5WF72PeYtVTBK09zREEYjqvnivLGWNOGNEwucmVzSMlbzGGuUqxp8Ngs
	+fqS2DOqPC1gLZuQ0tEchDcZ9CDWsmhnu6nrY/MaODES6u+jEjvAx7FhdQjhzb4E1Vw0seWb1gqVE
	EVVcT5wNfMKTYWQ5IdltYEEOyWlHI5G8fDv1oODwejr47b/ASea1VWt3tpnPDXlIHFfyyLgh11/Hm
	9SMPjlWQ==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6S-0000000AikD-14gn
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:01 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-78d6021e2e3so286101185a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209693; x=1713814493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=;
        b=UQl6QrNmDvjwcTQk48q73CKd3hLujSZQ+IxoKPgzbZOjAYirqFIjUTtl2b00piEcRX
         vUpWXNbIeIbI36yxaBksWPgirMiHEZJNAbF97UNubO1xIM0QoQwsu2lOXsyJtZjFZFo0
         h4dTcZHw1s6/20RDc+wBHOs4nd40DJUGsxG0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209693; x=1713814493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=;
        b=XHsnm6ZWkjQqHhyx2P2TA6RB3mVEPtp5qzjNlRiFurkUkFclRt1GpA1xzD3ucStZYL
         DTvJmP48tv+tmxFlwfA+tE46Yk6CeqHguNwAEGXm6TU9jm86fMCAjOnSnsRplgnyy00G
         rTcRfiTpOkWQcHVHjXXhhrobrH/+I6K22g2uhZNGXr8kT/h9kA2/0FgJk/m9wUlvdc/E
         PQTWX0iP5OCzpv7WiRs9W+MVvTWhNHgMU54vXyS22nTun1euH7qPAa/V1D1EYP9DCIRJ
         4G5WH8MNK4F2swk52E+7GLEHEddKswKx0Fzy+x5TJTt6KMn7Uk+f9AVV1gPnTEELPlKV
         ar+g==
X-Forwarded-Encrypted: i=1; AJvYcCX9/lZTyXdc1GaXzNlN7TH5xwjUAkDthwqVddqkqOxQ6Olg0yrqJtj8SeRlLoTVJsNnGGAM1wzBBVbie8dMKwaGHjwAkmUUr5jdaIaW7zIb2B2M
X-Gm-Message-State: AOJu0YwPqxvTmubu+n16W+a7FR1Hf18UfZ+bZ77SmpRy6tij5Jpfj/FE
	ftTZdjYJo7keID9vA/y6STKjG6Av7jOHbidWvxAbNX8kF47EZWGYvR0HG5hA5A==
X-Google-Smtp-Source: AGHT+IE7tE6n2LOOWlxUIvgFNmo/Vr0dYpoxwwqjlaXwS/vDwhHd4c5esyFK2/v/y9hDaMP9p/kqqQ==
X-Received: by 2002:a05:620a:410a:b0:78e:f439:64ee with SMTP id j10-20020a05620a410a00b0078ef43964eemr19862qko.72.1713209693277;
        Mon, 15 Apr 2024 12:34:53 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:39 +0000
Subject: [PATCH 22/35] media: i2c: st-mipid02: Use the correct div function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-22-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203458_457956_CE34B300 
X-CRM114-Status: GOOD (  11.67  )
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

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..93a40bfda1af 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_s64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog


