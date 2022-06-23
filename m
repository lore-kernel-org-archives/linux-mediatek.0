Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlJ623kYIiixyRnFbBdpB74xXITtoo13lP9Gz51M6CE=; b=3p6YnM5DAN8HHPDNWCt5FVLrzN
	zUNjERtCSd2UyWlzOxYBcYgGgCsFBBs8/C0geGtatZ1tAc03BASGp3I8fEqxAkEi5tO855DE3Jv9S
	+b6PWM4EusUJPJX9wX2aHEtJ9CORx9ZJdkOveszylCFsjk0RRYQj1HDJIbaK9usT4KeI9498E30ev
	rOEkuXwpRbj1LF/Smot8nvtUXe7v7mzXcbtsTji57Xg5o9dDayV6a1lmk2RsigQAyNuqq1QvRXMVj
	xsVQ34g2NtztJa/vOVK2EX4+/IwbxMCe1mzqnQkddJjZ/+pDSum5h9zON0GWgu6kjmck170+zX5tb
	bHhufvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LD3-00EkhX-5S; Thu, 23 Jun 2022 11:41:17 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LCp-00Ekce-TH; Thu, 23 Jun 2022 11:41:05 +0000
Received: by mail-qv1-xf34.google.com with SMTP id n15so25446848qvh.12;
        Thu, 23 Jun 2022 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TlJ623kYIiixyRnFbBdpB74xXITtoo13lP9Gz51M6CE=;
        b=c+PafEx9t9or6IfkcJ7ZyOzOPZu0N2lNy3eu3Vi3fLws1er+KEGfr/mIoPraDmO47z
         iyFNxaRg6V9NIC1Z1o3BBzCKEoeMbScCGBgezPU/9TSdCE5prlGV/Uy7f9XkQAnIF3S/
         ySGWI9WUHUp9ygOhgSv/AF9IZ3UdmPnWqFgxKC4sak5OwUs6Yx9xbc9MNk2eWye1PJXj
         XNTDW47isAtgapdHC1nfG6e8/nrWll8tN4qweRG87E3X3UtxPgg2ZlR3VpB7rqGgZ4Yv
         daVJ4ZAk4D/ym7MXc6syIkE7d2lczgbIalaOF6zshj8qiWJaM2BOzbNzWZd16AOeCWcV
         rFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TlJ623kYIiixyRnFbBdpB74xXITtoo13lP9Gz51M6CE=;
        b=FfYK2LeXN0vbdONSYZ2y2rUne8xtOJ3WnGQRz3EiBdexm4caT0OupdvXJcgHsEc6W2
         RBwNUI6/pi5EdNlDCpW4NQPxf7/7qFs5sijSX5Po8hpDLzxwVBhGMFDKwvRldvFAqtWz
         kwf5O+b6oFv8p2fCLEGxb6TY6yXnmnxGGQ2pEtwcrKuphDcQz3RH6GyzdaXWUSb/0n/2
         MFBLEEKSi89PZbYLqzF2/UqGQw6zg3282nuzHyHU8D9zjzEN+mSpsR8xPYrg4/GGe0li
         6NsySP7gnnq07U0P1ZfrCV0HxL2pD/buNMPuza02ISlXF/CoPNk0h8a6J7fTjxNkv/jQ
         pODw==
X-Gm-Message-State: AJIora/gaFq5V2P/znITzTm4K/HHfHEGBa6WrttoE1IdJTsJXsWLh3Uc
	rvLviVmNgt9kJUdytEl8K80=
X-Google-Smtp-Source: AGRyM1uCkbgyLd8bqmpVHgGUaWaGnEUvW6hQtdnjAjEevjJfcue5FX4j6Cp+pGXxH2vQJjft88KJ0Q==
X-Received: by 2002:ad4:5de4:0:b0:470:466b:15c4 with SMTP id jn4-20020ad45de4000000b00470466b15c4mr15080285qvb.34.1655984460197;
        Thu, 23 Jun 2022 04:41:00 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i10-20020ac85c0a000000b00304e1709b1esm18283516qti.43.2022.06.23.04.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 04:40:59 -0700 (PDT)
Message-ID: <11da278b-f7ce-d668-2c8a-46d7a9c71eb9@gmail.com>
Date: Thu, 23 Jun 2022 13:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/5] Allow getting regulator on MFG for multiple SoCs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wenst@chromium.org
References: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_044104_000618_699F78CF 
X-CRM114-Status: GOOD (  17.16  )
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



On 23/06/2022 12:09, AngeloGioacchino Del Regno wrote:
> This is one of the steps to enable DVFS with the Panfrost driver:
> since Panfrost is already enabling the (required) MFG power domains
> and since the mtk-pm-domains driver is already responsible for
> actually enabling the SRAM PDN, it makes sense to make sure that
> the VSRAM supply is ON when trying to reset/enable the SRAM.
> 
> For this reason, the MTK_SCPD_DOMAIN_SUPPLY flag was added to one
> more MFG domain, ensuring that the SRAM is actually powered and
> also not relying on the bootloader leaving this supply on; on the
> other hand, this is also making possible to avoid setting a
> sram-supply on the GPU node, making devfreq happy about having
> only one supply and finally allowing DVFS to happen.
> 
> If no domain-supply is declared in devicetree, mtk-pm-domains driver
> probe will anyway keep going, so this is not breaking old devicetrees.
> 
> No side effects either when this supply is declared for both a MFG
> domain and Panfrost together.
> 
> This series has no dependencies.
> 
> AngeloGioacchino Del Regno (5):
>    soc: mediatek: mt8192-pm-domains: Allow probing vreg supply on MFG0/1
>    soc: mediatek: mt8183-pm-domains: Allow probing vreg supply on
>      MFG_ASYNC
>    soc: mediatek: mt8195-pm-domains: Allow probing vreg supply on MFG1
>    soc: mediatek: mt8186-pm-domains: Allow probing vreg supply on MFG1

I think we can squash the 4 patches into one. Other then that series looks good.

Matthias

>    arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
>   drivers/soc/mediatek/mt8183-pm-domains.h       | 1 +
>   drivers/soc/mediatek/mt8186-pm-domains.h       | 2 +-
>   drivers/soc/mediatek/mt8192-pm-domains.h       | 2 ++
>   drivers/soc/mediatek/mt8195-pm-domains.h       | 2 +-
>   6 files changed, 10 insertions(+), 3 deletions(-)
> 

