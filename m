From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v5 0/9] Mediatek MT8183 clock support
Date: Thu, 28 Mar 2019 13:18:20 +0800
Message-ID: <1553750300.20204.2.camel@mtksdaap41>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-03-05 at 13:05 +0800, Weiyi Lu wrote:

Hi Stephen,
Just gentle ping. Many thanks.

> Resend clock patches from v4 based on v5.0-rc1.
> 
> The whole series now is composed of
> a fix for PLL tuner (PATCH 1),
> clock common changes for both MT8183 & MT6765 (PATCH 2-3),
> clock support of MT8183 (PATCH 4-8) and
> resend a clock patch long time ago(PTACH 9).
> 
> changes since v4:
> - refine for the fix of PLL tuner(PATCH 1).
> - add configurable pcw_chg_reg for MT8183 and the following IC(PATCH 7).
> 
> changes sinve v3:
> - add fix tag.
> - small change of mtk_clk_mux data structure.
> - use of_property_for_each_string to iterate dependent subsys clock of power domain.
> - document critical clocks.
> - reduce some clock register error log.
> - few coding style fix.
> 
> changes sinve v2:
> - refine for implementation consistency of mtk clk mux.
> - separate the onoff API into enable/disable API for mtk scpsys.
> - resend a patch about PLL rate changing.
> 
> changes since v1:
> - refine for better code quality.
> - some minor bug fix of clock part, like incorrect control address
>   and missing clocks.
> 
> 
