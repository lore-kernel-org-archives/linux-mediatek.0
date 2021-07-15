Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B50C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5046261260
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5046261260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hc2FPUiBGyYu1Bp2jvkE0ZxWasjmjp9jF9pff6NlN9M=; b=jf07j4cOwwIp90
	7A8VSvWHaoRjbMMFgu6Uz++wLhxe/TPodSKIDfTOaFvR81PVwQrpO1FUM6LNdESWGAjFvCtAhwIN7
	+YUMEffd8bBJfEcU1ilijoGL81cJw9TBjNwHGqUyn3QhXseqj5iNHngH0UJcfPmDHxYDIIff2x+Zm
	FION2X9gf7dakQmwy4JOGxJV1ZRPMYcZ6GbuyKQpb7GA17ZZDYjJtD9WnLOpJ9HSXE65V6ZWwuTwf
	ag15dV6qaq0xuv6XMuwiEMziejdYSrGU036iPh9B5jplR7CinaxJYibpFbWLl1yeKeXjUeC+i+Qte
	q5TA9B2MTf+2XQ6XuTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3v3A-00HHzw-ML; Thu, 15 Jul 2021 06:40:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3v2x-00HHxs-Dh
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 06:40:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id v6so7992401lfp.6
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 23:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=unaBiWnJarMH1gL7KYAkXbKz3od/E6fqsCgI629LIGM=;
 b=etu1S8miUnZsNSpg3HW7x38uMVbiLPD1tNvKTPEnOlRvEcWJzm7exG7BPJaod1ka0w
 CDa1vvopBYQX351vd75gYooym69T9Nf/RaGcFiYe3LjhfDCFhimGra+WB9snRBMOwYDS
 EPTfEacpnlvH9TbmEuvaYVdzOLBjl4lRLI9Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=unaBiWnJarMH1gL7KYAkXbKz3od/E6fqsCgI629LIGM=;
 b=WwI1cNGizgTW8PiGHRXOILuefbpDpF8z2gYtatpvftFkAwEHr5xxL19Ms1MiPLFmY9
 U+3IGeo3BaFb4bbzrLdgeNuxJ/1TnSGNJGGCKHSPgYRXbmq79utWPOWrbIPI2U9P3i/p
 7l40eSgiSMXTC6caF4hOrL8AwatBytvcFP+f65EAyv68hDdPEJdr9Lh/QkcpNTKuLVTu
 k8jxw+VWi0c7Eu59jY0zIB8oNFzwK6rMExnH7H7fj8Nm9SbirtH+fEEyaeAJT1xg2Eds
 4hXjSS3IWPuOVFYWvPQwusqHffanUsL9WBSGYoDhrfHo5XYkVy/+1pno43HC8ajxkzQB
 tP4A==
X-Gm-Message-State: AOAM530OCToLwwDuaYr473+sGj/p6uo4GZ0qPWti/A8nK6ymFVGvH4b/
 /hJmX5HgS3A+6WLnw7G0azsb+j88nWKKRYDNe3rUcw==
X-Google-Smtp-Source: ABdhPJy9IXnVib4DwY4g5a0dAWpWJk7dTChMptWv36qjycMCr9phL4RvEij4IZ7zX1gWMYsr8+0hSgzSXnmOIVcsi3U=
X-Received: by 2002:ac2:48b8:: with SMTP id u24mr2049392lfg.587.1626331232261; 
 Wed, 14 Jul 2021 23:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
 <20210705054111.4473-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210705054111.4473-6-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Jul 2021 14:40:21 +0800
Message-ID: <CAGXv+5ETE=qSPyKL6AjDtSHCDvu3Ua-rrLZWOECjZXrcNZ-9Tw@mail.gmail.com>
Subject: Re: [v3 5/5] soc: mediatek: pm-domains: Remove unused macro
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_234035_568297_8D953802 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, Jul 5, 2021 at 1:48 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Due to clk resource data will be allocated dynamically by
> searching parent count of clk in power domain node, so remove
> the unused marco MAX_SUBSYS_CLKS for static allocation.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-pm-domains.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index caaa38100093..1b8967b9829e 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -72,8 +72,6 @@ struct scpsys_bus_prot_data {
>         bool ignore_clr_ack;
>  };
>
> -#define MAX_SUBSYS_CLKS 10
> -

Future advice: cleanups like this and other fixes should be put in the
front of the series, before any patches that introduce support for new
features or hardware. That way if the new code still needs work,
maintainers can optionally apply the fixes so you don't have to carry
a large patch series forward.

ChenYu

>  /**
>   * struct scpsys_domain_data - scp domain data for power on/off flow
>   * @name: The name of the power domain.
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
