From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 3/3] net: dsa: mt7530: Add support for port
 5
Date: Sat, 24 Aug 2019 16:19:12 -0700 (PDT)
Message-ID: <20190824.161912.1377369658338940538.davem@davemloft.net>
References: <20190821144547.15113-1-opensource@vdorst.com>
        <20190821144547.15113-4-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190821144547.15113-4-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: sean.wang@mediatek.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, john@phrozen.org, linux-mips@vger.kernel.org, frank-w@public-files.de
List-Id: linux-mediatek@lists.infradead.org

From: René van Dorst <opensource@vdorst.com>
Date: Wed, 21 Aug 2019 16:45:47 +0200

> +	dev_info(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
> +		 val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));

This is debugging, at best.  Please make this a debugging message or
remove it entirely.
