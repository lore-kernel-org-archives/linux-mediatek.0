Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC62C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoD/pwtVYuvdX+OKMVNTg6bIq6p1zqS47s0pFLwsBFg=; b=Ld3G27QsKb6TJsQYzdSnNpsE03
	NesR7JHEzBsIdGvKkLAJVg3H4sjSJnIW2vdXNHjOj/tFiuaHCqNb9e0oS8Y4D73+S+OaG6ht1WfHb
	pnNnj0zLCo8htyZCBt1xfqJ4JOTmeS3dbN1+VTu6+ip8TpTxxHmbyXhL5WuO0t6BtT2RUl2n9CJ9j
	maJKQUQdzu2+DQ9dmccwlzVRO6uHzlzjIjPIFRXAVIEeOMGlS81ZmJ2/Leirn4vsydV59bgHw3rqk
	7iGknjpH7CZN1yMqEUEq4ZHRRfYLcgQ6t2QjCoQDgOzIFQt6cpoxY7/iFQKLB6BF/33WtJxCJjUuy
	EENPulfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4ME-0000000CUG8-3r11;
	Sat, 22 Jun 2024 17:16:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4M9-0000000CUEd-2LQb;
	Sat, 22 Jun 2024 17:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YoD/pwtVYuvdX+OKMVNTg6bIq6p1zqS47s0pFLwsBFg=; b=K3rxZIzWiqOqJy0ttSnuxlA0ul
	O1UYuOquEG/QNI9kg+A0eyQhpNsa6wpcJEni+J8K57iWLy28WuEty05FM05Wuv5fVMqMATNS1XEYi
	cbD6as6xKaMrK8W96rPN/+0MF4Kfg15+JWUZ6tERG9qhBt+iZzr+9VqCCQDfovki1AZ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4Lx-000jwS-2e; Sat, 22 Jun 2024 19:16:41 +0200
Date: Sat, 22 Jun 2024 19:16:41 +0200
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
Subject: Re: [PATCH net-next v8 03/13] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <8726efc3-83e6-4246-852c-994fd9ed8224@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_101653_616101_C55B7E04 
X-CRM114-Status: UNSURE (   7.99  )
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

On Fri, Jun 21, 2024 at 08:20:35PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch creates mtk-phy-lib.c & mtk-phy.h and integrates mtk-ge-soc.c's
> LED helper functions so that we can use those helper functions in other
> MTK's ethernet phy driver.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

