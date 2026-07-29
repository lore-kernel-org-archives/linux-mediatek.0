Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A695C53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=; b=dSb8IhV61gt3eB/dBr2mXCk63e
	eYWK5UONumBVF2mO5h8QYEtaTopzaIexY0vkvpDz1lrDzrDCQwxCYSMB2SQMdJRVgolpgDxfJrqOQ
	8KKG1lnMP0mRRzycoDDxkrd/Eh2fFt1FZ2rJUkEBtXX1XAVRnX0NZ0vgQcZYtjBc5xfyyTXINN6TW
	0ZBDqgkkx8xbyhqjaB0iwJrYfBRrrlOTUib90f1SMLLx334SjlGSvr+sW6pI7Mm9htO95foEvGUKm
	g+kCKA9uZ5Fewb9ck7l9xZZsL7cb7+n9defsmegiWxCtHfNaBnjgxTICLJOAlzsfQiL3A/KWIcykw
	9WiPmT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp96z-00000008ont-44UV;
	Wed, 29 Jul 2026 18:34:37 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp96v-00000008om3-0y0C
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 18:34:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so2017319a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 11:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785350071; cv=none;
        d=google.com; s=arc-20260327;
        b=fTmPb+SoVjZg78gXMzhvcs3kMiJL2JLp70E7dBXOa6AbMzJ1TYZ7QagPUBZoEXbJgb
         dGZ8OEqUiNgM1he3dsc9HiGEqYxHatyFfgZnicrjW3ij5JiSmjUrIwlptryZeiO2mqRS
         QCv4QsP6DkfR16Xxz1WSOHViyrjbNXPK4iQBEYmr5rKIiVuLInwSXxrL3ApUCh3EEioe
         FxztmS+icodBsITIu9ycEq1qqFY+rc8xljLC/cmxM4+4IwPHhsAofk8ZLyH6rq2MTfA3
         p0crMtF84/pbuvj+eZOC+zJiSjjci54xitKKXKJxzfrWgSnb8DvEyFPq10K1wi2oU1s+
         yyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        fh=qwoH1romTYnaONcw348cCJEZu66zRO2QrXLkJxgQg0s=;
        b=Rtkjh4XigXsrU3LF5GMAs8tQTMvPIV8nsXagE1wNz3ABK8/DfvchHl3dAEMs5bcUr6
         EnTlUTZ87xYf9Wxn4yZevtB5ClKpdiJMs2116R8gKE/OA8X7hMxdI6pK4MxM5YZ38mdH
         0axASrWuqfEpCOHSFaAZ6mNfWHBiSUAp1M20NeiPrbdzXnLTtfyqLFn+p6LSmcqLDuOR
         AQ9a4UoQqo/Xb31NPkLmRg+FAGCX8durFUZwVEvGrFpXJb5V/+Ro2rxU5mmm1Ax4jNGG
         odxSY2NLFE7g3dEVQzQkWbZEBNKzuGUHI54Z5SpjEnkqXQ5/VJDlSv+YRpp+h04MEDas
         Vi7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785350071; x=1785954871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        b=q9xyd76YWimo8N3cNois6PlZKiwPKInWUDiiQ2WIzmD8xRacPnu12ylbz4iN8UM28i
         ESx3OR/+5xy3XITgsYTRnLGjiI96BWFOWgtpcTluz3NrVXmj5F0iJxNWE1pkEILFlyQ4
         ZUnJNzwbTux28JOozrdafXdPXn+D2+a5tXKUe9VCBSIDo3ggz+McvggndMwS9aYWHLMx
         AeUqhBoMCTDuWmfsUPN0Tu2Sq+EGa1ANJAepYMcbNo0z2GiqrNE5wNHs5dEJ8da9XbbR
         u26GwqwZNV7z+0EBrBrBRVxe1DcGNg+A8s4iOKCHHAEeJqSz4BAFBtEfavtsL3yMQz4A
         HKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350071; x=1785954871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEkdeq10zZmR1kctz1fIkkTbV43ha873suiUEwLT1nI=;
        b=Zfta+EPwY7Tybux79CfSdF0Iw0MsVIUX5Ik/lHgy1oWXs+bv+n9nbqoT47sD9B6Ccy
         3ZumofwSBgVWqc8oMqwkc6BVQTfXZQDX+agFsb51WLmrxi9BSXo0D7t8Sandm1fKcEvi
         hoacZQbh1ahKFXw5sEQKx17usDAhdT0DeASZV1CikAuVIZ5jUCZ+HcwiH4iNgXEkEIAt
         Fss0yAZorMrjM2TyopoegdT4bVvGUvoxGDKG4+TS76mnhVx6u42nU0gz/Af3y6SZ/QuY
         bzoBb1oleHsf+G69xyWH4EmevHaCDDMXO6puWlMvGEMJ3cOJ13fHfgfha/rUeHn53cPX
         UyoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoX2a9LfI/hctlcUBju60dcnTLvq08A3XDUUhNw/XtnOtuFY0QJTicSqE6BuedONpBUaoYge4pC37tYA0Be1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOKTpfr2BFzsllG0Jo79kcaj9U+QeaB/dxavNBzdqwJDEVaZ6l
	qB0sR2MOjCLQidc5Z7MenV1zwXKF48kC5O/16sjPIWTf6Vhz8TOAuV06qN4bzmCq9ei3zoCM+PH
	Vv7Azq1iWdx2hBocI6/fWz633T5w5wZU=
X-Gm-Gg: AR+sD13FcpwygATiXJoY4zUH+D/aRlCRgS4mk9aNhYaUEHFOdOazNEpB8shKA7BAY5k
	7wNlEUHe9wYkKEH5CxoeJGqppCqFA3mfJU6STMt04uzbPZPLAj3P9ac981ausnmbeB0MuPtek39
	f6hLkWoFRmHaokbPo55yI740eNCaBZ6sU0jUCE3+fB33z7s/vRDERNJff9ukwPjuZccRg3z8IRm
	ZmLw1sepcGLwyzOfvekF43ACtLVDcP1EaTUuS7t6zbt2/vn1T+/40Uh1g1bNQ0NFLUt15swIkOU
	us4ItflJLELZPg6xTPtzZC4fQhelLMCdEWV2RkxFuZ4IfdFwnKVRCcDx64L5JAanEYpOj1oVz62
	ynJRPqRXFUdpV7Pk19Vwd5P1tlhTRMgVHoeOMFdH5nr9rGWpeQGBYniqdep1k+k1b3I6R+E7YgZ
	qdzIwMm3xMnB3igBnjlSZfdpF7ylf15Q3npaY7cd19g8vcay9gh92X8/8=
X-Received: by 2002:a05:6402:2345:b0:698:50ea:2d97 with SMTP id
 4fb4d7f45d1cf-6a034ab91cfmr4406703a12.20.1785350070955; Wed, 29 Jul 2026
 11:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
 <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
In-Reply-To: <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:34:17 -0700
X-Gm-Features: AUfX_mxHHY_oKlFmxwUp_dDYkgE3HyOB09yEzi4_yjeUnpEenThghULANdcA5Us
Message-ID: <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] Input: mtk-pmic-keys: Count available keys during
 probe instead of pre-counting
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_113433_356146_B5CC41F1 
X-CRM114-Status: GOOD (  33.09  )
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

On Tue, Jul 28, 2026 at 8:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Replace the separate of_get_available_child_count() pre-count and
> > validation step with a single pass through
> > for_each_child_of_node_scoped().  Skip unavailable child nodes and
> > bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.
>
> This actually fixes a small bug. The pre-count only gets the number
> of available keys, but the subsequent for_each_child block doesn't
> skip over the unavailable ones, so if an unavailable node is in
> the middle of the tree, there could end up being a mismatch.
>
> > Set nkeys after the loop so suspend/resume iterate only over
> > initialized entries.  Use a local key variable in the loop for
> > clarity.
> >
> > Add an irq > 0 guard to the suspend/resume wakeup paths so that
> > uninitialized key entries are safely skipped.
>
> You are trying to do too much in one patch. These other fixes should be
> in separate patches.
>
> And why not just modify the driver to keep "nkeys", so that it knows
> how many entries are valid? No use in iterating over empty entries.
>
>
> > Assisted-by: OpenCode:BigPickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++--------------
> >  1 file changed, 34 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/key=
board/mtk-pmic-keys.c
> > index fd684ac16938..e2ced6e5165a 100644
> > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev=
)
> >         int index;
> >
> >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > -               if (keys->keys[index].wakeup) {
> > +               if (keys->keys[index].irq > 0 && keys->keys[index].wake=
up) {
> >                         enable_irq_wake(keys->keys[index].irq);
> >                         if (keys->keys[index].irq_r > 0)
> >                                 enable_irq_wake(keys->keys[index].irq_r=
);
> > @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
> >         int index;
> >
> >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > -               if (keys->keys[index].wakeup) {
> > +               if (keys->keys[index].irq > 0 && keys->keys[index].wake=
up) {
> >                         disable_irq_wake(keys->keys[index].irq);
> >                         if (keys->keys[index].irq_r > 0)
> >                                 disable_irq_wake(keys->keys[index].irq_=
r);
> > @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tb=
l);
> >  static int mtk_pmic_keys_probe(struct platform_device *pdev)
> >  {
> >         int error, index =3D 0;
> > -       unsigned int keycount;
> >         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.par=
ent);
> >         struct device_node *node =3D pdev->dev.of_node;
> >         static const char *const irqnames[] =3D { "powerkey", "homekey"=
 };
> >         static const char *const irqnames_r[] =3D { "powerkey_r", "home=
key_r" };
> >         struct mtk_pmic_keys *keys;
> >         const struct mtk_pmic_regs *mtk_pmic_regs;
> > +       struct mtk_pmic_keys_info *key;
> >         struct input_dev *input_dev;
> >
> >         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> > @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_de=
vice *pdev)
> >         input_dev->id.product =3D 0x0001;
> >         input_dev->id.version =3D 0x0001;
> >
> > -       keycount =3D of_get_available_child_count(node);
> > -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> > -           keycount > ARRAY_SIZE(irqnames)) {
> > -               dev_err(keys->dev, "too many keys defined (%d)\n", keyc=
ount);
> > -               return -EINVAL;
> > -       }
> > -
> >         for_each_child_of_node_scoped(node, child) {
> > -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[in=
dex];
> > -
> > -               keys->keys[index].irq =3D
> > -                       platform_get_irq_byname(pdev, irqnames[index]);
> > -               if (keys->keys[index].irq < 0)
> > -                       return keys->keys[index].irq;
> > -
> > -               if (mtk_pmic_regs->key_release_irq) {
> > -                       keys->keys[index].irq_r =3D platform_get_irq_by=
name(pdev,
> > -                                                                      =
   irqnames_r[index]);
> > -
> > -                       if (keys->keys[index].irq_r < 0)
> > -                               return keys->keys[index].irq_r;
> > +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> > +                       dev_err(&pdev->dev, "too many keys defined\n");
> > +                       return -EINVAL;
> >                 }
> >
> > -               error =3D of_property_read_u32(child,
> > -                       "linux,keycodes", &keys->keys[index].keycode);
> > -               if (error) {
> > -                       dev_err(keys->dev,
> > -                               "failed to read key:%d linux,keycode pr=
operty: %d\n",
> > -                               index, error);
> > -                       return error;
> > +               if (of_device_is_available(child)) {
>
> Instead of re-indenting the whole block and making the diff huge and
> unreadable, please make this skip over the remaining code when the
> condition fails, i.e.:
>
>                   if (!of_device_is_available(child))
>                           continue;
Yeah probably better.
>
> Or better yet, just use for_each_available_child_of_node_scoped() { ... }
> instead.
In v1 this is exactly what I did and was told not to.
>
> I normally suggest people read the API docs (either on docs.kernel.org
> or the kernel-doc sections in the code) to find better suited constructs
> to use.
>
>
> Thanks
> ChenYu
>
> > +                       key =3D &keys->keys[index];
> > +                       key->regs =3D &mtk_pmic_regs->keys_regs[index];
> > +
> > +                       key->irq =3D platform_get_irq_byname(pdev, irqn=
ames[index]);
> > +                       if (key->irq < 0)
> > +                               return key->irq;
> > +
> > +                       if (mtk_pmic_regs->key_release_irq) {
> > +                               key->irq_r =3D platform_get_irq_byname(=
pdev, irqnames_r[index]);
> > +                               if (key->irq_r < 0)
> > +                                       return key->irq_r;
> > +                       }
> > +
> > +                       error =3D of_property_read_u32(child, "linux,ke=
ycodes", &key->keycode);
> > +                       if (error) {
> > +                               dev_err(keys->dev,
> > +                                       "failed to read key:%d linux,ke=
ycode property: %d\n",
> > +                                       index, error);
> > +                               return error;
> > +                       }
> > +
> > +                       if (of_property_present(child, "wakeup-source")=
)
> > +                               key->wakeup =3D true;
> > +
> > +                       error =3D mtk_pmic_key_setup(keys, key);
> > +                       if (error)
> > +                               return error;
> >                 }
> >
> > -               if (of_property_read_bool(child, "wakeup-source"))
> > -                       keys->keys[index].wakeup =3D true;
> > -
> > -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]);
> > -               if (error)
> > -                       return error;
> > -
> >                 index++;
> >         }
> >
> > --
> > 2.55.0
> >
> >

