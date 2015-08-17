From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 RESEND 1/3] clk: Add regmap support
Date: Mon, 17 Aug 2015 16:22:35 -0700
Message-ID: <20150817232235.31346.30218@quantum>
References: <1438355659-21558-1-git-send-email-matthias.bgg@gmail.com>
 <1438355659-21558-2-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438355659-21558-2-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, sboyd@codeaurora.orgmatthias.bgg@gmail.com
Cc: s.hauer@pengutronix.de, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, manabian@gmail.com, p.zabel@pengutronix.com
List-Id: linux-mediatek@lists.infradead.org

Quoting Matthias Brugger (2015-07-31 08:14:17)
> diff --git a/drivers/clk/clk-io.c b/drivers/clk/clk-io.c
> new file mode 100644
> index 0000000..9630ef5
> --- /dev/null
> +++ b/drivers/clk/clk-io.c
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright (C) 2015 Matthias Brugger <matthias.bgg@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +void clk_io_writel(struct clk_hw *hw, void __iomem *reg, struct regmap *regmap,
> +                       u32 offset, u32 val)
> +{
> +       if (__clk_get_flags(hw->clk) & CLK_USE_REGMAP)
> +               regmap_write(regmap, offset, val);
> +       else
> +               clk_writel(val, reg);
> +}

So we have clk_writel, which already wraps direct io accesses depending
on arch/platform, and then this patch adds regmap support, and both of
those are wrapped in clk_io_writel? :-/

I agree that we should merge some unified regmap support into the clock
framework for the basic clocks, but I do not think that this is the
right way to do it. This patch simply adds more code to already crowded
basic clock types.

Replacing the basic clock types by separating policy and machine-driver
code into separate, modular pieces is a high priority on my todo list.
I'd like to do that first and then revisit regmap clocks instead of
merging this series as-is.

Regards,
Mike
