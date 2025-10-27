Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F637CCF9E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=; b=HeiAhZh+0vjDmRJ+6vSy4jahgP
	B4B/MexXa/2FWwWVDnoYABzEpDPVyVi6gJzHkb5zwh8JCxrOE7rShOPOBHlvDTB5QSbo63hi8ktUC
	U/Lmrp6YuIe+bqsfYp2u+0fgM5EweohRD/V4ETXIAg/LLEELYQm1GZZPXI8P4RI7cD1HpUO8i07or
	Dbz6T+8AZ4PKsXIcpiSYPTL3+HpJ87YTCp14fndymyNdo/UU1WwZkLkLaZvMA5IjSOMERbz2yeaNS
	vkne76luZwnt+QyCrcqTT7tOkzke5DyBjqbRRTFXkcbQkCmA0Viy/ahxB+X27/KVllT3YoTI72hzS
	PmE2XHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSua-0000000EfXb-24TO;
	Mon, 27 Oct 2025 19:29:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSuW-0000000EfTC-3C0t
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 19:29:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-471191ac79dso52902175e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1761593382; x=1762198182; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=;
        b=0rBIpzjOtTXehKmZK+9Jfu7JBu++MCogLO6K4i9NrjGVjn0Yeacvc5XaESPYQ4g55h
         O6eoNEPXAuDi8POx4NymOsiKt+pmjT0DFU9OWJQJSZg8+B+QYYFb9pJfhfzINGa5rslR
         GIbrD8taTUgt/ftr1wtaGC0br4AHd6Qn5gBfGx/qIjJHCTMF0kL33pXXZ+iZxMK1/whA
         TK2kPMqbQ89HnohNZil6P5v5fWm7JFe/ieDDUWQtXo7QDA2kSn5SiuPFwjaglp1/jLxg
         HpEdxNvuiQuP+bxGpgfV4KRK5I71CKtB7G6nrh9qiuJC+xcN8wPc4Fmjs3X5nhC/h3SJ
         wU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761593382; x=1762198182;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=;
        b=ENKIu0fE2hE+KvGhd0PC5n2vGAFX0/UUnKH5WJWyMkrJrGqAMNg/SVS4Nrx0S7PABy
         ldopb7isEfHmzSXrgIKeEdxmB1kWVXE9jKp35T0YuQvB59+uWl+iXHnMxmzyLOKS7LdV
         RRLUr3SgWfedtTkyxxC0sYy10BwdDjmiKeD3NIIOci5sBbM2SgLODJZyJMFUtNujgkd2
         zNy0USac0mweogQSR9vTuD9RoxuVmfmoE3b88hyfNOm6eaCAcqbZtZjwOldPRhWYZT6E
         obB2awxQl3a8HoUILLA/ZGkd1ZJuHpuH9RzL1M/3tZ63QglB/uX3FeLWOroy19R16rag
         gC5w==
X-Forwarded-Encrypted: i=1; AJvYcCWEqqcubvBhc9MvTLb1VRTERI65MZWVSoZvm28+rOvaj/SDPKl65AyObm4Vx6G2RQTLZ5Sxz45pMrHojuWgUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/K9nTsky9z/ytaojq9E7CzHi2eNPkxpV0UQGg75uBf53FEO/
	B58xDxPNhE8/IdsnlUBzyjTnrMTDk4sqkaCEUMv5ylihlQt4Hx6K8svTmGRqD8tASB8=
X-Gm-Gg: ASbGncty4r5+lfEKRcBhaXMK+bC6JrDQlo4l1tlnFUlZrpEiz5Gd2ife3IEIkRVxMIW
	Ba2qqmfEyVqnuBFTevhJnPjSrhGLdI3rRge7QKIW7QYMjLVWMkRbSSXixdTjXjyQyrJOtBCvn6C
	IGAlK90uU+pX8vNUK8YGJr5z/Wgylg98+JY/Y74gFV2EMVy2QYQj0ikAhIeCUZDwS6aIjiFntyI
	uy+rmOoGbgR1Cw2YGDkUXSpQS0hnBimQWGJ8APqD5iTiiySsrGjylnPOh11Q0PqxIS7uZUkxdY3
	zgb2adER3J1K8HVXOn4XaZMnT9BMC8d933PZ1eykPy3sLueF7uHfPtC4TYuVke7PBXVaOBkLQFc
	aRnsy06fpOVEXal4cov+jIuWdW+H0ZJcFMmKfi5pxKNnwZQvwgGuIX98PxA8TANYwSQFm0h6cLK
	UR/1ZRt4uKRdBMn+k=
X-Google-Smtp-Source: AGHT+IGocaODkva4Vi+tf+oBbjpK958/QSI3Hxe2akrbLW5jasCr9HasaaEHo3kz7/sJopvmcF8bNw==
X-Received: by 2002:a05:600c:8488:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-47717e4df87mr6180765e9.22.1761593381986;
        Mon, 27 Oct 2025 12:29:41 -0700 (PDT)
Received: from [192.168.4.57] ([79.79.193.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b6fsm16002057f8f.1.2025.10.27.12.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 12:29:40 -0700 (PDT)
Message-ID: <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>,  Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hans.verkuil@cisco.com>, 	linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 19:29:39 +0000
In-Reply-To: <aP91nfnpShIhXcVQ@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
	 <aP91nfnpShIhXcVQ@hovoldconsulting.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-D/OargbqI2TIFLsZob0G"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_122945_091285_CE1A2956 
X-CRM114-Status: GOOD (  13.43  )
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


--=-D/OargbqI2TIFLsZob0G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 27 octobre 2025 =C3=A0 14:37 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> > This series fixes VPU device leaks during probe of the mdp and two code=
c
> > drivers.
> >=20
> > Included is also a minor documentation update to make it clear that the
> > VPU lookup helper returns the device with an incremented refcount.
>=20
> Can these be picked up for 6.19?

They are picked already, please check in the tree,

https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/next

Nicolas

--=-D/OargbqI2TIFLsZob0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaP/IIwAKCRDZQZRRKWBy
9Fc7AQCPNa5G9ciLazzEbjeyVuuoqH63GaI8a209fxcD9GMEFwD/eiCo3UjnKnEv
ruFn5dSHzalVI5zJt+gwoMAc3YEJuw4=
=8nKN
-----END PGP SIGNATURE-----

--=-D/OargbqI2TIFLsZob0G--

