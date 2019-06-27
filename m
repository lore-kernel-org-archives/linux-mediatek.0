From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: Fix -Wunused-const-variable
Date: Thu, 27 Jun 2019 16:52:06 -0700
Message-ID: <20190627235206.E247D20815@mail.kernel.org>
References: <20190627221507.83942-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627221507.83942-1-nhuck@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: fparent@baylibre.com, matthias.bgg@gmail.com, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>, clang-built-linux@googlegroups.com
List-Id: linux-mediatek@lists.infradead.org

Quoting Nathan Huckleberry (2019-06-27 15:15:07)
> Clang produces the following warning
>=20
> drivers/clk/mediatek/clk-mt8516.c:234:27: warning: unused variable
> 'ddrphycfg_parents' [-Wunused-const-variable] static const char * const
> ddrphycfg_parents[] __initconst =3D {
>=20
> This variable has never been used. Deleting it to cleanup the warning.
>=20
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/523
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

This patch has already been applied. It would be great if you could try
applying the patch to linux-next first before sending patches to make
sure they're still relevant.
