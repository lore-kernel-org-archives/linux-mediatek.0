Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20009606A326
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0nkQPtZy;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mnRZElJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=; b=0nkQPtZy7WNV2i
	JBYikO6WrxVtNg0DfcOKK1+UZ2LQmpd5zTSIX1+1OOJbvqmvAEw+QFLI4WDFEwWP+pYdNBwUx/rdc
	4SoK1uD1Y4M1XkB/KoBkV8So2sZdnbFYH6F8K6w6FjmKXhcOtcpvzmNUvYyyeUmq/HiZOYF+Tth7F
	UchNdmKhj7OUaSuwZZhJAXAsHRlU4ptZBlI1qwK7UbY3hMV0hsii4TxYIHwNle4BeRi2XyaP9Yzey
	4H+9w84Wg4+V1cN+iz49wN2XAy62pO1EdgB2HzZljLp7BD7Lx5wsalZi/RUadG17qS/9tGkW078p+
	dWvA+gPzLduWUxPKKURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKM-0000000FRzj-2uH1;
	Fri, 27 Nov 2026 09:33:10 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKK-0000000FRyz-2RN6
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 09:33:09 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so2780929a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795771987; x=1796376787; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=mnRZElJv7owXW7fx19ThGYNpqg7Nd+r8A01OP4Ir9e3/YjTchvYI3CI/OcXa0dKie8
         qPGbT4pcfha/d0rTUE+xU/GX0vNqAzJdnKorVahE0dVX8M2J81odco9yF8XFBO+ijT3E
         D/dtMqBVYZidFR54B7HjRokD4tM2sllSi0/PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771987; x=1796376787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=oobWocF7AUw7Bp8rFdmgWv4gLNlmEZJ55Ro6iOdbxEg82cvYZSNtHFXWDjVybsCNqv
         6U4HqXP2W8E9Q7LBMUA7+DHrYeDq6CnLJeXjalrN7fGL/mH7oNOPWDuvv+6Fl4KQ2U0F
         isTrefQbt8mlNE2CbJzoAGVMZPKvsEkIRdmJRF5EKVanDTI6xX97fZ2qMRDsHSN5b8Bd
         MjkaBwbt5sXcd8T2oegqNIeAFlrUkgGUNCcZT67ZzOAkOr2GubUT5rWoF8MICTsl2Kjp
         RxDxyLHUJ+XBAlod+VB+MAiJZkmWIlAqohbW7iCeOF52yeOX4AXwA1jnxiKjAKZ+u25y
         MgNA==
X-Forwarded-Encrypted: i=1; AL+hErHtLSVQJ48dEFOc09iE6GhvWzdA5PNMXRzfg9x2Gd+j/UEjeckXnwW0TxM17g/cO/JLDFnaxeh+Cja0AUAatw==@lists.infradead.org
X-Gm-Message-State: APuU4Z89SSXXB5bpWI5wrnvbLfqkIjq8BomG9yBb3w2trHz+S+3xRIu+
	G4DSz2nW4bzlyGB2cuCBHDZ+KGOKZxjpXwue2LwyrXCcECqzz7kjQ+DpDuKooDN+0b7VhE/Bcte
	fT5se0g==
X-Gm-Gg: AZFdTZcLtwAlV5sA0VIPnl8r93gVn/6QgA42dzCNszzpSuFMEU+UQciUlZq4nrRiYpC
	lirEs5ANoINxNnGebGkCQt/8CmNyAlUCWO6aoy+DGZhXpdSAQ9IMeoa6UaAimeA8wnlSH9YGvGV
	GuCJmcIU/MLoGMh521+9TtTdbwk74XpX+XvZIipDeJuw2Brfra2J8ushMy9bbP0t6bA6RaO9SFy
	thp3jt+O0yw1YkWLOqGKHNb9WR7Dl1Jsm5DEM3IVRoD+MgWckAIxWn3+WZtYOFAWroCeyTXG72G
	ONQmlJ4CwZ+zJHV9hul4ONiu/tYbti4JQTv2MZ23PcKPccY1lyTDOyalGRiO7qEw5yWYDZyFQju
	tCQfJtTbPMqsnpmwCrwVf5m5bhxFWqM3xfVzNral1Y2agP57Xw0eKMRhtVzT241HwfNbKztaVC/
	PgqVPU8Z2kXdkbA5pBfKivIBHoFhrM83W6gTTWn6z6fXLnFJbaNkgRL0ILiOx3HmAj2tjUd0rMl
	Tmu8u9GMsBQTIbmV/1OBODxa6Pyhfm28+vuUItddiYgstUiD3EXYCQiPixZb5YTkLPZYTBo75nh
	IPniBby0tIB5TT2gzeZM8X690vtOKO5iagrdsGOv/siLHPaB3nuL+dH8HHGUcgs=
X-Received: by 2002:a17:90b:4d86:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b41c93b159mr19823772a91.28.1795771987299;
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm37193449a91.9.2026.11.27.01.33.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:06 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so11648081c88.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCQ0vLqYkddBfrGv/8K2x2q6yxnlgq/GqxpZ1TdoNhhioDsAYvLoK/bgGrwsJtRV5oayRyV89h97oiV0WDeg==@lists.infradead.org
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id
 5a478bee46e88-386a1ae6d5fmr20784587eec.36.1795771985456; Fri, 27 Nov 2026
 01:33:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 17:32:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
X-Gm-Features: Aa3M54pRArGKHVMgeqwG1e8L5StTOP94fleg1U4pb_vICTi6qu6Nmly90U-l36k
Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
Subject: Re: [PATCH v2 37/46] drm/mediatek: Prepare path builder for
 multi-controller architecture
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_013308_671050_217E9D21 
X-CRM114-Status: GOOD (  31.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding support for the new display controllers
> featuring multi-controller w/DirectLink architecture, expand the
> path builder to recognize whether a hardware component in display
> controller related output path is getting its input from internal
> or from any external (to itself, but still internal to the SoC)
> display controller component.
>
> When an output path is found, it is also necessary to understand
> the enablement order (in terms of mmsys/mutex other than PM) of
> the controllers, as that cannot be done randomly: for this, the
> initial path builder will start storing an indication to whether
> a component is either in a leader or in a follower controller,
> and then a new function mtk_drm_set_path_orders(), called when
> binding all components, when initializing KMS, takes care of the
> looping through the path and setting up the order between all
> of the follower display controllers.
>
> As of this point, no multi-controller SoCs are introduced yet,
> so this code will not bring any functional change on any of the
> currently supported SoCs / display controllers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 374 ++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_legacy.c |   3 +-
>  5 files changed, 351 insertions(+), 32 deletions(-)
>
[snip]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cccdd58b848a..75b3fd56d6af 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -185,17 +185,26 @@ static int mtk_drm_match(struct device *dev, const =
void *data)
>  static bool mtk_drm_get_all_drm_priv(struct device *dev)
>  {
>         struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> -       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       struct mtk_drm_private **all_drm_priv;
>         struct mtk_drm_private *temp_drm_priv;
>         struct device_node *phandle =3D dev->parent->of_node;
>         const struct of_device_id *of_id;
>         struct device_node *node;
>         struct device *drm_dev;
>         unsigned int cnt =3D 0;
> +       bool all_privs_found;
>         int i, j;
>
> +       dev_vdbg(dev, "Populating private data for all controllers on ID%=
u\n",
> +                drm_priv->data->mmsys_id);
> +
> +       /* Avoid variable length arrays and allocate an array of pointers=
 to privs */
> +       all_drm_priv =3D kmalloc_array(drm_priv->data->mmsys_dev_num,
> +                                    sizeof(struct mtk_drm_private *), GF=
P_KERNEL);
> +       if (!all_drm_priv)
> +               return -ENOMEM;

mtk_drm_get_all_drm_priv() returns bool. Return false here or change
it to return an int instead.

> +static void mtk_drm_set_path_orders(struct mtk_drm_private **all_drm_pri=
vate)
> +{
[snip]
> +                               /*
> +                                * Paths are per-output: set order for th=
e new output
> +                                * by finding the order of the same outpu=
t number of
> +                                * the previous controller and incrementi=
ng it by one
> +                                */
> +                               src_path =3D &src_priv->data->output_path=
s[i];
> +                               src_order =3D src_path->len ? src_path->o=
rder : 0;
> +                               if (cur_path->order <=3D src_order) {
> +                                       cur_path->order =3D src_order + 1=
;
> +
> +                                       /* Order found: check next CRTC n=
ow! */
> +                                       order_found =3D true;
> +                                       break;
> +                               }
> +                       }
> +               } while (!order_found && max_iterations--);

IIUC, this only works for up to a 3-controller chain, which needs at
most 1 update (0, 1, 1 -> 0, 1, 2). When there are 4 or more
controllers in a chain, it needs at least 2 updates (0, 1, 1, 1 -> 0,
1, 2, 3), but the loop stops after the first update (`break` +
`!order_found`), leaving the orders as (0, 1, 2, 1). On the other
hand, when no updates are needed, `!order_found` spins
`max_iterations` times unnecessarily.
We need a loop that stops only when no more updates are needed, i.e.,
drop `break;` and loop `while (order_found && max_iterations--)`.

Regards,
Fei

