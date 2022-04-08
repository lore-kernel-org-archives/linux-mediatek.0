Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB554C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUzr231fAXjb5c9q58DUfo7yA/+ZO44swb8GD4bf3/s=; b=EmKksOW3xpyOfg
	/jSZIPQtqjrdxl8yiDYMwpkaE/7ZvgWgXwFiTh3KRrfVPCgb1tqy52OPCK/vThovq16x0/s568MA+
	jNPiUr9Y+Qim70MA2ESFkcoVZop/ZGjrMdG0MAqxQ3jmTSTAFHL5jOrBW8QH3qVAlm6cXbjDhwcHN
	Xe8QpeZ4kbvyweugwpzRtYXXiXeHShPT4KzglVPctDbxAHPnWHyKlb/Q4yX9gl5nE1gkR/odDUoS4
	8AZ/2nyZdyw5GnYAGJWlHi/b0+j+ClrCHL3H+n1/i4JFQIJeQ/G7mBaFqGpXpmfVDs014mjCCvvW7
	192GqQ5yJYpYpDnxeojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjO7-00Fd7j-2W; Fri, 08 Apr 2022 07:50:35 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjNv-00Fd4O-7L; Fri, 08 Apr 2022 07:50:24 +0000
Received: by mail-qk1-x72b.google.com with SMTP id v13so4181465qkv.3;
 Fri, 08 Apr 2022 00:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gd03FWWEZ6z3R9zHdDhplmx+tKByFE9yM+qWp1XkieA=;
 b=GSCMFVnVaT8jJ12K90kWhi04C6d7kzAY9GLudaNvYwE1aM3WniSwE1EDlSIDYmXNcS
 ZoskDnyt3oQ5cAYCeF2S04eLs3rPOCoRhu9JBt9sUaSEjVpc5tuHd1ujmf5O49UFC7JX
 0gjbhcWIZOP2mzeshdWpef7I2g5vOMS9fT/+N+9SBLJuv7SKLAd3y0crQl/DKb4n2aF1
 pIujdgV/QwGfUY/OzDEsNFv8V6xe0L/k1y/ouzPodjVnx8HbDqJ6hLss0MHdvuc2r4pb
 BDP9O88Sz3kXLSluV7pm13h4ni2njDLD6wsg4D+ggcP3oMhRbVnX8LLCI2qIyPMddecN
 7jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gd03FWWEZ6z3R9zHdDhplmx+tKByFE9yM+qWp1XkieA=;
 b=shu5i860uQmfJjnXPq0/pe4xIkOWB+x3DNy9MtCM6eLibiN6noEQdzyLBcADvhXcmS
 avKbf7o9nPlWtuz3C0WbO/jZzUkzyGSipGKA1y9SWi3QsfCruRfgt62jNFkoAIKuftuJ
 cjGEOUjThqa7jdyS81LqXT41UuS/elHJehpMMzCD4m8w+WxiKporU3zC8+F7KxSaT5rv
 8k0BxPrQfkfNTD008Pfhm4U9DEYdLjQsukDaN6v6kgGww4vx6HEG4es9Kigy8ZiVDwTb
 hzjesDmHaxqw9Q4harStMQmz+x8GvFfUa/C94cDE4f4Rg/3ZndlA/Mcb+IIzfzcw6Fep
 QvEg==
X-Gm-Message-State: AOAM532fqwj7jyQ5WPNpSceh170VGGXGnCnUSsszjmB+DhHKe03mbVTH
 gLnENePtuTkMNqKxLwSDKrgrFckdip3RtXvXbyc=
X-Google-Smtp-Source: ABdhPJyVf/N0dZeSbLVCmVj1wUMk/MGaGOBT/OOoQXowI5Wkqped1Hq4ptNsGPdoDFZWsarHlb93LyG4RVHhq4yF5HY=
X-Received: by 2002:a37:8d44:0:b0:69a:224a:dc27 with SMTP id
 p65-20020a378d44000000b0069a224adc27mr2598220qkd.563.1649404220992; Fri, 08
 Apr 2022 00:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Apr 2022 09:50:10 +0200
Message-ID: <CAMhs-H8Z=Q3vm6psjp4iqu7z4N4eUKokeJ8VM+_wCscypP1TLQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_005023_326722_A771FE99 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, Apr 7, 2022 at 4:33 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The node names should be generic and SPI NOR dtschema expects "flash".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
