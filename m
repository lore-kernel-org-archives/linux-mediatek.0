Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C512C04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=; b=vUFK90E6usiBV5rTUKhrRkAVsV
	7WEBVd9Lj+NTkvwJt7jnCeIbYZy3VHAPPYvMleh5kCQNSGiLkpfZipWAk0Y0/q6jH8pHFDZA9699J
	knikRY06CRN1U+e/wlvHdfoNa9TgZMkx2ohzhueY42g0s1/3DRTSlH8E1kUwXW3VeixuKUa4mf4sV
	2ZYy5KnfeWN3Cw6pXZGz9+fGYw3R7AVLlkFQqHvPb9Uk+Mq4iOWN6QhpnUoKFT2cuIqdIn+Ux2jkt
	bJcM1sMTNC4k9C220PPvpukINmmX5UFdgTU45xsHPAWisk6eOCnRokYUXhbO8uRn1AqRrLfCDX/qm
	yvbGsRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvi-00000005B9z-0dpM;
	Fri, 19 Apr 2024 09:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksV-000000059If-4Ahn
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=; b=Jr4piowM4YJJ9M9e8n6UaRMj/4
	6KWP2AdJ5LVEF+fIdtPRzyF8B3viwVrkSkZf37g74ZceQxlzUc+QWVZr+8KUWD4PTqByyu0IubqlR
	1oNSOA6pSav4DnIJj5RF53IQKfewINlmSLYlQqAbJAYQCaVdJ+VNWOc1ZuLgaoZiLCKwiPcv3dkc2
	nomVsbH26bO3udEXuoNAVg6WxZLgXHgyDrI/43KqyAZsT8fJfJPokbsCShOk00mkAQzOrH/bw7hRr
	Oq07abH3Xbbn0mId1sM/7mgUX197PEHFV+XeOmUmAm1wvMdsIxY0cpn2uCiTvWmXTjdjb/dFnBBxZ
	KnYvfbIg==;
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksS-0000000COU2-1Gxn
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:54 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-78ef59a369bso123606185a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520188; x=1714124988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=XJrEwUu97o34kOkXfzNciiwc2iABoLWazViav10YUhBHcd2hYF8EBRDo/uQl36WetG
         0Z3Sf9Pq9hYcU2N1tMRkDle+5dci2b8fmXL94UbU7FjLmbd0/CbpSNyGqHwpWzPGzedI
         eDbljVWqh9BccX2oSMziuwdSIcZ3eBjeqBCUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520188; x=1714124988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=LNRjkr6yxc/2AKRaf7y+0v3d0hosKhmU7ZytixKuA7OONyA7JDKrWbUH3P5WGtqq46
         qvVoqbRg/5IwKKVSAtYBU5XDB2g9uPqhqpTVB3vtuSbokzvWz5rJjNNe57lrvk79Z6Xr
         YtO2W6ScuqfMQlvQq/oBAUfWd6Dc958Q27WWMAQdHExxGy7Z0Jz7eUgkJnWX7f6GG2Ic
         UfvHEjKEv3ERVc8dSNUYqlfK2coO1A5dGbQOGnilFAYII6v8n4gIrH3ts7xw2uTQLGg/
         sjFf5ha/j+t7lLNTkQlBRjZnmUorRGN1jKl6XBRmwFgIXju09fZSmy/FXHnm4InEPdv2
         7TsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0o7YzsIR5CIQfeFiQOvRX1Cg/Y9piR335vX1PM78nLvUnwkF/CXehWeUb9CkaXq18tJR5ycMAIpEg+xGmV2vRhTK5wBRWA38nsOiZSDRoNYo
X-Gm-Message-State: AOJu0YxtmM3769yZ2YhIVzDNnlFmPykB0zP8eVc0mwu2JqkTLZA3AFcZ
	UAfke2S7M34DPul4wxV+8MCLDgKkUFZr0UCG331p9gjIyS0EDCWMdoKQ2f6Fmw==
X-Google-Smtp-Source: AGHT+IGwmCCN5wh4NaLa8aArMkOF/G4Igcbkk8uWKtclUOXaJ3Z6Gx5Noog7Zc3uSUISJQ5MgoV6TQ==
X-Received: by 2002:ae9:f50d:0:b0:78f:1044:bcc8 with SMTP id o13-20020ae9f50d000000b0078f1044bcc8mr1806809qkg.61.1713520187814;
        Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:11 +0000
Subject: [PATCH v2 25/26] media: dvb-frontends: tda10048: Fix integer
 overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-25-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104953_128086_A06F90AD 
X-CRM114-Status: GOOD (  11.91  )
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


