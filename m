From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 7/9] clk: mediatek: Add configurable pcw_chg_reg to mtk_pll_data
Date: Thu, 11 Apr 2019 13:21:15 -0700
Message-ID: <155501407511.20095.8651469793006948660@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-9-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-9-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-03-04 21:05:44)
> In previous MediaTek PLL design, it assumes the pcw change control
> is always on the CON1 register.
> However, the pcw change bit on MT8183 was moved onto CON0 because
> the the PCW length of audio PLLs are extended to 32-bit.
> Add configurable pcw_chg_reg to set the pcw change control register
> address or using the default control register CON1 if without
> setting in pll data.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next
