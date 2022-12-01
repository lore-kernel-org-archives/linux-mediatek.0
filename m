Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A051C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALhdSAWsghUtCus/0uCzkcW2mIgHq/m8cptp/lUwSm8=; b=d0E/M00MDxmBgQGBozGtIIJINs
	4H+N20pCzPss0/oqGHM4yG27JHdw3ZiuxoCDcGIqU2kzi4+sV0WJLvodR63ML3czqV7IWXn7z6bkO
	vNVRmOI8J1rlowwiVceyy47tvekfoRM9bF1+SR1qGM4E312eQnzNanlHkd7AUH7vqBuCGWm6S0Svc
	iDzham2kdAHAkpINat91sHu2xdkxy1vBWuTjGuRZRfI+sq/+mdLwJ4unfNM8kYiWbIBW1CxgXty5d
	rSyK0F+tU019EoBzBcFwCYtHR/jBPZfUkzSn340zz0znISzOcX198c1eYF3qIGExHeLp8cm+sNM8I
	Jnc63/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fcV-006Dy7-SL; Thu, 01 Dec 2022 09:12:39 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fcQ-006DtE-U7
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 09:12:37 +0000
Received: by mail-vs1-xe35.google.com with SMTP id k185so949217vsc.2
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 01:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALhdSAWsghUtCus/0uCzkcW2mIgHq/m8cptp/lUwSm8=;
        b=Of0kh94fnlxSCsdiTYxtv2RE7VW9Z88mWIB1zYKB8gIOj/TP0UcYpIEZ3A8aAWTQSa
         CRxETJdf6LJi3Ts6AkhEPxKvB1kEjcHUhYjljn0vVUsuXSlGffqnGoElOFXQK3TcBE4M
         bEQ4YiR2kv7KDz6EKDjYE9lHKgebvbJvQHBsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALhdSAWsghUtCus/0uCzkcW2mIgHq/m8cptp/lUwSm8=;
        b=ow7YetbF6I9AgFtXnZMetZasjOGhcCLhXSLNzkgifd3sbZu7bjh1NAQPCvdsw5Bo/x
         KeiDB2zytMJ624874AFFALf/rPt6QQM7rZ1igp97MoP19zXkGgMTBGbnzyDSyhJPzmDO
         vJYrjbfV72xUNZznIwLNdC8kWkl9OF02Gfdj4AFF1wDlUzwE2W7auXeuAttEt1yjcdXa
         VCHaFfuv7gqtob7u+84dOcGalr4dokQxQpLXKb3lGbDNrVqCkvWB1DC0EWdiihzMirYD
         IH/+6gLfb4T538DMNPIwM1JIB4V80uQhGJdUy78gjvV9e+jpifCYIlSevimZhd7ROi8o
         I6hA==
X-Gm-Message-State: ANoB5plgDAfx4qRvXKbTZOVXbIFM6c0smCqwVrAg8pm0NittB1RdNcdZ
	MzYek4JHQk9ZtrrDfyyUSOOyimD06V2bv3XGglxxtQ==
X-Google-Smtp-Source: AA0mqf5pDznuHdDmJa9FSw5s9Zyzj4ltqrR+GmrxSGK2M9Q3odMRAnvw6pHvQG/QVV0dO+6EmPnGmOEejJGbGfsV6Lw=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr13239162vsc.9.1669885952671; Thu, 01
 Dec 2022 01:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 17:12:21 +0800
Message-ID: <CAGXv+5HVVYb2RGE+dJ7JWpoJ5_QDnvvFEn=xo+17it-OFDCMNg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add vcodec lat and core nodes for mt8192
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_011234_989708_3C106F35 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, Nov 28, 2022 at 10:38 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> This series is based on linux-next.
>
> Change from v4:
>  - Add patch for removing dma-ranges
>  - Update child names to video-codec
>  - Update patch title and message
>
> Change from v3:
>  - Drop `vcodec_lat:` and `vcodec_core:`
>
> Change from v2:
>  - Add a dt-bindings patch for changing "vcodec" to "video-codec"
>  - Rename child names for vcodec lat and core nodes
>
> Change from v1:
>  - Replace node names with video-codec
>   [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>
> Allen-KH Cheng (3):
>   media: dt-bindings: media: mediatek: Rename child node names for
>     decoder
>   media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
>     decoder
>   arm64: dts: mt8192: Add video-codec nodes

Whole series is:

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

