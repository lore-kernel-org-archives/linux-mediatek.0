Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DEC3DA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NjQY4CFdRSSUMACoTljrQZ0Eu6KQjt/PB+PShVspRE=; b=UxPVGhdN7x1J5dD95JjDDK4rT7
	KM5bnUKQFhixiNJzLdG/Uu2rePK9Ov3w8sIjAacCQgczMDCjCUa+PiFH8wKUXojLdfvgku1Pjl0dT
	A1AqKK4FrI2AAn/GXT55SrzhaZDZBaCBLhsMqdGqWpWMBwFyiOSZuJwgCfiEW47PlWCd8GkI/dgEM
	hDSPmz4g5uMaObrWXGVs0XXpnqi2CmtieJ966nEnAQ/kAqc48toXyw42RX8quBCl74HdQv0gAjtsY
	lsVdiOq94OiOPm1J+Whu5v0fCN54YRwrJblfP+gY336XqFiSy9Z6fKvvfLtXueuA1f2OojC4HLPn6
	Qzcj0Rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRq2Y-0000000DLeH-1MX9;
	Thu, 11 Jul 2024 09:24:38 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRq2F-0000000DLYl-42jY;
	Thu, 11 Jul 2024 09:24:21 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EBB993B6D;
	Thu, 11 Jul 2024 11:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1720689849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=9NjQY4CFdRSSUMACoTljrQZ0Eu6KQjt/PB+PShVspRE=;
	b=ylW4lySgGjMOXcWA3D57Rlg3dbXLsLi6lD8Ujp4QTPKR3fGsa7gtjsmw8eqrWbYAJ48HgC
	+GbmuDCeNgyCqRkhsRYQ8litN8fDDEM/99hNMyzOA3TNVMp/ppxC6XcOMDXJivVBYuLrOQ
	E7N8boUaduoWml1xbC3bK2bPL0qZogEV2AfD5xg05036jXZ7ASzfsshNXTWAmg3W1anF/w
	mF2eigXeK3ys5PkY/YoOIsCWoKvZ8FqFeY+jFWU6M9lgeedMWSxCh+lEzri4FF2kV0YFY2
	bZ7Zj8nF/1j0J3vm+TP1jlg0TE8wKRxmP+/0S8f8MoS2g7KdZab2gOLsWYeMPw==
Content-Type: multipart/signed;
 boundary=bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 11 Jul 2024 11:24:06 +0200
Message-Id: <D2MLN7389BYY.1HZAQPLQNKU5T@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <jitao.shi@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>, <sui.jingfeng@linux.dev>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com> <d84f1469-e82a-42de-94a0-8ee0da0cba02@collabora.com> <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
In-Reply-To: <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_022420_159532_B0C57443 
X-CRM114-Status: UNSURE (   8.25  )
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

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > We've got a bunch of series that are waiting for this to get upstreamed=
, including
> > the addition of support for MT8365-EVK (already on mailing lists), MT83=
95 Radxa
> > NIO 12L, MT8395 Kontron SBC i1200 (not on mailing lists yet, waiting fo=
r this to
> > get merged), other than some other conversion commits for other MediaTe=
k DTs from
> > myself.

Yes this is the missing piece to finally get DisplayPort output
working on our board.

-michael

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZo+ktxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+IKuAX91bBhsZ9n70IFStgrv2BIU/wzvYey5zSMd
wdN4kUkgilUQZFMEdQBBI9Rre4soOOABgKV3nro9rwqC5Qu3/YjtsfR4y9YZMmWS
dVPja70ZNJ1cDuh4I+gD19+V0Q4xPsz6ZQ==
=B681
-----END PGP SIGNATURE-----

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966--

