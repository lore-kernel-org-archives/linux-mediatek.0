Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39557C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfCwZ2AwhrE2Zd1Kkt7i9hQF6qrDNPRufzN+RHay758=; b=BfoYZnj1ohv2iAGfhtuZ1dSZFX
	2Dbf7+BHkZYwQB0B3oneCXnhRGopZPK28TJcyaW9OboEpdm04JStZJ+riycpfFPn3kpZOngADrIgj
	YlJDqIJnaD8IME1MlMnmpXHkJZBQdGPlE/byqykuYs/rWAw99NH6R0SjA239m714AX+BFltuuh4+v
	pFG7qpbvzCF0qLdgkia6N0MJbFmXw3P4js7sKtOLg1sJVi0ryAMca1f9FafZHc0HBmKcL/AMXD13h
	v5DEN9smHXVPb1gt/WD6ZqgRzqrPPb3iJb5mHaVPYXJ8eh064yGbHB1g89navD9eRa/6PVaVlx+mR
	s7uGdZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTyN-00000002sDp-23My;
	Thu, 18 Apr 2024 15:46:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTyG-00000002s7A-3S5o;
	Thu, 18 Apr 2024 15:46:48 +0000
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A03C802;
	Thu, 18 Apr 2024 17:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713455153;
	bh=K6H40zZOBruNXEKy+mLBxL40J3Voj2XWEqqGuvJ9w94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNiKJAJDsTkJYMYK4ZtsZ9zlV7xPYE85xk9V7yAnZZ4lXnvj+UhwJ4fKqYaFra0Xc
	 2eBi44CBZWoMWyMkwDoCJV3GUcE9zfI7hzMI60oHIg/o5NGSS92iXbFgMGqv+gOkZe
	 2N/SspWfXOLe5x5IbsUKTfY8A/Ga1vjvyZkxLsrw=
Date: Thu, 18 Apr 2024 18:46:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
Message-ID: <20240418154633.GD31776@pendragon.ideasonboard.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
 <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
 <20240418105310.GV12561@pendragon.ideasonboard.com>
 <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_084645_705461_CE00595C 
X-CRM114-Status: GOOD (  40.26  )
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

Hi Ricardo,

On Thu, Apr 18, 2024 at 04:51:06PM +0200, Ricardo Ribalda wrote:
> On Thu, 18 Apr 2024 at 12:53, Laurent Pinchart wrote:
> > On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> > > On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > > > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > > > In my opinion, it's better to just ignore old warnings.
> > > >
> > > > I agree. Whatever checkers we enable, whatever code we test, there will
> > > > always be false positives. A CI system needs to be able to ignore those
> > > > false positives and only warn about new issues.
> > >
> > > We already have support for that:
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads
> >
> > Those are manually written filters. Would it be possible to reduce the
> > manual step to flagging something as a false positive, and have a
> > machine build the filters ?
> 
> Do you expect that the list of exceptions will grow?
> 
> I hope that once the CI is in place we will fix the warnings before
> they land in the tree.

Any static checker is bound to produce false positives. Some of them can
be addressed by improving the checker, others by modifying the source
code, but in some cases the first option would be too difficult and the
second would reduce readability of the code. I thus thing the list of
accepted false positives will grow over time.

> > > But it would be great if those lists were as small as possible:
> > >
> > > - If we have a lot of warnings, two error messages can be combined and
> > > will scape the filters
> > > eg:
> > > print(AAAA);
> > > print(BBBB);
> > > > AABBBAAB
> > >
> > > - The filters might hide new errors if they are too broad
> > >
> > >
> > > Most of the patches in this series are simple and make a nicer code:
> > > Eg the non return minmax() ,
> > > Other patches show real integer overflows.
> > >
> > > Now that the patches are ready, let's bite the bullet and try to
> > > reduce our technical debt.
> > >
> > > > > When code is new the warnings are going to be mostly correct.  The
> > > > > original author is there and knows what the code does.  Someone has
> > > > > the hardware ready to test any changes.  High value, low burden.
> > > > >
> > > > > When the code is old only the false positives are left.  No one is
> > > > > testing the code.  It's low value, high burden.
> > > > >
> > > > > Plus it puts static checker authors in a difficult place because now
> > > > > people have to work around our mistakes.  It creates animosity.
> > > > >
> > > > > Now we have to hold ourselves to a much higher standard for false
> > > > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > > > Drokin has told me previously that I spend too much time trying to
> > > > > silence false positives instead of working on new code.  He's has a
> > > > > point which is that actually we have limited amount of time and we have
> > > > > to make choices about what's the most useful thing we can do.
> > > > >
> > > > > So what I do and what the zero day bot does is we look at warnings one
> > > > > time and we re-review old warnings whenever a file is changed.
> > > > >
> > > > > Kernel developers are very good at addressing static checker warnings
> > > > > and fixing the real issues...  People sometimes ask me to create a
> > > > > database of warnings which I have reviewed but the answer is that
> > > > > anything old can be ignored.  As I write this, I've had a thought that
> > > > > instead of a database of false positives maybe we should record a
> > > > > database of real bugs to ensure that the fixes for anything real is
> > > > > applied.

-- 
Regards,

Laurent Pinchart

