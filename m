Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F434C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=; b=WzHwHuO5QO4LbrFWjCpLUfdbBM
	scDbc9yZTZ522f1D8mGcId/7gPvghH8niU1ViX0Q617xvNyinqOgkFB10xve0+kBzS64a2n4xUngW
	19HVkDj1Z73PTqaM0Q4k5QTkVzH51dHq1AMjBEgxtvwk9uatdBDYQt8RCdzKyC6Gk2IVA31TtNxcA
	lB/aaKeLq2pfU9mUY0PKOiW4kvxbk4JfAeuWxBlKMlgxH8v1n3IrpCsdbHG1wSecNsLoNfdxID+Hf
	Yev6PBw2EnaG5F+C5T/1oQcLFqlO9Za7BfDPruttTjNllt7/eqZRyQq6QNnExPz0HgJUEDL7RdZWF
	uVy/pyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS7B-00000009cgX-0aTD;
	Mon, 15 Apr 2024 19:35:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6I-00000009c1n-3x72
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=; b=BvB1KLSEPP3HD0hAGF1hlODJ2q
	gIVXK7cyalUDbY0NwsiY7c0Yb/DvZKiU6j5OU/6Lxf5Z/iAFh8wlyPzQKP6QVR8crJc5Uj9+8Rqlx
	+SNxG0WMbFZ9s4KW20EF3zUI66LaECXkJdLLPmil/y3s07lHDUjGY3esn7b9IM6RWTtUDA+T15qeC
	faEXG35crlACLfmkuPvNHbKFU6s6WbRrKOHLZ3WMWFM6T6ElYwJ6i4CwLkAGZQzAQSOrkEeeeyncb
	C0rjIMuUt89uKfIH2kAuabv2opQCe2FRR29Cbe9tpa4BT5yCQlzx1zqqDNWAls++60lS8TZZtUDKd
	54phgm/Q==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS67-0000000AieW-0hFk
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:40 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6eb797e10ceso1201260a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209672; x=1713814472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=ikth4y38JiQWoY5y/3HuiOVTJOt466W4Ns+6/KC9aWf+jtNhY2RhFrMJ0X2R287d9N
         nn6PNc7wMa1T35NvydIRUlv3wnuz4R3Sn8JTMhpeP4yc4teFB802m3i3HfUJK89CoOvY
         rHYVDwJFWWIk2Sf6j+38mlPnRIx4swiUk14Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209672; x=1713814472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=MLg6v7uR9WaK1rAQ0+hLMHzL2D79xPi5hxUwzd4BCl79cA2uIau/ipHLGyal6tgSW6
         u+QpP9RDSkYqh31j9iS+8G6pai7CGKbD+IDwHFvGkB2KwN4keX9xNijmbX0ZQgcjrB1v
         L+LRqSZ3LjcqVmfguC5R8iOPhM3MsSSyY6grk2nrhnjME/RtFbaN3jOYEBkgtoK/DdJi
         nO+TukS8uV39gplHQYVfoW2+olgJx1PTj//5ab3IGMkhOie/j2gSNJ36yNUtgF9AZe8/
         /onUByLDKl/h+t6Y+XqUnwHy7Hc7PKBtlf11U+JE+/snKYkt/3hHUM8ozXNolpqh0Ush
         klDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfUae3/Of1rS988dylcs792QstG3qmEYT1UQCCw+JoM5iwglbBu4GLEwZdqUk4nNwoGNbUYkvQ1CBT/kSuzy4C3pj5ALZYyIL2MQT5i7hGjhxq
X-Gm-Message-State: AOJu0Yxjrnv5wjPvpmaymPyaoumSRHQTqrpRdeNGPXgucRmXo9EiYryN
	rR/x2Ae8QYNIB7qmYuuaTC2OMjNqoiardPMDYD7ozQaFmAXOP51Lqil0KJzKBg==
X-Google-Smtp-Source: AGHT+IFajy4caV38o9egD00xBm8+r7fFdvax0FnbVE1biamOQ+jag9WqCsqV4RWMv5Us6Un2NRlLiw==
X-Received: by 2002:a05:6830:14cf:b0:6eb:7a07:8746 with SMTP id t15-20020a05683014cf00b006eb7a078746mr5458830otq.31.1713209672276;
        Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:22 +0000
Subject: [PATCH 05/35] media: go7007: Use min and max macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-5-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203435_955267_033E67F6 
X-CRM114-Status: GOOD (  11.56  )
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

It makes the code simpler and cocci happier:

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.683.g7961c838ac-goog


