Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8358C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 22:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=; b=os7Q/i200OA0Vj2kKpy+BcLunr
	Dbw69sCTi032Nm5/AcXbhs72urDN0JSxeE0gab8Bn7tKQ7FqjT51VCTSdj6uNbMpbkaNdIQkSMhMb
	1ugZJG1bCy8/AijUgD/HR9BX0K6Z9pCQgEP86exV7AHILNQwbbuy1N7j6F8H3CVcUsk1L4QtVpGjA
	u5kpR/RdUYYra2wNi44BdRN4dkSPhM7oY2jrMg6xQ3Xl6sKeZHSlApAmpbApDviPvX7RSEzwlFm30
	0uFs8m4VTckY26n6rEUyL62fG9g3GoW3au1j+Sv0etMYHeGMVGxT96DwImS2NMyUx0zY02Ij1MjSL
	EbiFaQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVIk2-00000005eg9-0o0v;
	Wed, 31 Jan 2024 22:07:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVIjz-00000005eer-0Lpe
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 22:07:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40ef9382752so17565e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706738847; x=1707343647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
        b=gBQk+weor15aZTvWSXmmdpfNxh0NrisXdnqy5Vwp+Ny9HLt5Z8K/xGgdUGO+FTeDIS
         Zi04/ZlmIOTNIE7cgFlWvHEs7NDzGXgWsN87zgNFszrBU4shHcRz07vnucp+cimL5I9N
         0whbit6DPiW5NnB5vyQ2r+NVVey1BapueTuQRn6M5I0wBSHn7EjEknvMJx4p0fO5vLCm
         riBgMZ1u2BiNNe6a1oFLW3sM2HkQl0eR3dTwTmbnjZwD/lBMGV30xNSTr2VGSW670wRt
         Xb1lvc+OiBlwHosSEbD/LaivUs8gCyKB5i1oh6qMWao0iEmFNcdjNHWudtLLHX0vNkgJ
         W1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706738847; x=1707343647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
        b=LqJ5W7JnNuM7uhz3t5yrqe+mkwzxbBkf+XEnHcwhqOdIcdEje7NMNPlQgXd2or7q8C
         Gf65ho0WHbwyTum/eaO2rn7PiJwx0SgG1HjWlvf3Tdeish4OvlxvGOCLJxCLn0V5VIBc
         TZCT+VRYqpmSgOFz8wWWuFdgO/hSH2z9qpZx6SL777pjAwfs/Pp+KWhB4jbzcWi/fuXz
         AgqZ0DpRupaTYv6/9BBe0QKLUOGfubAmhKlIaLT0zQbITz+Kg6sgFSKcto5ALl7VR5rW
         HhAXryPcFS8aOSg5nrXPTPs5tsHjoC/3/phaadiBq4L/6AfA8c1y0tB4L9iXhF8sVAYu
         j/SQ==
X-Gm-Message-State: AOJu0YwgRx0w1RC2yYy1TtW0g/bDCDUr4hDw2+0m6J6lbcGvwHoWrKRt
	9gPaJHhrOD+o6caC2kjEQm0bpQ2WnOzCoqJ6H8yIqEiCZ/khsdhmqcHY9OgzaD7vwcKGMLDZj8g
	dF0vJUJrgbqGLrx/7wMPWfikUBtXAeW6WMK8=
X-Google-Smtp-Source: AGHT+IE/2Dxf4agbwoKTbMQd8Mnstjn4gRLtOYMhgr/arfVgtxcTfa+Kk1PDbnEzzrNLU0B/ZV7z7fa+Npsy3Ek/Uvk=
X-Received: by 2002:a05:600c:5026:b0:40e:e7ce:da68 with SMTP id
 n38-20020a05600c502600b0040ee7ceda68mr66122wmr.0.1706738846818; Wed, 31 Jan
 2024 14:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
 <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
 <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com> <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
In-Reply-To: <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
From: John Stultz <jstultz@google.com>
Date: Wed, 31 Jan 2024 14:07:13 -0800
Message-ID: <CANDhNCqKPmo-RUd6RRRS2=ZJHqyy40G9HE=6_cAyop1CN2xOgw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Joakim Bech <joakim.bech@linaro.org>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_140731_150430_F1390A1C 
X-CRM114-Status: GOOD (  29.84  )
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

On Wed, Jan 31, 2024 at 6:15=E2=80=AFAM Joakim Bech <joakim.bech@linaro.org=
> wrote:
> On Fri, Jan 12, 2024 at 05:23:07PM -0800, John Stultz wrote:
> > So we need some clarity in what "restricted" really means.  For
> > instance, it being not cpu mappable vs other potential variations like
> > being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
> > only mappable between a set of 3 devices (Which 3 devices?! How can we
> > tell?).
> >
> Can we flip things around? I.e., instead of saying which devices are
> allowed to use the restricted buffer, can we instead say where it's not
> allowed to be used? My view has been that by default the contents of the
> types of buffers where talking about here is only accessible to things
> running on the secure side, i.e, typically S-EL3, S-EL1 and a specific
> Trusted Application running in S-EL0. I guess that serves as some kind
> of baseline.

? This seems like you're suggesting enumerating badness? I'm not sure
I understand the benefit of that.

> From there, things turns to a more dynamic nature, where firewalls etc,
> can be configured to give access to various IPs, blocks and runtimes.
>
> I understand that it's nice to be able to know all this from the Linux
> kernel point of view, but does it have to be aware of this? What's the
> major drawback if Linux doesn't know about it?

Indeed, it doesn't necessarily. The idea with DMABUF heaps is it
provides a name to abstract/wrap a type of constraint. So you can then
allocate buffers that satisfy that constraint.

Admittedly the downside with DMABUF heaps is that it has a bit of a
gap in the abstraction in that we don't have a mapping of device
constraints, so in Android gralloc provides a device specific
usage/pipeline -> heap mapping.
(Note: This I don't think is very problematic - I often use the
example of fstab as device-specific config everyone is comfortable
with - but I know folks would like to have something more generic)

I believe Christian has previously proposed to have the devices
provide something like symlinks from their sysfs  nodes to the heaps
the device supports, which is an interesting idea to mostly close that
issue. Applications could then scan the devices in a pipeline and find
the type they all support, and the specific names wouldn't matter.

However, I'd expect the same hardware pipeline might support both
restricted and unrestricted playback, so there would need to be some
way to differentiate for the use case, so I'm not sure you can get
away from some heap name to functionality mapping.

My main concern with this patch series is that it seems to want to
bundle all the different types of "restricted" buffers that might be
possible under a single "restricted" heap name.

Since we likely have devices with different security domains, thus
different types of restrictions. So we may need to be able to
differentiate between "secure video playback" uses and "protected
device firmware" uses on the same machine. Thus, I'm not sure it's a
good idea to bundle all of these under the same heap name.

thanks
-john

