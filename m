Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DD8D0C5F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=; b=JBtqwmUP+9d7Gbj6XH3FGlUWfX
	KIhUmpc1gFS3f/3CW9hII16gBsh9KbeztkpcL04+thPCxzPmtuV6nD4KIZtMKI5avmHPGVq5O32VK
	o5MLNYd6xlwidVzkeRCFKJP3EBAFpidaPP13IVPK7RiFdnTZ8iTNkCp63PrnGd+o7oOMybsvs4+vW
	E/259r5z3ASB+tBQENoymH5GaFLbPVABcsExfXcb69AAeHNKKtk/cOwfk+03s+MQjO+KMbc991h3g
	tlGo/YpG7bzWaeOd5PVhjdWFy3eBd7v0yKR7nIct5I1WvL86/x7UsSUAT5IL1tbM0hUZhjn0kwYKI
	Ti2YwwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H3L-00000003GfV-3iNi;
	Fri, 25 Oct 2024 09:56:19 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H1y-00000003GQi-0bq5
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 09:54:56 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6e2e3e4f65dso21271567b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850093; x=1730454893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=OhbVisnZk32nWGEZa6oOboKi3liszE3ZhvomKiLWltBTK/IqDm0vnFKFjHc6/qtjQq
         D30BHBTRfeEME6Bg6ahQEHAzvNYbqyfLIim67/tcrujqUuazEOwa3d0N9p2cslltQjqV
         79EIu5s7V1QbOFKlJar4iCEway0WKkpIpazCT8rOzU/HsLZ2dGs0vogyGbngvl4Jbo69
         UIg1e0d7CdTh5Uw2QhbhuYfaVfFMhHDPqKH8uQHCROGG1aJr3/YFGlqvatppiXPe4PJr
         pELxu8CfieO+1X4s91G0NmImIL518gmToDW9Hrn+iqQ4HW7hmEYJxXvqzIXNBNNj0NkA
         92NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850093; x=1730454893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=cY4g2E9gHHzvF9fi/amFi0HnhZC9weF82me7zLPyvvuhMozBKQrY+qU8R+6BKQv83f
         LNkAahgb7giYP+W+2l6XyqFcEwrwn1dE8aGNBbaQZ2vtmVl+v0IUc3eI93OXEfssqvdM
         3UCEX+PtCFFm3+23AB+Y0eML6/jeFRo3z8VDx67/SjSVn/bGq4dZR4XLPA7CIsSjgy3N
         3Kfy0WWUyfQOzqCs79tOnKIX3j1PkEF3EVmvNE4wERgpcWxVQ5+JrheRd4yx4b39P9WX
         kOgqpj4RyJqtNcM8FYKmw82QgLmjzmmCspOrT+g3j1mLh/Nb8cUYUSz+8fia5Xfr5k+T
         4lSg==
X-Forwarded-Encrypted: i=1; AJvYcCWGj3nRwaLzBZUDw0zyee6lARmPYoN4NRlDOHyaSgp1mKMZt3i3VP4K+8SrDHuB0MKUr2XFM7wOow2cwnTxvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGd8lKk94luYi7TJCZ4FV7WIXxXYcmRmHMhOQXvlTsE5xRvW0c
	cS/40NIkTduBmkRSDJ9BAcUChDs95O0HckT3iIYC/5yAyhhecEpG5zly+of1BtaTf0M3cxkb37O
	kYAfVVJM5F3jgg4DQJAAdek5H/X0tLj7Ga3LkxQ==
X-Google-Smtp-Source: AGHT+IFZu/LyAjfpwX5MrN+JVkr0x0xSzSrKk0A5Mdi5tj38z9PJE4G47Yh4NVVkEqgziX0kL7VNUYJrsxipC6JS6p4=
X-Received: by 2002:a05:690c:fc7:b0:6e7:fb87:7094 with SMTP id
 00721157ae682-6e85814d77fmr57343097b3.6.1729850092872; Fri, 25 Oct 2024
 02:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com> <ZxtMz8JP3DbzpMew@intel.com>
In-Reply-To: <ZxtMz8JP3DbzpMew@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 12:54:42 +0300
Message-ID: <CAA8EJprT=BGyMnvkjS4BkRqar1hHn_hpXFaz9gstPL_9u1rAsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>, freedreno@lists.freedesktop.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Karol Herbst <kherbst@redhat.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.orga, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Marijn Suijten <marijn.suijten@somainline.org>, nouveau@lists.freedesktop.org, 
	nouveau@lists.freedesktop.orga, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>, 
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Zack Rusin <zack.rusin@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025454_246987_24F36928 
X-CRM114-Status: GOOD (  22.07  )
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

On Fri, 25 Oct 2024 at 10:46, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Oct 02, 2024 at 09:21:58PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > An attempt to hide the drm_plane/crtc legacy state better.
> >
> > This also highlights the fact that a lot of supposedly
> > atomic drivers are poking around in the legacy crtc state,
> > which is rather questionable. For planes we did force the
> > legacy state to NULL already to force drivers to behave.
> > But even then it seems capable of confusing people with
> > its high profile location directly under drm_plane.
> >
> > This might end up as some kind of conflict
> > galore, but the alternative would involve trying
> > to wean the atomic drivers off one by one,
> > which would probably take forever. At least with
> > this the issue becomes visible and shouldn't be
> > forgotten as easily.
>
> Ping, anyone have thoughts on this? I'd like to get something
> like this in at some point to make the legacy state (ab)users
> easily visible...

I think that's a good idea. I hope to find a time slot and check the
(ab)using of legacy state in drm/msm driver.

>
> >
> > The cc list was getting way out of hand, so I had
> > to trim it a bit. Hopefully I didn't chop off too
> > many names...



--=20
With best wishes
Dmitry

