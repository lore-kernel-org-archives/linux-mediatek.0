From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: mediatek: fixup test-building of MediaTek clock
 drivers
Date: Thu, 21 Dec 2017 16:44:24 -0800
Message-ID: <20171222004424.GZ7997@codeaurora.org>
References: <971cc0e25dcf32e19bdc93a2bb0dec4cbda2fce7.1513741266.git.sean.wang@mediatek.com>
 <e39fbb5699f9978073fdd5a45173e12eff266800.1513741266.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e39fbb5699f9978073fdd5a45173e12eff266800.1513741266.git.sean.wang@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de, jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com, arnd@arndb.de, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 12/20, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Let the build system looking into the directiory where the clock drivers
> resides for the COMPILE_TEST alternative dependency allows test-building
> the drivers.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
