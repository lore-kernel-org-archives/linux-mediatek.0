Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535C9D232D3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jan 2026 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUtjsVJgpyn+V1ATrYKLDWmmxZiqnJNHwtVHwpb1sbs=; b=BIDWZrf0ddmzKFe2t1fXTwSM45
	ce8K2rgd4eqxBwC1OfcNGghpJuWncZ93HrSMM5/zgVYIjRtBU+63Z1PS/0Y16ezO0bwF+CrPVTM9u
	IJwyJmLGp2+291KUJCiqUCcrQvS+gFE7DIYTAdFstgTShiwiGtO2p1Ze1HaVgHwVaervbYnnWxKpq
	/VlN+qHH3+AG10lmlTMkNtiUAcJ2CozfkXjwsv1KGLZmesCt85OkFc5WWs09/qfYSX4a0Wy2DOQ+1
	v/R6Pu4XtOu8LDFFZGPANi3ofQvM47Gyz/r8ak7H6Oa6ECsADJaNT8jlaHwsvkwCobkGwphvRxQbG
	lpK0YxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeM1-00000003cJS-0tWI;
	Sat, 10 Jan 2026 19:10:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeLz-00000003cJM-1FBz
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Jan 2026 19:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B1A60168;
	Sat, 10 Jan 2026 19:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E762FC4CEF1;
	Sat, 10 Jan 2026 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072225;
	bh=OdadOUtAM3OBl/jYBH1aDVpB8Tb5MJjbAFxQCOIccSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1YmdzcyQ24YFmCngB2d4F8YnD7lgd3GeqNzZmyWEdTIc8mR15LzBmI6SKzlLUKZw
	 V3g30cIvOl7oNsMwjWk6emvx0a4h0P1XuQAvKIQY6dwZ3UI4x+H5dXCY9swVmBIjYb
	 XEEqawlkuO177pW2weZGBWDch7OdtT8E63as1lZHUharkcCq9UIidTKdvZsHsUBJU5
	 mK9XOicO0FD2jKIZZnrB8WIspE392qWBH3CBhv7KjgXqIzTn2z0u51vAtvhk2qW69w
	 2gewxCGgUNe2I9+GmB/Xm4GFBr52evHluDYdSzU06LCK9VS6OVUDCVlppYrRJ+Ph0B
	 y2O2ShYfFE1mw==
Date: Sat, 10 Jan 2026 13:10:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043146.4102967-1-tzungbi@kernel.org>
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

On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while

Please suffix functions with (), instead of treating it just like any
other `symbol`, this makes it easier to see what is a function and what
is an object/variable.

> the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> reverse dependency exists where `clk_prepare` can trigger operations
> that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

Can you please expand this explanation slightly. You're hinting that
there's an ABBA issue, but you're leaving it to the reader to know/guess
what that issue is.

I believe you have some concrete case where this is a probelm, please
include this, if nothing else as an example.

> 
> Move clock prepare / unprepare operations to remoteproc prepare() /
> unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> to `prepare_lock`.

Please expand this with an argumentation that the prolonged "prepared
time" will not have any negative impact.

> 
> This breaks the dependency chain in the lockdep report:
> > WARNING: possible circular locking dependency detected
> > ...
> > the existing dependency chain (in reverse order) is:
> > ...
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        scp_ipi_send [mtk_scp_ipi]
> >        scp_send_ipi [mtk_scp]
> >        mtk_rpmsg_send [mtk_rpmsg]
> >        rpmsg_send [rpmsg_core]
> >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]

If this is the AB case, can you please include a stack for the BA case
as well in the commit message?


With these things clarified, I expect that your patch is the correct way
to solve the problem.

Regards,
Bjorn

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..98d00bd5200c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  	struct mtk_scp *scp = priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  
>  	scp->data->scp_irq_handler(scp);
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
>  	ret = scp_ipi_init(scp, fw);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>  	struct scp_run *run = &scp->run;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>  		goto stop;
>  	}
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>  
>  	return 0;
>  
>  stop:
>  	scp->data->scp_reset_assert(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>  	struct mtk_scp *scp = rproc->priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>  
>  	scp->data->scp_reset_assert(scp);
>  	scp->data->scp_stop(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return 0;
>  }
>  
> +static int scp_prepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +	.prepare	= scp_prepare,
> +	.unprepare	= scp_unprepare,
>  	.start		= scp_start,
>  	.stop		= scp_stop,
>  	.load		= scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
>  		return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

