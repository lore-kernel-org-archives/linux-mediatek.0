From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RESEND PATCH v1 1/3] clk: mediatek: Register clock gate with device
Date: Tue, 17 Sep 2019 10:23:10 -0700
Message-ID: <20190917172311.BD7CC20640@mail.kernel.org>
References: <1567414859-3244-1-git-send-email-weiyi.lu@mediatek.com> <1567414859-3244-2-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567414859-3244-2-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-09-02 02:00:57)
> Allow those clocks under a power domain to do the runtime pm operation
> by forwarding the struct device pointer from clock provider.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next
