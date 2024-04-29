Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335CFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=; b=XiJ3Vfd/Pn7iwHZZ8qd2r5QVjB
	pViaYOMuYx8Etj20WeIayKzNTBHpS9DSofYK8Evj8smbwKDc5D8IoYOmIsxlIxdFdu3RKTupVS81r
	8YP4+NGUUnMWpJoghCiXWIOQ8nOjQlAOu6AQRbfL8Xw06sNLk7J+A4yPraQCx93ndcFp1yZIMSLPg
	TfIN52hpbpY+AAJsC0kA+V2liJnv6UM2twU3O13lW2x+uAvITKNyFbcNRv2mzViK1X8arHB6k5s3h
	wR7s2lYAC7nHZEHnsFeaGijTMrK6kKRQHnOS14ih2SfucZA4cUDGCPbxGkNOPIZQv9HILf5bzK2pv
	r4PUVqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PMI-00000002UPm-39xx;
	Mon, 29 Apr 2024 11:39:46 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PMG-00000002UOy-3g4g
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 11:39:46 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7f04901d456so698587241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714390782; x=1714995582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=PTqy2MBjmScTiUeqR0ROSJYEioXXzNjZye++C5Vv7pELdejHLvJYcZDuwXdVU/IJDz
         MveMKC9oxwMRIEO27VGYP5l5LhJPlJlYZyMe9Je06NzcVeSz6aHGBIpco802Tfr55lNm
         y5DD78mndpEvhzHmtxCtTpYei6DV5icenchrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390782; x=1714995582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=XvGWEukIvQJAL2kfD7PdmA7RbBCLXdzRPLaz1f269DirjFh4nqNS71rvAqyyXDJAlR
         4oDprI+p84ul31zESHiBATvKE0NeH2wUo0rACckGhct7rsHEhFgDPZHG56uQnJhIVCGV
         ZoXUQgGxa8JAmm3hv/eZm4+WVFnkaIClyGsY49WrKzUDLRSGDJhfOwqDoQpFqDzIRj50
         B4TpSNYiWgyas11QxUrjxy6NmSA1oWZxlWOvNUz802TPyOX1hdPS+aKzBuXO3O8MeUEa
         K4nLKAaS4boerwxQr/VUAmZM+lf1id7eMaiDNzo94VeqnPVHPi2vuB4M/O5xJBp9u8uW
         j/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2iYvfI3sNvo4v5XAzpAwwIsxMNLs6/40aZ17HT3dR1MCJjhwyJgWNQkAIF/jt5xr7AXUm4Vh+mV05+w/ff3R/w+ewq/6+5fVJ83l4icKNbU1
X-Gm-Message-State: AOJu0YwYaDxO6bKdAZavagAv1auSs+JKdjQfmuOF1lVKXIVKLcrjhpS/
	tnkwzw7E4yy71fPEDywQB7iIVQYfsoe9ZD6NdOpwJ5ag3aiyNbTtnS3aSg/jz/xFtS09bSW1Saw
	=
X-Google-Smtp-Source: AGHT+IEmh75uIRGVud5QU/PmfpnJSVjeQFBzDNOAq3vU0mPNwXxf1chjQxXjVTWq6nSUJzblZglWzA==
X-Received: by 2002:a05:6102:2a54:b0:47c:2599:9d99 with SMTP id gt20-20020a0561022a5400b0047c25999d99mr7345463vsb.31.1714390781946;
        Mon, 29 Apr 2024 04:39:41 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id w6-20020ab06146000000b007ec61539376sm3577919uan.29.2024.04.29.04.39.40
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4dacb2ad01dso1049957e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV7VCK0YRqK/dF/BZ0CDx/LKfiSRbXbKxhDfm9lnlgeEmPC1TYLbel0ORIblxdZQPHKhesgL9CRf1mQ+5WXsZZlwSUPO16x2C75nbATNtMevdP
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain> <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_043944_925193_DF868679 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!

