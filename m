Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4531C54FD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 04:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=; b=RARb+cDmwjI/J3qXtGNhM8lD4A
	2WEv/vsTN0kV6iSG6VutEIz4ub2vrHmIXa8rD0eS2BCbvvSJReXNVK6kePEpD7JMM3iNcFn2EQDUe
	N23AEpEECLw7gCRmQWeqhgBKX/VrdFdRKQj+PSpOJ83ikX+w4V0rvw4r2spc4dtc+XFCi3v2dL1wY
	WBd7W9NnlY9jf/hWxX6YfP3792JVrFhqhEbkS6X1Sl8drNhbSdWTcIltPEJRQYGISFc7EvpzG5tHk
	MfPN6TiP/2Q/p2WzJIPTrMKkd3FQWN9WjjBecP6dj53IA3ayARTdUzoUOh84xN9mRGAsRv8uEkRuq
	ZEkVP3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIm8-00000009VlC-1Puj;
	Thu, 30 Jul 2026 04:53:44 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIm4-00000009Vk4-0B3J
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 04:53:43 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81ee41aaec1so25706407b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 21:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387219; cv=none;
        d=google.com; s=arc-20260327;
        b=PgjeCBGOw7kKgOS13Z0KRxT6vCPTimJI4tJzHxSGPDMXB8fGrI5vwE6vuHUAOVuUwB
         RKqyUDnRP7I4A+2d+2fDAXSQRWqfktw+MFY16MO3eU6x0kB3fMybIig/XfpHEBCDScwM
         Wyeh4A0D9x3Y2MEgzzoQWMXsvjbdxSm7aZgGlNtn1BooGQW2IA1IMaZu2i2Uy4QI06pD
         rqtvZoX4WbO7yJOp62lZreYEM0swVIOOREY+u99S5w8g2Vbvrd6Ll5eKut/6CRkmARbJ
         nI0KEj/GW/4L95AU2wpAC27yZKLPrdA17Io5I25TDRlDcyJN5hGtCwRD60q8yUtfg9CY
         fkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        fh=DjBD+foBGrjO2mNSRo59j+f/Vv7VGYvCQFoCQrYgT3U=;
        b=Ly3GJgbgRbJaLrL3l6YS7QgKPjHFVkuujfIgaoXtevNd5iEKX0TL/X6QjY3TFZsv+b
         IobWb/kj+OL1aE1b29+SCBBRCRvxARqV/TRt/GRhmSsleRO8Gs2Q8lxM59WFm+Phd3Tg
         0Ipgvan132MFociI0wzLB9dsQm4PJpB0gKJSOIgrHH+TMcyXSkDtIOfbCEwOdzbOJfdx
         EMWH7zH7L5rNpHnAUXn5LEKgtLOCU/s38UFMhnuvbKqlMgMZWcVPSlWm88WaaP26ydj4
         F02vRD+fCbQwnHZ4E1r07cfUWBmqQTHJKZCz1j8N50ZyQn3TP8V1/G6mZRgyopCsknaQ
         SVeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387219; x=1785992019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        b=QQ3eR7z3nhSwJbgnXd1DWXaa35LGJ74r++hpRpK9cHB6+36AM7j6YqIIyBju7ZUcQw
         WItA2nEpjJQ2wN/2HbJtcTbP7IB8gobEbfV/UDm/JeF6VsNS3RCx2Dz+QAHlBZIHdkZG
         hEuOJZNHlvHXztdqdi2Lt3KALwV6sJNu5sndI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387219; x=1785992019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNQXtzIynC28TDaE/Ql1n0+KoVl8k9chZuF6STvMMrI=;
        b=moR1T9qNYQVkDPuNViWOXHVYvgtyPgsBvSUDbB44FiDicANshxdFcWhqs/lPq5jn9c
         pPNMUV6wzWtMYp9Pzco0cKtiJrv91xmOrYBHik8pumBA7AhnuTws12fTFIFouC4trruL
         iQqJlHnFZPrGjVNalo+fC7LCjJX1N0ahqe9sKz11GNU2rDYEsplBevxzR4s67dqKwtFR
         kb8RaNrGIoo7fAz8EfJu/nWHXZ8FhbQcX3EntUGtBI2lw+JPNeAsEwZYN29Y4CXfwKSM
         a+NEaMIjckUOyK3+DDLkp5biBpQG9FFyDXQMty3MdR5JeNWz1yhYHYNN7rijXqxICl9e
         PjWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWe3YqNXnT8hTFStT7amMb4MujUm8r2m3HaNOb5pRwMo3Nc1yo3RELVSipq610KdMTZtiGo679MKaIJXaZiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVbBjl4XQI9Efv6KWsE3yUXwJtUNyTL3yFDumgG7pa5m4zIvUz
	K58/s1kw8i9I2tpTKFa1WRWewvXwVM5AuOR2Nl/fYZwuPzV/U1SHYaUEA8xlR0kSg5jw8RGJUzb
	DRp7QrSfN32oFx1pf7DjUFdQeZ6B24GiahSyri/aS
X-Gm-Gg: AR+sD110d7Z5JprySYLBk8wUuRZFL/eVr5H6iLvIsR1lES6oDeBfj3rFsAzbI97FrAr
	xts8NyOqZwLjLtviRs7n7yEtNdGI0HjD2nyh7TEGtTG1vSq8TGQ1dHD/2CClDE+LQ1N0xfuUKaJ
	ICS2O3ARhuoGlgdzBuJHKG2p1xAze5Mo4wZaLYUJd1n/rVusK05c1FThQ1FNa9fcyQgif41YoVH
	EeWwolHebptvkS1T4heY7IcpcU/i8xQc+qPecmQDvPcohydesOGFV22W7In4wQLqx7rt+RUqJZx
	kj63p1vYtGwQIzYd0PVBaMuklqGaWl84tkGU7M47GkuA5uwGiTYmRkylz5tm5dV2ZlMqqckCh87
	D6qfWnsNXvYo=
X-Received: by 2002:a05:690c:c503:b0:81c:eca8:b31f with SMTP id
 00721157ae682-81fb8a840f3mr6908137b3.39.1785387218988; Wed, 29 Jul 2026
 21:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-3-rosenp@gmail.com>
 <CAGXv+5EVSc4=ug=GU6Gvdu0UatqM1DD48i-c3AEb4p0GwktRvg@mail.gmail.com> <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
In-Reply-To: <CAKxU2N8VeE+xPGZ-41nqDCtk_LA_PvgzjrUbnOZ-5JmEb-uKHg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:53:28 +0800
X-Gm-Features: AUfX_mw6g8L8q-LQMW-CQgvcfpzwOR1hh-FNl8gdfMDgDPM6vfWXNYP6-KfvIvo
Message-ID: <CAGXv+5F+a_ZdbtX+ApHdOC0884EfUdkULVkaY=nipFX0JgCZNw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260729_215340_328599_BBD28079 
X-CRM114-Status: GOOD (  36.83  )
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

On Thu, Jul 30, 2026 at 2:34=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Tue, Jul 28, 2026 at 8:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Wed, Jul 29, 2026 at 5:25=E2=80=AFAM Rosen Penev <rosenp@gmail.com> =
wrote:
> > >
> > > Replace the separate of_get_available_child_count() pre-count and
> > > validation step with a single pass through
> > > for_each_child_of_node_scoped().  Skip unavailable child nodes and
> > > bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.
> >
> > This actually fixes a small bug. The pre-count only gets the number
> > of available keys, but the subsequent for_each_child block doesn't
> > skip over the unavailable ones, so if an unavailable node is in
> > the middle of the tree, there could end up being a mismatch.
> >
> > > Set nkeys after the loop so suspend/resume iterate only over
> > > initialized entries.  Use a local key variable in the loop for
> > > clarity.
> > >
> > > Add an irq > 0 guard to the suspend/resume wakeup paths so that
> > > uninitialized key entries are safely skipped.
> >
> > You are trying to do too much in one patch. These other fixes should be
> > in separate patches.
> >
> > And why not just modify the driver to keep "nkeys", so that it knows
> > how many entries are valid? No use in iterating over empty entries.
> >
> >
> > > Assisted-by: OpenCode:BigPickle
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++------------=
--
> > >  1 file changed, 34 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/k=
eyboard/mtk-pmic-keys.c
> > > index fd684ac16938..e2ced6e5165a 100644
> > > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > > @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *d=
ev)
> > >         int index;
> > >
> > >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > > -               if (keys->keys[index].wakeup) {
> > > +               if (keys->keys[index].irq > 0 && keys->keys[index].wa=
keup) {
> > >                         enable_irq_wake(keys->keys[index].irq);
> > >                         if (keys->keys[index].irq_r > 0)
> > >                                 enable_irq_wake(keys->keys[index].irq=
_r);
> > > @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *de=
v)
> > >         int index;
> > >
> > >         for (index =3D 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> > > -               if (keys->keys[index].wakeup) {
> > > +               if (keys->keys[index].irq > 0 && keys->keys[index].wa=
keup) {
> > >                         disable_irq_wake(keys->keys[index].irq);
> > >                         if (keys->keys[index].irq_r > 0)
> > >                                 disable_irq_wake(keys->keys[index].ir=
q_r);
> > > @@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_=
tbl);
> > >  static int mtk_pmic_keys_probe(struct platform_device *pdev)
> > >  {
> > >         int error, index =3D 0;
> > > -       unsigned int keycount;
> > >         struct mt6397_chip *pmic_chip =3D dev_get_drvdata(pdev->dev.p=
arent);
> > >         struct device_node *node =3D pdev->dev.of_node;
> > >         static const char *const irqnames[] =3D { "powerkey", "homeke=
y" };
> > >         static const char *const irqnames_r[] =3D { "powerkey_r", "ho=
mekey_r" };
> > >         struct mtk_pmic_keys *keys;
> > >         const struct mtk_pmic_regs *mtk_pmic_regs;
> > > +       struct mtk_pmic_keys_info *key;
> > >         struct input_dev *input_dev;
> > >
> > >         keys =3D devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
> > > @@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_=
device *pdev)
> > >         input_dev->id.product =3D 0x0001;
> > >         input_dev->id.version =3D 0x0001;
> > >
> > > -       keycount =3D of_get_available_child_count(node);
> > > -       if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> > > -           keycount > ARRAY_SIZE(irqnames)) {
> > > -               dev_err(keys->dev, "too many keys defined (%d)\n", ke=
ycount);
> > > -               return -EINVAL;
> > > -       }
> > > -
> > >         for_each_child_of_node_scoped(node, child) {
> > > -               keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[=
index];
> > > -
> > > -               keys->keys[index].irq =3D
> > > -                       platform_get_irq_byname(pdev, irqnames[index]=
);
> > > -               if (keys->keys[index].irq < 0)
> > > -                       return keys->keys[index].irq;
> > > -
> > > -               if (mtk_pmic_regs->key_release_irq) {
> > > -                       keys->keys[index].irq_r =3D platform_get_irq_=
byname(pdev,
> > > -                                                                    =
     irqnames_r[index]);
> > > -
> > > -                       if (keys->keys[index].irq_r < 0)
> > > -                               return keys->keys[index].irq_r;
> > > +               if (index >=3D MTK_PMIC_MAX_KEY_COUNT) {
> > > +                       dev_err(&pdev->dev, "too many keys defined\n"=
);
> > > +                       return -EINVAL;
> > >                 }
> > >
> > > -               error =3D of_property_read_u32(child,
> > > -                       "linux,keycodes", &keys->keys[index].keycode)=
;
> > > -               if (error) {
> > > -                       dev_err(keys->dev,
> > > -                               "failed to read key:%d linux,keycode =
property: %d\n",
> > > -                               index, error);
> > > -                       return error;
> > > +               if (of_device_is_available(child)) {
> >
> > Instead of re-indenting the whole block and making the diff huge and
> > unreadable, please make this skip over the remaining code when the
> > condition fails, i.e.:
> >
> >                   if (!of_device_is_available(child))
> >                           continue;
> Yeah probably better.
> >
> > Or better yet, just use for_each_available_child_of_node_scoped() { ...=
 }
> > instead.
> In v1 this is exactly what I did and was told not to.

I see now that the interrupts are tied to each key in order, regardless
whether the key is enabled or not. for_each_available_child_of_node_scoped(=
)
is not the right thing to use indeed.

Could you add this bit of context to the commit message?


Thanks
ChenYu

> >
> > I normally suggest people read the API docs (either on docs.kernel.org
> > or the kernel-doc sections in the code) to find better suited construct=
s
> > to use.
> >
> >
> > Thanks
> > ChenYu
> >
> > > +                       key =3D &keys->keys[index];
> > > +                       key->regs =3D &mtk_pmic_regs->keys_regs[index=
];
> > > +
> > > +                       key->irq =3D platform_get_irq_byname(pdev, ir=
qnames[index]);
> > > +                       if (key->irq < 0)
> > > +                               return key->irq;
> > > +
> > > +                       if (mtk_pmic_regs->key_release_irq) {
> > > +                               key->irq_r =3D platform_get_irq_bynam=
e(pdev, irqnames_r[index]);
> > > +                               if (key->irq_r < 0)
> > > +                                       return key->irq_r;
> > > +                       }
> > > +
> > > +                       error =3D of_property_read_u32(child, "linux,=
keycodes", &key->keycode);
> > > +                       if (error) {
> > > +                               dev_err(keys->dev,
> > > +                                       "failed to read key:%d linux,=
keycode property: %d\n",
> > > +                                       index, error);
> > > +                               return error;
> > > +                       }
> > > +
> > > +                       if (of_property_present(child, "wakeup-source=
"))
> > > +                               key->wakeup =3D true;
> > > +
> > > +                       error =3D mtk_pmic_key_setup(keys, key);
> > > +                       if (error)
> > > +                               return error;
> > >                 }
> > >
> > > -               if (of_property_read_bool(child, "wakeup-source"))
> > > -                       keys->keys[index].wakeup =3D true;
> > > -
> > > -               error =3D mtk_pmic_key_setup(keys, &keys->keys[index]=
);
> > > -               if (error)
> > > -                       return error;
> > > -
> > >                 index++;
> > >         }
> > >
> > > --
> > > 2.55.0
> > >
> > >

