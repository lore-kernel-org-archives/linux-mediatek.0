Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE47C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m5Yf0KMdA8LDE+11LBMRA61gUdFtv3bjHZyucN29n4=; b=10cRStXR336STT3ZK5qz1pgUFg
	SmtFsHoh/z1Tf4+hupMpnQ+w12xUTCuqlkoD0HBgFnhw7JKuBuKXRfgEArYealzH9RfXDmps1eYEB
	XGIf///GABiI3TTtER636ck0zQDE3ymBDGIQblYER1InGGq1nERR6WWf6LiNrl5Y1VDStGvxwv+Kf
	48E+kD0hyDB4GYrUcrJQ7EzNZVVohDl82g6SDzyqlOaRDc9LT50nHI8JFOQ84DxXzlGTRggFUOU/A
	QtLeolazm+w51VwwMBeoU7dB/O1Z3Xjulfr7QrCNlJMFN207Ntwh6fDw0r0WaNg5cGLR6q5tw+N/J
	IOMEgroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RnM-00AL6M-1h;
	Tue, 23 May 2023 13:11:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RnJ-00AL5r-1u
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 13:11:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79B7A60B78;
	Tue, 23 May 2023 13:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471A2C433EF;
	Tue, 23 May 2023 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684847475;
	bh=Sddi6O0W7Q4lS+qA4cWluXzgfscZUqbIj8VrG2ya2OU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s9zE2SLW1Kcosn3utWP71RzVK9W9s7NPberv0YFBtxz1tMovUCjSnHPexxHdIJ4LI
	 P57uNVw8heqJLBVr7lnN7bV2qC2bJbunDvXVETzYJVNIg6EHh1vcJs4wFOI052YcaL
	 XjSv0SFKKf09sW03GjkO9iXinC1C8IDBXgkJ7tFan+sHkIyoSN81qw1KZWyrtuy6+i
	 JpdDh2zJP4VsmggP6dGodjbRvZXp8ST8NoY+0x4WSuIRClUOEKeiXHAq/+A9axcPX8
	 2uTLQiiCWLSqsWExsj0K4v3iIM8hUSCzbY4oeB0h8RvOlWWYtKGwS/s1cGcqhon1YZ
	 zRLl+FHmHIi/g==
Date: Tue, 23 May 2023 15:11:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186
 boards
In-Reply-To: <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm>
References: <20230427035656.1962698-1-fshao@chromium.org> <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_061117_733349_EE9D0276 
X-CRM114-Status: GOOD (  28.91  )
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
Cc: devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, Matthias Kaehlcke <mka@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 19 May 2023, Doug Anderson wrote:

> > These changes are based on the series in [1], which modified the
> > i2c-hid-of-goodix driver and removed the workaround for a power leakage
> > issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
> >
> > The root cause is that the touchscreen can be powered in different ways
> > depending on the hardware designs, and it's not as easy to come up with
> > a solution that is both simple and elegant for all the known designs.
> >
> > To address the issue, I ended up adding a new boolean property for the
> > driver so that we can control the power up/down sequence depending on
> > that.
> >
> > Adding a new property might not be the cleanest approach for this, but
> > at least the intention would be easy enough to understand, and it
> > introduces relatively small change to the code and fully preserves the
> > original control flow.
> > I hope this is something acceptable, and I'm open to any better
> > approaches.
> >
> > [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium.org/
> >
> > Changes in v4:
> > - Minor coding style improvement
> >
> > Changes in v3:
> > - In power-down, only skip the GPIO but not the regulator calls if the
> >   flag is set
> >
> > Changes in v2:
> > - Use a more accurate property name and with "goodix," prefix.
> > - Do not change the regulator_enable logic during power-up.
> >
> > Fei Shao (2):
> >   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
> >     property
> >   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
> >     property
> >
> >  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
> >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 +++++++++++++++-
> >  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> Just double-checking if there is any work needed on this series. I
> think it's ready to land but I wanted to double-check.

I don't think I've been CCed on the dt-binding part (patch 1/2 I guess). 
Has it been Acked? If so, I will happily take it through hid.git, but 
please send it my way.

Thanks,

-- 
Jiri Kosina
SUSE Labs


