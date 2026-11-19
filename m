Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E053606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gun+WQwp;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QeEtewbL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=; b=Gun+WQwpLzLQIZhdNyvsCOx1aQ
	c5vooyKNxu/eLY/ys0cVjd1EJUM3x6yYg6qte7waTCpGqJpxuB+HzAQDeMVkCwtsTPPINwGPUmXed
	iRJnt9eov56+zlFA44RggOiXMeK/vMOkDyytdbglVMG76PXhygV8lVg2yxFzm415wYI852aFbwJ5T
	+n4hE0vGbWPIF9SxwFXI9HF/jX9HIhPowJ1+81jQ/2285ycWj5PyiCG4Smygcfp7dfY/f8HEkeacl
	Tp8m86Vs+Mo2B7FoWN1JZxG3nru1ZHK5cZuKgDwfrDV9ESXMiARvXLjwCS2sM8UGdopN2qRt3RYCa
	0wfcYrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Oc-0000000D8ew-2uzZ;
	Thu, 19 Nov 2026 19:02:10 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7OZ-0000000D8dQ-0yt6
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 19:02:09 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so65099241.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795114926; x=1795719726; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=QeEtewbLp7vZT3bRfBjRClglXbpd8bTR5F9BMK/1nAo8gCTmD7jVnYZ01Oz+EbMJ0K
         SO9YoBJZ4loqclsBHUlWK0ovuXP1w46NVHoflCxaWg+MggLnjLHj4Oysu6wMI+PrDf7D
         UKEHN/d8B5jwthUvTvHDmM7cI0azIW2vBjfVbNPOcsm33i5CFEd/Wv1nA+LwhaBH7zRU
         mUoMx+Xayl0CNJbm5tfWwMjxHRhHGPZmIy0ugxwMd/pIWYNkRwFgOy8IzY+sT9pwf1Mp
         69c44vIBOsalahYU3esqF/M+1QqpdA2619jR+sYwgTCCW1Y/RMgTz6oikxI/5Ace6zm0
         SSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114926; x=1795719726;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=PRRamxH4A0OM/5pjOogXiYjKcWj5Yre1Toc25rccac14e3JIFuuGuC2MziRdPqK1zS
         suyG4gxokh1B870R21J8rJoyc/svBLL0QY5QTAl8EH07VAqhTTiD7Xe4OAOnnvtR57tE
         Dl/sURukbT6oFBqEsrRsMx1l50keL1lobSZGOn22hnnf7dWckhWwGzPiR+tojuPmiQJi
         ZCuLJBheydq7MaHPQ910KqYorzQ0ZVxtphdSTtFbXD3HVpxBWVkCjfSyRc0UG0Y+AIEi
         t3bDxEJRGpMBbsmq1O8NO767263+FK3Osem3sC8ZxbAwRijSVY/cSr9J5nOAQgwoLVBC
         TQEg==
X-Forwarded-Encrypted: i=1; AL+hErGYytC1bxyCpZcxOp4dZIh5HHrmPAUmpIPt+sQlVblghm6WCdW0qmKiyaLfR7i0xTiPEcxiYMteCY+2IiDLwg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/qoDDusRSrQFZRzN3Z3H8S9n+oHYsdqSBPenVLTYlT+uHtTk72
	1HP4tR5ItoRteLzQCrm+bPnKLNHLiDyLse0W62NPmwzsmyGrzEV41I8AowHaseHCwFg=
X-Gm-Gg: AZFdTZe9SBxh/M/4N7RGJUYfmJdl7iSBRZUwghWKVdn1zv3O+rsNufDLDvRbfBQoNzI
	FgpI8MuO2JxMGMLV46/ORSHtOPNrlVzVFV9j1RxccwQZWs2DUmOw+mf3Ssjx0yftZODsT4p5o67
	F+EZISppcEdY9OahhQi5bEEWotQQfBTQYfzODrbKSxYoNcvbnlFdAx7DNP763rmHUaj/SpwbPmV
	5r+AIpC30+GYARWi7sxsdKza4MATZcNIgqY/iuBzlv+FgK63IdYgHHrDRajaHf2Vi8PgFKvnYEI
	pktheAotyDSf9scGCTIj1WODb3uziqLPirypy87bxuyCAxqeeOoFARxh1B5ENhOYN3klbAx0UFt
	kuRm+RqPmMManHr7Cr4jYZUw/hDp2ySQog4qmCZW7VmwEvJYzNREWqXncmsHO1l6TicOqwQaso2
	nZDPxGh54lv2GrHx4ynSvGszDVw9MD7bJMKrljHlHmtjOVRgzgK3QH492VphWtgJOQ9AYIfnJm+
	7xZ7UbRi1b2yomhvef6VSqZDaaUroI6RhXLFhreJ/PkwXWw7qE7hqiWEjP/SdVhqdpNAQMdH/yy
	OGJEDrGUIAF+psyRL0W2HoYIpX3cSjBf7sNwGYmP1EPdssv1E86n3UU=
X-Received: by 2002:a05:6122:c88:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ee8aefbb61mr486259e0c.14.1795114925522;
        Thu, 19 Nov 2026 11:02:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm809462241.4.2026.11.19.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:02:04 -0800 (PST)
Message-ID: <84fd9703862c225d63d973cf170b06ab7a962312.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu
 Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
  Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul
 Kocialkowski	 <paulk@sys-base.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Date: Thu, 19 Nov 2026 14:02:01 -0500
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
	 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zy5+UcnjO9CPStg5/eKL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_110207_319647_84AC6B17 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 01:37 +0530, Mukesh Ojha a =C3=A9crit=C2=
=A0:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9HqQAKCRDZQZRRKWBy
9KPMAP43HkphsVrqQTwGITR+0glsiS4Fp5Wyse7t/ZPwvyRH2gEA4/6BFP8fPbe6
9p9JGy6Ck2BZu8qjXZw4UU8oUtkiJgI=
=GZdK
-----END PGP SIGNATURE-----

--=-Zy5+UcnjO9CPStg5/eKL--

