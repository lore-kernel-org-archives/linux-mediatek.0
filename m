From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] clk: mediatek: Fix -Wunused-const-variable
Date: Thu, 27 Jun 2019 16:07:05 -0700
Message-ID: <CAKwvOdkYvuYTq=kV9yBWmStQ4GhMtpnp9dV5UvASQKeMwfu0Vw@mail.gmail.com>
References: <20190627221507.83942-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190627221507.83942-1-nhuck@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: fparent@baylibre.com, sboyd@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@linaro.org>, mturquette@baylibre.com, LKML <linux-kernel@vger.kernel.org>, Nathan Huckleberry <nhuck@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jun 27, 2019 at 3:15 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> Clang produces the following warning
>
> drivers/clk/mediatek/clk-mt8516.c:234:27: warning: unused variable
> 'ddrphycfg_parents' [-Wunused-const-variable] static const char * const
> ddrphycfg_parents[] __initconst = {
>
> This variable has never been used. Deleting it to cleanup the warning.

comparing this to `nfi1x_pad_parents`, it looks like this maybe should
be an entry in `top_muxes`, but there seem to be some magic constants
in those that I don't understand or know what we'd use for
`ddrphycfg_parents`.

Again, looking at `nfi1x_pad_parents` for reference, we see
`CLK_TOP_NFI1X_PAD_SEL` used with it and being defined in the device
tree bindings in include/dt-bindings/clock/mt8516-clk.h.  I would
guess that `CLK_TOP_DDRPHYCFG_SEL` should be used in `top_muxes` with
`ddrphycfg_parents`.

`CLK_TOP_DDRPHYCFG_SEL` appears in:
drivers/clk/mediatek/clk-mt8135.c
drivers/clk/mediatek/clk-mt8173.c
drivers/clk/mediatek/clk-mt2701.c
drivers/clk/mediatek/clk-mt7629.c
drivers/clk/mediatek/clk-mt7622.c
but not the translation unit in question:
drivers/clk/mediatek/clk-mt8516.c

in most of the above (except clk-mt2701.c which simply has 1
additional field but otherwise matching values, and clk-mt8135.c which
has 2 different values), it's added to a similarly named and typed
`top_muxes` as:

MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
  0x040, 16, 1, 23),

even then `ddrphycfg_parents` shows up in the other translation units
in the same statement as `CLK_TOP_DDRPHYCFG_SEL`.

So questions to the maintainers I have:
1. Is the above `MUX_GATE` what should be added to `top_muxes` in
drivers/clk/mediatek/clk-mt8516.c?
2. If so, where? Is order of the array elements important.

If the answer to 1 is no, then we should take Nathan's patch.

>
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/523
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  drivers/clk/mediatek/clk-mt8516.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
> index 26fe43cc9ea2..9d4261ecc760 100644
> --- a/drivers/clk/mediatek/clk-mt8516.c
> +++ b/drivers/clk/mediatek/clk-mt8516.c
> @@ -231,11 +231,6 @@ static const char * const nfi1x_pad_parents[] __initconst = {
>         "nfi1x_ck"
>  };
>
> -static const char * const ddrphycfg_parents[] __initconst = {
> -       "clk26m_ck",
> -       "mainpll_d16"
> -};
> -


-- 
Thanks,
~Nick Desaulniers
