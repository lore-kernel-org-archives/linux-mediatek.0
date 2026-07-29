Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50570C53200
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 03:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=; b=T+742BnlWvTo/S2WplaY4di2b+
	nxc7QkWt167Z4UqZAbX4kTFWKhpJxn4cU3zlTxGDTsGeUIdaZf9bQyUBG2ohVAg6+JI3YowEvnPs9
	ALUuRUXFPMzQ4e9SVeUqIpxFxJpriitkiV5UF03xFZ5zYRbARMsvKnVz5Zmjic39ghjGZv4bVYCpK
	nZYCHdRDjsdxO7b1AnQafnu9baV3Y2Io1EPbMRba5kZXhbeNdokm2rDAR3tq3dO5fMBvU1Cj3kthi
	5xVjzdW2XAmmGWAGk3m/eZUn82x1/cRbMxiDJUAKtIzdmY7LJYfjVmGHvya/K4UXfSTPd5q2L3QOb
	vU2MpEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovDQ-00000006m4I-0ZrC;
	Wed, 29 Jul 2026 03:44:20 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovDN-00000006m3Q-3S5v
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 03:44:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-81ef8255cccso6887547b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 20:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785296657; cv=none;
        d=google.com; s=arc-20260327;
        b=Hj2fKn9hWAABCb67WUWMKhkeJQCMVbJyMnhvnVqabJhGELIq7D2D75FkEDUzwhxuTd
         fQDR5XPGNQWK8wyAVlNI9jdzviAZjUevDfdTT2PG/NFSpnn7YcHaX6vmgy+ieJBk7wZs
         2z0dyw1D0IOOLPl1pgWRdWRkAJ5fu9kzpDKhwPQ7fKDlM9JylKxsHGwiSAIQcMEtiNrl
         hU44I6zH52c4N2ByLfwIr61nnTklRRQkOSwn6Wy164bYah76zYyDBoiYULfuDai2WyNm
         dmLRnKbo1oWrjmTXkv92ZZ+h8YaLlQIGsX4jP/Dnpm1gAzcW70SnuO492mCh4If2KUPD
         evig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        fh=NXStUBk/VjpqnVX7FdgqewuDggbBfvf8KsLo81OIrE0=;
        b=fT5M5lkGdjMhH4FqmAiQfiU/EnDg0/UScn+5iB3vqQxRAZx8pZeg5MHrtP4kd90Ik0
         mPoUJyw8LpSQj5QqQxb1dG9mht8EUQ5tiD5zh3lriaFRcEfxnQZW9P1jjjNFz9P84avQ
         gh+Sfy0unXdZoeOrovkHGk2nqHEhsAPB/xrh4SbzTLWg47xN+KWZuwcumz86gtDjv8+r
         Ska4FxSoqsOm/qd30aSQ5sWZ/mS61Nv39Wse2J5TQgefuGRtw64qLooJknxiVyUrmrB8
         IM5l5/PShSbYHx3smx7GFaaBtbb+gTfR8fQgTN4e96elVED7SgaZMWT4s65Q46QFRP9J
         pXcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785296657; x=1785901457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        b=CTnCtXdzef/jdfggN8bF2V4699tyq6rqNSvi8Dn6KfFpFlkNu0IqNHPHiZJnPU2uBb
         C1e5wXLKnrBbsCYtnW5SgMzwu7N3K137HvUQ9Ne11+gBdmx4308ReSrCCVRIBZQWns80
         PbFkl0O7oBcGySyL9tSiYWkLUx6SuOjajcBYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785296657; x=1785901457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5SQzLZmnmAyoTu35635s72269K1LO99EjP1yPHjEts=;
        b=p18glMEpLjroveCDFUkkvJ45IpOqeIHTiQnrxzrg/xcmoE2ES0GiFKCVNL6jIvYzZk
         EeofT1lsvy52l6vFegBSy4nBlkKdanwRyH99VybCDwvl0mTGiv8pl1ldp/64HteaEPgY
         XmI97cYr9v10udkqlnig6BM+K17Hqk2pGUz11rCwTd0AYQzQJXUxQDx8TvTg7FIlw7vb
         fKnFMvdj64vvCkuf1lfVbUUVVi+bpg6F1WhfVKNqR09ykW+9CJ063R41bTQdNmS9ib9+
         D+mQChSdZOYm1dNNewWCSikhcu9YtczgXh9wi0gus5tjaS2hz6hW9eGZ1B0xOEUY9rnJ
         bidQ==
X-Forwarded-Encrypted: i=1; AHgh+RomY4SuDuP8jI4rR37Y5TPbEkz7QJDnE4XDnq7aF691/RzGTwBww9rIJLrVwer1wIN0j8xPrrNvc0n5pVTXfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwezsajH+8h/FmZr9mvsIasQ/YkN45ji8X8cDpr/g6HmijmMlRT
	MaSn9RVBgQmvXZkuNe2PVlCI2foeihrdhHyn4lVo8jP8UYSyiBA3T9vOsUcnxhTn0EQjLYr2UGx
	yfoKMBe0jTtxgzrt/zani97NVCavAWAOyIStAZd/u
X-Gm-Gg: AR+sD10j/VAaeqq/3w/vQq7EqBAl+oNLjESyqCuSE1DsYm4rd1zdj88fOZs0vbndVPA
	gUJnqFIBUqAe1iJkk9+HDSIFY1xXCT1BefzJzNpcWXk7C79wJbY1l4NLyrNZWv0mBj2LwWTcfac
	zQn2qcxr31OJgRyMF5vZ81PX2BP5vosXPnYpDdxyDFDNG0GQxGrHpdRavU3Zrljfi4eQJHDqA5X
	g0g4cwGCdoevhI/as4SNPm21+tHJS6AKhYfP/aPEcf0Sf/76m0P1HirLwvJTC6rxo/FKE1YPVAg
	yHRj911v24Q4sn+Qez5VCkA47idb3aG9iEodN3MUUN6A41i3fI0jC8CQgm9hS/iYhXjFqASaCW0
	=
X-Received: by 2002:a05:690c:3343:b0:808:f9bb:3832 with SMTP id
 00721157ae682-81f9912e26amr22006057b3.22.1785296656671; Tue, 28 Jul 2026
 20:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
In-Reply-To: <20260728212438.54078-3-rosenp@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Jul 2026 11:44:04 +0800
X-Gm-Features: AUfX_mySigGaf9N_bx5P2m2Z30yXuSp7TjHLme6C1EdwCx1nkTn3oRTu9esXu2Y
Message-ID: <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] Input: mtk-pmic-keys: Count available keys during
 probe instead of pre-counting
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_204418_125112_C6FB4B0F 
X-CRM114-Status: GOOD (  26.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Replace the separate of_get_available_child_count() pre-count and
> validation step with a single pass through
> for_each_child_of_node_scoped().  Skip unavailable child nodes and
> bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.

This actually fixes a small bug. The pre-count only gets the number
of available keys, but the subsequent for_each_child block doesn't
skip over the unavailable ones, so if an unavailable node is in
the middle of the tree, there could end up being a mismatch.

> Set nkeys after the loop so suspend/resume iterate only over
> initialized entries.  Use a local key variable in the loop for
> clarity.
>
> Add an irq > 0 guard to the suspend/resume wakeup paths so that
> uninitialized key entries are safely skipped.

You are trying to do too much in one patch. These other fixes should be
in separate patches.

And why not just modify the driver to keep "nkeys", so that it knows
how many entries are valid? No use in iterating over empty entries.


> Assisted-by: OpenCode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++--------------
>  1 file changed, 34 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keybo=
ard/mtk-pmic-keys.c
> index fd684ac16938..e2ced6e5165a 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
>         int index;
>
>         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> -               if (keys->keys[index].wakeup) {
> +               if (keys->keys[index].irq > 0 && keys->keys[index].wakeup=
) {
>                         enable_irq_wake(keys->keys[index].irq);
>                         if (keys->keys[index].irq_r > 0)
>                                 enable_irq_wake(keys->keys[index].irq_r);
> @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
>         int index;
>
>         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> -               if (keys->keys[index].wakeup) {
> +               if (keys->keys[index].irq > 0 && keys->keys[index].wakeup=
) {
>                         disable_irq_wake(keys->keys[index].irq);
>                         if (keys->keys[index].irq_r > 0)
>                                 disable_irq_wake(keys->keys[index].irq_r)=
;
> @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl)=
;
>  static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  {
>         int error, index =3D 0;
> -       unsigned int keycount;
>         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.paren=
t);
>         struct device_node *node =3D pdev->dev.of_node;
>         static const char *const irqnames[] =3D { "powerkey", "homekey" }=
;
>         static const char *const irqnames_r[] =3D { "powerkey_r", "homeke=
y_r" };
>         struct mtk_pmic_keys *keys;
>         const struct mtk_pmic_regs *mtk_pmic_regs;
> +       struct mtk_pmic_keys_info *key;
>         struct input_dev *input_dev;
>
>         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_devi=
ce *pdev)
>         input_dev->id.product =3D 0x0001;
>         input_dev->id.version =3D 0x0001;
>
> -       keycount =3D of_get_available_child_count(node);
> -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> -           keycount > ARRAY_SIZE(irqnames)) {
> -               dev_err(keys->dev, "too many keys defined (%d)\n", keycou=
nt);
> -               return -EINVAL;
> -       }
> -
>         for_each_child_of_node_scoped(node, child) {
> -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[inde=
x];
> -
> -               keys->keys[index].irq =3D
> -                       platform_get_irq_byname(pdev, irqnames[index]);
> -               if (keys->keys[index].irq < 0)
> -                       return keys->keys[index].irq;
> -
> -               if (mtk_pmic_regs->key_release_irq) {
> -                       keys->keys[index].irq_r =3D platform_get_irq_byna=
me(pdev,
> -                                                                        =
 irqnames_r[index]);
> -
> -                       if (keys->keys[index].irq_r < 0)
> -                               return keys->keys[index].irq_r;
> +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> +                       dev_err(&pdev->dev, "too many keys defined\n");
> +                       return -EINVAL;
>                 }
>
> -               error =3D of_property_read_u32(child,
> -                       "linux,keycodes", &keys->keys[index].keycode);
> -               if (error) {
> -                       dev_err(keys->dev,
> -                               "failed to read key:%d linux,keycode prop=
erty: %d\n",
> -                               index, error);
> -                       return error;
> +               if (of_device_is_available(child)) {

Instead of re-indenting the whole block and making the diff huge and
unreadable, please make this skip over the remaining code when the
condition fails, i.e.:

                  if (!of_device_is_available(child))
                          continue;

Or better yet, just use for_each_available_child_of_node_scoped() { ... }
instead.

I normally suggest people read the API docs (either on docs.kernel.org
or the kernel-doc sections in the code) to find better suited constructs
to use.


Thanks
ChenYu

> +                       key =3D &keys->keys[index];
> +                       key->regs =3D &mtk_pmic_regs->keys_regs[index];
> +
> +                       key->irq =3D platform_get_irq_byname(pdev, irqnam=
es[index]);
> +                       if (key->irq < 0)
> +                               return key->irq;
> +
> +                       if (mtk_pmic_regs->key_release_irq) {
> +                               key->irq_r =3D platform_get_irq_byname(pd=
ev, irqnames_r[index]);
> +                               if (key->irq_r < 0)
> +                                       return key->irq_r;
> +                       }
> +
> +                       error =3D of_property_read_u32(child, "linux,keyc=
odes", &key->keycode);
> +                       if (error) {
> +                               dev_err(keys->dev,
> +                                       "failed to read key:%d linux,keyc=
ode property: %d\n",
> +                                       index, error);
> +                               return error;
> +                       }
> +
> +                       if (of_property_present(child, "wakeup-source"))
> +                               key->wakeup =3D true;
> +
> +                       error =3D mtk_pmic_key_setup(keys, key);
> +                       if (error)
> +                               return error;
>                 }
>
> -               if (of_property_read_bool(child, "wakeup-source"))
> -                       keys->keys[index].wakeup =3D true;
> -
> -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]);
> -               if (error)
> -                       return error;
> -
>                 index++;
>         }
>
> --
> 2.55.0
>
>

