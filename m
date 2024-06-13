Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3502C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QQ5va+aQlfb/vFalaHPg5H34Qi6y4ixcQX/yxfzk4Y=; b=sSaUUjBNfy4OaNXsxRSabtzvOE
	2lplIrMv/FZ7Jr9c5KEo9zfxc32aMvrMyU3VIS/0EnCMWkB6dxV+2lm1iMPoemtsSGic6s/DQW0Dz
	ryC5xFJZAZrTaYVpaD0u5FVttEJttZ2NmxF2X1vK5hsfAyvefqAJr6wQ8zF8rwaqVuOSxMdDirz7A
	sfmNV74eZRyVx58wK3Vj5RxfG0Um/fmPIBzWJj4oC1Ec1Zo9HMfv/uzIIk5r5K/teihi0ghuk2Ic0
	98FqUCpqdkMwj/7EsVuBUwD43UOUUFiB14yog1N0CHor2QzS72fM+NhVcQ09EMWkdhnGY5fMBrhbO
	aoiXXbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiAM-0000000GFDf-0deN;
	Thu, 13 Jun 2024 10:58:50 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiAI-0000000GFC7-0epa;
	Thu, 13 Jun 2024 10:58:47 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3E1051C0082; Thu, 13 Jun 2024 12:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1718276317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QQ5va+aQlfb/vFalaHPg5H34Qi6y4ixcQX/yxfzk4Y=;
	b=UzwupdY/Ac2rvSWK4CcDb7IHw17P1YQfhSJeFe5Eiaf5ZQnXaNRH7FLMZMq4nUB4esdAa1
	MdXvLUELmlq3RYK5tK03k0Oxba9oFa+to0qIHHQ4OMxwsVhOqHkw0+qZBpXenPrb/YRxzd
	m1khVbAGHM8KN8XWo17biXMw9eDXRiE=
Date: Thu, 13 Jun 2024 12:58:36 +0200
From: Pavel Machek <pavel@ucw.cz>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: Re: [PATCH RESEND,v6 0/8] Add CMDQ secure driver for SVP
Message-ID: <ZmrQ3NWxwy8719Vr@duo.ucw.cz>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ugZqD1PtgeGMHeh"
Content-Disposition: inline
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_035846_532947_8DD468FD 
X-CRM114-Status: UNSURE (   8.99  )
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


--0ugZqD1PtgeGMHeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-05-26 22:44:35, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>=20
> For the Secure Video Path (SVP) feature, inculding the memory stored
> secure video content, the registers of display HW pipeline and the
> HW configure operations are required to execute in the secure world.

This feature goes against interests of hardware users/owners. We
should not merge this.
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--0ugZqD1PtgeGMHeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZmrQ3AAKCRAw5/Bqldv6
8hagAJ91OcdTYdDnoCizlMOqRMmJHUnS9QCcDaoEoZdKMTlzCo9uoGaVA2KHcyI=
=iTbB
-----END PGP SIGNATURE-----

--0ugZqD1PtgeGMHeh--

