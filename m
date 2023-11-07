Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BBBC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I804T6/GW37lh6aXKyeM+UsKPS03yXgg9+Lmc53bPiM=; b=IyWNUsWXH/qa8k4r1eqduAaqz7
	Q0lK7ii58OhEI9MYKfwwtKIf61NwNz0qSOxwBBrupSnmLfqkQwKLHOOTAUlOcUHqIFosuaQuUaqg1
	kEwF9ZVox73FxxBQmZUqIl6dS2G2saCuuVcS9VucKC+IGAz0ufCPKvLapSnp8wv/C4D+KNny8Fqae
	KcpurWYXW5xrc138Ge1N/2eZgQ9AtEziVoZnbaaNhyeDUtW51ofGBFHX23Wq4VCS5q1Hb2LdPXNZ5
	JHIMSugNrpkKU6jGCuhH7O3axiJi4FXlqyzV3v5gpm+gzni0B6hd5JPaSmQ9Ko8C7yz58E+tyWx1T
	kY1nkY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0LqV-001aS7-2s;
	Tue, 07 Nov 2023 13:10:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0LqR-001aPg-2l;
	Tue, 07 Nov 2023 13:10:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E9213D5;
	Tue,  7 Nov 2023 05:10:55 -0800 (PST)
Received: from arm.com (RQ4T19M611.cambridge.arm.com [10.1.33.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83073F6C4;
	Tue,  7 Nov 2023 05:10:09 -0800 (PST)
Date: Tue, 7 Nov 2023 13:10:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Remove Mediatek pseudo-NMI firmware
 quirk handling
Message-ID: <ZUo3L7zGwbUTbdnj@arm.com>
References: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <20231006151547.3.Ie582d33cfe46f9ec2248e7f2dabdd6bbd66486a6@changeid>
 <ZS-8k22ZWgn5hcCd@FVFF77S0Q05N>
 <CAD=FV=UVkE9k=o3-3UT2L172hhAH-gtpe5ByELN8srC+a-7mJw@mail.gmail.com>
 <0efbd5a2cfb5dab0876038ae726dc180@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0efbd5a2cfb5dab0876038ae726dc180@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_051015_937678_4229AFEB 
X-CRM114-Status: GOOD (  25.33  )
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

On Tue, Nov 07, 2023 at 11:37:18AM +0000, Marc Zyngier wrote:
> On 2023-10-30 23:01, Doug Anderson wrote:
> > On Wed, Oct 18, 2023 at 4:08 AM Mark Rutland <mark.rutland@arm.com>
> > wrote:
> > > On Fri, Oct 06, 2023 at 03:15:53PM -0700, Douglas Anderson wrote:
> > > > This is a partial revert of commit 44bd78dd2b88 ("irqchip/gic-v3:
> > > > Disable pseudo NMIs on Mediatek devices w/ firmware issues"). In the
> > > > patch ("arm64: Disable GiC priorities on Mediatek devices w/ firmware
> > > > issues") we've moved the quirk handling to another place and so it's
> > > > not needed in the GiC driver.
> > > >
> > > > NOTE: this isn't a full revert because it leaves some of the changes
> > > > to the "quirks" structure around in case future code needs it.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > 
> > > I think it might make sense to fold this into the patch adding the
> > > cpucap
> > > detection. Otherwise, if you apply my suggestions to the first
> > > patch, there's a
> > > 2-commit window where we'll have two places that log that NMI is
> > > being disabled
> > > due to the FW issue. That's not a functional issue, so doesn't
> > > matter that
> > > much.
> > > 
> > > Either way:
> > > 
> > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > 
> > I'm happy to go either way so I'd love some advice from maintainers
> > (Marc Zyngier, Catalin Marinas, Will Deacon) about what you'd prefer.
> 
> I honestly don't mind either way. The sooner we have these fixes
> upstream, the better, so my only advise would be to respin it
> shortly.

I agree. I can queue them for rc1 if they turn up in time.

-- 
Catalin

