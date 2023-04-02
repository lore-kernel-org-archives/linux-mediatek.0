Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932A6C7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsJ97AzAinqmYulQ9uVcLwa3ToVHlFCND7bl1BMrRiU=; b=lKpkx26wErovnumYGzGuTyKZ1c
	+Ft/47QPkVRRMU/0LYfxwksDJ10FJeCvqqYTbfKKcDXASyfQbvpjUJrQRTsdx+VfAUJI5us9OBWPN
	4fXM6U9FRmESME5TXDh+C6z9afnnLViDUxP44AM78Lyp16dyYNgeJsaZxkXmZNql2Aoj+nGH70IPD
	GTu+jmPCc0N/7CF9zVSJh2UMhPg/LQDf9oMcUM9RjLjCbqBpU2KGE5znzRSqCgC6Fk5KoKZ0uA+tB
	H0APcHcsMwkUHbEI/3L6LxeQdRXQcZcmqmyMrurYkMr37CnKhChuOJGWlhd3DWXxGAhAqz5f4a976
	whcaopKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1CJ-00CtRe-1K;
	Sun, 02 Apr 2023 17:08:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1CF-00CtQm-34;
	Sun, 02 Apr 2023 17:08:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id s13so15732659wmr.4;
        Sun, 02 Apr 2023 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680455329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsJ97AzAinqmYulQ9uVcLwa3ToVHlFCND7bl1BMrRiU=;
        b=YHNxsnJJ4c5c+8fCLqRjsHMs8tmEZHQ1w2ViHHGFaniGDy3caW4L474GMekT/yDMAp
         HNpLsnUDef4DYgY2EjmHZa1S8iK42qMP0qxu+LY+Nj0hvf1Kzkm/WOqjVveCyJGWQ6tO
         TQnqxsn/3DlfOxmdVY2EEgo6MM5bVzVdEq/nLIbCHat7Lk1JwznFRW7LzNrXR8Qh2H/8
         b4iHjFYYO9iS1cPGCM0GR0z4s/KHHrBTlkbw91nqBr6T+ljCcWaEmM4DmFMpXVwdiVLf
         rYuMQO5vBNeXRNbzTvcuTU3vup2h+YsxCtpG92MBHJlyTJ9GmvkkqGsUZ72gnEHP8LVd
         NIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680455329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsJ97AzAinqmYulQ9uVcLwa3ToVHlFCND7bl1BMrRiU=;
        b=0OpJZGZ3nY3NOnDUqQgmy/NFo4+4z/mVSlmtDDrMZw5y/WXaL+3SFT3DPlq2t2wM4p
         1VESlc6iVyT2NbMJVvWtRjcuzzqG37rOucyVwziGEkiufQGYlxD6MqM1NIm1lN4HomZ+
         imrznrSH+6WvDRCED72U1kfmQLP0lteMByp1oRg2OB36PEZpQyNHpW2nYZr1e2yxuZOO
         wIJfsAS9olONtLKjeeyYOGrjsKQuUopo25M71uwGizwSmIVpWlTZfsdYjtJprlvmaOXM
         eGVQ2N7rChAnsmgmwJ40YjWxhby1vNiY3DRZ3jsI0cPgXOe19gNKb75/F3dat4GrQj3m
         0Q2A==
X-Gm-Message-State: AAQBX9fc/klKgO3UlaYGkEvriv8iGix6k28kCD8lb5dQ5Cokk4nbUvei
	619/c9TZFdkcMgooMcIBZ/U=
X-Google-Smtp-Source: AKy350Y8n3sLV835zkLGWD1Asl2o/5OiDqWwy1rdkkLRI7XF1gVqgugu90RkgvcR9WttMJwwPkB95g==
X-Received: by 2002:a1c:7406:0:b0:3da:2ba4:b97 with SMTP id p6-20020a1c7406000000b003da2ba40b97mr10806342wmc.19.1680455329510;
        Sun, 02 Apr 2023 10:08:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c45cf00b003eb2e33f327sm26654245wmo.2.2023.04.02.10.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:08:48 -0700 (PDT)
Message-ID: <eef88552-64cb-b4e7-f443-bf6d7afe3ae2@gmail.com>
Date: Sun, 2 Apr 2023 19:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/17] arm64: dts: mediatek: mt6795: Add apmixedsys
 syscon node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
 <20230327083647.22017-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230327083647.22017-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_100852_030601_72340133 
X-CRM114-Status: GOOD (  13.46  )
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



On 27/03/2023 10:36, AngeloGioacchino Del Regno wrote:
> Add the APMIXEDSYS node, providing a syscon to the APMIXED iospace and
> also providing PLLs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 4d2119751572..26d640e1bfb6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -310,6 +310,12 @@ systimer: timer@10200670 {
>   			clock-names = "clk13m";
>   		};
>   
> +		apmixedsys: syscon@10209000 {
> +			compatible = "mediatek,mt6795-apmixedsys", "syscon";

Looks good although we have the compatible twice, in 
bindings/clock/mediatek,apmixedsys.yaml and 
bindings/clock/mediatek,mt6795-sys-clock.yaml

So we should see if we can merge both.

Matthias

> +			reg = <0 0x10209000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>   		fhctl: clock-controller@10209f00 {
>   			compatible = "mediatek,mt6795-fhctl";
>   			reg = <0 0x10209f00 0 0x100>;

