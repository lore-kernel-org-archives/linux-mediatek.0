Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46D9C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcgMK+5YJcdqMyiYP8fkeg/M5NHnhiFXPSXYcM43Mq4=; b=MYiVs/IsNFx8mwv5U2lG7eM+ic
	psQvNzvtN26adEdXJUC+3yoj9swwr+FRTO6KyUiToh1lXTdAMRUUBlPwZxrCZE4yNkhuNVgJs3iWg
	EoRmDgY4lTp3xB4ojnVGb8EpaWOkWQyjXHPr3+/WTF17Q+bF0AGNDmx/vmXUcf1ForzoVAwoQmiZD
	qnAdMRZy8FR/KaZBGzYw5KEIxlwLw+SW19vLDa5aPSngh+308nvJPUIDY5NX0XVYah9laIvAgbVCS
	fqaIdfLrvITfHlwU4pWyweg7rnA/7uJwdS5BHzF/MOzx6l9tzDOrvBwUnuB361YBR7G8Cmz4hZc6e
	8PJvGB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4oj-0000000CXNj-1s3O;
	Sat, 22 Jun 2024 17:46:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4oe-0000000CXMn-41Lg;
	Sat, 22 Jun 2024 17:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OcgMK+5YJcdqMyiYP8fkeg/M5NHnhiFXPSXYcM43Mq4=; b=K9bBFnDXh7iz3AI37g7bBLc//t
	o2tA0mm4p2wQdTuMpABmoHHCqLV0/q0pwQj4utVv03lAzNzFaj2bIgw28nMpoJ8PKLacO9FBMLGBm
	iAOPND1nAt4HmpHtCW5Mj0e1mqxGDOrM7wsaniT13LSWzvL4HpplAOiKrtpNCTGgF9bU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4oR-000k6g-IV; Sat, 22 Jun 2024 19:46:07 +0200
Date: Sat, 22 Jun 2024 19:46:07 +0200
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
Subject: Re: [PATCH net-next v8 10/13] net: phy: mediatek: Extend 1G TX/RX
 link pulse time
Message-ID: <931dec9e-e1c3-496c-9242-e5b24595a409@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-11-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-11-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_104621_022706_FA1B7451 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, Jun 21, 2024 at 08:20:42PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> We observe that some 10G devices' (mostly Marvell's chips inside) 1G
> training time violates specification, which may last 2230ms and affect
> later TX/RX link pulse time. This will invalidate MediaTek series
> gigabit Ethernet PHYs' hardware auto downshift mechanism.
> 
> Without this patch, if someone is trying to use "4-wire" cable to
> connect above devices, MediaTek' gigabit Ethernet PHYs may fail
> to downshift to 100Mbps. (If partner 10G devices' downshift mechanism
> stops at 1G)
> 
> This patch extends our 1G TX/RX link pulse time so that we can still
> link up with those 10G devices.
> 
> Tested device:
> - Netgear GS110EMX's 10G port (Marvell 88X3340P)
> - QNAP QSW-M408-4C
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

