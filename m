Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5C9D3CCB2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/5XmxwHwYCP8/uagwllmfFu0i9L1U3rU59lyz06mIM=; b=M1n0gukuJ1kM9lKnhzA0kaDFIf
	E4pMbQF0BJkuM12Gf5KLV9DLaJmxZ2jrBN3fB6Kseu0tCrY4867J05yTsGXP05zCJLZf7PVBoXBIa
	729FgVaqu3JLu+Vf35JrOBaN2ww2b0HAFsj9z+Fjzcmx5bnPh7NBKVaKiQ1/98X/OKNLuupIiqI+d
	ckbbYCiCvsWGOp36lW9SB+rqQj8hnyRARiJC/PFdEF1vYZeV1IVWqezJakoaC7TMHi+F8KtxS4RC9
	cppOxj2aY2oENZ2GcBeeqp8lWL3IPZxjUiGN4XI8NDzbfUZuABl2kxsuI+uuHKYJ/9HZ11JhwChVn
	/uhJMMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHdr-0000000But1-1mac;
	Thu, 15 Jan 2026 07:19:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHdo-0000000Buqt-18lw
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 07:19:37 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so2992264a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 23:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768461574; x=1769066374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/5XmxwHwYCP8/uagwllmfFu0i9L1U3rU59lyz06mIM=;
        b=NllH4Xi0+eA2UEA+UW5Nnnf9DqWI1YlHlpeq07vxIMn9TH1hRDXezedmuVsNsmzB9z
         Fpl6caW6pF1A6P+QUqdt7cLLOF4GB77ofOs59JYaGzc2MJSZnjPYB2qNkL4Npte3vMeO
         Fk6GpPHBGs/aY30WJ/YLBBscOTvpJ2lxBX2feQlHQEX/LXGD5Q1up2+J/wCVZndoIYPj
         f+nQoOzbwdO1TaeF7rRhpc2kvRO1jfficJ7F/Dag8hygJVPSVH0A6OYYusTHEQlfcDi5
         Re7FjSRL8zxj7ZH0c5juEI//3jGmWeaDE6L9t+fSQuNbdzcTyHXks1b3SW+uxjV7athp
         NT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461574; x=1769066374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/5XmxwHwYCP8/uagwllmfFu0i9L1U3rU59lyz06mIM=;
        b=cXkOWFMsDexjUpNpJy8uxuNjlowPOXZJR8qWYktNKbpcTRbYbIMa500pAnwuwl/3Yc
         zg8BI+p/9+YLt4wudFlfUaM15YM4FHQwNPsbYCXsYoAoaNuh9womAVL5DKPBEVtc4JH/
         cdiWVvIr8D+ieMO39sy/z1BWri6r8Mf0EaGHiRksOsR7qZMU7CBphmsEb6rUgt8qu4Zd
         QNoQSeT9IPrl9dsicsHMWD3PMbXuxwPwlRp1Dm33BhVccDgfpjCfGPhCMGpHiuiJTg3M
         9h0OJZEDqiSKcSjhuMKUZnONkS0I1UJLd4zB6lO6B3ZbrQZAdg2RVRD37rPQxpPgwMw1
         2nvw==
X-Forwarded-Encrypted: i=1; AJvYcCUa4MObTkGdqoYLx88FE8IbKxe4kVz1z9tTG4Ec/5C7vopJv82QKXdei97RVx8qBGhCM3KrdD8qcZJKIbjdgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvGkD8++2d4+/s+j/vU+byh3oMHYM8WX4rsHycE0GaKEGokDxr
	xy6D2kTj6cLJNi7k/iKG2BbZJcS77cURUNN0wg7xSIAldfx1QtHfTHvEcoC0YsbXHt0Lv6wE+K1
	G2HA6QzSs9WUeIqgrjRcK7hk9Ecksopc=
X-Gm-Gg: AY/fxX4i1x4odMr62QMw0FE9Y16l3DH9OAAG7DiqS0FISQRBYQ/UPvbRY4W3/knW2hN
	lfKf1Df595dHao8jpK+lSP7iJsrVcUeRaFzfo96wQRXJLrM+uC9MwLK4yUmF7IzGNw9FuAEeQ7m
	C3jeED+wqQIaIEX5BMTYfup5pV801tcKrq8Nb6VCCc0VUwukn7mXiPIODvgGReWA6wUN6f8LvD0
	3wfckY+7/SOZU1q8hKVlr/22J3Okj5vpubRwWTrS97uxMqV/OVjgAXci8eStFv/5xyQS+AmPD0a
	3gulZO6OO9ZQWxaQy8h740eDBh9LJIRu/4ydWhj3MJYw5UD7zW2HE5EUDQ==
X-Received: by 2002:a05:6402:6c9:b0:653:c2ad:6d93 with SMTP id
 4fb4d7f45d1cf-65412e18ab4mr1261487a12.2.1768461573636; Wed, 14 Jan 2026
 23:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20260101062543.186499-1-zbowling@gmail.com> <20260102200315.290015-1-zbowling@gmail.com>
 <20260102200315.290015-5-zbowling@gmail.com> <CAGp9LzrdvaPPLUi9TgenXvD6jWdOK-=95D_Fo2UYOppyzGPprw@mail.gmail.com>
 <CAOFcj8Qy=6gpKpkph_rj8Nyc82t_q87XM8B3hhmX0Rijv-FxeQ@mail.gmail.com>
In-Reply-To: <CAOFcj8Qy=6gpKpkph_rj8Nyc82t_q87XM8B3hhmX0Rijv-FxeQ@mail.gmail.com>
From: Zac Bowling <zbowling@gmail.com>
Date: Wed, 14 Jan 2026 23:19:21 -0800
X-Gm-Features: AZwV_QjK0v0tbT6r_b00Qb_Rg8mpI0meBJa8q-dEZ2am_HkmFWL9JtfuJmh_Ov0
Message-ID: <CAOFcj8SnLPZoq7JLhUGZKmJVTt=iGC6AcTxghauz91PfDCm+ew@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: fix firmware reload failure after
 previous load crash
To: Sean Wang <sean.wang@kernel.org>, linux@frame.work
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_231936_339219_90ADF9F5 
X-CRM114-Status: GOOD (  35.85  )
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

While I'm still waiting for feedback from folks on these patches, I've
set up a public repository with all the fixes for others experiencing
these issues and created a DKMS package for folks so they can easily
load these patches as an alternative driver since so many folks are
running into these same problems on several popular commercial laptops
and desktops:

 https://github.com/zbowling/mt7925

  The repository has:
  - All 18 patches from this series I've sent here (different versions
of these patches that apply cleanly to different kernel versions)
  - Pre-patched kernel branches (6.17.x, 6.18.x, 6.19-rc5) in another
repo linked in the README
  - A new DKMS package for out-of-tree builds (requires kernel 6.17+)
with various hacks with #ifdef kernel versions so that the single
package works for all recent kernels.

The DKMS package builds mt76, mt76-connac-lib, mt792x-lib,
mt7925-common, and mt7925e modules with all fixes applied.

Testing in the community with everyone experiencing these same panics
in the current upstream version, I've heard feedback from many folks
that this patch series (either just apply the patches or using the
DKMS build) that this fixes most of their issues.

There still seems to be ongoing issues inside the firmware related to
MLO and deauths with certain APs (especially with my Unifi U7 Pros)
but at least this keeps machines from crashing while it the chip
resets so you only suffer momentary losses in connectivity instead of
straight-up kernel panic or a deadlock.

For anyone still hitting the NULL pointer dereferences, mutex
deadlocks with NetworkManager and friends during MLO and deauth
situations, or suspend/resume hangs with mt7925 - this DMKS package or
these patches should greatly help.

Happy to address any review feedback whenever you finally have a
chance to look at these.


Zac Bowling


On Sat, Jan 3, 2026 at 10:42=E2=80=AFAM Zac Bowling <zbowling@gmail.com> wr=
ote:
>
> Hi Sean,
>
> Thanks! I don't have a MT7921, only a MT7925, so no unfortunately. I
> ordered off Amazon and should be here in a week or two.
>
> Zac Bowling
>
> Zac Bowling
>
>
> On Fri, Jan 2, 2026 at 10:46=E2=80=AFPM Sean Wang <sean.wang@kernel.org> =
wrote:
> >
> > On Fri, Jan 2, 2026 at 2:03=E2=80=AFPM Zac Bowling <zbowling@gmail.com>=
 wrote:
> > >
> > > If the firmware loading process crashes or is interrupted after
> > > acquiring the patch semaphore but before releasing it, subsequent
> > > firmware load attempts will fail with 'Failed to get patch semaphore'
> > > because the semaphore is still held.
> > >
> > > This issue manifests as devices becoming unusable after suspend/resum=
e
> > > failures or firmware crashes, requiring a full hardware reboot to
> > > recover. This has been widely reported on MT7921 and MT7925 devices.
> > >
> > > Apply the same fix that was applied to MT7915 in commit 79dd14f:
> > > 1. Release the patch semaphore before starting firmware load (in case
> > >    it was held by a previous failed attempt)
> > > 2. Restart MCU firmware to ensure clean state
> > > 3. Wait briefly for MCU to be ready
> > >
> > > This fix applies to both MT7921 and MT7925 drivers which share the
> > > mt792x_load_firmware() function.
> > >
> > > Fixes: 'Failed to get patch semaphore' errors after firmware crash
> > > Signed-off-by: Zac Bowling <zac@zacbowling.com>
> > > ---
> > >  mt792x_core.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/mt792x_core.c b/mt792x_core.c
> > > index cc488ee9..b82e4470 100644
> > > --- a/mt792x_core.c
> > > +++ b/mt792x_core.c
> > > @@ -927,6 +927,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
> > >  {
> > >         int ret;
> > >
> > > +       /* Release semaphore if taken by previous failed load attempt=
.
> > > +        * This prevents "Failed to get patch semaphore" errors when
> > > +        * recovering from firmware crashes or suspend/resume failure=
s.
> > > +        */
> > > +       ret =3D mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
> > > +       if (ret < 0)
> > > +               dev_dbg(dev->mt76.dev, "Semaphore release returned %d=
 (may be expected)\n", ret);
> > > +
> > > +       /* Always restart MCU to ensure clean state before loading fi=
rmware */
> > > +       mt76_connac_mcu_restart(&dev->mt76);
> > > +
> > > +       /* Wait for MCU to be ready after restart */
> > > +       msleep(100);
> > > +
> >
> > Hi Zac,
> >
> > This is a good finding. Since this is a common mt792x code path, have y=
ou
> > also had a chance to test it on MT7921?
> >
> > One small nit: the Fixes tag should reference the actual commit being
> > fixed, e.g.
> >
> >   Fixes: <commit-sha> ("mt76: mt792x: ...")
> >
> > instead of the error string.
> >
> >                   Sean
> >
> > >         ret =3D mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name=
(dev));
> > >         if (ret)
> > >                 return ret;
> > > --
> > > 2.51.0
> > >
> > >
> > >

