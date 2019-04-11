From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/9] clk: mediatek: Add new clkmux register API
Date: Thu, 11 Apr 2019 13:16:19 -0700
Message-ID: <155501377988.20095.3921794940086690412@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-4-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-4-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-03-04 21:05:39)
> From: Owen Chen <owen.chen@mediatek.com>
>=20
> On both MT8183 & MT6765, there add "set/clr" register for
> each clkmux setting, and one update register to trigger value change.
> It is designed to prevent read-modify-write racing issue.
> The sw design need to add a new API to handle this hw change with
> a new mtk_clk_mux/mtk_mux struct in new file "clk-mux.c", "clk-mux.h".
>=20
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next
