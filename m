Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C90FC47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 17:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D97610A2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 17:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D97610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FEF8wC+7HbLfXBAC+XQf+Mg18aBNOhpAOm/wI2CW+/w=; b=lFgKxRoH19xlv1gQsvooId1Uv7
	1oVnZsXgn58QJtOUUXmLjXENwRkLJ6gpaFTloQ/5qIvNQ6xa8Yzrj4NIMV/TTlCMRBo5V9ite5KZy
	O/r65RXWufi7ZtPbV5GB0WtYZqwfQBXbh9zlBVgcb/K9C9wywqUBbKqQF9jc9ZOtTstevhMzKiKja
	bNIUsvSRgr9XUbu5NdNL/nEvT/SRlJ1TU5VXSSVbq1bdImq+WIm/tahDlsLHe4nKMOgHmxGKaX3n0
	KtPCsdKGhkPpbAvKweRf+Lji9U6lPwK6DuJNDqre0L0U4dB1vvxXKiGsvWZKbKTnTcLqAQTPjIWJ9
	YuEW9X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorQ7-009xCq-2W; Thu, 03 Jun 2021 17:46:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorQ4-009xBO-0R; Thu, 03 Jun 2021 17:46:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id c5so6675800wrq.9;
 Thu, 03 Jun 2021 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TNHNoyIPc56JzvVDn+fQoTPRGO3k2WWty4qeqb/AesU=;
 b=B9hDeW0WbnAZidcvhpT+0xu5iLMKTSrBjYuow6ssTqM/0K4FTi7irW5EO/NwypOe32
 LbHTvarsy0ZS6pebaKI7+nQI8hHp2WDYb6++qq7r3lSQ/tL0wcXsSK/9vQdintAjN6Kp
 0DvCugCBQ/LRUHndP7LQe8+49fEk2Pt7nwvTCVRj7Myu1Azvc5SdQjAwHDF2QHZNzlJy
 z3M6aqFbePyN0CF7Yqk03G6hhizbWnoRff26KK8rRTxPZNOUQMM+40O67j9kU8bEo1EZ
 YDQ8CWfHAdDTaJ7/aA8/EIumC+9iBa0EU98va53s/VN9m9dJTedBft0tRlF6/Za/tVy1
 fxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TNHNoyIPc56JzvVDn+fQoTPRGO3k2WWty4qeqb/AesU=;
 b=TB1CD8wusqWDnQp+QSKhbCKBiyk99rUnShNBudAN3KbJq3aF3ZWPl4V+ydYcjdwVmZ
 3e+1g9o+kanp0XTg4SBX8l6u+nIwGQ+rQ8CyRS5HsCkrx7LS0QgHt/eOUh7ONFs6F3o5
 TsI++DUvyTkfZSDkDk9Z5+AFdZI66ad82Vuv8jhxzHMCUpaC1ZQk/P5D/9odpB8fYgrZ
 b0nPXFTnd78XgGOoJU4rvjbN5S6FqHOwh8U7ScKVz5c0LQ+cxeJHT1gihKr/yo7iFjbL
 hfQP28SPB2J5S7pOfkCxR2OKU2ZaLXPvBq25wCk2F1q1hlXZK6Ygp10+xHschzSBsltf
 yBZQ==
X-Gm-Message-State: AOAM530UcLE/WHIH4QW+0nXGMp2Skvk+Pg0OS1h4z+4CnJQ/3a6Pk3Dp
 9jZx2wQ9p7QdPWokcm2zs4s=
X-Google-Smtp-Source: ABdhPJzmelXmMojIaThGJLerEKR3ZHv8GnmRuap9Pmzthk93MEz3Msq9ANIri+xeybPllvt47KtDmw==
X-Received: by 2002:adf:a503:: with SMTP id i3mr166016wrb.334.1622742370252;
 Thu, 03 Jun 2021 10:46:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id h1sm7458431wmq.0.2021.06.03.10.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:46:09 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8183-kukui: Enable thermal Tboard
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>
References: <20210603105901.21552-1-ben.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b8c4023e-498c-c30e-e4cd-35fbadaf6b5d@gmail.com>
Date: Thu, 3 Jun 2021 19:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603105901.21552-1-ben.tseng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_104612_093399_0BD266F4 
X-CRM114-Status: GOOD (  19.70  )
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



On 03/06/2021 12:59, Ben Tseng wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add Tboard thermal sensor settings.
> 
> pull-up voltage: 1800 mv
> pull-up resistor: 75K
> 
> Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
> AuxIn = Vsense * 4096 / 1500
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change in v2:
>         - Rebase to kernel-v5.13-rc1
>         - Resend
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcf..65768ab 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -847,6 +847,20 @@
>  	status = "okay";
>  };
>  
> +&thermal_zones {
> +	Tboard1 {

Lower-case please. It would be also good to know what tboard1 and 2 stands for.

Regards,
Matthias

> +		polling-delay = <1000>; /* milliseconds */
> +		polling-delay-passive = <0>; /* milliseconds */
> +		thermal-sensors = <&tboard_thermistor1>;
> +	};
> +
> +	Tboard2 {
> +		polling-delay = <1000>; /* milliseconds */
> +		polling-delay-passive = <0>; /* milliseconds */
> +		thermal-sensors = <&tboard_thermistor2>;
> +	};
> +};
> +
>  &u3phy {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b..4173a5d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -673,7 +673,7 @@
>  			nvmem-cell-names = "calibration-data";
>  		};
>  
> -		thermal-zones {
> +		thermal_zones: thermal-zones {
>  			cpu_thermal: cpu_thermal {
>  				polling-delay-passive = <100>;
>  				polling-delay = <500>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
