Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB66CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LiF4k9mBk/L6jX0HDxBilSNT1MrvVtHmyPQFXo4Knc=; b=REb8JMlaPmlE2K
	qMeoIDGFaZbGn32JpTcIPzGbLV2B6QyHTiMfjX+VJAEZmw7WbnpPKrLW8p+miOPoGELxfGr80kt62
	hvPcXDiy6S6KaSMgWS0V9AOjL7MtwlSqhMKgs0OpMBYichjljrP9ZnOv4ZuqgLnGkwLkwLravBm3D
	91p7qwGVQrJSq5fER5CguE0vlkAFKAh6wndqRZg3LhVFb2hr+vSBPskEuno6RbVpwJ2XJz65QAFJQ
	rA2BU6+dqE6MyK9+n3NxKE7ZiwWTkamE5S77C9NnpDyiPQduNH01EWD+gOKipvHrkPgPbjUHvu2uM
	t6O3h8JJrRF3Cmlwq7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8mn-00G00E-Vg; Fri, 03 Dec 2021 13:39:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8m9-00FzmF-It
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 13:38:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id r11so11563018edd.9
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jZ0k65IEv+mkTjXj+Hsssr+TTC6PuB+uri2MNkshlgg=;
 b=QdEZ/4DlPgf5qAJIhxS4IiSzj47x69iMSbtz+4keNZevkJKHBOQ6KaXs+ONRRpGca4
 eLfvjCq4/SdlnzYvfJgbw8xWtg/stWatgwswPL+eJ+PjKhoD64Q9NPb+IiJCAujLdP86
 BsS13GIC/MJa61NY5ljnuOssYsukUWJjZiYlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jZ0k65IEv+mkTjXj+Hsssr+TTC6PuB+uri2MNkshlgg=;
 b=694Cc4hTMEMx+5v3wNqAIDDeerw966l0EsjIaZ0c8pjyHTQ7s2GDSQF93u+2cC92mg
 ZFU5ymXK+dT7QdDa5r53F/l0ppCER8FZSYZZny+3st7SrFZChvk7P1aye52JkZGj4EZE
 uhPitDxCz7p6fsESueJWxGDAi8KtIOEvOywlmHMjl8CkRkkSFHnsQOz41i8aXGFydMtz
 Vz55t63dt2sBZTeJLh4RX14Y1oaAkjLtVNAC3c3sRLt/aBJ7WdeZmrIXdjn8Amg2swh2
 MKb6Sb3LoU3O7vIIwdvVnWMr2jhQcmpzlln/0hVBlDoU+YF+JHI1yDLU0DHFmjfWtor0
 wZgA==
X-Gm-Message-State: AOAM533ozVotXoHQ1RP3w5Hj4kjZyBS3vxcQYLhNw5osH7cyxvUaqT6m
 1/Ov2uXUv4sqs7b4QFIvgjAmKg==
X-Google-Smtp-Source: ABdhPJzuITPnpzlSsz+9aNcFmFcrY+OtVEN7ewcsLzPDRrY8OL090gK8pD8o0pIwVC2mE1Ynmj9yMg==
X-Received: by 2002:a05:6402:2809:: with SMTP id
 h9mr26838816ede.351.1638538734105; 
 Fri, 03 Dec 2021 05:38:54 -0800 (PST)
Received: from gmail.com ([100.104.168.197])
 by smtp.gmail.com with ESMTPSA id s2sm2246751ejn.96.2021.12.03.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 05:38:53 -0800 (PST)
Date: Fri, 3 Dec 2021 14:38:35 +0100
From: Ricardo Ribalda <ribalda@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
Subject: Re: [PATCH V6, 0/5] Support multi-hardware jpeg encoding using
 of_platform_populate
Message-ID: <Yaod22NaGQveuevu@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_053857_649379_BCA7FD14 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Any idea why this series is not available at
https://patchwork.linuxtv.org/ but it exists in 
https://lore.kernel.org/all/1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com/#r

thanks!

kyrie.wu wrote:

> This series adds support for multi hardware jpeg encoding, by first
> adding use of_platform_populate to manage each hardware information:
> interrupt, clock, register bases and power. Secondly add encoding 
> work queue to deal with the encoding requestsof multi-hardware
> at the same time. Lastly, add output picture reorder function
> interface to eliminate the out of order images.
> 
> This series has been tested with both MT8195.
> Encoding worked for this chip.
> 
> Patches 1~2 use of_platform_populate to replace component framework
> to manage multi-hardware.
> 
> Patch 3 add jpeg encoding timeout function to judge hardware timeout.
> 
> Patch 4 add encoding work queue to deal with multi-hardware encoding
> at the same time.
> 
> Patch 5 add output picture reorder function to order images.
> ---
> Changes compared with v5:
> - use of_platform_populate to replace component framework to
> manage multi-hardware in patch 2.
> 
> Changes compared with v4:
> --No change compaered with v4
> 
> Changes compared with v3:
> --Structure patches for consistency, non-backward
>   compatible and do not break any existing functionality
> 
> Changes compared with v2:
> --Split the last two patches into several patches
>   to enhance readability
> --Correct some syntax errors
> --Explain why the component framework is used
> 
> Changes compared with v1:
> --Add jpeg encoder dt-bindings for MT8195
> --Use component framework to manage jpegenc HW
> --Add jpegenc output pic reorder function interface
> 
> kyrie.wu (5):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: manage jpegenc multi-hardware
>   media: mtk-jpegenc: add jpegenc timeout func interface
>   media: mtk-jpegenc: add jpeg encode worker interface
>   media: mtk-jpegenc: add output pic reorder interface
> 
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 287 +++++++++++++++----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  91 +++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  |   1 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |   3 +-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 316 ++++++++++++++++++++-
>  6 files changed, 644 insertions(+), 57 deletions(-)
> 
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
