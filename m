Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11897C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=; b=Gl9Ljku572p+dydnlnxC+k/5sy
	aeY67wXSA/H7IF5I3QdwlQ8OQIw7wk0Yn6BhbV34p4tz/bGogSx/5Jv7wBLyyPcleM5G01pW8FHit
	VAuUpS5XWRH64vQR4Vd/TX3fV16jG/0Ega8NXTrOq/yDIrt86KA3zYtO1CEf+e4mkEzz6P4yah+jc
	fAcKEPLOEw728NxzibJp4Ucd4yf3+QJ52HDhQZUaJSK7VTaCbXk+elPRVqd4cyPbMP5pw5CWn4vok
	ccvBqJZJ1kQFjxeLVgAexOw6wRIU9RhZR46Rr9DjStreTCqQXgznWhgJJpVQzYRFpo+7ePBZSOMeJ
	q8/ExzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PHP-00000001N39-4AGB;
	Fri, 04 Sep 2026 08:28:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PHL-00000001N1K-35Nm
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:28:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4956869750eso5641375e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510486; x=1789115286; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=O+mdIjFHtC0rIjiyWDgWYW1DuuN3ItvNqRQorv4J5BL13dOvv8OKGeecunnE4OF2j3
         Xzt9x6xENgdxkwluhaEj6lLAT57gB4PYHLWvEDXKZWIhmWcaWhmkYqmr8MEZY0j+Vtab
         Wuo47ja6IecbWnII5hbyfhBlmN/2TF9emJEjQt/O6EVIt2jPKM3iVA0CTbL3Odd5DHTt
         WQulBzD6tINUP480m1F3NCTl41lOubvWOzNso4e2Zsxwkyven0mFn+iyqPZtABykxtLe
         /HTl/y7WvUP0rHgUeFx19l+vsM923kIPNYEpn3PRRAKVlnzofj+PjP36LsykVxauVMHu
         v9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510486; x=1789115286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=jRbccF1cJ4ASYQ81McZWTg+95tZwrZ3aEKUdUci60cFscclDdpbHc8P7aGB3QsPvix
         ycYGNw83HHGAYi5aWRdW2p8LSb1mRrMjrMm6R5ebH6dNG4LsoTBJA7M08SNruBELdD2z
         6hlk8BiRiWPk6V3HPq7NJHm21gies6l0g6zPqQ/t4Gqfc9NMBSUK/ueAx/ualfQV8H2J
         yxeKkHgWrU79nI7YE5gi+C7NC0N8Q1WxVgwM3ZIGd7Nwp1Zbc1+Zm6vw4YeT0isDUhXR
         ivpgcDgHs4x47EHugF3Vl7ohX2q4dV5r5wkbnnfVHfrWonLwCFZh0EVmTsyUsGpfaqU1
         puMA==
X-Forwarded-Encrypted: i=1; AKwUvBw2V9C+kLWskZGy8u0/TQ1IptiBiL5GGZKFOvjaEtNQldjIBAC+lR1ha9dsBjYk0S6npwMcM9T0WuYWYGpcLw==@lists.infradead.org
X-Gm-Message-State: AFuF++k2untcBgTqFean9Vk4/Q53qLAHJcM/brVGSBx1nG6zwk2XPWNO
	SxLCzdKKUY/BtbBFJyOI2u+N5mBNbwuLfYQd2wXzYl3iNxIGmPAk3q+LiGODseKC6pY=
X-Gm-Gg: AYBFou0T0Zi4eG2c++783XwA2clF0rAvBkVvdDVQx6B/olUfvSjYSlrSto6LeLhB2I3
	X1DJmWscuOXe83zmfIedgvTluMuFAe26EKiEltc9xYazn3StEMuuA9a+4Ff87v/3FkV8TszrerV
	uX2VmCbkG22IzYZwNcJoIPSGBjzGSz27+w71UPq2WWlvV46nTSGXwMsBxGr9ofg/24luzdLE91D
	CNULzK9dvPouye7BCEeOIWd57ApBGSNnTSp+DGc8SQ0eVPAtFJHUhiniJjLwLPCF/nHq9utI6wk
	1+Nfu5NtqEe0bYLs7krSvcng6tVma+l4T8TSzcyz0Yj3v/gJBAhTL6BgaE46OczQ90oXh2c6Lhi
	xwJntovekqmfDFioeu7WPQ/ZJDWk69/iGk2nwn8KBHsknIpot8Bxr+M0uq9IOl8y74GXzcI9Z8S
	BxhuM4tWK1ExzH3Gz3MjLTbJrEVqdHF0g4w3zYFXrWOylKhfbm4ToYTfmc
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr25588125e9.24.1788510485753;
        Fri, 04 Sep 2026 01:28:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm68845625e9.2.2026.09.04.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:28:04 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 10:27:58 +0200
Message-Id: <DL6E1V8AMI2X.EQQ009BX5AZ6@baylibre.com>
Cc: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 05/33] can: m_can: Remove comma after
 sentinel-entry in match-table
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <kurt@linutronix.de>, <hauke@hauke-m.de>,
 <chester.a.unal@arinc9.com>, <daniel@makrotopia.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <ansuelsmth@gmail.com>, <linusw@kernel.org>, <luizluca@gmail.com>,
 <alvin.sipraga@analog.com>, <clement.leger@bootlin.com>,
 <justin.chen@broadcom.com>, <dlan@kernel.org>, <rogerq@kernel.org>,
 <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <opendmb@gmail.com>, <andrei.botila@oss.nxp.com>,
 <wangruikang@iscas.ac.cn>, <amadeus@jmu.edu.cn>, <kees@kernel.org>,
 <tmshlvck@gmail.com>, <c-vankar@ti.com>, <horms@kernel.org>,
 <vadim.fedorenko@linux.dev>, <daniel.zahka@gmail.com>,
 <nora.schiffer@ew.tq-group.com>, <v-singh1@ti.com>, <oss@vassilevski.com>,
 <haokexin@gmail.com>, <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, "Kendall Willis" <k-willis@ti.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-6-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-6-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_012807_787148_8F9DEC13 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 4, 2026 at 6:36 AM CEST, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Acked-by: Markus Schneider-Pargmann <msp@baylibre.com>

+Kendall

Note that this and another series by Kendall will probably have a
conflict as both change the compatibles:
https://lore.kernel.org/all/20260902-temp-v4-0-3896f7d16ce8@ti.com/

Best
Markus

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapqBDhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNU
DgD+NDmEsw57cLpzBEOHVv/Nk1EkJHkfkEl6somoL6FeZhQA/igsPy7rmcarz6Ym
lEV7ixhaA3JU6LQo0KOc3yMdNwIE
=DaCZ
-----END PGP SIGNATURE-----

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c--

