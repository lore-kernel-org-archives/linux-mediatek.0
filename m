Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA6C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWde9/RxgAOXD0QltJ01CiWNxoLjuof+4KqeqTguWDg=; b=CI2LTnruxor26q79NdMXzExxpN
	ttnULd0jvqRBt1P608hKQCvwIBJHVo3J2vBsmni3JB0IrCe9C1xvKpAzIUuxab5i59mYBYXcEdPLo
	hzBrm4cDAif/3Fj5FOngTeNvFYHU910X4XZfiuWn782jaoNcjfpmUm93TAUwAYKkWkwApE9HxeJt2
	7Khpnm2cOwoiJ507yS2WDUxV333e1SWjx6nKuR/yD4drnY+N7UEkpSl37QzSMI5UpH3S4Qv8TD9k+
	dEglWFCLUuvfdyOMCBwpURXfQFuLmrgiF0NT/hFCc17RB9/tc2xEf8p/6WLr2VUY45BITFTxPYRI9
	UudMsCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjp3p-00000003YNu-3jqo;
	Mon, 11 Mar 2024 23:28:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjp3Z-00000003YK4-1aIQ;
	Mon, 11 Mar 2024 23:27:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E112360003;
	Mon, 11 Mar 2024 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710199661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWde9/RxgAOXD0QltJ01CiWNxoLjuof+4KqeqTguWDg=;
	b=eL1SKczcX7Wm0LaFbj3auDMNYOkOivrXZQZwduAw6eTbSCLQeKxenVuovzWJ406RurRzg/
	QWsxKeWEkjrl+mAdXo/7D/gUYIcXiYvPfuBnii4S5H5+Eu7HwQbPB0eXVmquHm28TljmeY
	xQ17zFz0xpujDzZ3h36Kh+GnBz4k9sIGwItYt5RiSGAkk0pg//HkkJu0Zt3+HacLMEbHBN
	aCJrIFm3Q7mn91w4PKtcV3mRKiZWTJpWdLGL6Jl7ZWIC9QXYFD3GEKINer/p8jog8hl9/f
	g9QMboHpo1vHxzt0daB8nCdWX9sDRR8f1A++k4cmPjSdNr2m9HDUp3YQ+GDErQ==
Message-ID: <2846b377-f45b-45fd-9fe2-cb22615e0fd5@arinc9.com>
Date: Tue, 12 Mar 2024 02:27:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: patchwork-bot+netdevbpf@kernel.org,
 Justin Swartz <justin.swartz@risingedge.co.za>, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
 <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
 <Ze9-mp269h43WGD3@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Ze9-mp269h43WGD3@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_162748_210989_FD118190 
X-CRM114-Status: GOOD (  21.31  )
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

On 12.03.2024 00:58, Daniel Golle wrote:
> On Tue, Mar 12, 2024 at 12:22:48AM +0300, Arınç ÜNAL wrote:
>> Why was this applied? I already explained it did not achieve anything.
> 
> I agree that we were still debating about it, however, I do believe
> Justin that he truely observed this problem and the fix seemed
> appropriate to me.
> 
> I've explained this in my previous email which you did not notice
> or at least haven't repied to:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20240305043952.21590-1-justin.swartz@risingedge.co.za/#25753421

I did read that and I did not respond because you did not argue over any of
the technical points I've made. All you said was did I repeat the test
enough, on a technical matter that I consider adding two and two together
and expecting a result other than four.

How I interpreted your response was: I don't know much about this, maybe
you're wrong. Justin must've made this patch for a reason so let's have
them elaborate further.

> 
> In the end it probably depends on the electric capacity of the circuit
> connecting each LED, so it may not be reproducible on all boards and/or
> under all circumstances (temperature, humindity, ...).

I'm sorry, this makes no sense to me. I simply fail to see how this fits
here. Could you base your argument over my points please?

Do you agree that the LED controller starts manipulating the state of the
pins used for LEDs and bootstrapping after a link is established?

Do you agree that after power is cut from the switch IC and then given
back, any active link from before will go away, meaning the pins will go
back to the state that is being dictated by the bootstrapping design of the
board?

Do you agree that with power given back, the HWTRAP register will be
populated before a link is established?

> 
> Disabling the LEDs and waiting for around 1mS before reset seems like
> a sensible thing to do, and I'm glad Justin took care of it.

Let's ask Justin if they tested this on a standalone MT7530. Because I did.
The switch chip won't even be powered on before the switch chip reset
operation is done. So the operation this patch brings does not do anything
at all for standalone MT7530.

My conclusion to this patch is Justin tested this only on an MCM MT7530
where the switch IC still has power before the DSA subdriver kicks in. And
assumed that disabling the LED controller before switch chip reset would
"reduce" the possibility of having these pins continue being manipulated by
the LED controller AFTER power is cut off and given back to the switch
chip, where the state of these pins would be back to being dictated by the
bootstrapping design of the board.

Jakub, please revert this. And please next time do not apply any patch that
modifies this driver without my approval if I've already made an argument
against it. I'm actively maintaining this driver, if there's a need to
respond, I will do so.

This patch did not have any ACKs. It also did not have the tree described
on the subject. More reasons as to why this shouldn't have been applied in
its current state.

Arınç

