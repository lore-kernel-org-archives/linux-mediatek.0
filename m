From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: fix module autoloading for
 OF platform drivers
Date: Mon, 26 Mar 2018 13:10:02 -0400 (EDT)
Message-ID: <20180326.131002.382607463474769029.davem@davemloft.net>
References: <2497321afc9156f7954e813721f60a0a95c03bd2.1522057659.git.sean.wang@mediatek.com>
        <cb3bdedb65fca8e206ba081b0dfd69667c3f7804.1522057659.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb3bdedb65fca8e206ba081b0dfd69667c3f7804.1522057659.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Mon, 26 Mar 2018 18:07:10 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> It's required to create a modules.alias via MODULE_DEVICE_TABLE helper
> for the OF platform driver. Otherwise, module autoloading cannot work.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
