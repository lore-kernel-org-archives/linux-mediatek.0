From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: mediatek: add devm_of_platform_populate() for MT7622
 audsys
Date: Tue, 20 Mar 2018 00:25:20 -0700
Message-ID: <152153072063.254778.14980520624689416670@swboyd.mtv.corp.google.com>
References: <004f07aef08148321c320ea09f8169982f73dd2b.1521514928.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <004f07aef08148321c320ea09f8169982f73dd2b.1521514928.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Ryder Lee (2018-03-19 20:16:51)
> Add devm_of_platform_populate() to populate devices which are children
> of the root node.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---

Applied to clk-next
