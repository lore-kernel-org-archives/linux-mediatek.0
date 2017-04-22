From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: mediatek: add mt2701 ethernet reset
Date: Fri, 21 Apr 2017 19:14:37 -0700
Message-ID: <20170422021437.GF7065@codeaurora.org>
References: <1485175707-58528-1-git-send-email-john@phrozen.org>
 <1485175707-58528-2-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485175707-58528-2-git-send-email-john@phrozen.org>
Sender: linux-clk-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 01/23, John Crispin wrote:
> The ethernet clock core has a reset register that is currently not exposed
> to the user. Fix this by adding the missing registration code.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
