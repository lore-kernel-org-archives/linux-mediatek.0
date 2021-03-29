Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658E6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:03:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C286191B
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C286191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v14oQ2/0pSFIJGy+ZiYLYh4KNnP6n0gWtFd94JG8Vk0=; b=InVx837xEbdC9IOpc/triwqKZ
	Rr7vle++PUpm7Z4FZINUDKBqEWVO8FRkVEVRcMToIh+I0vPAAtlzmDP9Da4IvZNt5LMeXJYX7vMG2
	Tlyi/qDmWovQFHgniNVipyTu7/Mxg36Yk9f8VKaXxMYFZHgDTl9RJ+LdPSv0XSRk485nfkB/8Yjrq
	sh/FluuvtZ2XLxuKUxboV3ZWrNNpTDc1LJPoqJoZYyF0S1gj+gBbMDKG4sHO5thiQH4aKPUrsKVRu
	RH6WlpwoOT+lPocD7aEZMsXMUC+wlQTE6MtQDvgfgG2g+pxiFTh2JeIeyc1DZMmEm3Moj9yQ2PGkg
	b6s/RSCXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxA5-001A3f-Lt; Mon, 29 Mar 2021 19:02:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq0O-000cEB-FK; Mon, 29 Mar 2021 11:24:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id g25so6456713wmh.0;
 Mon, 29 Mar 2021 04:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e1a+kwffYzcMpQSHQ60B4gj/nqd34pu7XrkW9Q/Wixk=;
 b=JMaGuu1/1AzbM8khYOCfsDA83fsN5lLMMQFTORmksRJjFb3rHTdeYvFJlZQUUbKzZ0
 9We3OPZGsM2B6oIDjrodT/7NDDBtos84rwVAXbbeCCoWPVcQeAo07JzZCnOuKrlrk51Y
 Had8K4Zw2SfS6OQ4nh8t4o14ILF14kr1oowJlxzldlNGqpC3fI3UniJBXwCz7YZr2hFk
 +7c5jUfZ1OPfFAPZ8NW2m2NMnBoVrep5HBCeqX5WGgpiCixDDobOlUCL0/BK3xJOt9+V
 cantxZWUwthSRe1tW7x0e7kJHLqWOsv5u/Qt37HKR02juAAzdUycyVAwfbtmBcb48hdO
 EGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e1a+kwffYzcMpQSHQ60B4gj/nqd34pu7XrkW9Q/Wixk=;
 b=giaXbT4dvBB9Z/I3PemMMQM+S0XbGYXwJIi7GrfmLpcjalzQNB8D6Nh16GSZvZkp3U
 gNEEBxOFkHDJGoPdhYY7BUe491hLhnYPLSi0qAz6SOb3YuQs3ZikDe+rY9kEo5S8uimt
 CJD2oPBmqldKVsM93pwqa+KbGnWfey/B105NQsvuEs8NKUyLU3Q0Mx/I1OS3dg4/Xq2U
 axsxEUNN4Gka+4g8a1QkCVhjTEj7hL7QD1xrhXIjYlIi0hOgFBA8tvVxBVQyxZbsNt5w
 hMl1XSVMQX5MkVaYtiTUP6i5OC6NLnaUSxwTq3WxvToXa6PSyTWhBjrgs+Nm9axhM/Ls
 oEJw==
X-Gm-Message-State: AOAM531kic/PU9xw69UFWQPtQ2uzqKVVXbtzBYv3m7MfRLqaR/lCjZ19
 krbh8OT3JcZM222O4zi7yxw=
X-Google-Smtp-Source: ABdhPJxO5uaGZe0cOQbx0p1x8BvQjis31yBV3+DstmIQFPcMrOOWCSYX7J5Kah/aMmyTwI9nQ1zaQw==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr24435924wmr.110.1617017063717; 
 Mon, 29 Mar 2021 04:24:23 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id b65sm24516037wmh.4.2021.03.29.04.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:24:23 -0700 (PDT)
Subject: Re: [PATCH v2 13/13] arm64: dts: mt8183: update wakeup register offset
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616482975-17841-13-git-send-email-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a11c871f-4bfc-c069-b413-7fb6cd203b6f@gmail.com>
Date: Mon, 29 Mar 2021 13:24:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616482975-17841-13-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_122425_072362_C8870F37 
X-CRM114-Status: GOOD (  16.51  )
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



On 23/03/2021 08:02, Chunfeng Yun wrote:
> Use wakeup control register offset exactly, and update revision
> number
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify revision format
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 80519a145f13..9ea84d636556 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -874,7 +874,7 @@
>  			clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
>  				 <&infracfg CLK_INFRA_USB>;
>  			clock-names = "sys_ck", "ref_ck";
> -			mediatek,syscon-wakeup = <&pericfg 0x400 0>;
> +			mediatek,syscon-wakeup = <&pericfg 0x420 101>;

applied to v5.12-next/dts64

Thanks

>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
