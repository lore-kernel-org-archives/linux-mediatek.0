From: Rick Chang <rick.chang@mediatek.com>
Subject: Re: [PATCH 2/2] [media] vcodec: mediatek: mark pm functions as
 __maybe_unused
Date: Tue, 21 Mar 2017 09:46:29 +0800
Message-ID: <1490060789.27725.9.camel@mtksdaap41>
References: <20170320094812.1365229-1-arnd@arndb.de>
         <20170320094812.1365229-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170320094812.1365229-2-arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Ricky Liang <jcliang@chromium.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2017-03-20 at 10:47 +0100, Arnd Bergmann wrote:
> When CONFIG_PM is disabled, we get a couple of unused functions:
> 
> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:927:13: error: 'mtk_jpeg_clk_off' defined but not used [-Werror=unused-function]
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>              ^~~~~~~~~~~~~~~~
> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:916:13: error: 'mtk_jpeg_clk_on' defined but not used [-Werror=unused-function]
>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
> 
> Rather than adding more error-prone #ifdefs around those, this patch
> removes the existing #ifdef checks and marks the PM functions as __maybe_unused
> to let gcc do the right thing.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Acked-by: Rick Chang <rick.chang@mediatek.com>
