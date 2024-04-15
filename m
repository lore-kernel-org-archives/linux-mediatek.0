Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C8DC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=; b=vywkc0aJRXY1TKtJ0/tljsB3Oc
	p2o8QSpqW8/tiP+NA44GZSsbKHsExJap8jhx8agu9BKG1pmgwZbvw7/YyFSe0YhE4LxSNOzRb78tx
	GeFTQKZ8mWmfuzUmALU6ypS3I2PBfXr5qw/dx/Ui5zC1Ku2w0OomtULwpc9k6WzlBn8v3lP0u3EYN
	4GDvxlugzNuWSCAHj1hd8XvtfjQgSaAHOqsuLf6ZQU7tHJCFJU7AgkunVZtjKBps1OQ0hS15J357v
	4mtaO62huN6uY6dts6ArSXMEpnBlNUBA9bZ4skEJZudueITW99ZDycoknDuWPFPaUF/LBwK0ZJREW
	osBoLtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS7Z-00000009cwH-2xwE;
	Mon, 15 Apr 2024 19:36:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6L-00000009c4n-3weB
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=; b=VXjPhKkZhNd/d70NWGNZZbse0y
	gnOErKbgU6K6uCHVwuiKcHh3TE/Ceg19KYONqiTL1SvaLVvU/IF6wgDOiVt4G446i/Efil+gQpR3n
	eUwM2jvr0RJJmj+Ylw3D7YkhZJ4wLWn3+VzJWfpmJYngImS+pkdjw+xRs0hxFFF6d18Sjk8+6mhmT
	XmpkjUOySh4q80qpmv/0sAQVzQeSkq/DSFevGZ2hQ4m+shvtdPGfG4nLGq+IIGCSKcWIPiYZHoMWD
	Y9VsUy7uXWmPUSew/dDFSd6/59jh5hjXmwFsEo8TR25dLARgSmDqb7Pz/iAtAkqxFfoTQmuG4kk6d
	wsUWieSg==;
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS66-0000000AieT-2YdE
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:37 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-78d6021e2e3so286079385a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209671; x=1713814471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=;
        b=gyTDEAfQ2y5Zb3DOFftNToixljDiHIUT1rJKPgzyl2z0iphZvZ0pwSrvsVjDHAICt/
         tnX9mCtpkI30Fxo2o+/m5dT/cYwZRBumwWgZxFq4iJhOLRUVjXbzLr1W0bXQ2/cO5ipT
         sD7gWcPyBx3S78xYDOFd/ZHAXBBq6GwvUeknc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209671; x=1713814471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=;
        b=FESvRoRACt7IiyDLNJQvPBD9daAh7FuibP0d1DVPDGag/dye2TMfBrJ1MMeR1iHczn
         n5M10nkgxYZj1a4g4vXEdva8o0XrJbLBDCvIIVD+y0tF4xH9RexynfYzBdYBMhI6sFGI
         xv1RMS+fWUAkRvGk5PGbjhn53S3v00CSrG2tQUUaU2KU2Ae26QV/Y4ma2IktdGPm3u7u
         TURyDwkCBjrVYjjnlWWKZb5uV5cSnri2tu0VRCaP4Ux+Y13vjofv4DCcP7aa8Lqc7Fnb
         nSEHUtRWc5ROAv/oFWXHOxas0Aqu70GcatCRAQyj7tqMAIf7VIRwByDTWZxvFOuGRwN0
         hLJA==
X-Forwarded-Encrypted: i=1; AJvYcCWCPavTVwBmT+s8Q/ryTuYa0rSsmj0yQhLZUj4ZZhVZFXNm+Tc0Ohygmm7a4gwpkiAWGCQqE5jooS+lC7lqXkSNSmn3Fwy60D8ojUTkD8mvq5vE
X-Gm-Message-State: AOJu0YzUcE12JKy2WcDsa8AGc7BRC79AKuHUbq5k0taAd3C3Bq08ovYZ
	0qtWl+9OvUwx/4YDYf7/8+x83TlHEHW0UI/kInKN0RTELRs+MVWEvA2X1aTSjTdNbOhehNXBYCP
	l9w==
X-Google-Smtp-Source: AGHT+IEqj59jRDGSbVB+H5v2oX0HE1xlFJSWXdttWaWsHugr/F+aCppE0zEJT1gUi+zgVZvdSbru2w==
X-Received: by 2002:a05:620a:12e1:b0:78d:4424:b286 with SMTP id f1-20020a05620a12e100b0078d4424b286mr11683901qkl.39.1713209671340;
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:21 +0000
Subject: [PATCH 04/35] media: uvcvideo: Use max() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203435_930020_781DC353 
X-CRM114-Status: GOOD (  11.40  )
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

It makes the code slightly more clear and makes cocci incredibly happy:

drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a4a987913430..4b685f883e4d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -836,7 +836,7 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	while (1) {
 		u8 byte = *data & mask;
 		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
-		bits -= 8 - (offset > 0 ? offset : 0);
+		bits -= 8 - max(offset, 0);
 		if (bits <= 0)
 			break;
 

-- 
2.44.0.683.g7961c838ac-goog


