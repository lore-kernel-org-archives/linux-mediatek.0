Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C7C47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 21:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=; b=jG41ZvihgDq3DwgezbuDmjan6T
	aDLaoVJfCwP5eZEzt0jTbPu6R/nFjdwgiFcuQVH6w1FZzcxYqaomej1nbrPnGqEU7vB9xjWHE6q4f
	V6UzXNNObNZaOKET5VytW3H4pV03Xm2DIu0MiNxsghiYgoSowychU/YWNYOwjmrXSRDU4y/pVKWxe
	jMPmbSTTZRt2QP4I2wAYnPRzH5508XXGXCMX5n+qFz3G/j+IDyMc14IUpO217Rgh9SiwCgTeiCsZ+
	QTjiId1NIvy6NWbYJYeix9C0A0UwwS6Wl1g2R0u6jRDcjz6BynvvQTsjBcW1nt+8EBSXiUTX5BWFx
	jCn4+JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3kBN-004wgZ-1R;
	Thu, 16 Nov 2023 21:45:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3hsN-004TMw-0u;
	Thu, 16 Nov 2023 19:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=; b=FUhIg9yIYCuWD2oJWwlUe1AczX
	p2GaRGjrj5bFdN+O6L92I6SDQeKJ2RofU7LOkpgLY7DTu1BU0hzqJDqIMC4CgOl/SQ2+NT5v3rLfV
	2acmUJj14WYtS8La937u6jpiIUsICNdJLrY2Lrj6Ligj1hoiWe2CTkQRYJhjI+mXH0ghm8LIt5W/P
	qakZuQYyDLkjshFMLjUovtDCyL75umN3HVx9Qw619g6sYmHxtuqhCOcp8/2sxENJd/OIZpgHga8Co
	9jQ7BUtge4XbaoAzceLDesR+/X2mjeo5VIXv7ZSZZlWZqEcdwKYO66OyGxNKNIQdihMHZGxMZgolX
	lccjGDhQ==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3hsK-005mnM-0r;
	Thu, 16 Nov 2023 19:18:06 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce2de8da87so640994a34.1;
        Thu, 16 Nov 2023 11:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162280; x=1700767080; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=XPHaBzY8jKiST+kjpmv18nYur8mYqOSmNA1aZEOW7QJ9CmkeI1pw9zygXvb8LmGr6j
         +kPGP8EY8jbddDw/RKGQPteJS0wsS31wNibiaOPXkqcBtORAJRmUYo0QpLlZewuV8MnL
         c8ikyJtjBsW8uOgBTMoaOH9iFeRVSlbntH1ovG41q3/xAPxfO5J8smJ179NbMzVJeHC2
         wB4evOr2nCumMW6mNfk99+bpjSzzXaIK3V1I3Bm1CHb/WTGzhhNYfZHdzJy88LSBDZLk
         Uqeo9jcbXP2sGN/PY2R432LEiqLV8w2t4qXKUX0MZirXUmyI/B/gQoO+vFuQVUUfwn3n
         sLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162280; x=1700767080;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=dvuBGRajrOpRRPQVubtsTI1OZmuNzXCZU/ahxQ0FI5+vuBk6+8DZFg9JJctt6ksXn/
         vQNT/jzoHSH4COaOxN1iJh6u3cA7MrIoIkA2HpP0JVRHg7ief+bFE4WD/21Urr/7bGzx
         xArCGGC3jv0t4YLHfxK/gDpVtJP5U4O8XTsX4aPn17Ez9EwFRekoVRq+hH9trS+RJEtP
         KuVxCYo7e0Q3JvhC4HoGKc0h3VSiPcGwwtDaw79tlh36VXGQ6+guROT8ogkUqqlKH4bR
         nu1wDJIFQ6pejeph+yAPyoH5nnDAjqnBdnbsuD9x/kZ8YDpb6HgAgfQ/SgYI0MyYSL+a
         wDzA==
X-Gm-Message-State: AOJu0YyQwjoIV+rH0PbgA9O3/5+QhL7l4DAHcNYxpisEgoCtLd+4FDk5
	lM7KuCKbyo0vVG9XvW+XHoTDcLtMQLcSmTSMvDY=
X-Google-Smtp-Source: AGHT+IFchzrhEbVbz5AEifNKluJrx6zIDMG5gc5BfPiF7RMJY6+/+9azNscfVMvB74Y03sWBedUaDVz9bS5Uf4oPXtE=
X-Received: by 2002:a05:6871:2312:b0:1e9:cb7f:2287 with SMTP id
 sf18-20020a056871231200b001e9cb7f2287mr21389323oab.46.1700162279900; Thu, 16
 Nov 2023 11:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com> <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com> <ZVKNIn1eSlZ9yzco@shikoro>
In-Reply-To: <ZVKNIn1eSlZ9yzco@shikoro>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:17:48 -0500
Message-ID: <CADnq5_NgzZ+1FTzZObivnjJbbuYcafY-fbvgiGA9ryqA9wYedg@mail.gmail.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
To: Wolfram Sang <wsa@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-fbdev@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_191804_373588_1FF05D5B 
X-CRM114-Status: GOOD (  12.14  )
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

On Mon, Nov 13, 2023 at 3:55=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > We're not in a hurry. It's just my experience with patch series' affect=
ing
> > multiple subsystems that typically the decision was to apply the full
> > series via one tree. Also to avoid inquires from maintainers like:
> > Shall I take it or are you going to take it?
> > Of course there may be different opinions. Please advise.
>
> Ok, then this turns out to be a negotation thing between the drm/fbdev
> maintainers and me. I *can* take all the patches, of course. But since
> the number of patches touching the non-i2c subsystems is high, I'd like
> to hear their preference, too.
>

I don't have a preference if you would prefer to take these via i2c.

Alex

