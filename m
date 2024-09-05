Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687ECD4F50
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 04:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=038UJ3f6IVz3kd6xhfpDVqnDtr04EcD9hufJkuqcunQ=; b=L+vQ6o7aJVVxHOpt34La8uMutQ
	Z6w7vxWC/72zSYnGWfodD1VhVnl24+5S6VKRXs7MhoD5jkEh53frPti/re/fy7DZ8JUf36GE5/1qv
	pW2F7dBfQ1ZuVoqlYtn6+H4hEU7E3k/4Qfqk2DO+I5gVFwPOWfieLTLTRFOb9fTkwOTucIXUi7bgi
	s196cvNjdNHI5pL/vplGoQImFaLXvLsLkI0HZj50zsDX6v+0TEQLX8LA7AtthS8bFIFPLulSOB5sq
	uhc+n6Lf0po/yRadZkOzFGt69wFbmtP/b9IT42lVzV1uJrufWU/FtWvX6hbEFMf2cszKdf6GBZCC6
	5gEZvxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm4M6-00000006yTM-1mST;
	Thu, 05 Sep 2024 04:44:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm4Ck-00000006wrk-0jui;
	Thu, 05 Sep 2024 04:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E23725C5763;
	Thu,  5 Sep 2024 04:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8E2C4CEC4;
	Thu,  5 Sep 2024 04:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725510885;
	bh=aPzXBFJHZm3v5j42RugmPOfTrNEaxPAD9cyBL8Jy5es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzQjuqhbR5wPPcWHl/FbBnE0uuPsHOluaUd1sTO7pHzAb6vgvtWbRrhL407j9fZst
	 9IsKyhrl3MVioqsM0nU8pXDRJTDNDlgPrIL+yvljJzqeGNiXJZelkxWHYfm71o9qNN
	 V2Wt6fxVLrsMvZejgkA4oArt/uh0GuZQN4Mi7o5vbawRK06WB4Rc8YaxfkRYYfYk6X
	 F9LV/S2mQJPgs0GPcAp9CnNci9Ifphc+GCs0DW5br0E18o7zDfk+GZf/Q2FiQ0DkZq
	 b+HunivnFrX3yQMka7iahJXaOJnIr4X1SwTEwGo98nwXT36kEq09SeZ985dSvjWls1
	 C42rPp05PN1rg==
Date: Thu, 5 Sep 2024 04:34:40 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Ztk04Pfa3tXyrDJq@google.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-12-wenst@chromium.org>
 <Ztgxlmhnkn7NVC81@google.com>
 <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_213446_328342_97BBD8CA 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Sep 05, 2024 at 11:52:32AM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 4, 2024 at 6:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> > > diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
> > [...]
> > > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > > +{
> > > +     for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > > +             int ret;
> > > +
> > > +             if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> > > +                     continue;
> > > +
> > > +             ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> > > +             /* Ignore unrecoverable errors and keep going through other probers */
> > > +             if (ret == -EPROBE_DEFER)
> > > +                     return ret;
> >
> > Is it harmless if some of the components get probed multiple times?  E.g.:
> > comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
> > later, chromeos_of_hw_prober_probe() gets called again.
> 
> Yes it is harmless. Components already enabled will not get disabled
> in the error path. And the prober that enabled that component will see
> that a component was enabled, and skip doing the whole process again.
> 
> So something like:
> 
>     comp1 probed -> comp2 probed -> comp3 -EPROBE_DEFER ->
>         comp1 skip -> comp2 skip -> comp3 probed

I assume this patch will be applied through the i2c tree:
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

