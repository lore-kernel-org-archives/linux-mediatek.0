From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 1/3] net: dsa: mediatek: add VLAN support for
 MT7530
Date: Tue, 12 Dec 2017 09:24:10 +0100
Message-ID: <94df4a0c-3e9b-a51e-6f2d-5adc43e3b9e4@nbd.name>
References: <cover.1512625814.git.sean.wang@mediatek.com>
 <792c2d52b8da717b55ead9d480863ca390fe91b3.1512625814.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <792c2d52b8da717b55ead9d480863ca390fe91b3.1512625814.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 2017-12-07 07:06, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> MT7530 can treat each port as either VLAN-unware port or VLAN-ware port
Shouldn't that be VLAN-unaware/VLAN-aware (in the code as well)?

- Felix
