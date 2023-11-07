Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AF6C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A03ygw6xwhkX5Kf2nZd7QKNjkDnXF2q25kBAveJ/Fs=; b=1undHB2PPN6QVLHNwT8Q1zkydO
	5xZzof3AKSMdfSM2b0WVQ1U7Xzph27auZpcQZD3RlULL3hZXScndJr6abgKgws5Vw3Mk7jnCGgPNO
	gM6d3vJMploCyBhNnXTyWWQUA3q6biFCNS2DQ529E1FACR0cQzBj/Aa0rarAMc5Ege8c4qzyDAI+Z
	guJP0J0d+R167I+VtFtd1QmKsKHQf9+KIeRX26Wi7f8kxqsyFKG2JJ9Zjtw8c3Js6UL2tUUKIsrSS
	5DEYZJG9rk6Khl63+apbtX+eLMp2A7nZzgqoR2mLx5U1YdPM7yVn6YGGIkPUwrZedTL2s9kOUWEjM
	clKDSLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q6V-0026a3-0o;
	Tue, 07 Nov 2023 17:43:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q6R-0026Yb-1x;
	Tue, 07 Nov 2023 17:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0846B612DA;
	Tue,  7 Nov 2023 17:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E65AC433C7;
	Tue,  7 Nov 2023 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699378981;
	bh=AA29qJmLk5KV97FY2zltETr0dL2/GW30s2k0IJRqsJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KjYMFS4RKf6uYko4T43yEVuaUcBj+EzN33jxepRw/8L/c7DQRQ/FXw9E/FMRQuF59
	 JzQGYvu/AFH60XsGCXIAtsKh08uZy9xA4k/D9KG5SE6hx1HspbgSSm6iF5vLMkCmts
	 jj0w1YDg4AsdODnUp7GJWHTD4Ne0jghsSw8IvuUZRhXd+sKewXvLkhXtzu0yy+OYk6
	 viUqbRK45BkAmYTYtR+bTTfm3kuFqY3brlSCXse9jrJnBQkzt7vY3rnC4gyyS1E9ln
	 VEEIXSoLDoj25YqrDxZw6lLGly0uwImWCuynKe7vXrna67RtKHG0VOBdBaei+5oaMW
	 mnPf+GsASX3yA==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1r0Q6N-00BD8q-4T;
	Tue, 07 Nov 2023 17:42:59 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 17:42:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Amit Daniel Kachhap <amit.kachhap@arm.com>, James
 Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: Move Mediatek GIC quirk handling from
 irqchip to core
In-Reply-To: <CAD=FV=Xv7XKvePTZ6LKT97EViG81d8hqk+T68B5eXamKTU407A@mail.gmail.com>
References: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <9b2e37a0-32ee-4aa4-99e8-d37103674847@collabora.com>
 <CAD=FV=Xv7XKvePTZ6LKT97EViG81d8hqk+T68B5eXamKTU407A@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e2e7762bfd16f67bdc253dc23a967c46@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: dianders@chromium.org, angelogioacchino.delregno@collabora.com, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, wenst@chromium.org, amit.kachhap@arm.com, james.morse@arm.com, joey.gouly@arm.com, broonie@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_094303_745120_C1166B2D 
X-CRM114-Status: GOOD (  14.70  )
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

On 2023-11-07 17:37, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 7, 2023 at 8:30 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> 
>> > +static __init void detect_system_supports_pseudo_nmi(void)
>> > +{
>> > +     struct device_node *np;
>> > +
>> > +     if (!enable_pseudo_nmi)
>> > +             return;
>> > +
>> > +     /*
>> > +      * Detect broken Mediatek firmware that doesn't properly save and
>> 
>> s/Mediatek/MediaTek/g
>> 
>> Apart from that,
>> 
>> Reviewed-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>> 
>> On MT8195, MT8192, MT8186:
>> Tested-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
> 
> Thanks! Unless someone wants me to spin it more quickly, I'll plan to
> send a V3 with the Mediatek=>MediaTek change tomorrow.

I really don't think that's worth the effort.

Catalin can fix this when applying the patch, and even then,
nobody is going to notice that sort of pretty irrelevant
detail.

         M.
-- 
Jazz is not dead. It just smells funny...

