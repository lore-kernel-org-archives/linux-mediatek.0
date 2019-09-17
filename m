From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RESEND PATCH v1 2/3] clk: mediatek: Runtime PM support for MT8183 mcucfg clock provider
Date: Tue, 17 Sep 2019 10:23:14 -0700
Message-ID: <20190917172314.D2765214AF@mail.kernel.org>
References: <1567414859-3244-1-git-send-email-weiyi.lu@mediatek.com> <1567414859-3244-3-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567414859-3244-3-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-09-02 02:00:58)
> Enable the runtime PM support and forward the struct device pointer for
> registration of MT8183 mcucfg clocks.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next
