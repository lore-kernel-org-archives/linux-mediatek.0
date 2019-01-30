From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv4 2/3] net: dsa: mt7530: support the 7530 switch on the
 Mediatek MT7621 SoC
Date: Tue, 29 Jan 2019 19:39:27 -0800
Message-ID: <d030fb8f-c707-9aa2-5ebc-e8100188a5c2@gmail.com>
References: <20190130012406.28271-1-gerg@kernel.org>
 <20190130012406.28271-3-gerg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190130012406.28271-3-gerg@kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: gerg@kernel.org, sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name
List-Id: linux-mediatek@lists.infradead.org



On 1/29/19 5:24 PM, gerg@kernel.org wrote:
> From: Greg Ungerer <gerg@kernel.org>
> 
> The MediaTek MT7621 SoC device contains a 7530 switch, and the existing
> linux kernel 7530 DSA switch driver can be used with it.
> 
> The bulk of the changes required stem from the 7621 having different
> regulator and pad setup. The existing setup of these in the 7530
> driver appears to be very specific to its implemtation in the Mediatek
> 7623 SoC. (Not entirely surprising given the 7623 is a quad core ARM
> based SoC, and the 7621 is a dual core, dual thread MIPS based SoC).
> 
> Create a new devicetree type, "mediatek,mt7621", to support the 7530
> switch in the 7621 SoC. There appears to be no usable ID register to
> distinguish it from a 7530 in other hardware at runtime. This is used
> to carry out the appropriate configuration and setup.
> 
> Signed-off-by: Greg Ungerer <gerg@kernel.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
