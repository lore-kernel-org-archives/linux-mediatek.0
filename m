Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB548D10C0B
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UalDViA3yaDlhxM27mCslpLgsREGyijfzPfoJVZi8Ak=; b=tVst4aP6zvbH/lA4vlgg+T8Ar9
	Z0+U5yf3mQR553rzsT6+rDiNjb4H25OveAo2R4RIZCyDACU5F9p8QqUvrlkz6vEXoCiRZldvgOm/b
	XyFGyfFc/povH3OFgAiZTCxONKR2d5RQ9p3Uc/vmzg+mwqgZwIKN/WXdo8LgnF8SWqW3vSuLSJDdF
	/UX4FFuK34GWWUsGJxOjOvEYVe5JAdxAQ/F5JiRMNJn2eAJFHAXPiUV47Np6c9cVcEm1Vql/T3UKW
	wh3NVlpvrUXl7iwabCiUIzFNWiQ1yjGa6YEvgL+fKeX5kSnxpV5SQrbpZNRRUsNUPNYO9v52WWWKq
	Wj/Ww6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P9R-0000000Ap0y-1cZa;
	Mon, 28 Oct 2024 12:47:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P49-0000000AnBV-17wt;
	Mon, 28 Oct 2024 12:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UalDViA3yaDlhxM27mCslpLgsREGyijfzPfoJVZi8Ak=; b=T8+F1J7D6FlB7VF3f9VkqSn+IJ
	dZuHmTkbE4emk7+hSHQCf63cq81OrRQT3xrEVc56xyPgTcs5rrU9CX8bNtsKEgF2XjEPeQN8AMl7m
	siMBygrhTnKkepPl067drbzc0LVE2VKJJB3xTk0BymMjsL9pPoq4SN/I6fXKM5Yzqf8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5P44-00BRgQ-GN; Mon, 28 Oct 2024 13:41:44 +0100
Date: Mon, 28 Oct 2024 13:41:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Sujuan Chen <sujuan.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: ethernet: mtk_wed: fix path of MT7988 WO
 firmware
Message-ID: <8dea87fc-c37c-43ac-a541-9ac67e351319@lunn.ch>
References: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_054149_328512_DF62C239 
X-CRM114-Status: GOOD (  11.09  )
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

On Sat, Oct 26, 2024 at 02:52:25PM +0100, Daniel Golle wrote:
> linux-firmware commit 808cba84 ("mtk_wed: add firmware for mt7988
> Wireless Ethernet Dispatcher") added mt7988_wo_{0,1}.bin in the
> 'mediatek/mt7988' directory while driver current expects the files in
> the 'mediatek' directory.
> 
> Change path in the driver header now that the firmware has been added.
> 
> Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

