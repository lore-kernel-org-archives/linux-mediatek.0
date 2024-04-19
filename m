Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78EFC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=; b=Ee71hdGm2zBkTQM0cIkJ0S16OU
	rF6lKP6H9EDjcrk1RM+fV4vR3IorvZwfN2c7+gzZC+svVHP6kgnt0N/4Qp8Xf5+WwXYxUnd5aAYrL
	cV4YPXuVz8zccR9NKfgn1Htt0DaeBDlGnKxcEuALkyyARgOcBlJag8V1VM3hPa/evziSwS9aYxv1Q
	sE8JEHW7M0DI9WqmlgYCnBkAmxRvrAH0XXrMwJ6aiCdfRxG4X1eduPf4i7/NgGrg3ANiumwKrvgi2
	vcalLVYITbSjsJaWSrGSAYkLTO7IHcMVq6sw+v6Sd0HpeI/NH4Sv0p7CC/6rzX7r1muR5dob57yEl
	DASf/oxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkth-000000059tY-1upk;
	Fri, 19 Apr 2024 09:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksM-0000000598x-0ega
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=; b=SWRUpfUCtNyU9EqormDlsxKO44
	Lfh+htfGCKg3XBZB1ln78hjFQflHJutDnnVCzIxp0dBi5d1Qfcpvn10R66501gWQGA1ibX5odrL0D
	Nf1ns7D6VpADFNkFqJRBGCQcSucyLIYvRh8ZIaDKRUQmSFmTckJKSIZUnoEHNRZIIeqzkbL9ngDG2
	ydN/++azjhqd25rEqBz67Mtv0DrCyVZTIfeFzvn0aV5D5c/mAZ4zvZ5n1v1UbVBh0lXqGOfOKdMRh
	Ln4B57qJaQ5ex4BfAzz0DgAMcU9QvzDxWaT6AD74QVdbXfkdyhN19ZtgHfcPztQqtJuCqsYJ+PJLq
	te9dyqQA==;
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000COPD-2mM9
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:44 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78f049fefd5so120118885a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520168; x=1714124968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=Fus2+N70S2qjvVvu0/6vtfUNPOxEf5GrzY84LMmPma3quYiDEentg0gL7HhYTvKHFN
         Bwfv/vgsyBrSpbQPAyPFgA58bM8s3TLCTtmZrPKaP8pcHB5IeMxHE05RUTyxsp/X86gX
         T2fuQ2j6BAsQYiP+dRjDwnbco4MOa95p+3N90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520168; x=1714124968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=ct2MxKPHWA9M5zV5BZbjMumpvHO1aePOZGCIgUZXvuicujgLeqbcSUAAY3NOtYVzFr
         MVdgeKS9uUiSQuQClbVy8tdStSXEC4W8kU65fnIW+s592HC5WJomiu5vTXUprdEdJdzk
         7U46kX5OX/FIgP+YyIoMB54A64qVPFGuxQNeBoN3o2DNmg4PifyVTrOnL3FcbDkrH+/t
         23f2WIPWksohRfnuuyXfwbqxLDNVd1bAD88DTcJMnAOo5eEWamrG4ptv47DE+lrYDwP2
         Oc/2u9lwN6NSl7pAww7gqMYSKSr2BJXXIm4HgwV9/uU8vRacj6a+sx+zl62bdsf1tM0D
         bSDg==
X-Forwarded-Encrypted: i=1; AJvYcCXXpngAU9Drtt4G4E/CcL+PTM9X8+033ysHRPns4a9tmSPk60IbiqmGEianGSf0RjYJ9ec6rC6fx0+1Q6x67CfZKorkSs9x0B/b7h4fQ3r428Yf
X-Gm-Message-State: AOJu0YxNWf8WbxkXEkZy8QYKhjBYXTYUTIXwk5LBjmVHBGWJIQe5jj9V
	2sAXhD9a1V85XVKTGFQvOILYlqQx73azxipxeaoUDo93BhLgfH3YPXON7mIiuA==
X-Google-Smtp-Source: AGHT+IGrWT0O4AGlUln/2gm+WlWRdrbCZXYUSj9v1TAvaCupc//lNt4+QKq4Vo16BjNxQ14XM/vY2A==
X-Received: by 2002:a05:620a:4083:b0:78e:db2f:2726 with SMTP id f3-20020a05620a408300b0078edb2f2726mr1792928qko.51.1713520168153;
        Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:53 +0000
Subject: [PATCH v2 07/26] media: staging: sun6i-isp: Remove redundant
 printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-7-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104942_172582_C3BF7BEA 
X-CRM114-Status: GOOD (  11.60  )
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog


