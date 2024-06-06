Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A764C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNdeZQSKf2IqqK3qzU1VMTEZkMaINNY9Pq71b3gQVIQ=; b=ahlBb2hGRQb97PflP8mEjHlgrB
	qZf220Mud+ne3nekG0UiAi8zyxwaXEHAS08fTPGnPxV61T8HgN15PpmP78fMvmjG1Ei/9rRnQNxdL
	0lLq1gDH25OfxXQtmDQ8eQVkMzv7i6lD3t8QuLtz/o/WsQp3dJ0w6uPqCX7kJHNzd0Hc5xDOON1Pi
	2E6SaCqzgYlkoWVpPKVjbIVjRW1y47/sEKDoqlYbFrS8o9QcnR0WnOm35VFkDqDyrHaccRMxDqO2F
	7IHgmLS31CAvnlDbPoJqA4oPaqxhFrtnwWxd9IsLv25dXqrxLaeUTjm28VCvNFXu3zJsLEt7Z/w8W
	Vxx1eLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIW7-0000000B4h0-3i1e;
	Thu, 06 Jun 2024 19:11:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIW4-0000000B4fn-0ORJ;
	Thu, 06 Jun 2024 19:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717701072;
	bh=aISHoo9eqcpGDfEfq7sQGEadbxdEPOe8NFZxhgBU8jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7nZUQURpBOQzSMFx1ivIMnAlTKc51oSoTL53hhjdnM46/9TwJaxSxuFf/LM3Ehhq
	 vdT0dVZ+XBRIfc2ZC0Mjy3zBKTzxjWDO5bpq8Savkqc90SDhxfglSrHHpXmotRmJRM
	 ss1W1Ndc2EayE+ddroBj4y+kZnDdom4lTBSAjtrX/Gx5SmG3jjDNCa+ZXWuh1FjLfO
	 f2twwKH1qJSYP3caT+4zMcTklL33OlXh7Sn19IZQLFy/eE+y52TpZitSQxaX6h6PBm
	 Hv5oY28vXFgXIfUvOxDgSmiGybN0iTau+ldY5O2BNF+qRC08xkdObnxMVSz+2nky2x
	 q3CWPk+cuhg5g==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2DA7E378000A;
	Thu,  6 Jun 2024 19:11:11 +0000 (UTC)
Date: Thu, 6 Jun 2024 15:11:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't print error when optional
 scp handle is missing
Message-ID: <08125ad3-e5c8-4e96-912c-986b0e08b078@notapiano>
References: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
 <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_121116_313784_69E3572B 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, Jun 06, 2024 at 12:50:56PM +0200, AngeloGioacchino Del Regno wrote:
> Il 05/06/24 21:35, Nícolas F. R. A. Prado ha scritto:
> > The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
> > drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
> > missing mdp3 will directly look for the scp node based on compatible.
> > 
> > For that reason printing an error in the helper when the handle is
> > missing is wrong, as it's not always an actual error. Besides, the other
> > user, vcodec, already prints an error message on its own when the helper
> > fails so this message doesn't add that much information.
> > 
> > Remove the error message from the helper. This gets rid of the deceptive
> > error on MT8195-Tomato:
> > 
> >    mtk-mdp3 14001000.dma-controller: can't get SCP node
> 
> I'm way more for giving it a SCP handle instead of silencing this print... the
> SCP handle way *is* the correct one and I prefer it, as that'd also be the only
> way to support Dual-Core SCP in MDP3.
> 
> I really want to see hardcoded stuff disappear and I really really *really* want
> to see more consistency across DT nodes in MediaTek platforms.
> 
> So, still a one-line change, but do it on the devicetree instead of here please.

Sure. So the missing scp phandle case is maintained exclusively for
backwards-compatibility. And we're ok that the old DTs will keep getting the
error.

I'll send a v2 adding the phandle in the DT instead.

Thanks,
Nícolas

