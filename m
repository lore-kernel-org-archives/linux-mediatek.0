Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDAACD4F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=; b=JOX9nwdfmqFVRm+JweUtVZEW2J
	jOr2kDnFJ3gRzrNyEybdpXGZYLME4zXtPh/xBE8VT9r0Zu8FlHItZGv2LjS5a1YT1O4EdI9CmH4Qg
	lu+jYzihDWvMCYk29Dm6PBPcWFu3dXKLphHF+VyxKIGCfU3Eih2vCON0JWRdCtwyp9xs5BZQDQCUx
	RZo2Stl/Bi2CnPf6TK/ryQcPlQ17eg5GIOrK/aDtI09yUBOXPGZCfrRZW9a3KVleE5HV7bG6hr4nD
	FleXJAUoBXuDuqSQ+woce3Kbb0ic7N3QeIW6LK3os2OrQd7MHPpCnBHC/VqbFLTxiQ3O0xAeqkuND
	NlDbI3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFJ6-00000003b1U-0lvV;
	Wed, 13 May 2026 19:31:48 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFJ3-00000003b04-25xN
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 19:31:46 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-651bc83e74aso8075248d50.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 12:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778700704; cv=none;
        d=google.com; s=arc-20240605;
        b=Cls7GVlE8WdjwlNmKdEQ/y3Okay+oZAwFpEmOBGnDGwP0/ZD4OATD4Q1DUHHRbG+ST
         QcdhhzGWkLEWdCE+RaW4WEWjN0pzbxkZBR4U3u2ByWiZihnTACEJMUeeZg3AhU8/2dS9
         e1DitKjGiBnEwA9dUcWKR/HX8tXiag4djQ87p1j/wJDxut0yTEhXDbzv9eUsJjV/gqTM
         /uS+5ZrBIBWOgEI9z4F/Jl+JRHxoH0aNqRjI+sGnO0y10ROXpuGBoQB5kaHWFJgkDuXO
         e1YwVzykbwqVvFEjcy4U1YlplrqTQIL5o6q9QX/cXZtgUfTFtGEmgIiSw9JTCj5T2eQU
         Kj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        fh=GbxnGpRwHwb3wI7VZVsazccaIZvXTggZf/wqvC5hiD8=;
        b=HWXYWDmUTxZX6ePqjdQ0nwvJYSSQ8/ygiYYhtXVNX1sgM7htwSlLDDGrcwp3DfGntZ
         bF8KkEG5cM9D8+vWuHvK1HR9N5RCgc4DhOPMW5+PsQitD1lgU4W+Z6ReUba/D7/n0Fg0
         Ofmpm3pdPr1iHAj8VY8JU6AKWaUit+c9E/CFMzY/r59QQkj3kDBcAowkNM7++S4jF4Bl
         10hL+IV7f6PjQf8uGcwwejvJSZZuzXnoZaEFdqpQ2lU/ZmgYPPR1v/6tyDWQtybtq0/3
         rvNC0BxLncX1Zqp/16+fdC+RWrp/cWT89VQCi+mXkER+I6ZmRyI5tE4/RAdueAb/IHSp
         HAgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778700704; x=1779305504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=SXVDZBrywoEVYS9zbNFQRgV7Y423de6xOHM9fJD78DhK9lRQ0BmRDcs4lANBq16YbX
         bAEstwimAYxzFUP3ZBpXvtkRoB9DSMtUINxUZ66AYDX7V8rt2KntbCh2TfehS7/I78AX
         k4KPUMIUQw7Ka2/dBAcsFTaGG2OjwWC6SEJiIUgepqqUbgcXQP4A8oGGQjp+QStJ6bK9
         1+8PjGfgpRVHttfGFD8w4LphCgTA8F+vV0cYDDldfBi7TG9WSXCEFB2Dp7XC+NGLpDQk
         KaCfdpTmeBNk0XYDrUmaSEoLxc424Q0Rdf4zYFVE/1NnlqHnyu742hLSxh725Kl6juG2
         hD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700704; x=1779305504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=NZL4hBJx0A14ZKFssmfc59Hj9MkgNuJDS9sjQGhgGoqPPDxYF4sNx/rwZ7vyaLqUHq
         sAGJPQxUAp+kKLbBgWA3VZBaD/XWcd8uaiciaNA+wzZ8Gl4/g7vKZ+Zl9gMFEEH94P7p
         WmcUn3u7CZ5qZ1PUDFNaVA5AW0blUPiBnQoWGuVsOA6ndUaPZumIiC21RBjhfmxsP2JI
         B4CrIJNvhCL3sfrfQ0/2bYai+yAdmp2aQixzIP5rB+9rhZHEU0H3b7AvBPf+KSYve+hR
         dVVpnY/P8via/0qca7GOujoi9z40/PoK4y7ILnv3ysF+HSQ7I8e5kxHqOrYoEzO1UV+m
         Uymw==
X-Forwarded-Encrypted: i=1; AFNElJ9q79QWJSMJ6pEpmIxj7Nut01HAw0P+XBJqIZNnY9tFVYYE+LH7s+qlcQx6QVQST4Of2+dJHUxOXDrgqmXojg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCU3pJQB32KKVHXA9dEg8w1dN4JcpbA+NWu0fRhRTiEvXanFow
	G6DW1EKDuOZpu7Cfty/nHie36pvqDN0XH8HQsqyO66PoXkM0KUC7R+HPjB0VlZATwqWARTVTyal
	STLbg99HDi0Yq/HKyXkks2VWMoPUx/QI=
X-Gm-Gg: Acq92OEOMkjGcsZ7v8LMwz0CjbOTTM3o+YMUloyh9y1o+eJiGZ/YYYrjdZgvJMAzkPY
	uvzy2L0GLBHS5mlJUxIzyFSv1LXZlTs/MqtGGnXUSaZooqXPv7vp4O0I5M5oQS8NwmFP7+lGfcE
	zZEPovMc5A+0e0/2EW7bYu1uL4aA0Pgn3LQl5Rua7Z0H5rsTOYfdDg17G4JFGgyCoOrxy4309gf
	dcxlsEq21fx/SzSprME07k/3Sh5GJhySLD95GpGOkm/vCEl8ZDosp+H5WOGlnOta0q2UszQekyz
	6lNznGalnGQNn38m/kXy1z4HNTs7ZU0KHjLOFVis96CWAkkh/tMDvKHs+gCcF6K8YnOcDwVXqw=
	=
X-Received: by 2002:a05:690c:38b:b0:7bd:a50c:454c with SMTP id
 00721157ae682-7c6da2152a8mr42579647b3.19.1778700703738; Wed, 13 May 2026
 12:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
In-Reply-To: <agNJasayW8VCHTiU@e142607>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 13 May 2026 12:31:32 -0700
X-Gm-Features: AVHnY4JH8Ip_tVhSu6utyw5cZH7Mreif1YmCt2t2xjBKPcGuoTWdGxm_i0T-RLg
Message-ID: <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_123145_550019_73BF6CB8 
X-CRM114-Status: GOOD (  37.42  )
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

On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > On Tue, 12 May 2026 14:47:27 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >
> > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > >
> > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> > > > > > >                     return ret;
> > > > > > >     }
> > > > > > >
> > > > > > > +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> > > > > > > +   if (protected_heap_name && strlen(protected_heap_name)) {
> > > > > >
> > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail=
 is the
> > > > > > name is "" already?
> > > > >
> > > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > > This check prevents that.
> > > >
> > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > currently probe and boot the FW even though we never setup the
> > > > protected FW sections, so why should we defer the probe here? Can't=
 we
> > > > just retry the next time a group with the protected bit is created =
and
> > > > fail if we can find a protected heap?
> > >
> > > The problem we have with the current firmware is that it does a numbe=
r of setup steps at "boot"
> > > time only. One of the steps is preparing its internal structures for =
when it enters protected
> > > mode and it stores them in the buffer passed in at firmware loading. =
We cannot later run the
> > > process when we have a group with protected mode set.
> >
> > No, but we can force a full/slow reset and have that thing
> > re-initialized, can't we? I mean, that's basically what we do when a
> > fast reset fails: we re-initialize all the sections and reset again, at
> > which point the FW should start from a fresh state, and be able to
> > properly initialize the protected-related stuff if protected sections
> > are populated. Am I missing something?
>
> Right, we can do that. For some reason I keep associating the reset with =
the
> error handling and not with "normal" operations.
I kind of hope we end up with either

 - panthor knows the exact heap to use and fails with EPROBE_DEFER if
the heap is missing, or
 - panthor gets a dma-buf from userspace and does the full reset
   - userspace also needs to provide a dma-buf for each protected
group for the suspend buffer

than something in-between. The latter is more ad-hoc and basically
kicks the issue to the userspace.

For the former, expressing the relation in DT seems to be the best,
but only if possible :-). Otherwise, a kconfig option (instead of
module param) should be easier to work with.

Looking at the userspace implementation, can we also have an panthor
ioctl to return the heap to userspace? A dma-heap ioctl to query the
heap size is also lacking.


>
> Best regards,
> Liviu
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
>

