Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FDBCD98CF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNQ/A2/WUxw1qFzNZc5VEP3z3YtNzDc9swfW+wlF7i8=; b=3GBLg6MSuCPcgrnXDc5sQJQ0K0
	F7hXeIfQre2iILH5rJ5fqe/XwmYUprdOxXUsO1e04QVMeEtZY5jy1cgTjKiEw+7jO717B1HZdCZxQ
	Q5QgtdcCUqszN4zVJGJgdU2WrWGnhJ3ahR5TuYFWhe0r0CLoWNWfS6PShk8lnlbqAZpg3WAAbOQkc
	ssNqWsZfxtIcnIbem31qMdcmO2N8t2LVgby9hBQpellH1UYZz2AKXhLcyo6CsUTBFlRdOEwIyLDfw
	1iQ//8dOv+3Hl+Y+KvD0fMRLBf8mufAxPxG1I4CzTykm4BukX4dS4EUytyLgmxk3siGKMUeKgfHc3
	cLKNvZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Y3-0000000ERBR-37C7;
	Mon, 15 Jun 2026 14:44:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Y1-0000000ER9r-03gl
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 14:44:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF8B84E42F0D;
	Mon, 15 Jun 2026 14:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A343460015;
	Mon, 15 Jun 2026 14:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 528B2106C96A2;
	Mon, 15 Jun 2026 16:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781534656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LNQ/A2/WUxw1qFzNZc5VEP3z3YtNzDc9swfW+wlF7i8=;
	b=YFbbhTW99y38MgG/y6VAC2apnTEuaqt6BDTPv9X3YLQtVK46ALfjRfM6dV6JqDaRUgaKv1
	Tl5JwKrF2HGbLIpA6BkSC+2OBNkydc3UsTtL6Qs1bij61KpbHSUaB2I5zj/9vHwdAslEjc
	yxZ/sIka+VFvbfErdSPCAyXCr80uUYXDzHyhezFO2fiMGOdftv0vfRyoisP1Znms6bOc1U
	NQDEJ6nnFnCxASwF6fHXoT0tny4ZJWkthBI6iRizavgRM6f8jvKuT39ZEl6DBL7M5T8xMu
	5tP6/dIn7nfxVoVcmwa83SjNCEK9mT6utIwt+jm/qpxSMjTSRqDlNigCOg/iIQ==
Message-ID: <0355da28-d3d7-41ee-ad85-632cc2e03951@bootlin.com>
Date: Mon, 15 Jun 2026 16:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 05/12] net: phylink: support late PCS provider
 attach
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-6-ansuelsmth@gmail.com>
 <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
 <6a3007ce.73de60af.3a056d.d903@mx.google.com>
 <7702ac09-75fd-49de-8ad2-fceaa122b627@bootlin.com>
 <6a300da0.d5af3cef.1ca29d.19c4@mx.google.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <6a300da0.d5af3cef.1ca29d.19c4@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_074421_193564_4A675550 
X-CRM114-Status: GOOD (  22.95  )
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



On 6/15/26 16:35, Christian Marangi wrote:
> On Mon, Jun 15, 2026 at 04:29:04PM +0200, Maxime Chevallier wrote:
>>
>>
>> On 6/15/26 16:10, Christian Marangi wrote:
>>> On Mon, Jun 15, 2026 at 04:07:03PM +0200, Maxime Chevallier wrote:
>>>> Hi Christian,
>>>>
>>>> On 6/15/26 14:29, Christian Marangi wrote:
>>>>> Add support for late PCS provider attachment to a phylink instance.
>>>>> This works by creating a global notifier for the PCS provider and
>>>>> making each phylink instance that makes use of fwnode subscribe to
>>>>> this notifier.
>>>>>
>>>>> The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
>>>>> a new PCS provider is added.
>>>>>
>>>>> phylink will then react to this event and will call the new function
>>>>> fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
>>>>> provided by the event is present in the pcs-handle property of the
>>>>> phylink instance.
>>>>>
>>>>> If a related PCS is found, then such PCS is added to the phylink
>>>>> instance PCS list.
>>>>>
>>>>> Then we link the PCS to the phylink instance and we refresh the supported
>>>>> interfaces of the phylink instance.
>>>>>
>>>>> Finally we check if we are in a major_config_failed scenario and trigger
>>>>> an interface reconfiguration in the next phylink resolve.
>>>>>
>>>>> In the example scenario where the link was previously torn down due to
>>>>> removal of PCS, the link will be established again as the PCS came back
>>>>> and is now available to phylink.
>>>>>
>>>>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
>>>>>  	if (pl->link_gpio)
>>>>>  		gpiod_put(pl->link_gpio);
>>>>>  
>>>>> +	/* Unregister notifier for late PCS attach */
>>>>> +	if (pl->fwnode_pcs_nb.notifier_call)
>>>>> +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
>>>>
>>>> I wanted to try this out, but I get :
>>>>
>>>> drivers/net/phy/phylink.c:2218:17: error: implicit declaration of function ‘unregister_fwnode_pcs_notifier’; did you mean ‘register_fwnode_pcs_notifier’? [-Werror=implicit-function-declaration]
>>>>  2218 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
>>>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>       |                 register_fwnode_pcs_notifier
>>>>
>>>> I guess you either need to stub this, or there's a missing Kconfig
>>>> dependency somewhere
>>>>
>>>
>>> Hi yes if you want toi test just enable CONFIG_FWNODE_PCS. I forgot to add
>>> the static declaration for unregister_fwnode_pcs_notifier. 
>>
>> I'll give it a go with this yeah, I have a few devices here I'd like to
>> try this on.
>>
>> Can you CC me for the next rounds ?
>>
> 
> Sure, if you can would be good to check also the other commit if everything
> is logically correct.

Absolutely, I'm planning on doing this :) This is quite the series though,
I'll try to give it some deeper look in the upcoming days, I expect net-next
to close soon anyways, so that's as good as it gets for reviewing this :)

Also, it's probably a good idea to have Sean in CC as well, I know a few people
interested in the Xilinx PCS his series brought, hopefully he can follow-up on
this series with the other new PCS drivers.

> 
> BTW by checking test from patchwork I can see also another fix is needed if
> you want to test this revision.
> 
> phylink_create()
> 
> -if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {
> +if (config->num_possible_pcs && mac_ops->mac_select_pcs) {

Ack, I'll test it with this change, thanks :)

Maxime

> 
> Aside from these change I expect the current legacy code to be not
> affected by these change.

I'll probably have things to say about this "legacy" naming :)

Thanks for driving this work forwards anyway, that's 

> 


