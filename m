From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 01/12] clk: mediatek: fixup: Disable tuner_en before change PLL rate
Date: Fri, 14 Dec 2018 13:57:38 -0800
Message-ID: <154482465853.19322.3763394015657394960@swboyd.mtv.corp.google.com>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com> <20181210073240.32278-3-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210073240.32278-3-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Why is "fixup" in the subject of this patch?

Quoting Weiyi Lu (2018-12-09 23:32:29)
> From: Owen Chen <owen.chen@mediatek.com>
>=20
> PLLs with tuner_en bit, such as APLL1, need to disable
> tuner_en before apply new frequency settings, or the new frequency
> settings (pcw) will not be applied.
> The tuner_en bit will be disabled during changing PLL rate
> and be restored after new settings applied.
> Another minor change is to correct the macro name of pcw change bit
> to CON1_PCW_CHG because PCW_CHG(BIT31) is on CON1.
>=20
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>

So there should be some Fixes: tag here too so we know what commit is
being fixed?
