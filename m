From: Rick Chang <rick.chang@mediatek.com>
Subject: Re: [PATCH 05/12] [media] vcodec: mediatek: constify v4l2_m2m_ops
 structures
Date: Mon, 7 Aug 2017 10:42:05 +0800
Message-ID: <1502073725.2886.2.camel@mtksdaap41>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
         <1502007921-22968-6-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502007921-22968-6-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, 2017-08-06 at 10:25 +0200, Julia Lawall wrote:
> The v4l2_m2m_ops structures are only passed as the only
> argument to v4l2_m2m_init, which is declared as const.
> Thus the v4l2_m2m_ops structures themselves can be const.
> 
> Done with the help of Coccinelle.
> 
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct v4l2_m2m_ops i@p = { ... };
> 
> @ok1@
> identifier r.i;
> position p;
> @@
> v4l2_m2m_init(&i@p)
> 
> @bad@
> position p != {r.p,ok1.p};
> identifier r.i;
> struct v4l2_m2m_ops e;
> @@
> e@i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct v4l2_m2m_ops i = { ... };
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rick Chang <rick.chang@mediatek.com>
