Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736FEC52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VjwWzCa7RmyPgjqNdv5GensGG1UbswYCWqQMnZKuW4=; b=2gEQYatQQHrRlI5aVLqLg//IpU
	MLoYf06zPyVq6JnPPoBfiM3yyAwUYBTQ8woHw2I1JfrhC0N/dN7tPBGtIj1ejqjORjd+ZKLc2b3VI
	EZ0hpUDNkcFJXkq+xFRWTyZoKcw6j8i4s/d4walQ6G2/0tGh+9RXx+A4PV8rVyJF1/hDgNrElwuCg
	GvmvhdfKY9xq+DHkGtIYolCiAhDV8kvP4tQeQEPI9nJGapZjGmJRM7ZxxMhtadjWkUHGVYdMtelkk
	Th+4QOclO+7MJKLXLImBlki4w3SjgGIpLJNayseqS/Mh7d9pcrWbEg/ZOtyWKXideaNQwYzBlef+J
	F5QNPLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgumh-0000000AfEU-0Rhx;
	Wed, 21 Aug 2024 23:30:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgujX-0000000Ae6K-1HrL;
	Wed, 21 Aug 2024 23:27:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sgujG-000000007Cv-0hyL;
	Wed, 21 Aug 2024 23:27:02 +0000
Date: Thu, 22 Aug 2024 00:26:58 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v10 00/13] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Message-ID: <ZsZ3wpPXrbwZJXEh@makrotopia.org>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_162719_366289_1110400A 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, Jul 01, 2024 at 06:54:04PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch series integrate MediaTek's built-in Ethernet PHY helper functions
> into mtk-phy-lib and add more functions into it. Also, add support for 2.5Gphy
> on MT7988 SoC.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

For the whole series:

Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

