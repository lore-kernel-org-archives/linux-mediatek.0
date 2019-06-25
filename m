From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled during re-parent
Date: Tue, 25 Jun 2019 15:14:14 -0700
Message-ID: <20190625221415.B0DC22086D@mail.kernel.org>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-06-09 20:44:53)
> When using property assigned-clock-parents to assign parent clocks,
> core clocks might still be disabled during re-parent.
> Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> during re-parent.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Can you further describe the scenario where this is a problem? Is it
some sort of clk that is enabled by default out of the bootloader and is
then configured to have an 'assigned-clock-parents' property to change
the parent, but that clk needs to be "enabled" so that the framework
turns on the parents for the parent switch?
