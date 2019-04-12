From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: mediatek: fix clk-gate flag setting
Date: Fri, 12 Apr 2019 09:41:55 -0700
Message-ID: <155508731571.20095.11067229428863866325@swboyd.mtv.corp.google.com>
References: <20190412033027.3516-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190412033027.3516-1-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-04-11 20:30:27)
> CLK_SET_RATE_PARENT would be dropped.
> Merge two flag setting together to correct the error.
>=20
> Fixes: 5a1cc4c27ad2 ("clk: mediatek: Add flags to mtk_gate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-fixes
