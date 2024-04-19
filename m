Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4E2C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=; b=VjiuVewzjiKSrDVic9/yg4ZNp+
	sBbB0WF5BJKQ9HWEINyjAcGmgeeM3R5RKtMbHdse92GVcHiEuDJkDyekyLEXLwN2NFBjZcl0+ycX5
	Dmt1uZKCnv1zZ4V8wIlm7Tw14ZnSXRKQB9l8UHsijL58O0/zC45cDuJ9uAb+w7xjqrD9vof6d/vRq
	kwyzFauUoUFATNBETGczFJdHln7CjtTC4ZQBszy4g4/iNLg3OkEHACJtUBEbCJQBz2lNqsU8u+zpD
	HYdX62fONE8yG/f9wbqlGlCr839ojiQ83XbIZto4tVdUrksfDZDimwwgk2ZCOQ9itjpUkre9Onfvb
	Px8HtM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxktU-000000059mV-36Z8;
	Fri, 19 Apr 2024 09:50:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksK-0000000596m-3Zrx
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=; b=UKgB46AU5QKTbvT6wHKEbS4Zkv
	HkK5A2jtrRY9rgQfa9+3iZ5VDzUFcIovi9+wR/KxjtQtI0/Ny7UEzitayuvTMzg7fDMPLLnRw86kr
	a/k/+7zgsA9s52UlqWpYw8M+3NvyWssuhpS6bwRDnV13674gVydS/kg987YAVniA4MQ3haykvTF10
	nPqWHTRB1OqlQr6uVEJnRl2+oyRVvWdXhTvBn4CNpicw5IqI29MowLTsotDxCTmEBUHdatjdAO9bB
	WQrNrnlG/bOUGMT0AQUzBEsvClVaKyImewz2rKmEBIw4L4JimrEI0iuurfpD7wEvhAsj0mn1SDE80
	BBBfDdMw==;
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksH-00000007Ngc-21pt
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:43 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78f0417b36bso122485185a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520179; x=1714124979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=ggPO9ZX7KrSid0vexvetqKBolc5bHVG2VRSu3o7yhmS1CQRaxrKYLMYPNnuUjcW30a
         3Yj7aFB4Ek162Av6XHwXTIHfRgp9HmutYqxT5YKvRgZZ+0gZDyXwWtc4daFv0p6v1VC9
         zkXUQTi7g579wXne9XnzSFI+A1/xrinJ1ESqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520179; x=1714124979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=cml/K9f7MQW+Y1O8V6O0v+SOHdIUcxQCNfUbR+lFMR3e3Ax2RtAOANPP1AZPOouhNN
         2O9K15hiCwOTV/cwcRnSIXLCfzwmZw9m058am2c8Xg1GbKsj4y5+TW2g0Z0XDKy7tSY1
         YAtb4NdvE/ZBaekGZ8JSQGum5aIuSEmpiHlh6Z/tJVMw6Tc6I04IojNYGKwjKvRa72CB
         HecvdWrW39+ZpafjzIc/QrNc7eh1lYyk2gIDAWGm1iVpXKxc+3j8nZ07byK5qDUfudB+
         B4WdUbF7M5cUobfUnVajhe35/Ojnma2sZpBsJAmjG4/mXfv4Da6vNNh67UuSEs1EPiXr
         1qdw==
X-Forwarded-Encrypted: i=1; AJvYcCW11VcwpcdgEX3dRexSnFjgw9DNFxS3g5UpAbdWtRXuZ7n6nMfV7eq1NBSy8GGcqew6rmJzItaG8d44Khbqaw0BWPBKRJRCaF+VhSB5sclBWiSM
X-Gm-Message-State: AOJu0Yx4t+OyIIJPkefWzSNx5Qk4w2nNlfLTqFv0K6NT1rw9m2iCFAeE
	Vx3dqlc403AdE4VRTjETl1hRCy8RzhJdEBWbdASQLzCfTE0rMM7KveeiGSks2A==
X-Google-Smtp-Source: AGHT+IGpZ3ldVVwdiWjuIy5SwcAIMUaAxjtBaGve9bP2/gGFY6jCFymehsQebGC3Yx4JbEu/ovs54w==
X-Received: by 2002:a05:620a:d94:b0:78e:fe1b:a601 with SMTP id q20-20020a05620a0d9400b0078efe1ba601mr2205140qkl.0.1713520179012;
        Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:03 +0000
Subject: [PATCH v2 17/26] media: flexcop-usb: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-17-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104941_580455_05BA4792 
X-CRM114-Status: UNSURE (   8.94  )
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
2.44.0.769.g3c40516874-goog


