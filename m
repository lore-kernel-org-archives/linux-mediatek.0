Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0044C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:32:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2631161460
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2631161460
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6R70ZTTxguL1q6VAVk8JEpCpbjDvqnIK4VpWQ/W0Vyk=; b=MuWlR+Meqv7ffyOZkotGldKYu
	HoJ3EFwE4kvlctF+8w+WGdtFpvcg3YRLTi4eOaMmcU3+Ye8yl1GZSf6KSiQpaCo5YLQ377LMd9Ux3
	M1S2imPCs57RT5IH/5MWvXh+h11naSO+eejU2XJMZ7pKfST51mMlhEYM1RrcQyDS+RbtDhShGOKZl
	/dVL10CzPkNd9ipXmk35XjOWTE0ADClejZRV29CjhiaVKbTDli+8MQ/YnWZ+GeyofgzWT7QVWiYIp
	tEtgp6JpHwliEdCBpl03vOeLo59USRz6+lo+IaZtnHi15TsNkxezE09znb4qg6irE8F865BHxOq6Q
	IDSl37z5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcG8s-006j9C-Mf; Thu, 29 Apr 2021 23:32:22 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcG8q-006j8T-TD
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 23:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=eTT0JjyHTNK+HUwEt1vOt0ko87TGIxLuDLOETsVrMNQ=; b=PQc+KX1rt/fAck5hSFl2WGc+qm
 LCe4MinHzYF+HhnYhBXhs+ijQP4iz9D9mf/1pORBq0kjAqCnisx9zUnIdWch+q9T0XvoASmNAVKfx
 OSFUlfBcTos1nCo6rFIDhlaKJAjDpq+7aWpa94nEaQAI12BBqF8fuvp/he1A0mcjBt+FFANjTq/YD
 eXmMgr8ksbyCtD13BQ6DOepLQr1xT+8yTFNqRkODcwfbD18iP/sGD+Y8Qg+uprnMB8sqQgHO38VOv
 aXagNcMRkYA1MVboeh+UQ2Y3Mpgpyq6CquS9awuv4nGxdycLcnhnEo/nWCQbPL8BdKxxCsrqFe7H9
 TkgSXM6A==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcG8e-0011tV-GX
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 23:32:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id t21so4528175plo.2
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eTT0JjyHTNK+HUwEt1vOt0ko87TGIxLuDLOETsVrMNQ=;
 b=NL22mth4obNH9bwhyoRdPTGW5NDTt137bEw6yVVrYx9o5GEqU/tX6+bP1iv0mAo0/0
 +lO/8Ok3gD48/bcyyBQFenVT7d85a/IDaoGQxjK6UbO2CvX7KujRjv9x/qbzjR+rsl5U
 8xVENRKUEPwMkE5OaITnGU8/mesD1sS1xbntJo5XKVGQSaodiwIxnbY9NEAafYv0rmG3
 B6r5KsZmqBSX82/9kIAch/rFVugWbjKVYX/0BhHWAmzeaMWnZvcIxPJmmaY8FrgkiJzC
 aRtTSv2Vk7M468JbEXeRLRXEcPKKnVfrAEHaO4xuXmuem56bGqAtE38xqgEr5hugqPUM
 dTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eTT0JjyHTNK+HUwEt1vOt0ko87TGIxLuDLOETsVrMNQ=;
 b=Trj84ot0H1GGxJpes48RrdjRfwh+KU7ZhLVyXPH1f7AZvdtFnXbifQEKiJu29geHie
 Wk5Mqs8VOyJU21RSSmpg59WiTLGwZGQZMAU0RrX0E+fWcnKK1PpSTQV+4eyN4sf0Ljto
 /63J07Ze4N0qKg5u2nHbgP0xRmy+ad8KDbjhvvAU/vEni7r05bifGzb2POZnC7lEmsGG
 yiv2WXKzT3ZbRpbFpAwZVhHGbO1bb9p7O/uE6ViRwEoNsJBHg2MFam+IjAZjvuJfnPaV
 SSueBo7SZxc3LV62NjRk7dfkrsRh37peMSqQ+XYUi4lLB0vn2hKtfUfhVGOpuy3vCGjW
 rrNQ==
X-Gm-Message-State: AOAM533FFAKN91kaLXSCLy6o6TMTm0DkKbsbdfexll62ukUe9t64XPTp
 MW5eGU4K+9+SPyL9ezrqk9c=
X-Google-Smtp-Source: ABdhPJw6edmhEYsj/llH0BJ5N2LSx83oGegeqtY4EIlysM8uGKAKrfXAv1fBajAw5w1BLje8hcyPuQ==
X-Received: by 2002:a17:90a:a4c7:: with SMTP id
 l7mr2284100pjw.147.1619739127543; 
 Thu, 29 Apr 2021 16:32:07 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id lb2sm8041195pjb.53.2021.04.29.16.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 16:32:07 -0700 (PDT)
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
To: DENG Qingfang <dqfext@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-4-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46c30868-fc01-2022-f6ed-c61432d5760f@gmail.com>
Date: Thu, 29 Apr 2021 16:31:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-4-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_163208_581386_44B048BF 
X-CRM114-Status: GOOD (  14.83  )
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



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Add device tree binding to support MT7530 interrupt controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - No changes.
> 
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> index de04626a8e9d..892b1570c496 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> @@ -81,6 +81,12 @@ Optional properties:
>  - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
>  	GPIO mode.
>  - #gpio-cells: Must be 2 if gpio-controller is defined.
> +- interrupt-controller: Boolean; Enables the internal interrupt controller.
> +
> +If interrupt-controller is defined, the following property is required.

s/is/are/

It would be good to follow up with a converstion of this binding file to
YAML eventually.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
