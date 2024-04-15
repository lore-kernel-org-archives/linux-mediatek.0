Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0367C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=; b=wdElAFWRhzzimEyTVYzyAWFGP5
	npCuC95Eh4jJZZssd3lTuDyxfF6v3+JpkQhG+jyvKSuiYcZQE/oC+ng3RqBN8YWhvHJsIArBXqmOC
	vxkUeLZTproRPfVUHiiE6lvd3pV3kiMv/VwiIyjIcIUdOP4T7M8Xu0W592HP2bmZc70grYjA3X5CR
	Xm8UTTL1t5M95kK+vk0rSwVd9lKDbEs7S9niIOkjeG7TMbIMwbPviqPhWsA7R27gP/465T9B8DuuL
	3c001Xy7prGahqf8zpQ+N3FPNObu/VFdt1qJt8J1Mp7aiRsuiP8ZHoUPN2qriXggtQtAIfZCz/69p
	ctaY+bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS94-00000009dnd-1FXq;
	Mon, 15 Apr 2024 19:37:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6U-00000009cDA-3vIJ
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=; b=eweKQoLFEyIcZM+danETyyF95G
	6hIhe/yhfBCAXshvfXhbH3oUBMgZCTTSjXOs37xAvShat2LqWMbS9ESjm0/7DbPI6TToRjoAwQvLK
	xubxs2YnBUAYFZl7xnWP7tEEG+5Kzb5bHALqntfLDarule93Gp2kYRGKl3JW+/x/1seGS7XVWxyAw
	CDdXiKBfVfJmIlp9XObUwry75vD72C8l40Fwz4SKtV3LZUckVeMG/8kRHMUzzWcP8L4/UiV2vZ+go
	es6ZzFkTWYaWW6uPZfFsG63JaSP2TbHcERdaBRnPMqyMdXt5dEf5CRAKVO/qrfs0rmEr6uvH2oqF5
	e+gXJzlw==;
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6O-0000000GMti-37Gs
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:57 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78ebc7e1586so472921785a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209687; x=1713814487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
        b=WgzmjuLAFtTb66jKNBzJrF9TTALaud0mHJbDYsJPi2byS7/zc7IGOosO+2ts7WmpSn
         9ntxW5gO2Nh03bkwQITozolmHqnevV6I1oZ1V7cOTUIGqb2JZ3TxEJA72zECFvmOtEJo
         IOfGgF/PlCO2X4Nn0k5G31LcAjHVszFPD34eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209687; x=1713814487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
        b=hbB9BAji4p2klVLBMyK+PkZVLpI8/SCCE+11rXRfagU7zAwLfuqoyPBqm+a2/YAK3o
         g0OjPTDD9mmuO+PBalOBk+GE76YhrPdSbdbQV/7KmzEhK/Y7bbe3ZnBStdPauA4NT9n6
         oPR5VNeDxTfFeqK4QlLAq+DzuTKmcbqzBCbt89JPlhg2cyRF33X5tPZZyjOVPflGfjPc
         iTyw/o/hEHjFuyebuahHdA/2BIv4p+B8kj99L1vkaoT9olhf/pYelHAScSaNEEHEEXqD
         DHX07SO0NUcQd0cgi2kh9JQ0rCu924T44ALelqS4f6+Pmyphl45wr7WO+zA4i8oX2Bku
         W59g==
X-Forwarded-Encrypted: i=1; AJvYcCUjVp9XLkgwuEilepxqDP4Fw1WIfLSqVm0Tphg3eY8bfSvFbdrbJMaijZiNII5exJzI51bE/EfZBOHFW8I6hmtFaeuoog4KqP8lgxhoXdAbiZlk
X-Gm-Message-State: AOJu0YxHhMRCyj23BZEG5iQTwHKxx7JxbMhDoM3SLS+LiShLDtJ5rsPK
	DvnA0cZaKfp87WQZglObCCB1qPXKMaECiw/EtJ9MCN5WEgH4YDSyUV6PQttfiAqwIvbQONnihRz
	ZRQ==
X-Google-Smtp-Source: AGHT+IFZZwBtLZMDNfJayMBU/PaT+EdKNrIoBaFoYxfd58lYWJrbZu6cOvIxZ8QNIWMRuOhipLdFVA==
X-Received: by 2002:a05:620a:2953:b0:78d:61fe:77c6 with SMTP id n19-20020a05620a295300b0078d61fe77c6mr1118634qkp.2.1713209687511;
        Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:34 +0000
Subject: [PATCH 17/35] media: flexcop-usb: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-17-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203452_954309_C079F96C 
X-CRM114-Status: UNSURE (   8.89  )
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 790787f0eba8..3ba6a5ed7167 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.683.g7961c838ac-goog


