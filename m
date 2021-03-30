Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C617C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:49:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9736188B
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9736188B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s0N4AuVmLUlLR0SG+xld36dQsk9GXFWRyHTU++X0jMQ=; b=MDNP/liUFJlgrRL5CFQcPbwrt
	T1a2Cb+IOXYRVfMqOeMIumc5SuNq2nTSvQXVXjVEueVD6qg9co/YhlB0qw+9wWf8i7XDBmKGeJ7od
	xk1SxbrKClnQI6yvR0gHHPY7tO7CJXp89sf09w7IGjj/UzPAKjczSrc0j5rYOWCBuFrhNg4Zloh+3
	S77nyWPAMDVlMYj0ssBUtfl3wBrLxwhNqw6c3itAAXPuJHczjnf024qUgaKg4exROdFlZOOv/Jq7J
	R/bG/1YLVBfO8gTXonEFTQo0vdwDAnHy2BCZi68G0CfyZ2KA8K4KxT5AU+UoBtzv25Aplk4SnAXZW
	Cd4vFKeNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAzz-003IJD-Mq; Tue, 30 Mar 2021 09:49:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAzv-003IHZ-60; Tue, 30 Mar 2021 09:49:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id v11so15557969wro.7;
 Tue, 30 Mar 2021 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yoneRTqEG7m96T81STMfMz+9Ivma6Nn+tsD+S27I6eU=;
 b=g8nUvMMty2JIbdUc0nZ9beBZy6k7rr9AvRWDTAYwLbBeu+0SKUy5K2+y8ZgioPheXQ
 OGnhKstc65aPFkHUdKcrEraHBecEiZN3qLBk2V/W3jOrROdo6FfRfMlV1c+Bah9WvJBS
 4km90okvrtAxFUIF3MAtlCfuw87NtQpfHtnkhQHbhaZuq2P/LduEOBtKcvt7affzznaV
 jVGpD7J2KKCkgp8KCIZbqanERhVppTiBPRiGVRUDyJHXRqEIKrkTbewtpaKHHGURIR6J
 bjCQQNX6Ve5ZW0b9sTFPgnxh6dJIf9A8yGG74M9GX9trMTyci1YwUElgaIzptmkJJT8x
 axEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yoneRTqEG7m96T81STMfMz+9Ivma6Nn+tsD+S27I6eU=;
 b=bqde4Ee1rWz6skdZUuK2hykeEaIQC20wOkygrSUx55pDYUksgyFbHOkXd2SY9Jn+er
 xSKcsVAPD8E81ojjO40L6yScpHRpenPpu+Q5bHVzifmmU8Me9HZt+IAAe8tD25EqHoxc
 z5zWNncBKD4dB3OPx0IkzoXyRsij/1t3DknPgVP48VHTerj6SMn8X8eF9vfK/DjBwB+O
 CWV/Yi+4uN9d0UQbCMRYwKXuAHkF3C+nDREVX3UtvcDKRaZy3fG2YsJIP0FvCaxI0Gsw
 LyP6kvJXAIM1r6i18JVmsHKUJwkIJWR9fGY+0m6/06BcYMImv6ywAFXHZL2KBGGL6osC
 dVpw==
X-Gm-Message-State: AOAM531Gl3aHMid3Cb8EHaphR8FJhCPUrvtF604dh9oxlK4B5vcbcnAf
 3s3VnW3rhTvZXRDZdc5xMmZ8MB2uvz5o4C7H
X-Google-Smtp-Source: ABdhPJzgfDNTIYtLvXPjO88v2IHcdrjGIgiz3C2m0vNM3zwp/5LqhQlUSkvCWqp/jhw0KpeV+LYPUg==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr32508775wrv.329.1617097758763; 
 Tue, 30 Mar 2021 02:49:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id g9sm33109278wrp.14.2021.03.30.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:49:18 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt7622: add ePA/eLNA pinmux for built-in
 WiFi
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <641c5e40f54e7c9c8eaa6be398d7169445b6fede.1617006498.git.ryder.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <48f1bb20-38cb-c523-2186-05f7973714a9@gmail.com>
Date: Tue, 30 Mar 2021 11:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <641c5e40f54e7c9c8eaa6be398d7169445b6fede.1617006498.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_104919_563833_ACE31D51 
X-CRM114-Status: GOOD (  16.89  )
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



On 29/03/2021 19:24, Ryder Lee wrote:
> This just illustrates one of possible combinations. User should setup
> the corresponding pins according to the onboard RF data that stores
> in eeprom.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

applied to v5.12-next/dts64
Thanks!

> ---
> change since v2 - add pinctrl-names = "default"
> ---
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index 08ad0ffb24df..f2dc850010f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -495,6 +495,16 @@
>  			groups = "watchdog";
>  		};
>  	};
> +
> +	wmac_pins: wmac-pins {
> +		mux {
> +			function = "antsel";
> +			groups = "antsel0", "antsel1", "antsel2", "antsel3",
> +				 "antsel4", "antsel5", "antsel6", "antsel7",
> +				 "antsel8", "antsel9", "antsel12", "antsel13",
> +				 "antsel14", "antsel15", "antsel16", "antsel17";
> +		};
> +	};
>  };
>  
>  &pwm {
> @@ -559,5 +569,7 @@
>  };
>  
>  &wmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wmac_pins>;
>  	status = "okay";
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
