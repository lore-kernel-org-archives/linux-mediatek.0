Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B774EC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=; b=d4/vGicIkJwZo7x+tMcfGGV5jL
	UNHPX071LU+mShWxg3K8kq7C1tKALHr8ba+FE0TdYPzglggsrayFkgkvaEk6PWBg8zg70OtmlfHNl
	evCyGMgFHjSrJZQs//fjrxUxQRxi2KpxbvDQCOsudWIg1t8FGBO+1Z1eSU9QG8s4j3ozVUz5GFNv6
	bx2JNMriCGzII9ml2JRyE5DEpYXofiQKybz5YwcwSJT2T5kflgpOr1ROqnvdGfHRaxaH7eCodJk6R
	07KMcrAzaIzSVVp/zzl6kJru2rWCilgTpVjB1WQNCK/qe1BQdthFDRNqT6lFeCNdotgsgTXUIxGdq
	6Jw1mAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSA2-00000009ePM-3xdo;
	Mon, 15 Apr 2024 19:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6c-00000009cLi-3uYt
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=; b=iCfFJND7G0CX7598omwNzfmmxp
	xMJqC83eKjZjgpVNABuT/lWlv27mCKb0IO1f1QjgFGtRkYFs2A3XqY3PBaVVBmruv5Qqdqm5lF3GX
	jgmlh8HJg5gZbL08PMIaad/Bh0/qQntQ4QuHXzrFvFtNcPUZY4oCIdSaqF3fxCNxYxldAGLJLeve4
	FG40r6Obmj26knJnBcrGExRvdxHssMN7wba4AL+HToClC8tF+n52y+gFcz9Ma8c1WUhkl/vlc64Sz
	cpKWBKQi6ZPPlpcLGncBZKy86kGoKhYUpZrhCeXlhwPOiAnWFkeq4VbX4TCgRERDsJqVWeagKD+NA
	GCf9294w==;
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6V-0000000AimX-3qYY
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:04 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-78d777d7d1fso282210885a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209698; x=1713814498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=;
        b=fFf25N1WQyBeYVWem1bBuZV5YhE24VG3SIcnOLE6O6DcePV1ZigeJWhQIDuu8baOrh
         P4DMd5ab0dDRk68aZmItvF6wm6ZYDJF4YdQSifDbf3s6yvO9Ji8InOPMy61ZWT9AnXDh
         RBDsfq6xuSe25uQz6KhM+KV34bPz2XicQv8JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209698; x=1713814498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMZCcGT0at/n2sdsTlaxf6HXRDJtJnjvmf8GQe8Iq6Q=;
        b=Zx232NY99eG1ihD7rhiB4lVPqfoK4qPH4phNoz7h59OHDco24HDDq6BM/LZNkIHW+8
         ohKWYfaRpg5tnf7BXeKmqdjuQCcbw/Tw1MN1ij6dUZuXT6myEMiWNRArodAXBEDV8CJt
         berjdChgF3XGuSPTaBZtr6EZ4Z3syqKZChgdjSvUuu/gjAdvljOxsfo0fm/k0a9vVPLA
         h3zC+xfaCKsc+vVgfNEVX0+ENvkXZ5uaU0JGuZ9bgclJWC+CKHp4+ujxdn0tBQhVPEOB
         vYssJicYzFB0wMpKU7dJh1fOqMWC2xiYK97UrBddfvluTa4uxKlTjJB+jsPTDu9+fZYS
         i+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXTxbdVnD3WuCtBhw3u0inRMVo/Vla1DBE1ph5fLoOsvslQEeorB/2JfMIkQId6vrmM7pkwiil7x5LX/KkksenvO8IhKPbDEhA98k4etqyQ9JTj
X-Gm-Message-State: AOJu0Yy3rTe9FF0C4SP8hv9kbYl3ztgFPn27Rn+KP5cC94sdgIiSlRjO
	jfkvsegagDI5D06JqvU0lpDWLbBhvTPbveNJWAt5hC6beXYAO7GZ0qCX3LAdWA==
X-Google-Smtp-Source: AGHT+IH3ksUcYlN9cp0k1WPEjfsSCCPteMBHE8e8FR9KC+RBDbDTxTGGbvdceo3EwW9xNOFzS8IB7A==
X-Received: by 2002:a05:620a:469f:b0:78d:66b6:a786 with SMTP id bq31-20020a05620a469f00b0078d66b6a786mr14598431qkb.35.1713209698470;
        Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:44 +0000
Subject: [PATCH 27/35] media: dib0700: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-27-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203500_325429_FE9645DA 
X-CRM114-Status: GOOD (  13.87  )
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

drivers/media/usb/dvb-usb/dib0700_core.c:67:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..b2ad2d0f76f8 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -64,7 +64,9 @@ static int dib0700_ctrl_wr(struct dvb_usb_device *d, u8 *tx, u8 txlen)
 	if (status != txlen)
 		deb_data("ep 0 write error (status = %d, len: %d)\n",status,txlen);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /* expecting tx buffer: request data[0] ... data[n] (n <= 4) */

-- 
2.44.0.683.g7961c838ac-goog


