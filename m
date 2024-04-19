Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7590BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=; b=04i2ag6RMz7kwz1O9bueoLngdh
	/c6EAOpr4sjmbBNkAJO6zxnPE1RW/azbck5p6tYirs8Ys/9L2feUJ0qUQg7LoxiO3irAC2kcBqtZ9
	oQPtWSj8HjQBO1uTI/6caBV2qY778zPRaVLtaMblIdRaR76DsKBWwLSVakkUMCV6Si1m6NS4hWLTk
	pJI96TGlSEM63QSmb24GxxslKgroBgZ+UeYuPeTIBF6X7lOwBw6nNqaJOzryT7D07scFig66IPwuM
	Q82dfN+xrh5YPp78Y4sYClUHRKVaoGIrN5dIHPk0WSVo+M9iwP5IeCIeC4wKwq4+rbR6IdEq4jd1C
	aDSqwYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvW-00000005B3b-3WHQ;
	Fri, 19 Apr 2024 09:53:02 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksL-0000000598y-3umT
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:53 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-78f0e3b650cso84743485a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520185; x=1714124985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=BUe7SwGzZ7wMpCg6yglCc/aD97ISFXBqArZlQmN5vvEMMjnUJEKyLQvTTGB3t6WC9C
         O36gUOyFo1E1vwb9Tln7aiYt5F2PQbCmgjx+AjKzmQfESxDNILrky1gH7c09FB46EcoR
         0o5erMo10B0tRsCT4a1Q8dP1AWTy3z+WdaVW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520185; x=1714124985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=WucRDic9trh3xpbr4bJcn7ZsuHfD7i59de/coMlxS5H6Q8Cq8RD0Moc+f7P6eU4pQh
         8FEGSGrhxVp+jRGn+w8CWIYPgFaQ2Bi/MH2K+uMemBCte1piwGOHXerol0RtTOU0V12f
         AK70Bmn2Q9VFO2V8uoW1U5ry/YFqiY7VgHNKR6I/qepDpyKdOsy7s1/XGMQ98wwCeEpw
         rlwe5ciqOiEwGPyO4s7rD1kvzuaN3tJH5bj/bCUnjCJafMgzepQn860YQ2vImWxbFWmV
         guWBPEATpZOSxUc1UkxSuVXm+7k9CPHUDlFhPl0X3lX/50fnxBFRgIsJXGFeHsL0nqAb
         cNjw==
X-Forwarded-Encrypted: i=1; AJvYcCUBhcVIoTfFWBHh+oJSUY+Uh9iIMDkeamJCIRtj/VKQvmKKGC9gHMSC1EltMUVI4s7oMV7cTGGrrW3Fr7ApdtywDqZ6XlszNBuO/ybKeqveRU91
X-Gm-Message-State: AOJu0Yym7WDx6MCYxqIyERr/e5MkNTvl9pxsLA26f/KDgOqmB6gB5XLs
	dP2l54n7C625Q4YwCqmZom+CGkRukvx+5mgGkHmt8EunVKVImI0pUqlPANwxAA==
X-Google-Smtp-Source: AGHT+IHphQGghhdnaPa8294fBxI47z+y4xb3Msllejvsy/cEZHbt70Y742XZJgUuOJUmQOPF+5kWGQ==
X-Received: by 2002:a05:620a:1673:b0:78a:33f9:908c with SMTP id d19-20020a05620a167300b0078a33f9908cmr1816540qko.36.1713520184948;
        Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:08 +0000
Subject: [PATCH v2 22/26] media: tc358746: Use the correct div_ function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-22-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_024946_360412_0CFB1952 
X-CRM114-Status: GOOD (  10.92  )
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

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.769.g3c40516874-goog


