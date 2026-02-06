Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B26EE20B6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Feb 2026 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=; b=x2YZUxnoYSonyFoMJUWhC4qvzZ
	1EDNJUUkpf/Po1DcRqdqislPyR9Mn9rbpxxWT3xv/I8bv24JlH0Iw9YcHXviK2UGWObMod6fLSjLH
	0ki0jEX/RWJ5arJxnp7R2aFf7WjucvlTvpyYi8TRCDM1x7bzIXS4QEopNNbaTqVaZITM4kpvbtjc6
	7CzAlhKIS9c0fB7mM0TruKahhpZGHzZaEAMhwzDv4Khgg2ApQjKM/3bJUjU50Kxj4BSiqKbD9gUHF
	yDxUUvDPDtczRdtBW9QIz07lnBc29khFYWDFuzBrQYRmVq4yj0f0nE+FS/qsDFStvpx8nAsNuj4jI
	+lzKjKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPAY-0000000BaxH-1S2z;
	Fri, 06 Feb 2026 16:58:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPAU-0000000Bawu-075U
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Feb 2026 16:58:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-481188b7760so17530635e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Feb 2026 08:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770397132; cv=none;
        d=google.com; s=arc-20240605;
        b=I1bzd86LxgiqOM3NuCaDyzJ1IZ9iWmy0/Abm/TOvvSTajq7vXUk2CPr3bqKx/JIqJ9
         L6QC0WZbZ81XcULg0kOIMvcbs6pMLVMQj8Mn+i08gx6q/seOdYIICMb0werDNHD+fizF
         8dwbOx6fCQFxK/cRorMD2eNJBPI+b35LgBGsRNMCLwEuhpXWqCgkWeFhwjQsD9NBelE8
         ddk6Ib3z5H567u3G9HAhfbh82i7DKN9soTuVg2X+CgU8OTC4lYbgusTnCqTnf/YJ3KMg
         h0J0/6GxMgqQCUBcLxfRcU2UTn/z9o2s3y0NFEi7OWIgeXi/YERTon9fr37kR6LN9nv0
         c3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        fh=k49FpJqqpmlMvWRsxnJ5Z984bhbseDWlJdHDMHaDk1U=;
        b=gMDOB79sJZEaVOqFWkx/ye/NiyHaD63VitVo5VICYuBgpJ3pGnsY3fKZxuNNCrakpA
         s0/mld2BZD2w40tv/Sb7Vq2XYrvJWM4u/yF76Yj7Dvo23jqbv84hsvFeWehLKTaq2xXX
         +JDntVElvKGkHyEy4GTAEcCjgxhunkHZvlGj63rTzxf2DK8J6QzEKdyRf2SUlc7ofe+A
         i+V7kRQWvQW4oTG0Rbuf3FWXbsC4ZCJ2PEjlnMcjjh9Wb6laiw/VBEe5YnV+H0ZqLamZ
         hmraMr3yiq3HQMqvpFoi3NbBGw+EI/u5BTrx20bfma0dAt77uwnhXMOIKLKd4N1eZfrD
         L7vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770397132; x=1771001932; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        b=PMkFEIdZX1tgUDrsWkWIDMn6CjbmEElV5UrclRvfoD4eURuH0nB8OQOFbS3MpRqHAA
         EC74DiUBJqMgO+4akRQ5WS9OHcmnkHgNJiFt5QX3d/Vz5kr+Ve3wA7WF15AU0hp+WgYF
         PHRI1/7h1JeYb1rG5g1XU6BvYGD05FK5i7lNDgJ9ShlsYvm9Hv6j/6lHyShAtC3G0k0k
         fmUwP/i3R2yM6y2KbT0+vHOf1mROyN0I2YDBpjWcfPpJMvwWfKy9o2Gk18fY7LGImAgN
         /EgGLblrJpXSO4r5bdRTTBl9P0OZ8hxKj5NQzFRiBnDBXyiTz2vs6st+YvVXTqDsSJe9
         1rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770397132; x=1771001932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        b=fx4MsrBP8ZXy6uUcwE9u7Q2/vgIoDoka/CgbUFS6lm5UBYLqLS8SZjUH2S/sJI0Efl
         t5fk7HVmeaofJ8cEnQhLSpFR4VkOL3KBSy3cGVT0Cy29QX4hjlgNlci0fq6euDK2HhCq
         6cjM+dw5uFrvGq6ey2mdGO48O1cN63rkRLZ6X78Q7bctWg/+yDRkd9UYbIGYFAlHuzqG
         H0mSc2agZ/jmlo727ix6XzHHZ3nMaHFDzSo4zRZME1SYuUK7nXj7rtthu6ikxMLRCzfZ
         AqWmJtbwBSmAdBGAUj+M5dUgq1nGul9pAK67RcU/jcIKMmYiUwXO1JOBRSBm8uW5P/yz
         Ai4w==
X-Forwarded-Encrypted: i=1; AJvYcCWH1I1wqmeYFIefjKulQ3Bz8VLboiyMKi++QwYs/f0Xkk3MoTdFQM2kVeXUs9OVHJN5/44g5A9+oTXC49AegQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVy9dmvpgskQEBT8a8nYO4kGQDsxcXNOnelUSppWWunoLGHT0v
	Z9v8AJYTowzjBZl+gmha02kZ64QgfhqBTGkfXJc8hDtT+zwOWjronNnnCaLB4a8m2HSuuUs7/9G
	IfUzmpbCzSWFLz7mXVY6HSnb3WUW5Yzg=
X-Gm-Gg: AZuq6aJfydt5Ut/ByXg5LSFv4Xg3uGsjSHaldY0lXdqrTM/VBcjzZVK3Ypv9hdKS9l+
	josfyOr6eDHO6GPaNHSJgiVkI7TTmEL6GRLcOG/Sf/VMOHyao8AqFt4ME7qLVMD1ugBLryEMz6D
	gTXT6sFlOXQZRUk0ZdEZf9H4rhRoANEVYuRDatQi8vXLAGI52uOcCaVzaVsavNhjf2kyRDyH8mk
	AM1AiyS0eICNjhCyN+yz+NMsMF6F16up1vV1lSkQzmVdcvuk2ttbuinA5hhym1AAod3kybN
X-Received: by 2002:a05:600c:19d1:b0:477:9a28:b09a with SMTP id
 5b1f17b1804b1-483208b9470mr43758935e9.0.1770397131636; Fri, 06 Feb 2026
 08:58:51 -0800 (PST)
MIME-Version: 1.0
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com> <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
In-Reply-To: <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
From: Denis Gessert <denisgessert@gmail.com>
Date: Fri, 6 Feb 2026 17:58:39 +0100
X-Gm-Features: AZwV_QgNCppAnl3lb89V9TBwVA6S5u-NVBJN7ILzPpKGv0R-o4J6O7rbHQT_tuA
Message-ID: <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	Evans Jahja <evansjahja13@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_085854_300999_17083104 
X-CRM114-Status: GOOD (  15.90  )
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

Thanks for the quick response. I compiled 6.18.9 with this patch
(without reverting the previous commit) and it boots successfully.

Cheers,
Denis

Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
<regressions@leemhuis.info>:
>
> On 2/6/26 12:33, Denis Gessert wrote:
> >
> > I found this email chain while troubleshooting why my Levovo Duet
> > (with the MT8183 chip) would not boot using any 6.18.* kernel.
> >
> > I can confirm that on my device the current stable 6.18.8 does not
> > boot unless I revert the commit
> >
> > commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> > Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Date:   Thu Jul 24 10:39:08 2025 +0200
> >
> >     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
> >
> > mentioned below. With the reverted commit the device boots as intended.
>
> There is a fix for it from Otto here that I guess should help
> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/
>
> Side note: lacks a stable tag and maybe should have been merged this
> cycle instead of the next. But given that 6.19 is immanent it might be
> good if this could be backported to 6.19.y once it landed in mainline.
>
> > PS: Apologies for the potential double-mail.
> No worries, happens.
>
> Ciao, Thortsten

