Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF168C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=; b=pREq7fEsKvB4L2Q5fGv1KN9XJm
	kWiyi+sycdgymSLLzmWZ1EdN6imYMBuM8RLMBLJpT1XrJv1nmQr6o9jy2388RdemuciXWmc8nsCkX
	Ms/6VELQL4H2XaDdc1LOon2mrFghg67qqQXGakIwCT4gViAHurlvpSy8WtB6IrsOXSHqunm/NGxL3
	IuwbIwooM7SkPOs3qwICp7PGrFkcCCprTtG8S+UDCeXjjNGVa9U/m1VGK3SOOItg1bCuPxEpCESdn
	VP0dclcrY9gd7nu1KUqAlW9RL+01N+eh4ABj+yXb/Jz4VDjdG/cgxwq3G23sdq0HmNCIZV0k6AfZb
	1y4iCZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvh-00000005B9Y-2AQ1;
	Fri, 19 Apr 2024 09:53:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksV-000000059HY-0Gvs
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=; b=f6ZMFGt7AHagk1RVffRE+2ae9V
	NNfZV8Yulxu4U06vRpSyNvDBBt/+ucjw61o1mMOm4PSQONiTSORYYFl0IB0JezasgevEdWuVKG6dF
	0OQHVmPzl9lWv4zTCLHwWYedpc1+n2NVGabdcXdBUpZTFFCiEaGhMzw4EYqZJq78/QEuxVysTI3n9
	XN7ZVzRcmYlO3s6j0WTVa0bPkZ7UhD/Pfyo0slki8MJhpPv77ajaz5qKVNSQ3tZseS3OOczGaigmW
	lKH9PrQILyo583NU1jcmvVbGo46JlLsW4C+B7sKnEO/pEt+7OdXSvKfNY6HNn2129IyApfg+0ORGC
	LlQoePAA==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksR-00000007Njo-37ue
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:53 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-78f0628da1eso112143285a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520190; x=1714124990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=XAU9ZmZeXGx7enTxKqJcgoZrGS+MI1WahPhypLf+qdS1d67iYRkMoPQNwB9IVEG/++
         h15XnH5+o7C/XeN9O0nbpQTwkf+QGCKciUe8yfJwWdwwd7GaP+H75IsiLxISWQIXug/R
         8seF6s/Ol01HHYDlQoSdZtvFQoCY96240ztnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520190; x=1714124990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STqazHEagBxWlHC69lQFp5WbvQ2Sdx8rB6+uKcUB0cU=;
        b=KoCPTn/EMBI5WE7YOmeZRnRGEJALif5/HL5la69CYDLPGKDDTAJ8V19aHhNSEYkfTb
         vViTHle7iwpS1SK3exblqSzXJmIGPnlPlrE3VWFOjmu1eqButid/l1F3E6Xojis2mLcr
         kznChREfd2++aNqTSWU7hsZsnP/+72DzpSIN6MoqmqaiAUKC/XqiZex4MAQ3Q8ZzbaRN
         5bcz82W+ZtKZfCQAl2albOMmjvD5zLL5yV+nlKGEaMWeWgFgrphX3YwSlt99bShXxadn
         eOLfDRDl13DJbiPHuZtIHybhhs3wL7kyk6pzJ3ejdsBa3Sl0cIGYgKFcOseAVvvSskor
         +SIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWjeyG+JHwv7Je6cEZxsmuIeOQvKrUSoz8CGMu+qfBjkjv1/Oirqn2LoKSBsutbczZ/XrtV5pSYO6142y9MALLyrWNEXVJiOTU0Iy+bhISoic+
X-Gm-Message-State: AOJu0YzF5dhTJx+pxL8N6CVsraA7DNuAC5s3AimzhEX6roc32QxWJrdI
	wyxI9Tqm91zL9el9HEfivsRLi/GejK3u+zxvwAAZpZhNvZnXIeOR6mSecjaOOg==
X-Google-Smtp-Source: AGHT+IGB4W3xcDVnLVL+1B0lbE5yrHeQCLWo5Y0evN+/+oC4NuGMNOIMrDzfkEb/6TpNH9rKrh/xtA==
X-Received: by 2002:ae9:f00d:0:b0:78e:fd3c:b6 with SMTP id l13-20020ae9f00d000000b0078efd3c00b6mr1503480qkg.40.1713520189085;
        Fri, 19 Apr 2024 02:49:49 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:12 +0000
Subject: [PATCH v2 26/26] media: dvb-frontends: tda10048: Make explicit the
 range of z.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_104951_955583_C795F525 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

We do not expect the sample_freq to be over 613MHz.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.44.0.769.g3c40516874-goog


