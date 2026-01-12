Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BF2C9EC72
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kptdBs4AFEE31SI8G2jNdZtjCyjheBn37/XF7nNah3I=; b=Wl2d+MZtJ8F6YgRx4EcJYIJIHA
	htKSIevnjH+RxDCF2dw6kXOYLU9nq00TxTXyskcf3ImSkR1LNJRA8VT+lVCQS1JO6CqaTuDQgxa40
	Wnf0uMLp2o7NGWzBfeYQZfPMB4VltgDw1mn16qIpEa/swRFh0q/HwhIf+4wODh8Jh8D/0XzhX6OK1
	BuGuk0JegSYyz170rqDqN4rtZ9VMRsug/DpJ0MqvtE22XeYfqzkbct6eGErtwm4Jz1P3t+/ld26lh
	hcT50wViBPhUlDztLaR8fNRfVCUFras7m2z9seBxSjTiheniOKYX4gkQHnOM5tEnxNZ0UAjds+zdq
	QhKv87EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFrP-00000005Dx6-3Out;
	Mon, 12 Jan 2026 11:13:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFrM-00000005Dwy-1iNE
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 11:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 786D26001D;
	Mon, 12 Jan 2026 11:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDB1C16AAE;
	Mon, 12 Jan 2026 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768216399;
	bh=tiFf2Hax6qiohmjLxT9EJq13kbkFEMihpUrXcadA+yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0+dU8cFO0JZbjcLt1ek31AKogkcQbNNCaOCyuZuSSGW/weNh5ABkmh75/6H4eKBX
	 MonYQjR8gezW6I46OTGhOT32qZau+uUh5PbXVBV5VnUznC4cTkSfeQEZQQIVy++gzH
	 OGUBnrMlzHniMna1dELhmvBwKl3cdj5qwBzFtAVie7MqHis/sE/YC+IWtea5fxMI/l
	 F20g15e8T6QQJA49n1Yn9zCgQJEZ0OYfFAAJRib+tNbNQ/aEX5ETLEuXwYOzjtec8L
	 KdIdIjROIgrGmDl95CIKzGbaoNEP4+Qw6UXYw56doXJZLDwww42lfLkDA2UYUB2lpb
	 z6vjU/yQGpKfg==
Date: Mon, 12 Jan 2026 11:13:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aWTXTMTanGj1io3b@google.com>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>
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

On Sat, Jan 10, 2026 at 01:10:22PM -0600, Bjorn Andersson wrote:
> On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> 
> Please suffix functions with (), instead of treating it just like any
> other `symbol`, this makes it easier to see what is a function and what
> is an object/variable.
> 
> > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > reverse dependency exists where `clk_prepare` can trigger operations
> > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> 
> Can you please expand this explanation slightly. You're hinting that
> there's an ABBA issue, but you're leaving it to the reader to know/guess
> what that issue is.
> 
> I believe you have some concrete case where this is a probelm, please
> include this, if nothing else as an example.
> 
> > 
> > Move clock prepare / unprepare operations to remoteproc prepare() /
> > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > to `prepare_lock`.
> 
> Please expand this with an argumentation that the prolonged "prepared
> time" will not have any negative impact.
> 
> > 
> > This breaks the dependency chain in the lockdep report:
> > > WARNING: possible circular locking dependency detected
> > > ...
> > > the existing dependency chain (in reverse order) is:
> > > ...
> > > -> #0 (prepare_lock){+.+.}-{3:3}:
> > >        __lock_acquire
> > >        lock_acquire
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        clk_prepare
> > >        scp_ipi_send [mtk_scp_ipi]
> > >        scp_send_ipi [mtk_scp]
> > >        mtk_rpmsg_send [mtk_rpmsg]
> > >        rpmsg_send [rpmsg_core]
> > >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]
> 
> If this is the AB case, can you please include a stack for the BA case
> as well in the commit message?
> 
> 
> With these things clarified, I expect that your patch is the correct way
> to solve the problem.

An attempt: https://lore.kernel.org/r/20260112110755.2435899-1-tzungbi@kernel.org

