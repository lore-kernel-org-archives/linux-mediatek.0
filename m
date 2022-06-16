Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA95C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU/S2rDRdJXSvF2HJYT5MX/Baf9+5cy35uV5UBnDVAE=; b=O+cCQH/6AxltOA7FoamsRJ3LR8
	GwoVSH8Oj6+7Zgw6kTuDh3M6rF5RCHimhrPPVdFruXSr1tzPjFz+qMFH6/DOUHijS1FRR8ptTlFw/
	s4KkrtAbY8aP+a1pwfkw8Sgt11ISsTIK+B/Se5c5oSydRUgtaKPAKTvUq3gqyEbvot/g+A3eAyQN0
	hjuGJwPn64khX8srnFd01pVAWH6UL/VFXX7JrqtAvXekvysYLGZNEXwhHpk3TNaTfXjuwSR8KXCHZ
	jmNax5ofuZC4K91Wg/D3oYb1OtwlZZzBh5K/ee81cA3G7zauL1wkXI2w2/Sf4VH8L8VMouW8mRm3g
	0Ujt6BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1uQ7-003ryp-SW; Thu, 16 Jun 2022 18:40:43 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1uQ4-003rxF-Vy
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 18:40:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id l4so1983919pgh.13
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HU/S2rDRdJXSvF2HJYT5MX/Baf9+5cy35uV5UBnDVAE=;
        b=UgAioPDwOol1mtX0moiIbUq+7g/dIGZTQMDu5AExU6sV7xVip/EnXbsCYhrh+WNSuv
         3h3bc+N4mJWEnpIVGGN5FXzozf+7YN/8zTSAkAwZfnleROINqUyL24D1QrqvXWGRhx+K
         OCqAZBEhp4X769KOpgSkUT89EKd/ve/Di6LiAM2REFFYHDOxtaTwUFQoTBWzPX71QHsm
         Yl6jlmv1I6C+WmgoUV0wwSo/7SeDGhP5hOb9SNMtF7Uop4RTkdB7KdgIWoftWnCBY70s
         /Wkm+ijxr+jah2XQshzjkHeeKoAAOWtzKrVhnik94cYstOcvMlmgSuELVNle2JqCOVUh
         Hi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HU/S2rDRdJXSvF2HJYT5MX/Baf9+5cy35uV5UBnDVAE=;
        b=l7u6ChfVjSOiBK+ya8psUROjgVqy/A0AJ92E10fdNSsoESTAkhAFzhWW3z70ux8tm5
         T5lYygLSIoieqRhiH8qzBk59UOK3i/SHOiOldavd4sj2/kvpf+SbMmgDbMQSCaakuLLD
         IBRDOfmullKQ+KhT92vVKkdex4CklnRIRD1RrCcIYulfRRc2Ze+VNe/TcwuBIDo7Nfo6
         YxaEtDNxuX55uA5caDV8MXDJmDk6v9NOArS7rxgDZkKoibEU+maAyLXw1QH5HtExueHH
         R5EL2DDiR0AyQ2RMIzkOw7zKM9P9wth82tAH6DL6Dt1dW/cgAQIdfbdX9vkGavWgZkyB
         HQag==
X-Gm-Message-State: AJIora/cNpZiNbFSBsAZ/bEko4T20fUFbZahzoH/IJFtR22CFpde5OQ6
	V6djDYtGEl6jOrzVnwSNuUipSQ==
X-Google-Smtp-Source: AGRyM1uTOQPUU6gJIf2RfGvYLof4xidypQqv0TIVUTH6ipWOrME4pI+sniIJ6KwXyC6IjQxxeU2/2g==
X-Received: by 2002:a63:441f:0:b0:3fc:8bd2:f828 with SMTP id r31-20020a63441f000000b003fc8bd2f828mr5506549pga.579.1655404832093;
        Thu, 16 Jun 2022 11:40:32 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id o11-20020a63730b000000b003fadfd7be5asm2148272pgc.18.2022.06.16.11.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 11:40:31 -0700 (PDT)
Date: Thu, 16 Jun 2022 19:40:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
Message-ID: <Yqt5HPIXbOab6ik5@google.com>
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_114041_090319_F1464C27 
X-CRM114-Status: GOOD (  12.53  )
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

On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:
65;6800;1c
> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
> in MT6795 Helio X10 smartphone platforms.
> 
> This combo has support for multiple devices but, for a start,
> only the following have been implemented:
> - Regulators (two instances, one in MT6331, one in MT6332)
> - RTC (MT6331)
> - Keys (MT6331)
> - Interrupts (MT6331 also dispatches MT6332's interrupts)
> 
> There's more to be implemented, especially for MT6332, which
> will come at a later stage.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/mfd/mt6397-core.c            |  47 ++
>  drivers/mfd/mt6397-irq.c             |   9 +-
>  include/linux/mfd/mt6331/core.h      |  53 +++
>  include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>  include/linux/mfd/mt6332/core.h      |  53 +++
>  include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   2 +
>  7 files changed, 1389 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/mfd/mt6331/core.h
>  create mode 100644 include/linux/mfd/mt6331/registers.h
>  create mode 100644 include/linux/mfd/mt6332/core.h
>  create mode 100644 include/linux/mfd/mt6332/registers.h

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

