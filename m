From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: mt8183: Register 13MHz clock earlier
 for clocksource
Date: Wed, 26 Jun 2019 09:28:47 +0800
Message-ID: <1561512527.24282.13.camel@mtksdaap41>
References: <1560132969-1960-1-git-send-email-weiyi.lu@mediatek.com>
         <20190625221512.B691620883@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625221512.B691620883@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Dehui Sun <dehui.sun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-06-25 at 15:15 -0700, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-06-09 19:16:09)
> > The 13MHz clock should be registered before clocksource driver is
> > initialized. Use CLK_OF_DECLARE_DRIVER() to guarantee.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> Do you have a Fixes: tag in mind? Otherwise, the patch looks OK to me.

Yes, Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
but I forgot to have it in the commit message. Thanks for reminding.
I'll update a V3 patch with Fixes tag. Many thanks. 

> 
