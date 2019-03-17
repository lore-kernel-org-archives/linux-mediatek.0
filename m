From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] dma: mediatek: addres minor style issues flagged by clang-format.
Date: Sun, 17 Mar 2019 11:02:28 -0700
Message-ID: <CAGp9LzoWhFzjryv1BhUyjNZOU-K7pgKji94n_7B-Bzbu2mJ1Ow@mail.gmail.com>
References: <20190317084443.158913-1-armax@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190317084443.158913-1-armax@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Armando Miraglia <arma2ff0@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Neil Brown <neil@brown.name>, devel@driverdev.osuosl.org, jbi.octave@gmail.com, gustavo@embeddedor.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, sergio.paracuellos@gmail.com, Armando Miraglia <armax@google.com>, linux-mediatek@lists.infradead.org, bhanusreemahesh@gmail.com, christian@lkamp.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Mar 17, 2019 at 1:45 AM Armando Miraglia <arma2ff0@gmail.com> wrote:
>
> Running clang-format on mtk-hsdma.c I noticed that few lines would not
> need to be wrapped, since they fit 80 columns. This change changes such
> lines to better fit the style-guide.
>
> Signed-off-by: Armando Miraglia <armax@google.com>
> ---
>  drivers/staging/mt7621-dma/mtk-hsdma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index 97571f1d697b..74c374f7bef4 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -264,8 +264,7 @@ static void mtk_hsdma_reset(struct mtk_hsdam_engine *hsdma,
>         /* init desc value */
>         for (i = 0; i < HSDMA_DESCS_NUM; i++) {
>                 chan->tx_ring[i].addr0 = 0;
> -               chan->tx_ring[i].flags = HSDMA_DESC_LS0 |
> -                       HSDMA_DESC_DONE;
> +               chan->tx_ring[i].flags = HSDMA_DESC_LS0 | HSDMA_DESC_DONE;
>         }
>         for (i = 0; i < HSDMA_DESCS_NUM; i++) {
>                 chan->rx_ring[i].addr0 = 0;
> @@ -435,8 +434,7 @@ static irqreturn_t mtk_hsdma_irq(int irq, void *devid)
>         if (likely(status & HSDMA_INT_RX_Q0))
>                 tasklet_schedule(&hsdma->task);
>         else
> -               dev_dbg(hsdma->ddev.dev, "unhandle irq status %08x\n",
> -                       status);
> +               dev_dbg(hsdma->ddev.dev, "unhandle irq status %08x\n", status);
>         /* clean intr bits */
>         mtk_hsdma_write(hsdma, HSDMA_REG_INT_STATUS, status);
>

Acked-by: Sean Wang <sean.wang@kernel.org>

> --
> 2.21.0.360.g471c308f928-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
