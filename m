Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D84CE8E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=; b=QotU16oyOD1Iq3iInMwIA/srde
	ZEn5rCr3PSw3i0ZdtjqwnxoL1qu/R4wV2bX7HzWtIJxXjnL+FDWzA3y/cXskfPFGx/BMZTSt3JbJH
	86yuPEXyaeJQOd1SxmBIjV/xSH2cjlZ22+X1IXxdazENafAAobDMKhnMk0qqeYIYhItkBcENKfO0d
	NZVCIdwQx96Wjk0xGlmSfMXEn4+SSeRuXubmpRK015EsPGyCB9syYhiII7LMZo7fVCJ7Mz5Meomrz
	58Q8QsrFu2ivlBZYAuuWHcE69BcMOixGkNOTY4UHMjHfZj39oO6D5ZGqmH9tuHFWJ6hM9Ggfkz0z7
	/1zI+68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t411c-00000001A5t-0Xaz;
	Thu, 24 Oct 2024 16:49:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40y7-000000018vb-3c20
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 16:45:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e93d551a3so839637b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729788351; x=1730393151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=kAmEBD32H4nk51HvIdrW0PaqB+CI41/mad8dzHciF50dDrihiFZFYDktN+yJkG7Z+C
         F/WYa0xp2SPvdX+42dn0rplsfV02+WiXakbS5gbdJ+dW2rgV0WKoVkGNr8u4knNmh5Dg
         oZpEOkli4U8xJXzCch8quoepD/n8x6Q2Xc2Zt37mcEUYZV1ZawxEhYcs7hWcFHFzKnYd
         Hmcd6hSFaAYNCAngNQaTzYfeORgV8XyBDz7jbn8dyVtVHsm85LvIF3owIgE8Mza5vNGy
         YyHBcOyN9HmXWmkyoP6RvVfRZYdk2/PPFPXX5Phx1kKC3C8upooILvNg3dCx6tCEIjhG
         Nqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788351; x=1730393151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=UlRO9JMGvyS0TbLpNndRC7zzmJGnQv7bxrPe8Dy8xiOVbaMdgJRsQSz0G9+WxfV7Wl
         o8e0Sptp/PxyA+T6E/aXlm7LqB9+fJ/X2h1QEdqYYMxvrFd9k2i/eA7W4hfBVOd0ZC+F
         Pk62Pjy6lzikl8DWZkeETHJeANfxE4x/ldLsZsDYo0U57Xr2MCZ0lzT0G4Flvi6QIr7/
         Xvwedb+QC1hQ/F9mjb0bZGL6ZT2qYXTPinL7Usg4bgSX+ZJUFDvsg/DXWU/Y9L0BReVs
         Y+h+bBxqihTTgbbP/YM+CsvCEEvOkk72OjXq1IppwM5Stgy7G4+p2UNjbzNiu/xDcgTC
         T7ug==
X-Forwarded-Encrypted: i=1; AJvYcCUDIZfExgTqCGGrUV2wzjWHc0dVXLCF77W9pArjXR44PzGS9Foa3bp8gU3YOwI83TwzMUA+Zpjxj34eHON1Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwygODM8zTGkh1D+CZWVNF5QcKalu3ySdQZC5erPhDwcFj4LeT0
	E7uw72s3lTi4ZxoQYwEIN0SjTaNJamammPV929F59Jzc9pHQGbW87TJUkb+6PsIysPigJVkQEz2
	jIWZL3eszCImovEyprc1mSZL/fQaqmTVy4DAr
X-Google-Smtp-Source: AGHT+IGyVGhrIax31DbYyaNPPps689qKUUGZ/dBmIonlf0Ms5Q31B+FIXf7PnrvX0k/Y2NDzzkEVUzrdywoXgv6bmrc=
X-Received: by 2002:a05:6a21:9d91:b0:1d7:1277:8d0f with SMTP id
 adf61e73a8af0-1d978bd6450mr8093124637.48.1729788350739; Thu, 24 Oct 2024
 09:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com> <2024102457-manager-counting-ff68@gregkh>
In-Reply-To: <2024102457-manager-counting-ff68@gregkh>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 24 Oct 2024 09:45:10 -0700
Message-ID: <CAGETcx_BD_G3oOHvT7aRr98Ag7-XvrMX=NW_wm9Cx9M5+qr-aw@mail.gmail.com>
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_094551_920816_84F4D4DD 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Oct 24, 2024 at 12:08=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> > Probably easiest for Greg to pull in these changes?
> >
> > PSA: Do not pull any of these patches into stable kernels. fw_devlink
> > had a lot of changes that landed in the last year. It's hard to ensure
> > cherry-picks have picked up all the dependencies correctly. If any of
> > these really need to get cherry-picked into stable kernels, cc me and
> > wait for my explicit Ack.
>
> You can do that with the correct tag in the commit as per the stable
> documentation if you really want to :)
>
> But why would these not be able to go backwards?  What changed to
> require them now and not be ok for older kernels?

Depending on how far back we go in terms of kernel version, it'd be a
bunch of cycle detection logic, deferred probe behavior change, etc.
And those patches might have other dependencies themselves, etc.

He's one example of such a breakage:
https://lore.kernel.org/all/20241024-fixup-5-15-v1-1-74d360bd3002@mediatek.=
com/

-Saravana

