Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3C2C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3294261407
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3294261407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AtNSSSlZz+ea57Y8at7SWnhOhpIMhlkFnwg+eTlpLm0=; b=nt/4DXGUvPn00J9qjtoBRu/9+B
	8fxSWOs6B5oPWjGVJOrvdnoyK9+W0INSiCS+HXP7Oo93BYMu+ByEdxY8KBkQveDomCSms+/2OPmIL
	wcyggmYDMolYBkyzgjJihbcRNyoTHAkRBrOpqQYQ0Ht/LmpYe6BmjCMkeMFLw8ms+QXaW8ZvNHDlH
	6f7MWBD+mvdqp0sS0ywE04ee+oI2N+0icymZYYiyU3++5/QEiXwSgQ4F5JDR74/CKSzW7xCq6FFtS
	L4pvVIqyQi+afcjRwcnr/6bIxBCZ/Z3XK24RaKG9UmYUBK2yByvFn5V12J1JLdOKqv/4kBwWXggLa
	1VfGxBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz0TL-000bem-0N; Thu, 01 Jul 2021 17:27:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz0T7-000bcp-R1; Thu, 01 Jul 2021 17:27:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id i8so9295254wrc.0;
 Thu, 01 Jul 2021 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+88KlZNNLOIm2DdqGH+4+ZuHLP9XUHctYTH3I53lf+8=;
 b=qXlJSeXS8ubK4FAzT8fLgFN9ZD3u2NyTmEjZrsUF4VSyVIFMFZSQbb27MKgTDTVhPH
 Vbnp3R5lCU+rSV84smwV/P5GEs1dWy2IAqFaqeyHfbTWyfQhHXDkfmxZ2fsAOcT0wt9n
 5omRV2seNR92AEfs0j8a41BGhsefYTB3OHm4UDyQRehb4xnl2odDwx9W3IaCN91g3tWe
 MHhTnodpnL8peJURrxQDSrKF08KtWZZ4rRDfPuURcYMYl5/78UxPxb7cxvFA8B8T2bg6
 Ojt4n2grs+fJiK07J0KMldANkNyWg8YUSHx8OUkKg9XNt1K5pPpfG+d+ToGsvPZZZsaK
 fKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+88KlZNNLOIm2DdqGH+4+ZuHLP9XUHctYTH3I53lf+8=;
 b=S+izY5eYpRLtnC4Z90WgdEuoOq6ISn4ay7T43gIGgdtUeyxdBbGFPrrZbJvnS1Cm46
 vg+EkLm2vZgtnRXPLXyuwaFaAIELatWr0cSLgkhuG+IdxyaK6eXlX1ozJON8UNOrvuFY
 plvkBMpAGopizZ4vFxRfbteewRwzYwaU8dDpUtJBJreFlP7SH1pvSf3ma3YrrCj8fQrr
 DmVmAycSVoce9A4mF/tn8bm8svxgz02n123elSPtC03IOzLxFsmjZ0BLWTknCmGDq6B6
 RGVH5C7oSFqJ+UDw6thbtTmE6UDDkAb4DpXc+IBy/STOw8twWapB/BzUwxD9Tr2YM5da
 Jalg==
X-Gm-Message-State: AOAM530c81TLQ8YOMjB4hwbguSHeQsYPknaKQUW+6piLynEyIceDEON4
 +uA4hCZFnPGdiAITfratODmPtgmgg9jZAg==
X-Google-Smtp-Source: ABdhPJxTiDHHiOn2vzTtLIolscc0obkiPhBZ9KyokX2MSHtthkSnk0yEo9O5omdr8fNfNdqZg/qBPQ==
X-Received: by 2002:a5d:48ca:: with SMTP id p10mr921119wrs.87.1625160434440;
 Thu, 01 Jul 2021 10:27:14 -0700 (PDT)
Received: from ziggy.stardust ([213.195.127.100])
 by smtp.gmail.com with ESMTPSA id z6sm542191wrh.67.2021.07.01.10.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:27:13 -0700 (PDT)
Subject: Re: [RESEND PATCH 0/3] Misc bug fixes in mtk power domain driver
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, drinkcat@chromium.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210701094024.1273759-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <736b909d-ed43-3691-6e93-e7f025a04833@gmail.com>
Date: Thu, 1 Jul 2021 19:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210701094024.1273759-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_102717_930373_0F522E15 
X-CRM114-Status: GOOD (  17.31  )
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



On 01/07/2021 11:40, Enric Balletbo i Serra wrote:
> 
> This series, originally sent by Bilal Wasim [1], initially broke my
> display in mainline (no gpu driver). The problem was not in the series
> itself, and, after [2], this series works as expected. I was able to go
> to the UI with and without the imgtec gpu driver on my Acer Chromebook
> R13 (elm). Hence I rebased on top of mainline and resend it to take into
> account for next merge window.
> 

Whole series pushed to v5.14-tmp/soc

Thanks!

> Best regards,
>   Enric
> 
> [1] https://yhbt.net/lore/all/20210216165926.46bbafc7@a-VirtualBox/T/
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210625062448.3462177-1-enric.balletbo@collabora.com/
> 
> 
> Bilal Wasim (3):
>   soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
>   soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD
>   arm64: dts: mediatek: mt8173: Add domain supply for mfg_async
> 
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
>  drivers/soc/mediatek/mt8173-pm-domains.h     | 1 +
>  drivers/soc/mediatek/mtk-pm-domains.h        | 2 +-
>  5 files changed, 11 insertions(+), 2 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
