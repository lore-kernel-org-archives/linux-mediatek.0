From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] [media] media: mtk-mdp: fix reference count on old
 device tree
Date: Fri, 21 Jun 2019 15:22:41 +0200
Message-ID: <20190621132241.GC10459@kroah.com>
References: <20190621113250.4946-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621113250.4946-1-matthias.bgg@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, djkurtz@chromium.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jun 21, 2019 at 01:32:50PM +0200, Matthias Brugger wrote:
> of_get_next_child() increments the reference count of the returning
> device_node. Decrement it in the check if we are using the old or the
> new DTB.
> 
> Fixes: ba1f1f70c2c0 ("[media] media: mtk-mdp: Fix mdp device tree")
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
