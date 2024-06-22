Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E5C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=my4hZnL32V+SMN5dS2dc7S3j2Y/FVoAYeGfakbx4Qj4=; b=rU+cb9Hg/kWBOOwJKmmQAU7zuU
	De6oR+uzojSsYG/zAD93/PdRlgsrcHuezd4bF7dLsaDtIJAvCpQB0374aEZRDquvwQS5Qc0vJrr3x
	KU4s21pcrcOCPSUjl88IjG07Q/nRuZ/LsO6mH+X7l+NcHDkcjwnUh9m8d/SomHZBuxERipvb/dvcl
	0UiKNHbml9COzj9p+nHKQi2Fr8BqCJPcdT/JNYtl2uATRkIZCgBWZkiUt1YjaeFDWYQVoRECxZNME
	YR6Fly8zG+9NQYxHErRAy00mshouu5szxLvTIC1uIT9uurGL42RyehTZ5naMab7FZr/BopxC/rYGs
	UveTqL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4b4-0000000CVvI-395O;
	Sat, 22 Jun 2024 17:32:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4az-0000000CVu0-2xnx;
	Sat, 22 Jun 2024 17:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=my4hZnL32V+SMN5dS2dc7S3j2Y/FVoAYeGfakbx4Qj4=; b=lyHmkqkxMhH2homFvP09/othi2
	olglnMnZ9rhuby8GkjyUjIJxydNMCEXG4eOk193xahKZo5C2RjHzCTTHlhca2FNK/PWxR18fZ4F4z
	kAB+hYuEYPcbDwAoAtNxWdBwp5MGBhIKsNoL+7xYXyGc8hCiAPe1a4t9qAExl8FPviFI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4ao-000k2U-3t; Sat, 22 Jun 2024 19:32:02 +0200
Date: Sat, 22 Jun 2024 19:32:02 +0200
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
Subject: Re: [PATCH net-next v8 07/13] net: phy: mediatek: add MT7530 &
 MT7531's PHY ID macros
Message-ID: <9515b596-c151-4e46-95f1-768e76de34cc@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-8-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-8-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_103213_765435_D70EB15A 
X-CRM114-Status: UNSURE (   9.66  )
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

On Fri, Jun 21, 2024 at 08:20:39PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adds MT7530 & MT7531's PHY ID macros in mtk-ge.c so that
> it follows the same rule of mtk-ge-soc.c.
> @@ -170,9 +173,10 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		.resume		= genphy_resume,
>  		.read_page	= mtk_phy_read_page,
>  		.write_page	= mtk_phy_write_page,
> +		.led_hw_is_supported = mt753x_phy_led_hw_is_supported,

Was this intentional. It does not fit the commit message, so i wounder
if it should be somewhere else?

Otherwise:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

