Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0714CC83F09
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=; b=PHQjazgm6Ptkx1p4OsqnfRjSjn
	wbWh/V41KdgFOl13jrpIo9aEx1dq4deXcZhw2VblUWVFu6Hh20fkY8pASRG2DSnm3aCs+9doOt0ls
	in5R0zj9GpcUZG7408ZpIHhU1gwfEztSkuQ7HW1MI2g62fKkj/XxhEL55sZJMVkHpSx3gbK+BWq0F
	/gCLrHMoohjIlmSL1Cs5hwnenosGPhc/9ZVBC6N4fxt8mn01D24qt9+uVChvsciYwqA0VmgPB6E1V
	y5jCBdWzC9wIoJ3MmgNOFebJrhtoVf1cFWW2waOSJ0mLU65R7PIKdP/3qeG+o3op2M0oA1BfRTeJx
	HMUrQHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRdC-00000008E95-0FJo;
	Wed, 09 Jul 2025 10:02:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPkB-00000007sbW-0HLv
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 08:01:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ae3b37207easo973009566b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752048089; x=1752652889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=;
        b=clzgCDRVjSAye2hj84pRAZ5ey8KPHojmZBqPbwCsM5qGPTKs/cPVs7IlHP1M9ymM/F
         u75jMfm0EWO+aI81vg0Kp+ZZpm+uEHCgDXM5XHnliiJvjnWh1xaiZikXn/GUKK5wbesL
         jnUqHbL4xIovfECQk98r9/qLICSkE+G8gqMYSIaBGUuCmJrGD1h8y1bjTdPgeLnWIJhM
         6yTy2FGowpAgf7L2c+7ZDwYqUZ3VVsSMxiLIah8B0Q8qy43dtMevE+PX5N0Q3viNp1F2
         RDxg6kT60R0rdtOvd9fycQ6EvOFO4MaiyDOZ4we2SpDq7ou8wkFA+I0pJhJb6A1xXOrk
         JtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048089; x=1752652889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=;
        b=fvTJh8UUPmxhONP5V7d7dyv7zpJ8SWVA5eOFtQ2fZ4QIDZtqk1S/eGhFZQrsWVeOMl
         Pz4PzX1VL6NSW0Z7UTS4rE4PT4vhEQoD4gPBmlS0ivvpLolpLq29hxN4+3hCPcc9+zF/
         kS5he9s1tj5rRebZjgKhqM3TdgVYmWWNwgxmX9uprHJBnczF/7yzy4AHmWiCAHS/mtDa
         DZkPlbOKxM/7feZ4TpXksmqoFxz0XVC6ILACpyBcvNtjvIIy0Od3tWWSZMPaQTSDzSWE
         +bEhwXl/M62UjXZMfIeGWFswVQnPOHka3Esx+/O+5PCJ32mqs+YicJ3TwnMPQWI56z5C
         yJfA==
X-Forwarded-Encrypted: i=1; AJvYcCV9hQEUcEtN3q8whCx/rI2DQGXRDiDBzcMTt8MQ45uGb+AUCUDJBqu65/Td9KwiGcgtCAQZfHbGD7ucdcOEEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZbcuMfLX36zArkozLjnGSIajoHQbSsTXttUzWKUrrkgOYnFEz
	qeIb+BO2FuC1y5VKF58O8PwOA13s/ocUBUj5Gz8ls2b5Il27ZduTSo+7CQ91Wh1RXHs=
X-Gm-Gg: ASbGncuuHGZKcC3NnCQC2FdJEW858m89WZNUKHxZ/iMRtCkZZXcgRJkwGuVCzN0aBWo
	0cJPZTLl5o0u9hnbW3J441ouGeFCJGq7nnoL5vwp7QhrkG2Ul885PQV5LuOJNUiQvOAPdWBm/un
	y4/jFvsy28PNIrO9YIh9BrdGbzm+rI05/elm1g0Ib6SktZDpcBw9pqsERi0UUZ1O8gGNHBprN9y
	pjXLNB2ZNllwUXCvRhRSJbBDIz20nejdS1z9pFrTCzUdnxalmeysrW0Mk3+rtDYB/BwLe3SILB7
	YU5a1+/AW62xhAwUCLGD6zbsI/57fXoyfwV6I/BMUHNp0+8NhzfiUNCIXehu50g/cwU=
X-Google-Smtp-Source: AGHT+IFBXOzd9iwnJcU6ys0n0tOScCaS96LTlgmk4/agHFWXi9OXbwsBntMcLQxbhIAYszAndNvzfg==
X-Received: by 2002:a17:907:874b:b0:ae6:c9b3:57cb with SMTP id a640c23a62f3a-ae6cf549b81mr155596066b.5.1752048089411;
        Wed, 09 Jul 2025 01:01:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b0336asm1061070766b.115.2025.07.09.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:01:28 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:01:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Message-ID: <xkluxdj7ns3mxul7iadgd675t2yrztr5ywj73z3zimrpqpz5o3@foo6qpnmt7c5>
References: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
 <ad575b88-80c7-4301-96eb-b34d97c5d5fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlx4gym6ltgwnmyd"
Content-Disposition: inline
In-Reply-To: <ad575b88-80c7-4301-96eb-b34d97c5d5fa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010131_249647_8A1B218F 
X-CRM114-Status: GOOD (  14.30  )
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


--nlx4gym6ltgwnmyd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
MIME-Version: 1.0

Hello,

On Mon, Jul 07, 2025 at 11:33:00AM +0200, AngeloGioacchino Del Regno wrote:
> Il 04/07/25 19:27, Uwe Kleine-K=F6nig ha scritto:
> > After enabling the clocks each error path must disable the clocks again.
> > One of them failed to do so. Unify the error paths to use goto to make =
it
> > harder for future changes to add a similar bug.
> >=20
>=20
> I don't like gotos, but admittedly that's the cleanest option, so:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

I somehow missed your mail before I sent the patch to Linus for
inclusion into 6.16-rc6. Anyhow it's very appreciated even when spotting
it only today! Thank you and sorry for not honoring that by adding your
tag to the commit.

Best regards
Uwe

--nlx4gym6ltgwnmyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhuIdQACgkQj4D7WH0S
/k4U5Qf/YSzRht495dMD2nqnQVOBbye9Zhk8OhgjT3q/FobP0sdpSL8jtIMYA997
ZBs2YOUYobAvfqlYRLI5GCpBr/3A0Vp8M1oeFb2IL5h7j9QjXHaQL8ZBHNUDZCcJ
Z4o7e6LnVrEnyokwK8NIrfi3VTtJCz3XuXp+f07bNuDLNtPT20dDD+VsHf1+qV9h
2FtzpRlVBXWqu5e9SyVPyjF/Rj2F0HkghPkEGrV+M0nRhMhFzZ92SKzpqzOAnEFg
EcG+foh9umzKYgSOgKEolj11hdHYp1k3Efl2CFRX+CpvP2T6FBr6zRZLiyL3LuNq
Arl5RRU8HtWOl8vMMNFO+D1Crq6r2Q==
=L+fW
-----END PGP SIGNATURE-----

--nlx4gym6ltgwnmyd--

