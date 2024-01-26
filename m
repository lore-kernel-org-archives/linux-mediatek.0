Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503A0C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=; b=nh+pgb4DhcuiisOhd77JqfAfyI
	KSNhMEuEkqd0OCk7iKdKh+RC7d64zFWOJbwotRgq3GqRFiezqfumV0Q5vp+Ig8/rKXLwigtwO0SXA
	wEBgHz3P+GnQorejXGMV4UO/AXJFFvYJFZLoHzE26TsDZb+k5rxwATy/LwJInnjh9OVoqczeaz9xT
	HtLtd7jl1GhI1pNlkliTMTxxxofWhP2AmwrIb81E8SxP5+QFz/zIbHxRrL38YIpMfzVvlZhk8h9Rg
	ecNljy/dw7N1U95d8O3GtF0Oz8CggfjZp05PYwpYY2iXUzf9ahLnd0F3ONLgggMkrhVV20kOTUds7
	DQYxhwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVSy-00000005kSV-1lCr;
	Fri, 26 Jan 2024 23:18:32 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQr-00000005idW-22p7
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:26 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-783dc658b59so61106785a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310980; x=1706915780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=Z3Q2UgKbN7NxcscnzfzuKK99BtRcZtmdvr43HYKmKYgkjT+sC4nVcJkPERze1tQ6PY
         SNw6ifEXLO078q7xtw+4sSp7jMLBTcGz9tv09TRJQK8JSHKL7p4/YjVmnNQGCzbMoc6z
         h+w6dbkaGi0h2cPdVxrSI1KWP/Acd1Ss6IJbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310980; x=1706915780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=rth+HXGaWp328PiEs878GqycpP4ofZXl185lNK1vMAJBeU9rAU0Am+cobL8vq31JE2
         8+fxeiB0eY5tAwTwEw+EDarAIt/yJqMpmqdx+r2wfFUx/sJpBI4OmCORwbp/s5InCZyq
         EayLCD9yKC27GOmnQCiyQLPmQUo8eqNbDP5poFWjDNDDEBZH9zRNENsxOub5SOLeC64X
         e2XeZIDxoW9P2Il1r160dj7lDDmQq1w6FTt2qCqzWK7Ne/3SDI0dQYpKUU4EkVu3V/QY
         i4+3bF8WmK/uqpXtv2N3t6Ph5EtqbZ+i0iubAlboZd1+8uDGG2T5kRDpOgKOT9SLshn4
         /hNg==
X-Gm-Message-State: AOJu0YzCjQaHIZDDl224OlEV2ykkLEDcMX3at08NkBD4TN89bOY0Ee9v
	f1EryqC1sAgu9FLD8J4zeMJMv039t/TczfyTR2MgAGYeSaJRf3lOKA3YVyUW8w==
X-Google-Smtp-Source: AGHT+IHKRlOu9LCpALD6RY5rOpayWfV+md9Ii2K85hj6JHlytziq3n5aAFRxrPIkRTY/lkweMMhnsA==
X-Received: by 2002:ae9:e716:0:b0:783:4e2:de7f with SMTP id m22-20020ae9e716000000b0078304e2de7fmr555937qka.113.1706310980532;
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:13 +0000
Subject: [PATCH 14/17] media: dvb-usb: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-14-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_151621_891217_195B815B 
X-CRM114-Status: UNSURE (   9.94  )
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

Remove kerneldoc from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dvb-usb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 0990aa4a17bb..cbb0541d4dc1 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -126,8 +126,6 @@ struct usb_data_stream_properties {
  * @caps: capabilities of the DVB USB device.
  * @pid_filter_count: number of PID filter position in the optional hardware
  *  PID-filter.
- * @num_frontends: number of frontends of the DVB USB adapter.
- * @frontend_ctrl: called to power on/off active frontend.
  * @streaming_ctrl: called to start and stop the MPEG2-TS streaming of the
  *  device (not URB submitting/killing).
  *  This callback will be called without data URBs being active - data URBs

-- 
2.43.0.429.g432eaa2c6b-goog


