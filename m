Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C74CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=; b=NSVQFXfXUHfyaKqTLI4k0cWPK/
	5edkTPkBmR++YS4YK1rzbJ4qQgvlJvfoDe5qwVVX4FRr5nD3CaB8yCtAIsnEXYA9mxsAqDLfLnDEQ
	T2rrlW4zNILsIjLc6XnVT6IRKpuVPiflY9lCM4HuVQHtf5asWpLTQ5KS+XhuQbHNyiCK8Mw1k0Wrq
	LWhx1eFY2fIxCWB9bmNvTGlfsR28IcwhFSulhzbZJv8XLXEO++NMj/B1LcGOOdTBZiWhaxis0mVV2
	gNK+YJGUxwfyb8HkshbkrHs0PsUvgDXra7Y3k9iUX6/P3KS+e2szK/MEN4qbgkbs9D5AwwL6XpZib
	Ev9RLUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxw0-0000000Ae1c-3c4d;
	Fri, 12 Jun 2026 09:12:16 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxvx-0000000Ae06-2P1m
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 09:12:15 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7de68222e96so5794347b3.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 02:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255532; cv=none;
        d=google.com; s=arc-20240605;
        b=V8FjUeMQnxdkkkxtl5T2WHQ8vETt4scd0W/rNQrvOGmmMqI4/i5H1g5QygwgPDk7rU
         A/Ts0WZf+PjLph7aSJCizbFdhE2Wv1WrMezxZgAm0u69Bxx78xca8G4IV71dGf6c+gnZ
         k9ixEB+QOSblokG+IY2GJJs4bg+QMvzXcg10MEEfFvjBFiLEH5jslBapqAPaXTbrnO+8
         7y6377hygovXcyapp3tJbsYPcAlZc34zLbKyX1AnZeDNlMcrGi8GoaXeVP0C6I85Yi+E
         BbBBgkqmUvjU4EDxaxNVhIcCtbZh3W70I7nIY7ToSSGr4JeLWrbE5AwtGiL7oaPEOTCe
         S7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        fh=Ok6rKBPQmbAeyt6FLZm5YeyyBsclZPt3gMr8AnKudb0=;
        b=XRZwE3bylimd1XILIe6En/k7kSSku/zonoAk5flpqh7esMm+Xt1DrnieK/pe5ZXqZv
         tNUKofe35Q02ictWHRrZIRP1whNZoQyj4xpWPz5j2DlxE7cOwRrheU14b7yJSKAtNAGi
         9O4cd39cpcZ5D+C77Mxt3waaBDHs/Ghtm02n1xB45+evyQ4WdIjnnv2Kc54BSbsAJV5T
         X/+9xV/pTjiY3jU8Os/+Vu59VM6IkZk8cLhmfkAYK+dIjLWyphQM9kyEOaXumgaPtgJl
         WvlShoe12oHCaWyruD4NdbTZFre0pHwci0xyitHi89XWFKhwXo5sB9vlp6vPvakrqQ8g
         Ydmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255532; x=1781860332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=J6gots6bxF9OilbYTIHEFj0/xm6+hXVh4z/gBonxj0sYcsjQYpYvhxWptaYv8ao3uq
         ibVMWkQzA7xXw04kRrL2JTGSJV4szK7CqUXYnsY5oRXqL6n3x3LIHfiMuUcebVDCI5kZ
         KJGLfYygkSvhrfzvmC9jc0fS/FpW/JchkzFyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255532; x=1781860332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=bsoVGmpa1BU4l4IPd6Wz3sBfmonslNT9hBqhgM3spqXsnDmvSwXTOq1x3V/YbUnObH
         OoNHMFxLNszXFwrIXKCtUv0lBjsCNPBa2VsAmcunB0qZsStldkX39+KF6oaZqtRXo4RD
         lzsugolxWLAiKdtWc5WoOizliPFEjwa/P5jqUYnAiD1Gm0T60BWDhVmdDr5LJ3U22E53
         O8HpEps74ttkeFtYUVO5u0FZj39cb31VFVX009cHoic6jFt3n6ZxxtudG7VbyoP+dbh3
         Fa2S2uUCLO5FqHDUNrT/AkUhaKYtfNZqUVCOG+NAg1vUiMYsa+rYHDFSQ9C71AmuxaoR
         hX0g==
X-Forwarded-Encrypted: i=1; AFNElJ+vNmc6fpzfkDFrS+tnK+LCANRjNiXUMkHH1YXtxCl4yXeeNmzFkH06qFPN3WU+d3Xc7DYJaKMKFVijCPmgAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQlOOvGfI7+lPThGmH/CBqso+ZSHd8XcP3nWFicEqT+XXuPz6j
	jFwQOND/94oKdvKPTN/X2nd+vhEMsTJemhX8hQOtehjSGqMb7NJK/2uaMcngl2E/KGmIMuMHNVB
	emT2Frly6f3quM8Auk+Ks3vhF9I1m8xQoRJUcUDdq
X-Gm-Gg: Acq92OFRuGJ1T/Rf/ahrYtSmxkN8g5lCfdXhwTXv7GBfwwVqeDvDJ1MxzaVVJSysMeJ
	Slg1iXRi2cX916zOZdaaXW7nById8zLDSFKBsszWwbWRzTmrWC57GtX9kV/wxpGuL2SFlsgGsE4
	+/asNu76x08D3zLkL3FLLf4XiGtlVQRobgJLA/Nz8A4JXh+uzNdmRXyDHKA+JQepFW7fcpHfowo
	8sFjg7qaNSWxRtyjDBBRchNGZJFezH1vxjwPYq5gZF8Xaot+COdPaQYcgrct/z5eDlOrlZo5A4y
	VKylLogD
X-Received: by 2002:a05:690c:f0a:b0:7ef:d039:a334 with SMTP id
 00721157ae682-7f7bcf0d73cmr16871217b3.22.1781255532401; Fri, 12 Jun 2026
 02:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-11-wenst@chromium.org>
 <ail1sAxgh5Xtkj2y@ashevche-desk.local>
In-Reply-To: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:12:01 +0900
X-Gm-Features: AVVi8Cc47lUt9lrnuGQ2TayhjSsjO0Ufug4-8BS--usEeOHUYmKa3VTCiJvbq60
Message-ID: <CAGXv+5Fkp9R3i+WnCunbydJpn_rjxX5Cz9Cb=auS-cR1RE=R8g@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021213_648428_8F4AF2D2 
X-CRM114-Status: GOOD (  14.03  )
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

On Wed, Jun 10, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> > A USB hub can have multiple ports, and this driver needs to
> > differentiate which port is being matched to. The USB hub driver now
> > associates the "port" node with the usb_port device, so here we can
> > use the remote "port" node to check for a match. Then fall back to
> > the remote device node for the other connection types.
>
> ...
>
> > +             if (remote_port && remote_port =3D=3D dev_of_node(dev))
> > +                     return PWRSEQ_MATCH_OK;
> >               if (remote && (remote =3D=3D dev_of_node(dev)))
> >                       return PWRSEQ_MATCH_OK;
>
> We have device_match_of_node() IIRC the name of that API.

Ack. Will also replace the existing instance.

