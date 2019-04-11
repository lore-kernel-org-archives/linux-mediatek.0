From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 6/9] clk: mediatek: Add flags support for mtk_gate data
Date: Thu, 11 Apr 2019 13:19:58 -0700
Message-ID: <155501399858.20095.16525048679717411283@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-8-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-8-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-03-04 21:05:43)
> On some Mediatek platforms, there are critical clocks of
> clock gate type.
> To register clock gate with flags CLK_IS_CRITICAL,
> we need to add the flags field in mtk_gate data and register APIs.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

This patch doesn't apply, because it's already there via commit
5a1cc4c27ad2 ("clk: mediatek: Add flags to mtk_gate").
