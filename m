Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCACC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=; b=yypwCIe5qpculhw91go3kYchO1
	GO8Z0pNxVXDK6qLf3vVN0AO6C+RjqvAZ6O7BLTLKWT3C+V0OiwdZqz+j9NzfDWcp9CH4aTSbV1qyv
	suM7pVA9iE/fN9UVprTgw2Uwr/LzH8OqKJyRCp9+q22m5TGekWFs04OJJnVT+8irYVA7YHd22rde3
	gDB74fFy9fI4tHI7ll0wAfX/43QRLwGNPDSYyRmEfhEZ/JmFy8BjjKkx/cXhAdCjTv3VdLN1xfrF3
	iQD1EZkhY+IpRF2d0CnZQvBMkLPzwy3UlgOYGSaI61fCpX08+Ywj171PKlX5Kp7IhJ3ptoKvnVDK4
	rJp1FhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaP-00000003GLS-1LD7;
	Mon, 29 Apr 2024 15:06:33 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYp-00000003FOW-02qg
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:56 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-78f049ddd7dso369256185a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403094; x=1715007894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=UwbYySCupR21ZFXjOXxaAIXCA/xOh1PfFAtxmC/YL39+YOlt7qH5HZt2RSYUvT8hS8
         XDgK1M6qdXnfSbu98rBoJOyrvcB6YHLn+64dRiJeffi2LWJUIcdlMCrPj49sFcv08PZz
         qhg/ZOHkF7usrV6RPyffhy8U93fzETFqJzUlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403094; x=1715007894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=gXU4Y7bJFg3YOWF0F5ARoReheQwvcRHdgdhELqelHCJE0dsq2WyzQ2pn6wVvbE8krZ
         QKZxiwJIPXm20jOMBlzah3odiIuuVi502Bhbe/Ta/fKtBHx9FfPxHp8enHjq+0KPWMB/
         Zb4jAAdBZtwvrq1MCCOG2v9pBhW0fXQ1sLYiiU34n0hJ0U8K7PiQSRzw0mtsCABJieLw
         1yzPoQe4SaV+QS/lCJf6y8pRFbj0zGH1/DStUeIfStpVheqs25yXkZeyxyfO23jXXbme
         314URxiY+h74ZnoDgcOaE16xyOP0NBgIPgu87hWtg3HCdoiFR/B+x3BmK+jZg91Q+ySt
         Wemw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1PLCNJt3A3Ks0Vx5gNQ33+k3oWT1ds2TO1buiGhTXsCfUbFuT1L1XWeDWuxABzeB4b6C0Fa5VBHEKluXTYUe4XGKlwdjYWOeHOHPSZLDhIBU
X-Gm-Message-State: AOJu0YwLA0I/5+rnM4LBr8myDofvInNXSZ198dPvnY5Q9UtckaP5gyDb
	XLFTk0MF3D6srP8r5EsNmzsB3x/aoByAQFGt/e7aA9vPlApUtiozp05o3+g2AA==
X-Google-Smtp-Source: AGHT+IHd6ddxHUwcI+GO63TKnOLl3i4M+Xxc5o4/p3XMVcglh0UUR3rtSUQc8AjhdVbPbvMA6ElG+g==
X-Received: by 2002:a37:de19:0:b0:790:9eb8:b6ec with SMTP id h25-20020a37de19000000b007909eb8b6ecmr9509923qkj.30.1714403093917;
        Mon, 29 Apr 2024 08:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:49 +0000
Subject: [PATCH v3 10/26] staging: media: tegra-video: Use swap macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-10-3c4865f5a4b0@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080455_258958_180A2E24 
X-CRM114-Status: GOOD (  11.44  )
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

Makes the code simpler and cocci happier:

drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 630e2ff987a3..7b8f8f810b35 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -317,13 +317,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
-		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
-			unsigned long temp;
-
-			temp = chan->addr_offset_u;
-			chan->addr_offset_u = chan->addr_offset_v;
-			chan->addr_offset_v = temp;
-		}
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
+			swap(chan->addr_offset_u, chan->addr_offset_v);
 
 		chan->start_offset_u = chan->addr_offset_u;
 		chan->start_offset_v = chan->addr_offset_v;

-- 
2.44.0.769.g3c40516874-goog


