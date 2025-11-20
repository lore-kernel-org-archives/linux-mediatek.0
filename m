Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9ADCF8854
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZYK1BQq2N1wQlUTT59rGy7ykJxlB9+J9uuHhYjIhS4=; b=znROoz93uzabGRS7mV4dBummQY
	L6qffU4DVpHIsXVSLs0RB/Z6+Oj6alC7R+a9WCZYjjaSbPFuTgNdg+K+IjAJWoZSt0ECzve8OgmKy
	1Ieb9ZPZGHy8xgjFeolg9U+5KKhN6/zyBYDUjZiMxOXNgnroGLFtg46nLOgJOj0T9HunNTo/mZMYg
	r5YG/0zW/hWUq8WmlHEFr54yQ7IK7CsJnXp2JNidelAiMrkKS7ncnNn5bVaVDLLl4prHO9nTvnZJY
	btUbY5IrsTDVxTRjakj3OYnMPa4cG7UzNWApRV1ckm2sv5/bsCab9xuZxuer0MEkfnpeQsryJwn75
	xoHsq/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Un-00000006haj-2ipK;
	Thu, 20 Nov 2025 13:14:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Um-00000006hab-3zBh
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 13:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17DFA6014A;
	Thu, 20 Nov 2025 13:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8643C4CEF1;
	Thu, 20 Nov 2025 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763644483;
	bh=690R1aIqXEsiV77CfJMMMfFWoAn24bRFYzdx8kvtixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQU99WBs2qEKt6naghA1nCIHyeEQ8pr6t2TvmQ1rUMQvca0y8a34RlFqHlH0ijsLe
	 hKqPJvaWHza2aI6+rV6Yqw/59GMmhbY/5OmT9UhCrS1znroxyYwXMhujsi2MPFOqr+
	 DaukWIRw6WlW2gklO9cjrBEkzlBFNL97/IuDGZ4wV/L6gRrkir/9S5MrtIJUsXdBL3
	 0qFZcCwVfoCL9VHMs7fch7vC4gauFl3f4VDYYUIc5wXb8O6v5bLUQbK0McESRSMZRI
	 tmfVpOHfs1mPxENo8XIWci+ZtrVWJgL+MmD2SMW2IvnVo+cXxu7udsZZDQm8KORF62
	 jNMknfrlaktug==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vM4Um-000000003n1-05j9;
	Thu, 20 Nov 2025 14:14:44 +0100
Date: Thu, 20 Nov 2025 14:14:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
Message-ID: <aR8URPPYRBuVCdDk@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
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

On Tue, Oct 28, 2025 at 11:04:52AM +0100, Johan Hovold wrote:
> This series fixes VPU device leaks during probe of the mdp driver.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.

> Changes in v2
>  - drop incorrect vcodec patch since that reference leak has already
>    been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
>    firmware interface") which added the codec release callback
> 
> 
> Johan Hovold (2):
>   media: mediatek: mdp: fix device leak on probe
>   media: mediatek: amend vpu_get_plat_device() documentation

Can these be picked up for 6.19?

Johan

