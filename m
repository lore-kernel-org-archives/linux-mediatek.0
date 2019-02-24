From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 5/5] net: dsa: fix a leaked reference by adding missing
 of_node_put
Date: Sun, 24 Feb 2019 12:32:30 -0800 (PST)
Message-ID: <20190224.123230.261167641058555597.davem@davemloft.net>
References: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
        <1550819742-32155-5-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550819742-32155-5-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: wen.yang99@zte.com.cn
Cc: linus.walleij@linaro.org, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, nbd@nbd.name, lorenzo.bianconi83@gmail.com, kvalo@codeaurora.org, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, anirudh@xilinx.com, John.Linn@xilinx.com, michal.simek@xilinx.com, wang.yi59@zte.com.cn
List-Id: linux-mediatek@lists.infradead.org

From: Wen Yang <wen.yang99@zte.com.cn>
Date: Fri, 22 Feb 2019 15:15:42 +0800

> diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
> index 8c431e0..89823f0 100644
> --- a/net/dsa/dsa2.c
> +++ b/net/dsa/dsa2.c
> @@ -613,7 +613,7 @@ static int dsa_switch_parse_ports_of(struct dsa_switch *ds,
>  	struct device_node *ports, *port;
>  	struct dsa_port *dp;
>  	u32 reg;
> -	int err;
> +	int err = 0;

Please preserve the reverse christmas tree ordering of variables here.

Thank you.
