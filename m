From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 0/3] net: ethernet: mediatek: convert to
 PHYLINK
Date: Tue, 27 Aug 2019 20:19:40 -0700 (PDT)
Message-ID: <20190827.201940.2141115576553497735.davem@davemloft.net>
References: <20190825174341.20750-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190825174341.20750-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: john@phrozen.org, sean.wang@mediatek.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux@armlinux.org.uk, frank-w@public-files.de, sr@denx.de
List-Id: linux-mediatek@lists.infradead.org

From: René van Dorst <opensource@vdorst.com>
Date: Sun, 25 Aug 2019 19:43:38 +0200

> These patches converts mediatek driver to PHYLINK API.
> 
> v3->v4:
> * Phylink improvements and clean-ups after review
> v2->v3:
> * Phylink improvements and clean-ups after review
> v1->v2:
> * Rebase for mt76x8 changes
> * Phylink improvements and clean-ups after review
> * SGMII port doesn't support 2.5Gbit in SGMII mode only in BASE-X mode.
>   Refactor the code.

Series applied.
