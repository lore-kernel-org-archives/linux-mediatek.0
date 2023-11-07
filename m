Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D808C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qfHGaw+qQc3teLfUDPF4NRMrRggBRJWg7K58kjcQCA=; b=ef0ZeBHwjviAGwZ2u5xgKiXFR3
	tPhjZ9lXigvVmEVXy6nmnkFWVTRry/kKNNamfo+crHjS4EwRKTcSgWb1KErN7Oi8wCCBrXic8ze4t
	6tsiIp0uYxt1brxrG8NF0OEYr0hvSEAVWuWSWbJzkwOpudPnnUQyyOyrI4ugOsvdkRQibIU1aLTw2
	+ySnKo4rYfragOoJimRrQpp77x8L5daAyyuJ6zMnii3kIMCZb4SpKy+Jg9t/S3UBVanWM7eOeqws8
	QzaeanXz2dv+wgtgoBdU9MknU1VjW3YNZRzAdy31UiCvGPHqngDHwJxoDEYJkSTOCkmkTR7AyTzBW
	RfF/h5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KOf-001JEW-1x;
	Tue, 07 Nov 2023 11:37:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KOb-001J9L-3C;
	Tue, 07 Nov 2023 11:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8047F61172;
	Tue,  7 Nov 2023 11:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23444C433C7;
	Tue,  7 Nov 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699357041;
	bh=txhWC7Qk/B+OuUbVMEFoUuEQ+inCT1iopvkXocpTbpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nLI4zejY3Awsws4zBH2Um0JJUz32OBAW7xmtGH7vvZ1dz1Wu0Rp63D1NMYOQXwRJ+
	 e2a8+oHGAthz7QNzYYBdR5AUn4kOpZzbO6Cjmcbj7eg1/erqLEYbnyQvAskU3bHWbu
	 2oObyICVXiIDe2rEgcmPqBhe6flbtAbFCFwxEP8IanBA1QiVHM9LEi0YoeALUlV071
	 s0vILooiXx8N8Nn5zY1nzleZOTlHZ9R6Gq6PZrkmvOCUimLuASBXz9YsTwaR8tjryv
	 +fxmj+smX+T4+1+fa/9brOIy0AdErquwXKZJekQLIaOoaMWlBpKNrlZ4k3xgVdNZ2Q
	 yKkzmCLIX72DQ==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1r0KOU-00B4hc-CM;
	Tue, 07 Nov 2023 11:37:18 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 11:37:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Remove Mediatek pseudo-NMI firmware
 quirk handling
In-Reply-To: <CAD=FV=UVkE9k=o3-3UT2L172hhAH-gtpe5ByELN8srC+a-7mJw@mail.gmail.com>
References: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <20231006151547.3.Ie582d33cfe46f9ec2248e7f2dabdd6bbd66486a6@changeid>
 <ZS-8k22ZWgn5hcCd@FVFF77S0Q05N>
 <CAD=FV=UVkE9k=o3-3UT2L172hhAH-gtpe5ByELN8srC+a-7mJw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <0efbd5a2cfb5dab0876038ae726dc180@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: dianders@chromium.org, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, wenst@chromium.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_033726_178800_DED622E5 
X-CRM114-Status: GOOD (  21.23  )
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

On 2023-10-30 23:01, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 18, 2023 at 4:08 AM Mark Rutland <mark.rutland@arm.com> 
> wrote:
>> 
>> On Fri, Oct 06, 2023 at 03:15:53PM -0700, Douglas Anderson wrote:
>> > This is a partial revert of commit 44bd78dd2b88 ("irqchip/gic-v3:
>> > Disable pseudo NMIs on Mediatek devices w/ firmware issues"). In the
>> > patch ("arm64: Disable GiC priorities on Mediatek devices w/ firmware
>> > issues") we've moved the quirk handling to another place and so it's
>> > not needed in the GiC driver.
>> >
>> > NOTE: this isn't a full revert because it leaves some of the changes
>> > to the "quirks" structure around in case future code needs it.
>> >
>> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > ---
>> 
>> I think it might make sense to fold this into the patch adding the 
>> cpucap
>> detection. Otherwise, if you apply my suggestions to the first patch, 
>> there's a
>> 2-commit window where we'll have two places that log that NMI is being 
>> disabled
>> due to the FW issue. That's not a functional issue, so doesn't matter 
>> that
>> much.
>> 
>> Either way:
>> 
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> I'm happy to go either way so I'd love some advice from maintainers
> (Marc Zyngier, Catalin Marinas, Will Deacon) about what you'd prefer.

I honestly don't mind either way. The sooner we have these fixes
upstream, the better, so my only advise would be to respin it
shortly.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

