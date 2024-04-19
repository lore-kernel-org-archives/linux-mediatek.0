Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7676C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=; b=ic9abSvTAtZJYv9tJA4CN+ib5t
	YhC9TuuwxjIyZaLFI07Pr3VOI1vJEHKQoYmUACsWGnkrEqUp8DxKPq9aSomVyoe9jYZw3twrQXhn+
	xfRzB1mn6Ut4ChxIWgncKceo0tYteB6Y0F3uDZRc2D9iBdIec/ugpCginElf7jDn23X8KxFdyQVwD
	j9GzQbJvKRFI4a0bTipDObiwHT+sZBagH8XtJO7QIxuzLmj9tg+MtPQy4uHypW3DPa1U8qexZ4nB9
	mY5LvPZKkaVHo4BCnWHKvlKht71v2LwIGZlcGIkbWMpk238FJLt/NXEZ8SDExLKwAPFQrj6RgaPLC
	6dOH+wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxktz-00000005A5m-1Mk4;
	Fri, 19 Apr 2024 09:51:27 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksC-000000058rn-09MH
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:40 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-78f0417b36bso122475285a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520165; x=1714124965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=kFlJt9OXRDt4H25V+OeXIj5d0OeB5gTMPQ8UKFCjlEEaQ55og0bptyQ+zt01DZ4uVw
         Yiydaaq8jxGfBlWHibKowzRBkL45efyns8ikkedGVXU2S1UiehrHb/AiVXk+eN79jtC+
         P2a2q/guU/ph5J3HUx5D+krvV5n1WsY+fuclg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520165; x=1714124965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=fmz2oTW30bqP+Jn/tfhB+iyDDcpfuh0XvRs23qYPvQXs7sj7NLkUdPnzrcy9zXJAlu
         WNv6ntM4ZwvapKobqjEJGto1PUCegR7S99J+yVamKngdUfFesntCqAfTScSheQr4CZsU
         yAHLmRKYw2eUXrNpuy2DKTpA//35/233CjBZsmAX7fwjgIvAjjlCqPg3Ji8tvl/lq8fq
         HhkOxoXwIAtiy/8k1THrACRDig64nbdsXO8+VTCxQ9t24q430T9ApaOsoB04Xp53oGJ1
         J1DUhMulAJyR/wfhmB00ZC/DSxD6cWXR2QGdEQcmpfItiUxksqdOikjj3h9Xe55tHc25
         Kltg==
X-Forwarded-Encrypted: i=1; AJvYcCXpTN9FVMqMleXdJ9bOuiqVpM6KTjYFUnqPZlkhFt3C+Z4dJaNKBVfTYr7dqvR5zVQgJN/zjXm9UpmgKHKfgQFUPNo5xyOsb/vZuLYWL3A1JM0e
X-Gm-Message-State: AOJu0Ywew6ZSDB1rMh2wgG7ZIQzaUsS/93RtLZ+RCk/SqQup/cMdqmdl
	qAnR4lc0iQ1Bk1A2Yogqrb/J2jIZ6RTnuQ5UxdcmmJVdNEO1oYAR0OtaS7HImg==
X-Google-Smtp-Source: AGHT+IHomIgtJUPKBWZHNjcgUxdMC59m2s0CnNC81cRH7k5Yf23XSr3oTpLeoFOU8oA9VPTqHwEHeQ==
X-Received: by 2002:a05:620a:984:b0:78d:6b8e:18d with SMTP id x4-20020a05620a098400b0078d6b8e018dmr1691369qkx.64.1713520164849;
        Fri, 19 Apr 2024 02:49:24 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:50 +0000
Subject: [PATCH v2 04/26] media: uvcvideo: Use max() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-4-2119e692309c@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_024936_365261_478DEAE1 
X-CRM114-Status: GOOD (  11.27  )
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

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
2.44.0.769.g3c40516874-goog


