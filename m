From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/9] clk: mediatek: Add configurable pcwibits and fmin to mtk_pll_data
Date: Thu, 11 Apr 2019 13:14:42 -0700
Message-ID: <155501368210.20095.61816680073374889@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-5-weiyi.lu@mediatek.com> <CANMq1KDciN76ZRL7kLPWM--3sHNi3bbjV86Sixm4R=QUKwrx1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMq1KDciN76ZRL7kLPWM--3sHNi3bbjV86Sixm4R=QUKwrx1A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Nicolas Boichat (2019-03-07 22:20:27)
> On Tue, Mar 5, 2019 at 1:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > From: Owen Chen <owen.chen@mediatek.com>
> >
> > 1. pcwibits: The integer bits of pcw for plls is extend to 8 bits,
> >    add a variable to indicate this change and
> >    backward-compatible.
> > 2. fmin: The pll freqency lower-bound is vary from 1GMhz to
>=20
> Minor nit: frequency (Stephen I guess you could fix that when applying...)

What's a 1GMhz? Anyway, fixed the typo.
