Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F2AC10F15
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce5t81AR4LLzMmw7ptIOBPkiZfOh30AXyQ1jcb4c9X0=; b=TxjVbR+WGG7UBJ2oAAheUIWl9E
	pnU9bGTpFhYEruBfBo/ssf1vig7pNQtsF5TUW4OGdsqcHR5WNWJoONUEG2yDtWuKPMz9BVi1EliWu
	a71N22A10GXynn9oTIAx6sP+t+JOiP2u1q8fudvA3zGws4Q3Gr1lUnKomNxFxAZoj2L/MUMQccdF0
	egUQzN9Iz5utNCNZTe0WPn4UqM75lXTiBT9xa+0fg+O0F2pXqQaVdtkkq0yOPKtg953YPSHf3//ao
	R5X/kSU/ud5TEUXktxSn5NQ/1JRRqSeLJ4SXfWpiwvd/Ze2DGrFCnlo3bJE2yLtQr2HXq6brSRYzF
	fbV1/j8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00ev-000000090lC-3oWl;
	Thu, 25 Apr 2024 15:05:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00et-000000090jh-2Lcg;
	Thu, 25 Apr 2024 15:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ce5t81AR4LLzMmw7ptIOBPkiZfOh30AXyQ1jcb4c9X0=; b=msyAjJkZql9GE9HvAaFmMsTK/C
	Ji6/gqgmgpcUF7HoBOrUMQmXGD0S+pUm5pSvFzDXQop40FMVY/L2/UwzCLGolC6gOi38fnl3UuJCw
	b2/kXkYazICzFlFl17LAnf6aGH2DGk52oStmofyff2iBm2uEOQb9MLwjty/3YbnWssx2Fa1bn09k8
	ZuvjMae7kuVy59Onxjm6njhLUptr1MFKwY3OYDrBUq1/XW2yOB2n+ZDQtZRxUKJCBiQc4Tf2m+NHn
	FVlv7zoawdpDEyaRt09Lc99cOYYD7h2SQoWI00e0smkjZdl/zzw9Mq0WuPCOV4V9PQSujcZ621pCv
	7hTnbwPQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00eq-0000000Exrf-17h3;
	Thu, 25 Apr 2024 15:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ce5t81AR4LLzMmw7ptIOBPkiZfOh30AXyQ1jcb4c9X0=; b=qcMS9Dciv3ySUmIgtvGkMaGAdY
	h7bYPEdhfM3QW5df/VVQPAEl41AXD8vzCGBPPRhH6Aa1Ji5E+Jy9MNL+4skbUXRJp63qWDiQyFhGe
	hNIQJYIy2Upvh0Rg+NaG60GKh1dt/clUxZo5JrH40RWLH5fqXVkTWabwgrnQTX7COgaM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s00eY-00DzlT-0q; Thu, 25 Apr 2024 17:04:50 +0200
Date: Thu, 25 Apr 2024 17:04:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet
 phy drivers
Message-ID: <8d9ef4a5-9bf5-4f59-89d0-86722f90e8eb@lunn.ch>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160508_508045_42268A1E 
X-CRM114-Status: UNSURE (   8.05  )
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

On Thu, Apr 25, 2024 at 10:33:23AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MediaTek ethernet phy driver files and get ready to integrate
> some common functions and add new 2.5G phy driver.
> mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
> mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
> mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

