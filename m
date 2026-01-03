Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6408DFC617E
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bcf3JMltMq6B3ayh2KI2Hnl3zzMj0i9VG17bkzRAzBo=; b=jxzwAqL3Qm+1ZlokOAR/DjkVm1
	1cOCgo2Gkv4oZm+bFfjK+G5m6BNUix6+QkTbevXU5u2vWg/7cxfmTjh44XYTxGPguu1V+Jcs5Fz6b
	IuaWxk/3GCJJAB6a5w/alrbuu2uQrv618wL1frQhGuaOZh4IKVeNZT07hVL0dFKsjudNRlFEm4org
	NyXXkeiM0aeWZUl3GdLxTujhPkKVtKOxFlhklRGML62qlunVdbHl4vpp1lizw9bHfS9ixvPqcajGn
	nvVhJpamBghBUUKm0ySvxdENqGJGoLAT0eimZGTmTE3jN3FPQykCvTRvOaLjEwQMJl3qb5/PQki9j
	ICjnhWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc6af-00000009hBB-0adf;
	Sat, 03 Jan 2026 18:43:05 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc6ab-00000009hAq-0QQx
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jan 2026 18:43:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so17980061a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Jan 2026 10:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767465779; x=1768070579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bcf3JMltMq6B3ayh2KI2Hnl3zzMj0i9VG17bkzRAzBo=;
        b=ZatamwdSQuBV42Z8op3pkceuQQ89pbhoqn1PC4K0ZMhUniL7a+B2F0NPJTaXPiRWap
         jkCkPBqDJ26NEsjcoSMSujxJa6IFullnWdcpGN5xjiNj2YS2VFLtOfxlfPka4i561ldT
         olbhLukLvMJAYqE0GpSRtAFieDFqusi3ppOXyTzjxxSt6rjB2O0ywY8uAF+Zf4JW7BEg
         ohneln4GlVzo1yH7E34f+ReAb5cIEzvVuOgTEtiu8RDKCXMMqSzgM3kyBsK+dys70m1x
         dUbnqUjDXI0Q+gytHM7mhybVNU9GIZGnaq7Bdn9d7apuIqD6EJlqpRJM1G4Q6s15w6P4
         gWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767465779; x=1768070579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bcf3JMltMq6B3ayh2KI2Hnl3zzMj0i9VG17bkzRAzBo=;
        b=IwMiNWNFpGdtlcLdkjG0xW560Fyab2plPEORUsBI8+CwajYhlH5tsI14F0rI3VfGYa
         4SHh5P/nDGGOQqFPhD1C31tg7n1k1tL4Dtd57HIhRxLL5jngbfBqogfFs71+7qZWTMDq
         0VPw+Mh43aA+8jxeV46z8bxIGJu1n8wraXpFZ+wz5NrY27kEZsFRNFLAACjhkxLFnGuQ
         PT4mF1vdTbLv/h/dWLDbSMn9Ww8FOUNG01ZqXwKhbctwOukVAQ4ElQ+KRCpyDH/DwXPE
         Zkg23w4y+NwIYGrDrxzFO+94xf5veUrwler77/jnnP6pOYmk0z24vpixuSPKYDEiwhN/
         J6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt+iwfiOpK7NM1fg9V1CuqHK56Qj1wTCSVbeSf958I/dfdmyvLMs28PAntjKDuSecH3dUluh8iq9MICb0H2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/XETF5e7rqjZ8gwpliEQa5paDIfY/1UCOvnBDuKfb5NKXHs/
	E2qb7SGlqOYRNdJS2tF/vEtCyzyVuahR1xl8vwo9fsSzJOUGiaa3T6+9KY0B5aVFsfl2hCwtRCC
	qsBJMisWErksBiSQ5YzoHEoMxwHVfb6bQNjsvtFw=
X-Gm-Gg: AY/fxX49wv+1Z5z4ulPbDcFkakI/yZClKCEsdlfQh8yV8jQSdZq/kgiNosdIXzO3y38
	2DuL5SJodFoMoWrMraxlb5r44cFP3EIM1jbCM+6bRHdU0s3EZ05UDgGITR4BUT6PQ7+g+g9L7Cc
	zSUaSLiBS/mWw5m38+NlTxw6cHcS1mHTimVX4Kp55uux/3fUp1cNDe3DVGGh0z7q4m3Tgt7xh+R
	AdA8IE1TfRslloLdrpEh6pkfu/3nZg1l+fUvODgNitO0YygJV7mFzAR0tNjN3C0VLsyBCKTZp8+
	oUssJ5QxyqssAMvQQpUb9KA3J+28W1KXkCcH67KBbmyIgwlGow+0RT6cVA==
X-Google-Smtp-Source: AGHT+IFH05B+rMrvSMPIiZrsPLgws1FCVH8qzxE+CGadN526lnrLQdsn/Qo5n5+Tsk7x6vjxyppwePBD/Tdg7Rg6s9A=
X-Received: by 2002:a05:6402:520b:b0:64b:a79f:da3c with SMTP id
 4fb4d7f45d1cf-64ba79fdc02mr51226141a12.34.1767465778917; Sat, 03 Jan 2026
 10:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20260101062543.186499-1-zbowling@gmail.com> <20260102200315.290015-1-zbowling@gmail.com>
 <20260102200315.290015-5-zbowling@gmail.com> <CAGp9LzrdvaPPLUi9TgenXvD6jWdOK-=95D_Fo2UYOppyzGPprw@mail.gmail.com>
In-Reply-To: <CAGp9LzrdvaPPLUi9TgenXvD6jWdOK-=95D_Fo2UYOppyzGPprw@mail.gmail.com>
From: Zac Bowling <zbowling@gmail.com>
Date: Sat, 3 Jan 2026 10:42:47 -0800
X-Gm-Features: AQt7F2rzCrrGXs_P0KILVWkad7Ucdn-ziUPoIM_FiF0IuE-c3Zo_jCn5n0SjXiM
Message-ID: <CAOFcj8Qy=6gpKpkph_rj8Nyc82t_q87XM8B3hhmX0Rijv-FxeQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: fix firmware reload failure after
 previous load crash
To: Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_104301_786754_C36166C1 
X-CRM114-Status: GOOD (  26.63  )
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

Hi Sean,

Thanks! I don't have a MT7921, only a MT7925, so no unfortunately. I
ordered off Amazon and should be here in a week or two.

Zac Bowling

Zac Bowling


On Fri, Jan 2, 2026 at 10:46=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> On Fri, Jan 2, 2026 at 2:03=E2=80=AFPM Zac Bowling <zbowling@gmail.com> w=
rote:
> >
> > If the firmware loading process crashes or is interrupted after
> > acquiring the patch semaphore but before releasing it, subsequent
> > firmware load attempts will fail with 'Failed to get patch semaphore'
> > because the semaphore is still held.
> >
> > This issue manifests as devices becoming unusable after suspend/resume
> > failures or firmware crashes, requiring a full hardware reboot to
> > recover. This has been widely reported on MT7921 and MT7925 devices.
> >
> > Apply the same fix that was applied to MT7915 in commit 79dd14f:
> > 1. Release the patch semaphore before starting firmware load (in case
> >    it was held by a previous failed attempt)
> > 2. Restart MCU firmware to ensure clean state
> > 3. Wait briefly for MCU to be ready
> >
> > This fix applies to both MT7921 and MT7925 drivers which share the
> > mt792x_load_firmware() function.
> >
> > Fixes: 'Failed to get patch semaphore' errors after firmware crash
> > Signed-off-by: Zac Bowling <zac@zacbowling.com>
> > ---
> >  mt792x_core.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/mt792x_core.c b/mt792x_core.c
> > index cc488ee9..b82e4470 100644
> > --- a/mt792x_core.c
> > +++ b/mt792x_core.c
> > @@ -927,6 +927,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
> >  {
> >         int ret;
> >
> > +       /* Release semaphore if taken by previous failed load attempt.
> > +        * This prevents "Failed to get patch semaphore" errors when
> > +        * recovering from firmware crashes or suspend/resume failures.
> > +        */
> > +       ret =3D mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
> > +       if (ret < 0)
> > +               dev_dbg(dev->mt76.dev, "Semaphore release returned %d (=
may be expected)\n", ret);
> > +
> > +       /* Always restart MCU to ensure clean state before loading firm=
ware */
> > +       mt76_connac_mcu_restart(&dev->mt76);
> > +
> > +       /* Wait for MCU to be ready after restart */
> > +       msleep(100);
> > +
>
> Hi Zac,
>
> This is a good finding. Since this is a common mt792x code path, have you
> also had a chance to test it on MT7921?
>
> One small nit: the Fixes tag should reference the actual commit being
> fixed, e.g.
>
>   Fixes: <commit-sha> ("mt76: mt792x: ...")
>
> instead of the error string.
>
>                   Sean
>
> >         ret =3D mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(d=
ev));
> >         if (ret)
> >                 return ret;
> > --
> > 2.51.0
> >
> >
> >

