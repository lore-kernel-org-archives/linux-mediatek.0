From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: mediatek: mt8183: Register 13MHz clock earlier for clocksource
Date: Tue, 25 Jun 2019 15:15:12 -0700
Message-ID: <20190625221512.B691620883@mail.kernel.org>
References: <1560132969-1960-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560132969-1960-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Dehui Sun <dehui.sun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-06-09 19:16:09)
> The 13MHz clock should be registered before clocksource driver is
> initialized. Use CLK_OF_DECLARE_DRIVER() to guarantee.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Do you have a Fixes: tag in mind? Otherwise, the patch looks OK to me.
