Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=; b=2raDJysLRbbi74XaV0J4U6nKRL
	wiuC991iYLQUlX5kCwpUp7Vz61nj9IhuB0X/TwgSIsrrwR2YqtD0AbknfSD/dF4HpXD1W2fvSsiFJ
	2W/QLcGwO+yM1exrYI2sTbWs/5+SPXyKebAGauyrXbboVaXMeeZSadLDBk8gUWGt5hJTUfZ8Fmojn
	ZidIYkpDrqIDjl5oM91Ri5Zc3CbGkujaxaPqHF0WSGYk+qbMO4QJk7SLiSWw/eBFjIfyt5IjldTGo
	SzFE7Jbv9Cx6wyhkXPBFzzlW4y4iuZ1yQd0ziXKeFNw6bVtqQgkZ97mx9DeFIOeIdL5SD/QnMOMXa
	nmCJtbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkur-00000005AdC-440a;
	Fri, 19 Apr 2024 09:52:21 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksJ-0000000595s-1ls3
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:51 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78f103d9f64so86945385a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520182; x=1714124982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=QKkjF/3ZrmyMjLI6PZxoR71eYFuXqsl1p6Fuz8KRX9DkFrcMN2d6dwujihI52umbvI
         lUhB4xQAyDW/dE76sa+lWCYRyjthZD88GDfvdsWZ0aW/9++SSDWiKe2oVNLBkjaRDRaX
         x7m+9nv8oPgF+4j9uy/gzICZcD2E0fIFj3ZKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520182; x=1714124982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=qzfu8xuQV9RzA2IfjrEsdd1rQ+sC7YQF0S2vIlPaL8nKN2A/kaHWv8MO3CQXEYUJJh
         uG/ofp+LFTsUL5Fc7MPYFo3AD7QYG/4B1SpBag/6+HA3yeMSup4OMsqDasYbOBTMh4z0
         RxLkPY4RElH1hDSpcp+K4e/dbQHmexSwZT/Os0QggA7rlXfwWIkQjybsp8biQ8FDMPRS
         WA8Qp5aswr2hZgcc4m2zqoLuIEQKJPW5uEv2VTJlT4XrZDzpJ2FpguqsU5/TEOjozwwJ
         Hhu5WY0dh5PL0ClI6d8pppfwZJJ4QHeta3SQiOy96v1z9q6a2mwWnOLSsZJX1X+cGsf8
         DMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4FOpJwb6cky6a9v8fr7BDP4+aB/5pAQXL6rFRsBZOXWc5zihCDaDrpuU7umiXRY/yrQ/FeQACZJEsAQiUSyeqqdnS4GSOI+49oW0nrY5prDj8
X-Gm-Message-State: AOJu0YxABxCZC5wc0AXO+ZKV0mtHvT2eqK3ZMF7X13zDHvkqvaQfsWV8
	DgCcnVfjAyuQDvjTuQFFWftY87hfFGUvK+tE3wwMahYgd5I9IEzxMvKI7WW9Uw==
X-Google-Smtp-Source: AGHT+IEXhcUKUor0dxuV3thvzJo2y+QPxtJebfEt+tWOQcWOyhTJf9Fve6oWEuZlRhBFIInhoP8+Wg==
X-Received: by 2002:a05:620a:956:b0:78e:bd2f:1088 with SMTP id w22-20020a05620a095600b0078ebd2f1088mr2994401qkw.4.1713520182200;
        Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:06 +0000
Subject: [PATCH v2 20/26] media: tegra-vde: Refactor timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-20-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_024944_128515_6152F1FE 
X-CRM114-Status: GOOD (  13.28  )
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.769.g3c40516874-goog


