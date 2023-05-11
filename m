Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE1AC7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 00:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSQW4tiYATgQuO+xcl9Ah2yxbFicjpEMjAjRIi4512E=; b=Aazuknnkd+P+Bcn62z5EJGKKRb
	RRp14KrfIXWH1Z3h7+3RaanSMF+hkqhxNSATyf26zRSaxiWnMndtgSD9wJKuOvNTEfi4rfovSuFRi
	YoJkovqOpRnyKHGru5L3wOwECX4fjz3H0lWbUaH74TMtHHa5CkPy7hblvhIjuBFCYq3wbN1RyvaPl
	iXo/VarEgPgu+BclK3jSL7oD0m68PqGQOwpeNPxXYAL2bvIIdCCi2LEwveBqzXZfXB6E6Ix1HZ855
	aaQDIQGHUYaJ9MD5e1XHfnf8Dy4exhJwmGYJPpr4XeufmEQtCNaZ2xw7MohK+S5lxBNcTn3nyk8IJ
	QVh9coXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuGg-007LJW-1L;
	Thu, 11 May 2023 00:34:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuGd-007LIy-0R;
	Thu, 11 May 2023 00:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SSQW4tiYATgQuO+xcl9Ah2yxbFicjpEMjAjRIi4512E=; b=rqYP6+DwsvXTDnOD+XdKZMKI3N
	lraYI8v8YK7uqcIb1lqBFELdQvLdZrHU+oqZ3mt6fc/6Ghy0IeTkaYyBgS+aq6k5vNGoEYsmsNtkB
	w6Uukusg7XsqbOrLuzS/JsUTAMwUU6OeBx7CX1dEJ38IiOEQ2p7ujRHPmPONDvN633PY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pwuGb-00CUs0-Al; Thu, 11 May 2023 02:34:45 +0200
Date: Thu, 11 May 2023 02:34:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] net: phy: realtek: rtl8221: allow to configure
 SERDES mode
Message-ID: <303352e7-33f6-45d6-b93d-061f84a027da@lunn.ch>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_173447_178970_4082BF19 
X-CRM114-Status: UNSURE (   8.94  )
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

On Thu, May 11, 2023 at 12:56:12AM +0200, Daniel Golle wrote:
> From: Alexander Couzens <lynxis@fe80.eu>

Hi Daniel

Why are we getting two copies of this patch from different people?

I would expect to see just this version, sent by Daniel Golle and the
first line being From: Alexander Couzens <lynxis@fe80.eu> to indicate
the primary author.

> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

Your Signed-off-by: should be here as well, since you are submitting
the patch.

    Andrew

