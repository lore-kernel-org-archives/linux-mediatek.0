Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E262C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th236SFm+UL+eQbk39f4IhG2ZwNDs1NzoNO0exA4MrE=; b=zecXbDNwo3ObDN7oONCZL4gwIJ
	iY2RDSt2Eh0uR9H41E3Wa8TZhfXjW+j94LpCBaR/RDh2X9jHQ+19XM+7r8Bz++MJRAXqU22yxuCPQ
	jkQXHGUYOgkEWPNR5I9FzmKylKK5oKBvZhXYzL7Yy+kX5Fj2J84KEjY5zHuNFsfs6atcqk5dKcv+e
	inAlIbTxsZlQ0CBeNAvXnxNvK0rTrItiF+IdroK0SJvXDLSM0khgC3nU2txd+vslsG0qud0zaDlse
	ZVbwuuAoQxjC1X2ETNQ3lAt2FxDEqgS0SpqtTkL4TwfmUXHIj8/MQvQeq7F5DFNEhdkIZTNEGi42E
	YXL/VP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx0X-002PAg-Ej; Fri, 03 Feb 2023 14:25:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwlH-002HeS-9D; Fri, 03 Feb 2023 14:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=th236SFm+UL+eQbk39f4IhG2ZwNDs1NzoNO0exA4MrE=; b=tUsF8rvmnFEicbxs+BRmfthFt8
	9T1uxkqICLFJgfWWC2LFbQ93ZsmQK4n3drjzLKb/9CGXO45p69Q2zddgiBogQQsRwLJgCEGM3mxjQ
	8yqKOtQr7Fm9lERRAlrFXueIJcyyZ/jH/GkyRUXBVmopDPIXz1aoQeH3FZ8DFM1na5gI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pNwlF-0040Ts-CB; Fri, 03 Feb 2023 15:09:53 +0100
Date: Fri, 3 Feb 2023 15:09:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 5/9] net: ethernet: mtk_eth_soc: fix RX data corruption
 issue
Message-ID: <Y90VsYieanKFNqO3@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <96c628df0991104d255e6d4696988686387bc2ef.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96c628df0991104d255e6d4696988686387bc2ef.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_060955_351749_D28A62DB 
X-CRM114-Status: UNSURE (   9.64  )
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

On Fri, Feb 03, 2023 at 07:02:28AM +0000, Daniel Golle wrote:
> Also set bit 12 when setting up MAC MCR, as MediaTek SDK did the same
> change stating:
> "If without this patch, kernel might receive invalid packets that are
> corrupted by GMAC."[1]

Do you have any idea what this bit means? It would be nice to have a
more meaningful description.

     Andrew

