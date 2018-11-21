From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v1 04/11] soc: mediatek: add new flow for mtcmos power.
Date: Wed, 21 Nov 2018 17:21:04 +0800
Message-ID: <1542792064.20593.2.camel@mtksdaap41>
References: <20181106064206.17535-1-weiyi.lu@mediatek.com>
         <20181106064206.17535-6-weiyi.lu@mediatek.com>
         <CANMq1KDbauouMDvsZS3KsNJrNs1gGg7mDjsKRw=zTcuQXSTa0Q@mail.gmail.com>
         <1542681454.5132.9.camel@mtksdaap41>
         <154278766192.88331.16232130563413450456@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154278766192.88331.16232130563413450456@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, sboyd@codeaurora.org, Rob Herring <robh@kernel.org>, jamesjj.liao@mediatek.com, fan.chen@mediatek.com, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, owen.chen@mediatek.com, mars.cheng@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2018-11-21 at 00:07 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2018-11-19 18:37:34)
> > On Tue, 2018-11-13 at 11:31 -0800, Nicolas Boichat wrote:
> > > On Mon, Nov 5, 2018 at 10:42 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> 
> > > > @@ -226,6 +397,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
> > > >         if (ret < 0)
> > > >                 goto err_pwr_ack;
> > > >
> > > > +
> > > 
> > > Drop this.
> > Why do we try to drop this? Once the power-on step fail, the following
> > steps should not be permitted.
> 
> I just see a whitespace addition that doesn't do anything. I suspect
> it's a style nitpick and common practice to not include spurious diffs
> in the patch. So remove this hunk?
> 
Oops! I missed the extra whitespace. I will remove it. Many thanks.
