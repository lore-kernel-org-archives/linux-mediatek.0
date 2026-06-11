Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA38DCD98C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z2obxuOlT0K7zT6h2EEIhqYsBu6dly8lQ8sboW2Vpg=; b=Xgff6yspA+9ZlT/alxx9tu025v
	On7FTomrGY6U8pcSb/0K2KkeAEgQvO/q8O+OGOlX0Wa15lhKRBNauMPj9Fjbh9LyACA4REMUc4poz
	Pzeam+G8A+Yvqy+Tr1yWa1hWzPf0HQcH97y15ZNXuLf2M8JgxxG3DAW1KXFfMChN0BJhnVqti37vT
	MB+2CHU3Z4uue8UfiOYcAGaSx/DdiK8epWs5I2FPzh1q/CRLTR4lqTOOaRx6v7Fo0NfQl4bQ7yZCa
	in37xb8IDFdNeNgXDg0cDuUk2kOG2Ybyn99LNUIvyuIZdxzLqs4Hu2DV/THy0CGWBLkvGv8Q70anR
	piLpZcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhzr-00000009jmC-2Z9m;
	Thu, 11 Jun 2026 16:11:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhzq-00000009jlr-0IHa;
	Thu, 11 Jun 2026 16:11:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAF2B600AA;
	Thu, 11 Jun 2026 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959A81F00893;
	Thu, 11 Jun 2026 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194267;
	bh=5Z2obxuOlT0K7zT6h2EEIhqYsBu6dly8lQ8sboW2Vpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogkbxZUc39myVWyZO/P2nkC1S3nQ2/OgknkpsBselFFFzetmAo6fgC8uyExejtM8C
	 yPgr7v1BOMEJdWly48BpVxjszwWo4fxd6yIm/EqpR77LsI860MieNfFRosaQPmNxX2
	 h0tlcUOhDdYUg3eGorT/xVpGr0pk4MbY9RF+ZyyuRBor3CFGq7qxWQdFZCt9Nph0nb
	 wXPCfzJgATb7DrOcZyQI6vXJ+pC+QObxDEjVYao8PD4+hIij6THJIPOqdQtJT7iPUT
	 72oBGdd6O0TsKlJAI9Av0a8oC1b4el2Tu5nafhWn3HCMHdCbzThg0s1EegtUVyzdFT
	 BaI8ZDckVca9Q==
Date: Thu, 11 Jun 2026 17:11:02 +0100
From: Simon Horman <horms@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: mediatek: fix refcount leak in mtk_probe()
Message-ID: <20260611161102.GV3920875@horms.kernel.org>
References: <20260609081300.208168-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609081300.208168-1-vulab@iscas.ac.cn>
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

On Tue, Jun 09, 2026 at 08:13:00AM +0000, Wentao Liang wrote:
> If mtk_sgmii_init() fails after successfully creating some PCS
> instances, it returns an error without cleaning up the partially
> created ones.  mtk_pcs_lynxi_create() increments the fwnode
> refcount for each PCS it creates, but this refcount is never
> released because mtk_probe() uses a plain "return err" instead of
> a goto to the err_destroy_sgmii label.  This leaks both the PCS
> devices and their fwnode references.
> 
> Fix the leak by jumping to the existing err_destroy_sgmii path
> which calls mtk_sgmii_destroy() to safely release all allocated
> resources.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9ffee4a8276c ("net: ethernet: mediatek: Extend SGMII related functions")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

I think that a better approach would be, on error, for mtk_sgmii_init()
to release any resources it has allocated before returning.

Also, I'm not convinced this is stable material
as I'm not sure it's bothering anyone.

...

