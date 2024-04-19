Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD0EC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=; b=QnbtHzWrmFWcxt9mToz6kKdq0H
	N2rtAYLqtqOh1m9HjgTn/YA+VV5j7uEj5viDWl+z/TPC1gVtjwyE+vRphXNEVIPKqGvZGAKCbnG91
	Yti0nQd/azTiK9/JoDr7kOiEseB/+YiGLQWIKPY49R1eGUOAgvgXvdQHHbp7kENqSOiwmCMPuvRIu
	XrRDd+fipfj7vswSSikVWZ289v3syA7120lYAjvw0yuHjswfHoPjLbqPr47PI0xt6AmQ8j9kVrYPz
	be9JWaLvSTwdmx1RE55lNuHfiXJHYP6YH1ECjpzneP8XWdcHovZKKLsHqGRX051XjTMlAIiWXQ1BG
	ZPAs/8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvM-00000005AxD-1LKr;
	Fri, 19 Apr 2024 09:52:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksS-000000059FE-1D7E
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=; b=b421Ft/YuyMytGAkKnWe+G4wPf
	/fgyT4kgPVAZapEc8pJv4n/Elu8CchSMfgIJVaWcgsRRQW34W4dzc/GDrYSm6P6DWZXJ37zNjYrIR
	RmrQETSzaMGNtkpzH5zJCjITh4EYCDuo6+OajbEUT4KwIRue7dojmxSjo+siW4Kt2BUr8Ng3eJRnT
	OM+nYTqgPHELWkAkhXl4bS9r71kKzY8ijQUPvHewf4OaA9Jvivh+lkZICrM86JXlygd6EY59U/Fx2
	vACZDjHHPWqMZ8BEJfVNq9cTzfyOWsImOzEGGkAGLYsmAOv622W3yoNRZfGiPp3odnoK+1JIA+4yW
	EurIa4NA==;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksM-0000000COSE-1qBK
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:50 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6eb82af305dso991229a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520184; x=1714124984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=;
        b=TdlJUqVdsxsctOWn7kZrmFKVhePSJK8VGYsXuNscLx4dd3PNNblcNQLUZqnGi5+p6Y
         ob1PmG/NCSwyZ6xzCZUbKpMt8IQAmBrPwcrZhoFnUpSvGnynvBngZ6/MHLsL+Ha9U/cs
         4ETSBN1nUDOe3IwIroc7AIWQEbqDmaZ58xjwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520184; x=1714124984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mekpuuLwriZD6IkthqRlN7odC9zWZqgKPV8UcJZ7R9M=;
        b=R2+hrKASLm0IAxzjScwUHftuf2xRLXfG3e3WTD5IMOYfCnOrlX766Fkk+52OtOnuwM
         r1RGyT0nTZnhkkUYbd4qngJWpEX6yDUt4y57mEkoL8HCF4og2abAxLtIvUl1OAY7UYgu
         z8GSSiVEuIZLXxtS11ziIZ0Qg9RDKPUArnHFAMnC9zNR5Hj7IZhgq+VbMCABajtAEn+V
         ZYkDsWPM5j58Bv53arWIw0aWnsiUNyFYW2cEelxbZ5TGTlcemFqjRkQeT84vbW5VvNHO
         agQhj50RKs4gKp05hqGt4xAehaCT8+GWk6D4yeJd5o//hUegZFgjn1diLDXclxNsvAhj
         DEmA==
X-Forwarded-Encrypted: i=1; AJvYcCXstZHHksFGEM1nWWx0ygySR3U0u3LPqCx0SvJHU8/Az/2VYVRlXyagFa+dCQNg3ZF3WLXiLUDr6AocoQewLDFDyDO4SeBnLMXJBBg5IyVdIz0D
X-Gm-Message-State: AOJu0Yz+2BtxohK5/aHFY3uO5SZmvBr6et+7lHy1VZz1vNsfT52KK3Q2
	KMiLM4qQrHxeV21NXHvnf6IqDXvGpCwFv73ixfwHEisT/Caf3gNd9/zdbBOgLQ==
X-Google-Smtp-Source: AGHT+IEYwOxlb1WugYE4t9h28+AXEwcDjQAa28XJBDFMEfi87sd7BKKPg6Joa8eH6oaaPvD2ajlMkw==
X-Received: by 2002:a9d:7f03:0:b0:6ea:1dc5:514c with SMTP id j3-20020a9d7f03000000b006ea1dc5514cmr1695945otq.11.1713520183703;
        Fri, 19 Apr 2024 02:49:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:07 +0000
Subject: [PATCH v2 21/26] media: i2c: st-mipid02: Use the correct div
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-21-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104947_623754_F9E12EF2 
X-CRM114-Status: GOOD (  11.58  )
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

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
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
2.44.0.769.g3c40516874-goog


