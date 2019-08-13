From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] net: ethernet: mediatek: Add MT7628/88 SoC support
Date: Tue, 13 Aug 2019 15:09:23 +0200
Message-ID: <b2258258-af40-3e0d-f771-a70428ec798f@denx.de>
References: <20190717110243.14240-1-sr@denx.de>
 <20190717121506.GD18996@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190717121506.GD18996@makrotopia.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Felix Fietkau <nbd@openwrt.org>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

On 17.07.19 14:15, Daniel Golle wrote:
> On Wed, Jul 17, 2019 at 01:02:43PM +0200, Stefan Roese wrote:
>> This patch adds support for the MediaTek MT7628/88 SoCs to the common
>> MediaTek ethernet driver. Some minor changes are needed for this and
>> a bigger change, as the MT7628 does not support QDMA (only PDMA).
> 
> The Ethernet core found in MT7628/88 is identical to that found in
> Ralink Rt5350F SoC. Wouldn't it hence make sense to indicate that
> in the compatible string of this driver as well? In OpenWrt we are
> using "ralink,rt5350-eth".

Okay. I'll use this ralink compatible instead in the next version.

Thanks,
Stefan
