Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B7C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 May 2025 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUyR0Gqfod1ZUhFSOfGOtDGNy5URQgdGLeuFUS65lZs=; b=lEe+B5Y06aPiysNY8gDNJTR4Ck
	02Xk/S2RmsKaqaKNgRtIcsJoampJK/xDC6/KNoa/KM1QhGBsABfhAXWnQ9EznMxHsEQmSF7l6k0+o
	yN2VUHc46tQWHD3qzQ2gE/xV/Dj0w2bjM7m1mXWbgjW+rJ5GWuU8lVpBR6PyXnZcsj+wdpKejLkQm
	fFBCRSTZf9jK2dcPqiExxs3LTHtXkhtXPE0BS0Pxtm0TNN/4a21mSLyI8/4Iu/5JSjyq3qkhRQcu8
	3Xwh2YIXuXnWx+RRliQNQ4sDJ1IWT/zgNQ44sAOZIj30gVSfaHSZG8DiiPdiBYymM6YGCjqRFLzSi
	HgfNb0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmjd-00000007eLw-48jJ;
	Sun, 18 May 2025 22:43:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmW6-00000007d36-2JB4;
	Sun, 18 May 2025 22:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LUyR0Gqfod1ZUhFSOfGOtDGNy5URQgdGLeuFUS65lZs=; b=TPhk9FKQLGRcZ7CBwjL+2ijL/A
	R3emg6Sc2H0qslPpVk1LMkzFuJM5fHTG12dSBIFQp5VHNy3zfpZTnaWouBph3jT0W2sb0NVq1z4vW
	IhfUkWzqOOdVRKbpfZ5vDdU5so24AYG2PGEFz8LTqzuOg9+mesYwAx3//n9XTnuR5XHA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uGmVu-00CwmK-Jy; Mon, 19 May 2025 00:29:46 +0200
Date: Mon, 19 May 2025 00:29:46 +0200
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
Subject: Re: [PATCH net-next v4 1/2] net: phy: mediatek: Sort config and file
 names in Kconfig and Makefile
Message-ID: <d38c3678-92f8-4a5e-a1ae-a205e44d99f4@lunn.ch>
References: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
 <20250516102327.2014531-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516102327.2014531-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_152958_585382_BF4A0FB0 
X-CRM114-Status: UNSURE (   7.23  )
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

On Fri, May 16, 2025 at 06:23:26PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Sort config and file names in Kconfig and Makefile in
> drivers/net/phy/mediatek/ in alphabetical order.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

