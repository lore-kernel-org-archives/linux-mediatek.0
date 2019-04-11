From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/9] clk: mediatek: Add configurable pcwibits and fmin to mtk_pll_data
Date: Thu, 11 Apr 2019 13:16:24 -0700
Message-ID: <155501378408.20095.2407243439182851286@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-5-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-5-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-03-04 21:05:40)
> From: Owen Chen <owen.chen@mediatek.com>
>=20
> 1. pcwibits: The integer bits of pcw for plls is extend to 8 bits,
>    add a variable to indicate this change and
>    backward-compatible.
> 2. fmin: The pll freqency lower-bound is vary from 1GMhz to
>    1.5Ghz, add a variable to indicate platform-dependent.
>=20
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> ---

Applied to clk-next
