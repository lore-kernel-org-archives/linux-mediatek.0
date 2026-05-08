Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140CCD3445
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 22:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGhV4tJhhFITtip7RIJj1HklpJJ78N/H5BhAF01FN7c=; b=c9PKV83VMuTMvg
	vLfT+Jt+kz1MLgMNJOUPX0Vq4nw6UHU6S0FQCbkSfaAps9Kl0rIJdB3DkFGO5XCKimhoto44TiRc1
	5o/Cg31hlKf9bA8yHCc0bCft6YdzZLd04BxDo9rVicCWuNxmQoEAQHUmxoyD+DiDz2SCKe2XBzts/
	csLI7oG+mPg9P0RWzqSqqtDUOVSMesRSAT0eV3keBl5rOK0FoB1l1dH+G/DG020YhngnbcZhT2CIC
	HxZ8iaGqiBW7a2o18byXyzcdgiMylgOozRA0vjaAJPYIk+xMtW7O/1KWIaaW+lhUQdZczJb/sTlRb
	TRe2Jbyu9BoAs5GEJlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLToi-00000007eje-08SP;
	Fri, 08 May 2026 22:37:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTof-00000007ejA-0zX0;
	Fri, 08 May 2026 22:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 510256024D;
	Fri,  8 May 2026 22:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AB5C2BCB0;
	Fri,  8 May 2026 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778279824;
	bh=doWXpAV8i1KIsPVSpwySS7aiXUQtAtR9+ap1JLqiNmY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nXG85BpPsxRXtTy9vRquN4aUado99x7u/EAuFTgMICFe+wwITf2rfcVrYZgAwlYya
	 Mxy4a2RZCeIctfJAwSRe8W2bhDgn79oPsVSdbGG+Pygl/yXbYVRJ8gHhO6TaHl/4no
	 B9PgioG6LhM1bT4qyMVEUCU8FkaCHv9N959BnZLI903mRcw/uhTnM2YoGPrP7XYK4l
	 5dLH4A9DVNHAze0vKfR6FttTjSVFm/cfddtjE9p85vol/yodgVTNfqw2p6xNHX0btk
	 APfG6Y8z/NZzpVCZ5S1qtUXva0YGZUcXb1gix9GmLarkB/L6SFNKFx5+vFD1rCDKIl
	 fI643HKC3DtaQ==
Date: Fri, 8 May 2026 15:37:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [net-next v7 3/3] net: ethernet: mtk_eth_soc: Add LRO support
Message-ID: <20260508153702.69b89021@kernel.org>
In-Reply-To: <20260506192806.143725-4-linux@fw-web.de>
References: <20260506192806.143725-1-linux@fw-web.de>
	<20260506192806.143725-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mason Chang <mason-cw.chang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed,  6 May 2026 21:28:03 +0200 Frank Wunderlich wrote:
> - fix u32 vs. be32 reported by patchwork check

Have you tested this? I still see an extra sparse warning
(install sparse and build with make C=1)

It'd probably be good to fix the pre-exisiting warnings as the first
patch in the series while at it.
-- 
pw-bot: cr

