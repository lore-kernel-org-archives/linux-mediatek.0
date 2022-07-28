Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B823C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MfQt0pBWorRlsAFP8DPl6zHr8P3SDh0xwaF66hHtuo=; b=sYwM3d5SeMaKxEzYd7lezPVOeY
	QwWl6sjSc8rwxDJtEVlg6fcqEYzLNHl95berAbDxXIXo7g8hA15Fbw+4CFbeia1YM1ONnibACv3Bo
	dDWIHpcKsCVI7d8y2tDdxlyAi/qbELa+CqHvT9289CkB5eVBWi/zvbA6YCxpRdp58uujLxhzTed8s
	DJrTChBiXCvl4LSBGhTCIqcjerAUfTTPkQ3OW7yzeeFi5fmKRBATu9b2WC3qakxBjtGLD3fNrBLrO
	ZsO31rqJDLbMzlFQrwZLn51VgTJ63BSBpFw7fDBKZK0GkXcWhAIopL/p7CELa5DhUFR9RniMMzNrc
	qtNnESdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH7iR-00D4Bx-Fy; Thu, 28 Jul 2022 17:54:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH7iG-00D48Q-7z
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 17:54:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id z25so3940702lfr.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6MfQt0pBWorRlsAFP8DPl6zHr8P3SDh0xwaF66hHtuo=;
        b=PSOOhlr1VTqdPCNhNjATTulVhMqFIJ6P/zYsu6rgIGU/c4tXgbVS3GqXW64iQEF2Wz
         XskiPlFCCSrbuQaBpbciOiaIgIawF8aZA0SM3KUIzRyWV5iIJ9tMSfIsOT/Jr9Hw34nd
         o7hmXIByqyAhsTgTsdsjmWVaZR/P0w6byYToDcktZpMea+RWSixBTrgYZIP5fm8+Z1N3
         SEkduZvIeY2mI5HJ6CehwsTdX26ZHau9Cx7/PL0NmY/sOB+GKEFlODaAcky7Wb8DwYW6
         D13neg0HcS00D+iP+q4jb6E8YfwhtQFX9RFwrUdng04m25TR9pJ54HHvwERqKBPzEig+
         VJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6MfQt0pBWorRlsAFP8DPl6zHr8P3SDh0xwaF66hHtuo=;
        b=x2bu8mQILPczVmxrIknuIEezcKGuaqQG9BB5w/OVu2JipHskrIg/Jt4o8nXL4EWarQ
         rNMPXd5wxiLE/1oZVi6niKEJUK4RRdT9adhPYHmcK5/klaUltYSzzWKUpLXEzRFE8sPY
         j/ReZcMJBWo+rKnEhNJN4DaZF3cPKNTrG8grSqRlnMj/ZLHGG41I+7IImR6jox2hHPZl
         MhUG3PO/D2bgbqP8cBU7mqx1h4Y6P+Gg4hDAMDM9+rcI6kwBwIi43ddhGOdIzopzttOW
         mfLKh0TPyX4fLcwWXjoqfh1WfcTkgVJvVdiayl0C9KAO8iAMcwf0bcLVXNepXhDZPDTl
         wrog==
X-Gm-Message-State: AJIora8G+FxTonZMmZP2VvcDC7y+IA4Y4qPyrQwPTunQ42xTJoauaEuq
	AhYGQpH46yAkIKij+sXanDESSA==
X-Google-Smtp-Source: AGRyM1uC9AUPOcDFCyJbmlXK6r4q8xIOp/Zk9fpaBMmiBcH1i15Ev3nqouRr0FKDDD/Eu3JOB5MlwA==
X-Received: by 2002:a05:6512:2622:b0:481:5b17:58e7 with SMTP id bt34-20020a056512262200b004815b1758e7mr3513lfb.600.1659030857234;
        Thu, 28 Jul 2022 10:54:17 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b3-20020a056512304300b0048a7ebb3151sm292023lfb.181.2022.07.28.10.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 10:54:13 -0700 (PDT)
Message-ID: <2640c637-68c7-641d-9b15-c57bdd5adca2@linaro.org>
Date: Thu, 28 Jul 2022 19:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] arm64: dts: mt8173-oak: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eizan Miyamoto <eizan@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220728153913.2652153-1-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728153913.2652153-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_105420_374213_014B66E6 
X-CRM114-Status: GOOD (  15.26  )
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

On 28/07/2022 17:39, Pin-yen Lin wrote:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v3:
> - Remove /delete-node/ and create a new node for SMC watchdog.
> 
> Changes in v2:
> - Move the modifications to mt8173-elm.dtsi and add some comments.
> 
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e21feb85d822..fc8203297bac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +

Why?

> +	smc_watchdog {

No, you need to read the comment you receive one more time. So to be
clear: "watchdog"



Best regards,
Krzysztof

