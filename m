Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D55C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJr5pRuJqzZAk3A4pwJqMO/0Wfgow5x7CkKVh84jwCo=; b=EbGwEzQAoUmefXnlg4sIYyTQFI
	5PP5cZ9ivMHc2aoh7jKyUoeerqIXVRjBn4K218ZvmbN9wikvzdQ2tHmWv2L8zkaOcxZmu0eW53pVJ
	BSy9eYm/QoZDG9nL3HiP45cBlJhmFBZRt07LxovcvbKvRocOxO3ODZqXB8oQdpvyKS758qLykHUu1
	qsEKwNmwyDue3kcWo70Kb5s1bhVkKbqhERh2of280CUeiYubu6xogvsK44IkAbEvESU9oPJazYtd1
	n+7A55lyNsvkpkE5KotlAJNHFqLYTQQzqNBZ0fmL9qACzhpxkSU8sL/R81iwyRU6EO/1YpGzo1S+j
	Fiymbk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjpJS-00000003aef-3tfA;
	Mon, 11 Mar 2024 23:44:10 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjpJN-00000003adX-3UTV;
	Mon, 11 Mar 2024 23:44:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rjpIp-0002Jp-39;
	Mon, 11 Mar 2024 23:43:32 +0000
Date: Mon, 11 Mar 2024 23:43:24 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: patchwork-bot+netdevbpf@kernel.org,
	Justin Swartz <justin.swartz@risingedge.co.za>, dqfext@gmail.com,
	sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Message-ID: <Ze-XHH4yFjXC0p11@makrotopia.org>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
 <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
 <Ze9-mp269h43WGD3@makrotopia.org>
 <2846b377-f45b-45fd-9fe2-cb22615e0fd5@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2846b377-f45b-45fd-9fe2-cb22615e0fd5@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_164405_901588_1B94DA45 
X-CRM114-Status: GOOD (  35.91  )
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

On Tue, Mar 12, 2024 at 02:27:25AM +0300, Arınç ÜNAL wrote:
> On 12.03.2024 00:58, Daniel Golle wrote:
> > On Tue, Mar 12, 2024 at 12:22:48AM +0300, Arınç ÜNAL wrote:
> > > Why was this applied? I already explained it did not achieve anything.
> > 
> > I agree that we were still debating about it, however, I do believe
> > Justin that he truely observed this problem and the fix seemed
> > appropriate to me.
> > 
> > I've explained this in my previous email which you did not notice
> > or at least haven't repied to:
> > 
> > https://patchwork.kernel.org/project/netdevbpf/patch/20240305043952.21590-1-justin.swartz@risingedge.co.za/#25753421
> 
> I did read that and I did not respond because you did not argue over any of
> the technical points I've made. All you said was did I repeat the test
> enough, on a technical matter that I consider adding two and two together
> and expecting a result other than four.
> 
> How I interpreted your response was: I don't know much about this, maybe
> you're wrong. Justin must've made this patch for a reason so let's have
> them elaborate further.
> 
> > 
> > In the end it probably depends on the electric capacity of the circuit
> > connecting each LED, so it may not be reproducible on all boards and/or
> > under all circumstances (temperature, humindity, ...).
> 
> I'm sorry, this makes no sense to me. I simply fail to see how this fits
> here. Could you base your argument over my points please?

Sure, will happily do so.

> 
> Do you agree that the LED controller starts manipulating the state of the
> pins used for LEDs and bootstrapping after a link is established?

Yes. But a reset may happen while a link is already up because the switch IC
was initialized and in use by the bootloader. And hence LED may be powered
by the LED controller in that moment **just before reset**.

> 
> Do you agree that after power is cut from the switch IC and then given
> back, any active link from before will go away, meaning the pins will go
> back to the state that is being dictated by the bootstrapping design of the
> board?

I don't see how this could be related. We are not talking about power cuts
here, but rather use of a RESET signal (typically a GPIO on standalone MT753x
or reset controller of the CPU-part of the MCM).

> 
> Do you agree that with power given back, the HWTRAP register will be
> populated before a link is established?

Yes sure, but see above.

> 
> > 
> > Disabling the LEDs and waiting for around 1mS before reset seems like
> > a sensible thing to do, and I'm glad Justin took care of it.
> 
> Let's ask Justin if they tested this on a standalone MT7530. Because I did.
> The switch chip won't even be powered on before the switch chip reset
> operation is done. So the operation this patch brings does not do anything
> at all for standalone MT7530.

This is not true in case the bootloader has already powered on the
switch in order to load firmware via TFTP. In this case the link may
be up (and hence LEDs may be powered on) at the moment the reset
triggerd by probe of the DSA driver kicks in.

> 
> My conclusion to this patch is Justin tested this only on an MCM MT7530
> where the switch IC still has power before the DSA subdriver kicks in. And
> assumed that disabling the LED controller before switch chip reset would
> "reduce" the possibility of having these pins continue being manipulated by
> the LED controller AFTER power is cut off and given back to the switch
> chip, where the state of these pins would be back to being dictated by the
> bootstrapping design of the board.
> 
> Jakub, please revert this. And please next time do not apply any patch that
> modifies this driver without my approval if I've already made an argument
> against it. I'm actively maintaining this driver, if there's a need to
> respond, I will do so.
> 
> This patch did not have any ACKs. It also did not have the tree described
> on the subject. More reasons as to why this shouldn't have been applied in
> its current state.

It was clearly recognizable as a fix.

However, I agree that applying it after Ack from an active maintainer
would have been better.

I don't see a need to revert it before this debate (which starts to
look like an argument over authority) has concluded.

