Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D41CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJess6RuQMSWhPSA8IlgB6KKuFZN08U6M1XLsNn6ak0=; b=wX7i5vpqx9ipNrKab5VtNzMi9F
	CQjv050miC/xsmuew4m/gs2+iF/f+lIheLKLuGshk+vzz17vUsTYJ/IvFxojmKj1oAwV2WbMjwd8c
	6trGdWyc6TRimTC/R36k112RHzi/CIKVnnnnYI7jIyzt+aMBdRfdGNai+qsju3zqxsVoukXcewX94
	HdVZScgzlo6gC2rB6Qgkgq0ZMdH/H43nJvJH9zsGpFtwv6F73YA2n+4XKGyjZWIXvtiXhOZVFKDLZ
	zoaOhfrr98jIrkFNMWm7PcvclrG94zumKM5ZxxgEeu+iIDJ+k7/1Zs5NDd4thoTvKQ1zclBLNdxB7
	Qs5+qOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Tt-00000008CGq-461l;
	Tue, 09 Sep 2025 15:42:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvCf-00000006EJy-11r8
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 10:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88E4D601BA;
	Tue,  9 Sep 2025 10:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31718C4CEF4;
	Tue,  9 Sep 2025 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757412236;
	bh=MX1yEKtU1XlkDkySNWFMl83sKLvqqiq1wh9vWRpHFI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcNGCFiGtCBdlK6h3ILvTV3+IPmzjlaTRMi9z9G1FxFYljC0M7EBZ5EmsWrmiGzp/
	 gVMFc2QKLoySwHA70lazg0F30+jLHbFTn+WcYnAEF9eG2ETDjGzxLIjS4K6rw2c9mz
	 2D3bGFHNjV1s57QvgcFtygPVer631Myaiuo7jQkZ3/6LxtdFWK+YrQcV/NHjIWy38H
	 Dp4jp2uruQtJSsxQNOLAGj3TjDCw6/AdL+t68/59DknoP7AhnKnTIGNIa98YDReGXU
	 o3BvpcNq6EerKPwmuQIloDBc5Nh8JnQIYXuBq1tBpg1hwwu+9AGk7lXlbeIP0LH4Ed
	 BOh4I1W6SjGvA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvvCc-000000001ZX-0dx4;
	Tue, 09 Sep 2025 12:03:54 +0200
Date: Tue, 9 Sep 2025 12:03:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH] cpufreq: mediatek: fix device leak on probe failure
Message-ID: <aL_7ituSjf5a0p_U@hovoldconsulting.com>
References: <20250909073819.25295-1-johan@kernel.org>
 <CAGXv+5EcnLJHG_50mYb2YB0_q1XOztF84c9tAJJfKZxSCWuUCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EcnLJHG_50mYb2YB0_q1XOztF84c9tAJJfKZxSCWuUCQ@mail.gmail.com>
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

On Tue, Sep 09, 2025 at 05:57:45PM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 9, 2025 at 5:40 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > Make sure to drop the reference to the cci device taken by
> > of_find_device_by_node() on probe failure (e.g. probe deferral).

> > @@ -552,6 +554,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
> >  out_free_mux_clock:
> >         clk_put(info->cpu_clk);
> >
> > +out_put_cci_dev:
> > +       if (info->soc_data->ccifreq_supported)
> > +               put_device(info->cci_dev);
> 
> put_device() has a check for NULL, so the if isn't really needed.

I know, but this follows the pattern currently used by the driver (e.g.
for regulator_put()) and avoids relying on the caller having cleared the
info struct.

> Either way,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for reviewing.

Johan

