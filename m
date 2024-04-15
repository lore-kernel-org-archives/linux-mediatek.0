Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D2C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=; b=xMiW9YaqiKzdyMMNJrYz8+JFl4
	kued6s1v86XFEFhly03jtEGTDvfNDp3fYORdHoNzc9Kr+yJ30u5xR2Pp9R9J1J0JAUo1Tv8Woi+4q
	iosdtehKqS7+CNUh7dWY9Mp2nytH8JcEckaOOcHQZqxnelb3HKdFlTEyDRmMBZhYQzGErfNOVZNFY
	9a2XewP/MkDVBsoTlJTq46xLuwQ9Smh1JBQ69b14iy/Gevfs5IRv0TptRVa13sUkwj+N/VWPBhlZ1
	JBUxWXbR0YCBx1gTrbfT6v8PASYE/He+rUoFweAFuxPomBlgxhApSFv3wJ9OdlZ4FTMqzinDaHDOl
	SOtzNqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSBJ-00000009f9t-0XrT;
	Mon, 15 Apr 2024 19:39:57 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6X-00000009cFM-2PdE
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:04 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c61486d3fcso2133133b6e.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209699; x=1713814499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=RBh0Ntht6WrsMyRqOUPWOykWdqUWa0+j63l5NmySLifScFl7ROidepZflIkufZC0cL
         g1EYXYWP3BPKJMMPAXAkgUYL91CqUwiZks34kAlifthfRW3uu0PMMy3VBp/KiWdNoXW3
         doFiYuYiNr/uzU6ALKXgVXkaHubbyFZxN+zRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209699; x=1713814499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=S4/BDwkt0Npg6HskYiPNy+KUhOo+fedPV8QgD+rfUEuop4VPK50qtItPGquMcfEQyw
         5SzMBu9H/CX7QCC8PyfYiPo1emaGCX4PpYIxYoVYDnv7c2uA9OGtzi8vlWVjXC2C3mq6
         B1qHTSUkjKjLh441PQrrHl/d2WUi2jE0YW3ASrllDx+s9N6XjAN6fhUnWY9+0gXsnQa2
         8QuZVTjJda3cBMEEwXsEq2ed+7h+tq1f6nV6KQDC769d5wVuUs7TYpq2E2veFA9XZFO0
         QhlgO8iA8d5I0W/q/OY09VGF5rDoZHrFlqsH6YwaAfQwXi5alynGSm+aMElgUGabpiS/
         BQbA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Bsmw9bEieGMO0AkqxNeJUGE2AoP4tHiP0BgW7ka5QIHWx9s+g6yoU/Rgz3dUfOKwW+6XErkVDkElo17hV5Qm1B9uxRh//noBpPb7AEng2/g9
X-Gm-Message-State: AOJu0YzjoS1pSdBxdbSzcBWxVLLqe/ZQjOal2i6/bELaGeE73sFp36dn
	620inVKi/3Yo2lo8BjBoEDOu62vbNDIh3JEocXeewnOd4CGjsF8wqlE+oH+1gw==
X-Google-Smtp-Source: AGHT+IFB7ej7jQ6Y7TTKmDCBXS4WSfTxH8KcZpQzoboVm109oqWmXInnRELaaHMlCW17SN5elKNPwg==
X-Received: by 2002:a54:480c:0:b0:3c7:c12:e2fb with SMTP id j12-20020a54480c000000b003c70c12e2fbmr5150205oij.56.1713209699409;
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:45 +0000
Subject: [PATCH 28/35] media: usb: cx231xx: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-28-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_123502_121353_0DD65812 
X-CRM114-Status: GOOD (  12.66  )
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

This is a nop, but let cocci now that this is not a good candidate for
min()

rivers/media/usb/cx231xx/cx231xx-video.c:1282:12-13: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-video.c:1328:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 8f347bbeeb32..bbe207d72427 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1279,7 +1279,10 @@ int cx231xx_g_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 int cx231xx_s_register(struct file *file, void *priv,
@@ -1325,7 +1328,10 @@ int cx231xx_s_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 #endif
 

-- 
2.44.0.683.g7961c838ac-goog


