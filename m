From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/8] net: dsa: add helper functions
Date: Mon, 17 Dec 2018 11:31:19 -0800 (PST)
Message-ID: <20181217.113119.1920042287405234188.davem@davemloft.net>
References: <20181214164847.4851-1-frank-w@public-files.de>
        <20181214164847.4851-3-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-3-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: frank-w@public-files.de
Cc: matthias.bgg@gmail.com, netdev@vger.kernel.org, sean.wang@mediatek.com, andrew@lunn.ch, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>
Date: Fri, 14 Dec 2018 17:48:41 +0100

> @@ -255,6 +255,24 @@ static void dsa_tree_teardown_default_cpu(struct dsa_switch_tree *dst)
>  	dst->cpu_dp = NULL;
>  }
>  
> +static int dsa_user_parse(struct dsa_port *port, u32 index,
> +			  struct dsa_switch *ds)
> +{
> +	struct device_node *cpu_port;
> +	const unsigned int *cpu_port_reg;
> +	int cpu_port_index;

Please order local variables from longest to shortest line.

Also, for ->upstream_port, since it is ultimately used as a u8 maybe
it's best to define it as a u8 in the structure?

Thanks.
