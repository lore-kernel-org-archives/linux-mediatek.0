From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 3/3] net: dsa: mt7530: Add support for port
 5
Date: Sun, 25 Aug 2019 12:48:13 +0000
Message-ID: <20190825124813.Horde.ipTYml4Y_iJUAXHsR1A0--K@www.vdorst.com>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190821144547.15113-4-opensource@vdorst.com>
 <20190824.161912.1377369658338940538.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190824.161912.1377369658338940538.davem@davemloft.net>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sean.wang@mediatek.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, john@phrozen.org, linux-mips@vger.kernel.org, frank-w@public-files.de
List-Id: linux-mediatek@lists.infradead.org

Hi David,

Quoting David Miller <davem@davemloft.net>:

> From: René van Dorst <opensource@vdorst.com>
> Date: Wed, 21 Aug 2019 16:45:47 +0200
>
>> +	dev_info(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
>> +		 val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
>
> This is debugging, at best.  Please make this a debugging message or
> remove it entirely.

I change it to a debug message.

If there is nothing else I send a new version with this change also
add the tags ack-by Russell King and tested-by Frank Wunderlich.

Greats,

René
