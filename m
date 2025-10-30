Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C08CCF9F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=; b=KLxJg6YU0Ss6gy0oSigb8RFG6c
	xFijRiyQpZ4fCB99JpSPQpVrCx9ajZy1GeZoQ3EqRnVAcx/P/rqqNnKHRIOH0g6oCmV+sBXDAjpQz
	ipkJwrctY55rqveXEbPHh4ZCWjjGCVBOzDWE/93GYtiWg1MUhHfdZ9Aklc7hmT8jJK0j3lHcvnaWb
	BhXNzOIqDj2YBldXk/D2SkrSUbZSjBC4DJ5S1orLFvLkWv50rhAUL2gwVw4bpYBGkSfetAwYPp/IT
	CN/xts0weWBjQ12zEDwXHicRfchJor/W/5l76TMF/BN+R9oEeJ+1GyWzZo0zvs3egmqcTiRHVlX55
	xQN1Qx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb8K-000000054ai-1IAY;
	Thu, 30 Oct 2025 22:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb8I-000000054aW-432n
	for linux-mediatek@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=; b=ZHcRccLFsgXObaVXCbM74bH/5S
	0h/PlXx0XV0bA0J59RErtIbgaNDKkXRutdV1N9fESlab33Dye3/BiaVuVFt2UmS4aoR+HFpG6tS3B
	+o32u5NZGz0gVUkOS91KtNYB6HhQg8rDm91N6Mqds4xVPOuNTSbfWLsBQ/keRtuT7QwLfzTBkR7dB
	PxkMYqCaKC62St19frsJGAY3hsqUlRgw0ZoDaiU7QS9Ooe7M7OrADG3lzYW1W0guHGP0QvUjrHrv1
	ErEj26J18aW5mXOSrFdrbfcA0ERo4FbxGCrgXU65yp9P8UlN8Jyz++kR9xlCr0uvp4MhLVm95HJEg
	Rs8rpRxQ==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaGV-0000000A7yd-1UdN
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Oct 2025 21:33:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso3341847a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Oct 2025 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761863313; x=1762468113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=;
        b=UHzZzV301LsfsvQdFaf42w3xZT+y8ii52pRjujDfYfmBhBcOpbNV79iEvtmYdqIWXi
         fzdSLC/K95ANVWmlZoqQ2fhQ3MllJ/P1i7NLxUCc+qJGJPJywTocvzo6FnW9VmEXB5Gc
         QH1v2dAHnfc3d6skzHfS5go5gZdE/9ZTYIGxoldT30cfprkB6U/+VX+yNzSFJvOYDYJ7
         E4zj6N+xuvr1oSH7DmnhIYMEgQoJi8j0Z7O9DFCMufZCaGqRNw/ueL3KfzDmY52TbpBr
         7OaAFapVbwpnJp+iXPJFQcVm1cwzmcznu6p0E4szXGEr0MtDuWkcDsdqU1rvSHt+4BNc
         E7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761863313; x=1762468113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLIj2ZxzmymqRauTGMy4XKLZHvUw1c2JZBXJt76wks0=;
        b=hcd14zcqy4DkmSmAMRNMOSpbc6oRCBogE/JClmygEP2nwsx+Vpc8vUPVwrXKnXLqdk
         uSiw8iDuiY5fdSCTMS673Sb1Vs7N3yWTHRvTugc8FZQWckg9hUWhEO9NtxqyMHb4WL5+
         8PDh1ucWSCR4n/b7I5GQZ+9bLO8ix+qHgds1sJK2hF7uuIj4WzmLZqysYj/M0S/L5GjW
         twtu5lWMRY1RBvMvSFbo1DDL2LMAZExCXx7lphMIMkKfduOHnK9ryxGWSkkp4Ol8Efiq
         nKpcilusF5vvqjTX7RpQkjk7lGE/uhXpYwgZ02WDgjx1od3uH16jldZh+iE5hu8Fy56l
         bETg==
X-Forwarded-Encrypted: i=1; AJvYcCVw9+4cDPTU2+W7Y6yn4WnwhqeqJPBeZJZY1Hfa+1Qp05NRYWFArS7W24MroaNMO1DXAW6ljtMtdgvtKZ1UOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzppy0RjAI+twgYsU5pt8S2nO+E/PhVlT9KqoFTdcWMBI4wRo12
	/40lSTFAO2BEDib0O0Ji/hAvj2pnMm//JWimdNsWiikei24Lpg5nr2PE0nPX1nYrMNPnuiKyPI1
	QZDsN
X-Gm-Gg: ASbGncsxSXFNthpz15NEji3ftY9CpTCusqKhpMRTJNKuVSnoYCP0uYtkWD7ycGSo8+T
	A9ItT6Xy/hwHFzvOMzt7NXw4TpffVnow8zaJdLvTCJyUtoZD1BzSYrMsp0L8S4Wc63R/SBR/LKX
	YRy1jeBHfkfWCJwzC35hjcRE4EjesRzxvUk3MNtyx0lWO1nhczsAMuyJzclZSQxtE6n7P7T4v0j
	9zuHIv/MMVZowpqQWy8x0N8NN6O7pU9RghQnG/bSPk14uxQAtY0iVXikTxO0c/jtaCAjWOhW/oI
	FNKxgHlcc/FYLhV0ngzCNZO17WuVVw6v/GX89kCRg2efNlNjSSAu2yXtpmlsQo30jInVVS0Nyib
	Mnzr3890Gnr7hPgJvXzwgeKgc6M/ACFH7UResdipjKdl2bXhWIW8SBkJfpFyFDjfYf0C0/wZG05
	oQCSVQYQ==
X-Google-Smtp-Source: AGHT+IHJSQvJu6sueJxCiUL+EQWJpzwZ/WTHJR+xaALkyTaBAgSDfM7hwfeK84Q5Re4DmoCk0CX88Q==
X-Received: by 2002:a05:6402:440d:b0:639:f7b5:9c2d with SMTP id 4fb4d7f45d1cf-6407704f19cmr962096a12.9.1761863312684;
        Thu, 30 Oct 2025 15:28:32 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6407b439363sm86845a12.32.2025.10.30.15.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:28:32 -0700 (PDT)
Date: Thu, 30 Oct 2025 23:28:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] pwm: mediatek: Convert to waveform API
Message-ID: <4lhh35sxh7dkmn6iqpje3zojea4qqc64nes2npkuxgqsucusah@sclwr7uokzq5>
References: <20251013114258.149260-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmymtir4yxpkn2ip"
Content-Disposition: inline
In-Reply-To: <20251013114258.149260-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_213304_208382_3E7393FB 
X-CRM114-Status: GOOD (  11.04  )
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


--rmymtir4yxpkn2ip
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: mediatek: Convert to waveform API
MIME-Version: 1.0

Hello,

On Mon, Oct 13, 2025 at 01:42:56PM +0200, Uwe Kleine-K=F6nig wrote:
> Implement the new waveform callbacks which makes the usage of this
> hardware more flexible and allows to use it via the pwm character
> device.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks
Uwe

--rmymtir4yxpkn2ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkD5owACgkQj4D7WH0S
/k7yEAgAoj8oyEvLV8k3Yq3Ir8m5016o/vQbhThpW9TRHRhr5SKtxVfa07ZM7yWC
Aho8ZW2AwOIuNRnr6bUs2k5O/lSg0UBZU7TMY8AVXbfBF8hj6bcoNWbV3LD9oGTC
3B37fW+mlwT61d8Op6o4r9aO0zO9sQgMcyUbGSCiHWasEaD14xnCFGpHP2aTwoJG
WSC635SJj7uTVzsuWFAdf3QQNR7CLCVSuMn4ko6mYtGevLy8xapCfMOfdlQXEHMA
GpOj+H+G57dNpleEGxa6QSMoQ1uMwyCPC5tIAIgJ40xjIfViQBuQAOF7BwXZXPYs
8oKuk9iEEHkCM8kcKPSZCoCKcRgaXg==
=0ccV
-----END PGP SIGNATURE-----

--rmymtir4yxpkn2ip--

