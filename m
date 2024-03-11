Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11FC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXm+dv0F8WRcaIbQydNqY3t1UW2S3zBA7Lh4mVQHEz0=; b=xZ/o8h6aEcSK0280mUPIWjqvdW
	F6x20CSDZXUcdNpov58GAdtjqymjtY33bK+aLA6rGpfPrlVXQ4L1x4hjX6ZomTDjYTTGjkMJPH9ey
	MO2O1LQDxCo4sABLMYv33L4m2z5erIc0wzLhLOQ7czgm2c6rK45VOjpDkZtslsa5ZgR6NGl9BiNov
	BTzdMixla4ynWv+9x/MDRRC/LNlv4YSajS0D2BYpBFtG7X38uR83E8E+sIYMlp4Hgeut2esLpUWSh
	6Gcp01a7QYBoW9px/LZTKQFI+DoB/gk2HQeCZgYfzkzM6wzyFybokn6MiaZwgHFVdFpFxSxJ8bVvd
	02k3dDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjng4-00000003KTv-1eJV;
	Mon, 11 Mar 2024 21:59:24 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjnfr-00000003KQo-3OBw;
	Mon, 11 Mar 2024 21:59:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rjnfa-0001zA-0X;
	Mon, 11 Mar 2024 21:58:54 +0000
Date: Mon, 11 Mar 2024 21:58:50 +0000
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
Message-ID: <Ze9-mp269h43WGD3@makrotopia.org>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
 <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_145911_880736_25545163 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, Mar 12, 2024 at 12:22:48AM +0300, Arınç ÜNAL wrote:
> Why was this applied? I already explained it did not achieve anything.

I agree that we were still debating about it, however, I do believe
Justin that he truely observed this problem and the fix seemed
appropriate to me.

I've explained this in my previous email which you did not notice
or at least haven't repied to:

https://patchwork.kernel.org/project/netdevbpf/patch/20240305043952.21590-1-justin.swartz@risingedge.co.za/#25753421

In the end it probably depends on the electric capacity of the circuit
connecting each LED, so it may not be reproducible on all boards and/or
under all circumstances (temperature, humindity, ...).

Disabling the LEDs and waiting for around 1mS before reset seems like
a sensible thing to do, and I'm glad Justin took care of it.


> 
> Arınç
> 
> On 12.03.2024 00:10, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> > 
> > This patch was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> > 
> > On Tue,  5 Mar 2024 06:39:51 +0200 you wrote:
> > > Disable LEDs just before resetting the MT7530 to avoid
> > > situations where the ESW_P4_LED_0 and ESW_P3_LED_0 pin
> > > states may cause an unintended external crystal frequency
> > > to be selected.
> > > 
> > > The HT_XTAL_FSEL (External Crystal Frequency Selection)
> > > field of HWTRAP (the Hardware Trap register) stores a
> > > 2-bit value that represents the state of the ESW_P4_LED_0
> > > and ESW_P4_LED_0 pins (seemingly) sampled just after the
> > > MT7530 has been reset, as:
> > > 
> > > [...]
> > 
> > Here is the summary with links:
> >    - net: dsa: mt7530: disable LEDs before reset
> >      https://git.kernel.org/netdev/net-next/c/2920dd92b980
> > 
> > You are awesome, thank you!

