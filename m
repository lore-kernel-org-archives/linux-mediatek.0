From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 7 Oct 2019 10:26:49 +0200
Subject: [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig indentation
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
References: <20191004145544.5066-1-krzk@kernel.org>
 <20191004145544.5066-3-krzk@kernel.org>
List-Id: linux-mediatek@lists.infradead.org
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
To: linux-mediatek@lists.infradead.org

On Fri, Oct 4, 2019@4:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk at kernel.org>

>  arch/m68k/Kconfig.bus                  |  2 +-
>  arch/m68k/Kconfig.debug                | 16 ++++++++--------
>  arch/m68k/Kconfig.machine              |  8 ++++----

For m68k:
Acked-by: Geert Uytterhoeven <geert at linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
