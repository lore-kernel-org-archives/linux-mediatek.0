Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8687D374A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0sfteNTHnsJBCnWWFclO6cRRrxN4tUxYwZv1nkdZFQ=; b=pzoNOGCQR8Wlinz4LHkYX8Hu66
	dGZdARFbQTjX94urdBDSwkRNfySMM/cIOB22ehZw6Z9seY0FQZYgTun1H29WVH/HvR5uu0YgIwvdP
	yH3WnhXG+F1HsjgMDKZfHxAfzl10IC24ElafEgZU1szNxX+GdqpXaaIcsRwBZl6OcjqkiAcXZZMmL
	e+ZwC31+1RCzAb31tVDtW/R+1wEamAQpR+AAopYboWCawkUrszDInA7+kiYl2HT8kV2FEJM4Vs7o5
	WOTa3FNtHL2TF92krUhIW7VIIuamgUoT7+AaxUhrMAb02eURF1oizsuLRi9SuDdtdzFcWXL2j+JYn
	wnEHSzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ROe-0000000F6AA-3bSK;
	Thu, 17 Oct 2024 14:22:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RLv-0000000F5bh-3wjv;
	Thu, 17 Oct 2024 14:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B54265C5A4C;
	Thu, 17 Oct 2024 14:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF119C4CEC3;
	Thu, 17 Oct 2024 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729174786;
	bh=ukHkPZB2khOGiqqlMlSXcpRHso2j7wSVMvSaP3s51gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYpcxIEPCFmxdtvHeubils7hL0Cezn0iaR726SRo6UKezx1jTNCusInk7gNUJt/rz
	 IIlfhW05gkqNaWYPsFlwLQ2hK+Y9NGUXT7nLJxt8VWatjSdkOaDojLM4oTScTiIICj
	 7ohIrvzf73UomSwPFnbclu8MdzGDE+Q8/iGS6KffipT4kFSixF6PjlFeL/V7ud9xNX
	 48zGZ+isY9Q7hsXpNDsGnkScwsrVBZIV/4neYe4nmNzHdH+Wj2j+44nmKBgGEBA/tY
	 Yr+jzp16joQrQJGk1A2wXghJp63rFKTDDtVn4hzzMm6V0huxsda6HprAlPVTqSp4mO
	 4hENlhpS90aCA==
Date: Thu, 17 Oct 2024 15:19:41 +0100
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
Subject: Re: [PATCH net-next v2 2/3] net: phy: mediatek-ge-soc: Shrink line
 wrapping to 80 characters
Message-ID: <20241017141941.GQ1697@kernel.org>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
 <20241017032213.22256-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017032213.22256-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_071948_041808_1A461BD9 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 17, 2024 at 11:22:12AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch shrinks line wrapping to 80 chars. Also, in
> tx_amp_fill_result(), use FIELD_PREP() to prettify code.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Simon Horman <horms@kernel.org>


