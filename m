Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4EEC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=; b=ZVRiTpLhPbmEN+O4NHEyJCUl3x
	eyY2j3POhRnWwuP3zXeNEgdTxxRJ5gv0nFVJ5upbhJ0P1k/oKQou9n81znMfYh8GAa9vSeUS6HSOl
	0iuqrCiv8FgjrantQJnPRXKz7715By1dPXLWiFt+SA9/auqn2yZoh8mFMwf37vxKMP2yd9kk6fViB
	OkNURmxpxUplWBhy9NlVZy2zEvT+4sI9kQNNGgXqmeRkM6Ty0TmXYz/aNIbVaXm/XTELr6HwYAS9A
	qDXyUspUwRpRNEwd5eRKyQasWO0yL0VzgOvrI6s6o/V8XShOhmRhx+79nV/VEqs5+YIyoEqu5QYSz
	77XccWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Se2-00000003Iug-2dJW;
	Mon, 29 Apr 2024 15:10:18 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SZ5-00000003Fds-2b3m
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:05:13 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-78edc3e7cd9so346884785a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403110; x=1715007910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=eUdeAe34tOyMEfTcIb5OxAG928VtQa3E7KxaZEckDtIpiOc4xtCH3MO6NHOg5CZy7S
         TOHgrDo8WrK/zgnBEmT1Ykvwi7DQ/veppJWXeDDvU4BIzhgN2rSakipNfF72qiwKIZF1
         bgKksusZtScavk/0Q0s26un9/sz+DQA0EcxWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403110; x=1715007910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=eGS2pTgldsHt4icwyJBFex+bdClBj8wpUDwbzxnr5kR0g+/kikoUkJXatRSZtdFTVH
         s8DrNClTQcjawBg1Q0mfX0HqDI0N7ZsVS9OCm7k/gbe6AKS0NZYCIfUalMMQeej6NDw4
         vLuxGcKj4zvnn7HA8KDUu12rR8NtdV6uo2/2+lQE4ccNh4a+kUZwpOwA9A6whcnsvqLk
         aCKGClaL+RurFjMsIWYS7jLtdbquj0Q2y9REXcxOa8OKfC0DRTVTt4w63ZeL4bvZn4TM
         ZFM4iaB/OT2j/aydxLUqYyWI+IyuatXE7sXZtwLaHaem9kMVkhrzPcKMyX21rPPs4SkU
         pSZA==
X-Forwarded-Encrypted: i=1; AJvYcCWP6X1IVIRV3es/bNU2hY8u3VgVFqHxgwXFFkV0ZtrCTd5ukSceLfw53GtpUtAaxIEX5+JkEbH000rOFU0BcDGS8OL42ZwBfTAmazi9n1FhbvaG
X-Gm-Message-State: AOJu0Yxj2pgMZfCAks47pP70Wyuxb7/kfryjwjbRlhPUHysMuCJdcdry
	4FGDBU9zhitoylspvAl2u4afiUbqWGWcLx9JAASrSJNArNKkugykZ2GydI3ChA==
X-Google-Smtp-Source: AGHT+IH9sz0tcRc5gxc3Hn2yH4aEBZFdiRiwY4P/N3aVh4I90x1YrGS0c1n2StA1reM2wgrnpB/ryg==
X-Received: by 2002:a05:620a:1665:b0:790:9e62:787f with SMTP id d5-20020a05620a166500b007909e62787fmr11023549qko.28.1714403110567;
        Mon, 29 Apr 2024 08:05:10 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:04 +0000
Subject: [PATCH v3 25/26] media: dvb-frontends: tda10048: Fix integer
 overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-25-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080511_781561_C7482A3D 
X-CRM114-Status: GOOD (  11.74  )
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

state->xtal_hz can be up to 16M, so it can overflow a 32 bit integer
when multiplied by pll_mfactor.

Create a new 64 bit variable to hold the calculations.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 5d5e4e9e4422..3e725cdcc66b 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -410,6 +410,7 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
 	struct tda10048_config *config = &state->config;
 	int i;
 	u32 if_freq_khz;
+	u64 sample_freq;
 
 	dprintk(1, "%s(bw = %d)\n", __func__, bw);
 
@@ -451,9 +452,11 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
 	dprintk(1, "- pll_pfactor = %d\n", state->pll_pfactor);
 
 	/* Calculate the sample frequency */
-	state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
-	state->sample_freq /= (state->pll_nfactor + 1);
-	state->sample_freq /= (state->pll_pfactor + 4);
+	sample_freq = state->xtal_hz;
+	sample_freq *= state->pll_mfactor + 45;
+	do_div(sample_freq, state->pll_nfactor + 1);
+	do_div(sample_freq, state->pll_pfactor + 4);
+	state->sample_freq = sample_freq;
 	dprintk(1, "- sample_freq = %d\n", state->sample_freq);
 
 	/* Update the I/F */

-- 
2.44.0.769.g3c40516874-goog


