From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 4/5] phy: mvebu-cp110-comphy: convert to use eth phy
 mode and submode
Date: Fri, 16 Nov 2018 17:05:21 +0100
Message-ID: <20181116170521.11ee68e9@bootlin.com>
References: <20181108003617.10334-1-grygorii.strashko@ti.com>
        <20181108003617.10334-5-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108003617.10334-5-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Manu Gautam <mgautam@codeaurora.org>
List-Id: linux-mediatek@lists.infradead.org

Hello Grygorii,

On Wed, 7 Nov 2018 18:36:16 -0600
Grygorii Strashko <grygorii.strashko@ti.com> wrote:

>Convert mvebu-cp110-comphy PHY driver to use recently introduced
>PHY_MODE_ETHERNET and phy_set_mode_ext().

I gave it a quick test on MacchiatoBin, it works fine and the automatic
mode switching in the comphy happens as expected, so :

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

>Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Maxime Chevallier, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
