Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNKBTiyzazOQiPLalZw7RlUKoJHDeGxtG5eUGa/jo3c=; b=EgQ7Fevb4JcToDufWQAV4m9SVc
	mhVOqiMHNuT1DUJdbK6KLxzmmdV6nf9sRv1UavKAPzcuKVfZYBefLP7da/IJfXAW4a0nXHPWQwpVx
	rQNTcd80qaVU4iFSav7A6VdE5QFaAjL/uTsCx0CUiCjyP3CIHWbdSB92PcFOqkrP0giXPLEzqMMe/
	RDJKZOGMFv9nfJLRKbLOv1Hf1bTsuD7MadvC4eP78YB73pyNJt6A44wo7Ae1FuQqBg3ZTceO4N5g3
	5GQL0R7UMM2M2PCJgMvB0lx3ah2ZR/3Tw8iNDRvLXdvm5tbYYrB/WAC5wbTX279SOm6VBp63RY76s
	MQolaoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ImD-0019BF-Pl; Mon, 20 Jun 2022 14:53:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Im2-0018nL-75; Mon, 20 Jun 2022 14:53:07 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4726F66016AC;
	Mon, 20 Jun 2022 15:52:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655736779;
	bh=xp4iD9VvxWQO3iGiqNjrIMxyQ6VBElMaMUahY/LVwS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNPFGstPolfiS0TNNLwD/ZuqLGWms3hLfb0mCuHXIBvhlPkfrbiHDXTKwQBkzrQo2
	 GnYcz5WCgY3LpG4tM1pnJ80w207ca795BCIQWOFF8KndwzN6Kd9UhZ5inCJlvlsqpX
	 D/w4hzylaPUB/JC+HZxJ51rima4VzY6PdhPgWJ9gmzKV+KpZ5tVJriJQQGW5pS5rPT
	 VLpt/6/BPRVw+Tlc74Fr9krCwGkk+WP0i2vsrACx9Kroamo82JveYuWTsAlcFPQO9O
	 yCDXTFeHuZEXH4CwbUlL2qDYsnorpIdaDe0CqiseTi5iG944mKGUHReQ3R7YUXc0eA
	 JW5IM7pU3haBg==
Date: Mon, 20 Jun 2022 10:52:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Drop
 platform_get_resource(IORESOURCE_IRQ)
Message-ID: <20220620145254.p52iqrfloteof7py@notapiano>
References: <20220617203906.2422868-1-nfraprado@collabora.com>
 <8956bb3e-60d7-a882-3672-f2a2f0bf858d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8956bb3e-60d7-a882-3672-f2a2f0bf858d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_075306_429173_74EE5CD6 
X-CRM114-Status: GOOD (  24.89  )
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

On Mon, Jun 20, 2022 at 09:58:01AM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/06/22 22:39, Nícolas F. R. A. Prado ha scritto:
> > Commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource
> > from DT core") removed support for calling platform_get_resource(...,
> > IORESOURCE_IRQ, ...) on DT-based drivers, but the probe() function of
> > mtk-vcodec's encoder was still making use of it. This caused the encoder
> > driver to fail probe.
> > 
> > Since the platform_get_resource() call was only being used to check for
> > the presence of the interrupt (its returned resource wasn't even used)
> > and platform_get_irq() was already being used to get the IRQ, simply
> > drop the use of platform_get_resource(IORESOURCE_IRQ) and handle the
> > failure of platform_get_irq(), to get the driver probing again.
> > 
> > Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > Tested on mt8192-asurada-spherion.
> 
> Yep, that's totally necessary... Except the Fixes tag should be wrong here,
> as you're not fixing that commit, but the mtk-vcodec driver in relation to
> what's happening due to said commit.
> 
> I get that you're trying to tell everyone "this is an urgent fix", though,
> and I agree that this *has to* get in v5.19 to avoid breaking this driver.

The commit I'm pointing to in the Fixes tag [1] says "Now that all the DT
drivers have switched to platform_get_irq() we can now safely drop the static
setup of IRQ resource from DT core code.", and while there were patches by the
author [2] to do the required changes on some drivers beforehand, some were
missed, including the mtk-vcodec-enc driver which I fix here. I see at least one
other driver that was missed [3], and it also used the same Fixes tag.

I know that my change isn't meant to be part of the commit in the Fixes, but I
still think it makes the most sense to keep this tag, since its meaning is that
that commit broke the support for this driver and this commit fixes it. Wherever
that commit is applied, this one should too to make sure the mtk-vcodec driver
keeps working.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220316200633.28974-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20211220011524.17206-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[3] https://lore.kernel.org/all/20220609161457.69614-1-jean-philippe@linaro.org/

> 
> Finally, for the code:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ...but I think that you have to send a v2 that drops that Fixes tag.
> 
> Cheers,
> Angelo

