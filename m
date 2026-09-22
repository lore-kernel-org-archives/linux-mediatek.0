Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69612C982FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 13:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=; b=sRJk6ciIkW/kFek4rdNSDSTpVO
	SvQra6OZRxJTZvnlutdk/bEQU4dYJ1+NvWmtq6LRLPyjGM2/Hm3X0yyeg1e4jnIE6EjgxIvl6zjQ3
	SIDQOzV4FInerN/uK4JnSqB2J6fp+CF1eDUVO92J8ZPUFDcAFL4rOjwCDGawPqVvXDlnxC8HP3ULe
	QzU7f7lCKDLVUdbMp99xZoNND+qP0VGCG8Xd83FXgIXhPwHGrgxCHZklD4ucMpLZGIQm8I6XNspSu
	Hq2/Y2u1UVh6MNq0Aft+o3VtWOlmwHRLEpU+JBU4fWcMCpOC62ZjKjXlwkgz35sKTn7W/VYN7x6fC
	8oVgrweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90W8-00000005VtF-0qfW;
	Tue, 22 Sep 2026 13:26:40 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90W6-00000005VsX-0yYr
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 13:26:39 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c29440ee0e7so280769766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083596; cv=none;
        d=google.com; s=arc-20260327;
        b=R/TprBeSC8XWiNIxHlybF1/0//4ZAHx06fzWgM6jCp31eG1xywqjn8NN5JhQiLXF5f
         MAnuirqwLDDh1/NoKnXvc3UUwxwXV/ju5We3aIIH8klZycoNT1rJQsem3w5yEnaHdktC
         UOUDG3DYUDNao6wGr0cU0ZY0TZq6nX/daDHHPDqqxLdm/RGkhgCqiw5NUCgxvG7TILBA
         P961c/7o5xLWLBE96sTtlElvgCrG+49phi9bF2RjZ9vAKcEdMkzc0yC/jQRx2teT3LYU
         0vNM1ya6d3rhGsm7Ty/sFdFOlR6JYfzsduzoXq0ul4FT+aZLsbfEMQGdYwuc4FPrrllw
         KbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        fh=vy+4+XrauinimdENN9YDyJ1UVzFanPcUXmwgkbYOW0E=;
        b=QXxZd/G7VZOHsqlc2RAxLbawXI4PCJynA9R7uP7UWFW5b0I/8BnxrgjISF95bcZpRR
         jwEmDCMr9CM/vhInm1qR3ZUFkixGanCmXDJPYeWOlhBTdCd09X+T60Y4ffvCJPDMMf+H
         vYibpLG6mibVZuaTR8tPUnqxPx/4azIEFscPooDJ4mEPX5Qa+crXhCGfd7MEuUrHEG3K
         /fNB/vx2PY9liTadW7BskEJKa+yPV1MXftrNgHjBy1PxDOoMWFdezfkWUi40zWSNEpT5
         xtR15CcoSjlHD8G+NSHf12fdi8g7DqCdqyK7NJ8if8+9oVviclUCKIvf2UfbJ1wYNCPT
         7uJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083596; x=1790688396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=QxR2Jg6sC+NJw97vsTDMB4QK94JLweFSKuI+aPPpQi8f2H+QrWBEnnN0TVGy0lS1yf
         RNEWNpFyh/K3BhmWnXvFFBSdiQKmXLbkG3EEw4inJ4pNKfbip+tyHe1zWZsG6an9zo60
         cPz/Sl4Enc001Hh59MCDxeGnAbEfUsP2dDXeeMs8YX25JJV6f5HntSAqkielhZV0Mb+n
         CTp6KnuiRb1rY4QNu8YgBDA6NCBghV9OvmzVup0Aey0q+UyNhFZuGuSOP/aV7oznZyo3
         tVdsttnMnckGHFW5W/aPnRtIxa76o3iIXH7Mji9oKuh9H0SdoitTwyAVx3tkrENWc/rX
         R+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083596; x=1790688396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=QTSi+UmngBNejfhh+oArhJKgua5VOaS0rEIEwslZnPgVfCjIbtZ6kh6Yr9Qz/oyr5W
         /YPEN+YmgV9UIXk26989RABW0QcQfeqVuTOtVmuk8alzosi18lYGeR96ox/fe6V+b1rG
         U9e+4T7JpGXxkbOXcZ78GpM8OUXQ1FtdVW1sh0Thcav1KipRSUUolg66UckMNPNIwukW
         qfrXBT0VcFYu2RsR30bulncjKQCQqE6GqlJK8j51k+jz+gAbBRwkg/YQRkf1JnfQ7pLR
         hz6Wa9tk8U3mSQ8VF91dR6+eD9BZuOm6NJh4YFahbfk8xdOij/qJNmQkj+TXjicIQz87
         1eQA==
X-Forwarded-Encrypted: i=1; AKwUvBzqIFGLnMMw0d9//AEBnJM7wU7TO1OfwS597CZBAcbG4FEgjMGWj6c6qk1f8VDSrv2xCHY9BGczPTFIpnNZIQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l5WKW1skLd1ZGa4zvHwOqs9cWGvtPvC4R5LI9A8DKrYVh3F5GT
	OOWpK00C+68fVk7cldcvQiOFOUoAoHSvNpL3VBfFRzFmBY0fzoKen8GNfVLYpsEqhN/K4hNiZCz
	uBQ5VdYbIpDy+3aKB4BQMVB93D6+Dwgc=
X-Gm-Gg: AYBFou1y2f+HE722PUl9wkX7E5HEykeq3qpLgKf0UMw3SwRkQrZCBD/cHWl0je31Fxk
	eLguLwhhCwqX63Hvn6iJNWI+Tvu4m5B98UxCJyBMeJUyJxVMIMCAwOBUE+teQwUbDXlbyo98+Ki
	o/x4gKHPCnXH6qsy5G6vpvYKRCnQOtKI37SxDPtF09VwDwSjSFsEz6lwNz9VLG78O+c8JXzS6UV
	ky3RgxkUFF3+UNTFuPanEZVWaIckY0Oav8BQqZ+7jIutiX/U9EuAArh/tDj90SWpTqHfw2oCTx4
	t7lhAS9az10pCXO3k+JKGbe5B6tYJhVRzcc62OvdKvwSQsyKQT8U0e6tsQ==
X-Received: by 2002:a17:907:962a:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c2a156ed781mr1064393666b.19.1790083595818; Tue, 22 Sep 2026
 06:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
In-Reply-To: <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 21:26:23 +0800
X-Gm-Features: AcwNN1Ur2tt8b16s6pIVEQsDoiyvx1gOYWr_ba3DyTwWp74e1eP8TDNhMjUzs84
Message-ID: <CALj3r0gyfggFP-T+yXM2P=ooyQMk0AUfnpxtArk5ioU+wMNrxw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_062638_299010_5A3ECF8A 
X-CRM114-Status: GOOD (  19.55  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:50=E5=86=99=E9=81=93=EF=BC=9A
>
> I'm attending a Rust training until thursday, I'll see if I can squeeze i=
n some
> time to re-test on mvpp2 :(
>
> There're a few series pending for rockchip and S32 on stmmac that deal wi=
th
> PCS support and their PCS handle. It would be nice to have some stmmac gl=
ue
> maintainers that are using complex PCS to help with maintainance or at le=
ast
> testing, maybe Coia can help with the tests ?
>
> Maxime

Hi Maxime,

Thanks for thinking of me. I should be upfront about where I am though.

My focus this cycle is landing the RK3568 XPCS glue before the next
merge window so it lands in the next LTS, and so downstreams like
OpenWrt and ImmortalWrt don't have to carry a backport.

On testing Christian's series: my current glue goes from
ethernet-pcs-mii@N up to the XPCS platform device and hands the virtual
MDIO bus to xpcs_create_mdiodev(). Christian's series changes how the
PCS is looked up, so testing it now would mean restructuring the
Rockchip glue and rewriting the binding, and I can't fit that into this
cycle on top of the initial merge.

Once my glue is in and the lookup story has settled, I'll be glad to
rebase and test =E2=80=94 and convert to xlate if that turns out to be the
direction. I'd like to use xlate long-term, the timing just doesn't
work for this window.

On maintenance: I'm a student and fairly new to this, so I can't take
on the PCS subsystem as a whole. What I can commit to is helping where
I have the bandwidth: testing when I can, and sharing some of the load
on the XPCS glue layer (pcs-xpcs-plat and the platform glue drivers),
plus a bit of pcs-xpcs work. If there are stmmac glue maintainers who
can help cover the rest, that would be very welcome.

Thanks,
Coia

