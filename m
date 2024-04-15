Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2CCC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=; b=GMOryjJQVLObtqr4hBVB8rTVng
	Ppe7oTcbfkNm7dhTjiONDKYQOUOsvhrDeV7woE9i3WVlbzBQFbeRJOKQ/LJVphivuc3qMbfLOTutR
	t7BI5ojRwaGSS0UlSqFnNRN+AwoS6BP/p989xKdq2r3e+9y4Zs4nqb5585WHJqKizlp6VotQdoAqm
	waPqKpbjheiK7c2JTtAA26gLuiln7nrWAIiFdAgq5s72RpVgzbMFw8Xz8Ncn1V0BPx/qdgs8TMMx7
	9/qaAvKzXeiJ4/o/l1tlxFd5kVUC1pEmNyDjvPyvJXMKRARlQjKu5Y6ULRFWE4PTOhE5Cn/81N1K+
	/0kveuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS8C-00000009dGy-3UJw;
	Mon, 15 Apr 2024 19:36:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6P-00000009c8A-2uMk
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=; b=B+QlthqxZVtkaJkC1jNBGmcGhX
	oYbWWkceCtk+9FsJ3FypI8JK/K4mc1UhQy9mthOs7tt7YtcvQtv/TUwJcI3q1qnl9v/j0HEUEeF8f
	1sudjgMXnTP5AjxObbzymlSmI/BmU3PCGj+sUTaf01X8n1kmdDeHzqY1jxh+2RFgoBxtfTVFmUflg
	ptWmAAyObdzNI6+biWJ/WE9R7EOzPVG6y9WtVFzf35OXJLoJbZmcL6rKfrLSp9wDRtnZYmTH9YW6w
	yjHjrbkY07ylosjYAduYbvWyJRijYIB0Bns5n87ExkC9c2XnG2USfT/j9MvChsAvXr8XHw+Pbnbnv
	7NAYrHbw==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6G-0000000Aigx-12MC
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:51 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-78d77b309f2so322273285a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209682; x=1713814482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=;
        b=hFw6wclFwy1pyO5pPFOTfhFW/TwFmXdbFGLEp2Nzevm2WcFmQE0BSwoLl3IsRkAAJe
         FvkqWMtLzvfiaAzKh7hbQfNVL2MNUCDIKEyJuLIAbt91Rn+LX6FuklS3KY1gvh+kEsIp
         7YC0w+bpyvhTZXxsp6TRmOAe0YwjkJiPSt5hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209682; x=1713814482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=;
        b=ezp0HJ9R3RfkUXrGfjn/aOqmMCvI/22AdKdrlKlmQlEqZgegBJ1fL1HfcXfRwq/IcT
         MXdIMHKhjb0W0ycEb60q9nlrGLdnAuQfh57gZfjYVWzb9A52WLayS+bdB4dmxEHg5+OT
         lzQfJDGMKcCxxVZHAVNcPRtRtx2HzHpR6AXq3coxNqcmiNGOMA9iQbks7mJKnGan/NRJ
         5EXVcgcyqS4DstO0URVk2poA2WXlm3jmsPi4QLIU4gpCLBJkTtgv2ZuQIVklYk/cyJin
         D4mfMX6RHbewoQ2GLxaIfbCo46u/pxW+8lTOTvjaZj14YttC812vJ/4Twz9Hkxihe9aO
         x0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWJuNyCZTthJN0/i007CsPPnLKb8709jO3H3ryvLHdE0q0egP5nwM7RPxkblJbTyeinYFl5m6+dNl9T7mJfBxvuTGZ1f2U+9zumYi2udUcDcQNK
X-Gm-Message-State: AOJu0YzORRCVp9NfSjQcNzbxbCvCqadrEc8aahKn0zkBjvrjN+4uiJUw
	lLo8LOA7XYfRonxNEZX0jH8BNhNHK782e3cumKOmVTidvB+gd1fpi683GbWTIA==
X-Google-Smtp-Source: AGHT+IE+3KdNYzINGLb3rrR3dbCdrA74Ddhjd2P3YHrcD0Jca/9uMwZH+j5PP3pBwpJxZ8tf3OsdUQ==
X-Received: by 2002:a05:620a:5a6e:b0:78d:6786:7637 with SMTP id wx46-20020a05620a5a6e00b0078d67867637mr11767547qkn.71.1713209682098;
        Mon, 15 Apr 2024 12:34:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:30 +0000
Subject: [PATCH 13/35] media: common: saa7146: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203447_216243_FD97D108 
X-CRM114-Status: GOOD (  12.65  )
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

Simplifies the code. Found by cocci:

drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/saa7146/saa7146_hlp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 7569d8cdd4d8..fe3348af543e 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -122,7 +122,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 	xacm = 0;
 
 	/* set horizontal filter parameters (CXY = CXUV) */
-	cxy = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].hps_coeff;
+	cxy = hps_h_coeff_tab[min(xpsc - 1, 63)].hps_coeff;
 	cxuv = cxy;
 
 	/* calculate and set horizontal fine scale (xsci) */
@@ -151,7 +151,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 		xacm = 0;
 		/* get best match in the table of attenuations
 		   for horizontal scaling */
-		h_atten = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].weight_sum;
+		h_atten = hps_h_coeff_tab[min(xpsc - 1, 63)].weight_sum;
 
 		for (i = 0; h_attenuation[i] != 0; i++) {
 			if (h_attenuation[i] >= h_atten)
@@ -283,10 +283,10 @@ static int calculate_v_scale_registers(struct saa7146_dev *dev, enum v4l2_field
 		}
 
 		/* get filter coefficients for cya, cyb from table hps_v_coeff_tab */
-		cya_cyb = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].hps_coeff;
+		cya_cyb = hps_v_coeff_tab[min(yacl, 63)].hps_coeff;
 
 		/* get best match in the table of attenuations for vertical scaling */
-		v_atten = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].weight_sum;
+		v_atten = hps_v_coeff_tab[min(yacl, 63)].weight_sum;
 
 		for (i = 0; v_attenuation[i] != 0; i++) {
 			if (v_attenuation[i] >= v_atten)

-- 
2.44.0.683.g7961c838ac-goog


