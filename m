From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 3/3] clk: mediatek: Mark bus and DRAM related clocks as
 critical
Date: Tue, 26 Feb 2019 09:55:13 -0800
Message-ID: <155120371334.260864.14503820089028591730@swboyd.mtv.corp.google.com>
References: <20190214163242.26259-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190214163242.26259-1-matthias.bgg@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@kernel.org, mturquette@baylibre.com
Cc: sean.wang@mediatek.com, linux-kernel@vger.kernel.org, jasu@njomotys.info, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting matthias.bgg@kernel.org (2019-02-14 08:32:42)
> From: Jasper Mattsson <jasu@njomotys.info>
> 
> Currently, DRAM-related clocks are not marked with CLK_IS_CRITICAL
> for MT6797. This causes memory corruption when the system is
> booted without clk_ignore_unused.
> This patch marks MUX ddrphycfg_sel as well as gates infra_dramc_f26m
> and infra_dramc_b_f26m as CLK_IS_CRITICAL.
> 
> Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

Would be nice to get someone from mediatek to ack it, but I can't wait
forever.
