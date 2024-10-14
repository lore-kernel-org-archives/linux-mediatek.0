Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9208ECFC503
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh5l30xubog7P+TrLhAYvbfarUAi5VWWy/+GFR4nnlY=; b=hbf3gUX9NmQX4Rk/utQEhs60S8
	dRqMjBi6tU0sAR6AmtBSp5KZ9VjPyi5mqhzA3HmfMWK8ra5g7idXjRD0dc8+eb0YP954qMaQouaB2
	QWtsKzCQ8hCLbUXH5V+49FyhnxTSz/KNWzRIORm9/+0/Faw0iy5zdcf2/+O4eDgC6mH6bInLo7M95
	bniFiyxUjRAKPnjzUkhzWxgA6zk9SVM54alN1Qsmq/qDxb5GrAtJJDGfLEjtQEXdQO4ykQ086k66B
	y0oIP/jAhva6qazuWR1xjxf1sE5se5h1tzccHqNjY78DeE8tTrBqiwixF6wAYOvpY6dFNpJHwB9VK
	4Nf2SN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GQ3-00000004HNg-2mPd;
	Mon, 14 Oct 2024 08:27:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GHe-00000004En5-1qSg;
	Mon, 14 Oct 2024 08:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CB895C02A9;
	Mon, 14 Oct 2024 08:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A04EC4CEC7;
	Mon, 14 Oct 2024 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728893909;
	bh=WSG6JKOrpz//yHgEJmqYwVlan1AwfYYChHInmnQGJWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq14tKIvdRmlqZXLADeTGOPOPtBpwWU/YWA8URdTeOFBla9CtDT8grK/h1Yyv5Cja
	 hDfBL1aVogMWZumJzicbQ2bHE9a7NWgnFTGUzAtOb8hXIHqampAsO/SjDYPIFiZvNV
	 d+t7v/5p6+JTrCc8fMNIY28ISzY0lQCEtGSYc7C5M56HTvU5LjQGPffMdYMmHa59bv
	 dd43wfIL3XvMJ7PQjqJzZUnYD4t6ptLIQLZlHTjHKqC5KEjbFCv4LskEX6TGB/q1Q/
	 zqqvFhAoq9wi3SS8/7iBZXYEr7Ew2X8yXzMk183jqVxfUt3qudmGuNI8HFKYd9b0hT
	 2Z37ZDBiRR/fA==
Date: Mon, 14 Oct 2024 09:18:23 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 1/1] net: phy: Refactor mediatek-ge-soc.c for
 clarity and correctness
Message-ID: <20241014081823.GL77519@kernel.org>
References: <20241014040521.24949-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014040521.24949-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_011830_549519_C652D8C0 
X-CRM114-Status: GOOD (  14.11  )
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

On Mon, Oct 14, 2024 at 12:05:21PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch does the following clean-up:
> 1. Fix spelling errors and rearrange variables with reverse
>    Xmas tree order.
> 2. Shrink mtk-ge-soc.c line wrapping to 80 characters.
> 3. Propagate error code correctly in cal_cycle().
> 4. Fix some functions with FIELD_PREP()/FIELD_GET().
> 5. Remove unnecessary outer parens of supported_triggers var.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
> This patch is derived from Message ID:
> 20241004102413.5838-9-SkyLake.Huang@mediatek.com

Hi Sky,

I think this patch is trying to do two many things (at least 5 are listed
above). Please consider breaking this up into separate patches, perhaps
one for each of the points above.

Also, I think it would be best to drop the following changes unless you are
touching those lines for some other reason [1] or are preparing to do so:

* xmas tree
* 80 character lines
* parentheses updates

[1] https://docs.kernel.org/process/maintainer-netdev.html#clean-up-patches

