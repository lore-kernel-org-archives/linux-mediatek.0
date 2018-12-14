From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 08/12] clk: mediatek: Add MT8183 clock support
Date: Fri, 14 Dec 2018 13:59:52 -0800
Message-ID: <154482479243.19322.7465842539016312943@swboyd.mtv.corp.google.com>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com> <20181210073240.32278-10-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181210073240.32278-10-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2018-12-09 23:32:36)
> +       "apll2_ck"
> +};
> +
> +static const struct mtk_mux top_muxes[] =3D {
> +       /* CLK_CFG_0 */
> +       MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MUX_AXI, "axi_sel",
> +               axi_parents, 0x40,
> +               0x44, 0x48, 0, 2, 7, 0x004, 0, CLK_IS_CRITICAL),

Please document why CLK_IS_CRITICAL is being used everywhere it's used.

> +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_MM, "mm_sel",
> +               mm_parents, 0x40,
> +               0x44, 0x48, 8, 3, 15, 0x004, 1),
> +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_IMG, "img_sel",
> +               img_parents, 0x40,
> +               0x44, 0x48, 16, 3, 23, 0x004, 2),
> +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_CAM, "cam_sel",
