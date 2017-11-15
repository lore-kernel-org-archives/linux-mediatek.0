From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/8] clk: mediatek: mt2701-mm: switch to mfd device
Date: Tue, 14 Nov 2017 16:17:05 -0800
Message-ID: <20171115001705.GJ11955@codeaurora.org>
References: <20171114214114.15793-1-mbrugger@suse.com>
 <20171114214114.15793-5-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171114214114.15793-5-mbrugger@suse.com>
Sender: linux-clk-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, lee.jones@linaro.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab@kernel.org, rdunlap@infradead.org, pi-cheng.chen@linaro.org, sean.wang@mediatek.com, linux-clk@vger.kernel.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
List-Id: linux-mediatek@lists.infradead.org

On 11/14, Matthias Brugger wrote:
> As the new mfd device is in place, switch probing
> for the MMSYS to support invocation from the mfd device.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
