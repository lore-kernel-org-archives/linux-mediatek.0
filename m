Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE5ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaoiK9aHa52swA7QKWMCX1EdP80hRX2/nxRk/GpprBc=; b=ZXDHtgHX4pswI/KeVNZ/GWLm0v
	tLb8QL7gbMIXf+p3cCLZmGJo5mRHpBYDEI+APdyf9Mgcs6cONXQn4pT+Esqv8rpGgN/gYhHAju65d
	odkE2kmrK6/Jdq3/Hr8vffGeMMU6WxkF0WB8OOqef9LxkksbXyQqVRwGoq1fjwXb+CXTqvJfS1Ivv
	QbxoZC21Esw+F4XFCFdEm0zyXrBHxwaUd7ZSbxhZiZu6QODfBX7dd+oPXeyh2iM8tlN25CYKbJFJV
	hJNjBcbk9HWOHyw5ywiSUcv8wLqw4E0x1q3qTnsnpO43PY/KI8LtRfuRObnR//C+V6JUCwRx5dsNF
	DEemyLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Ru-00D2Jq-Nh; Tue, 13 Sep 2022 16:07:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Re-00D263-Jk; Tue, 13 Sep 2022 16:07:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04589B80F01;
	Tue, 13 Sep 2022 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1361EC433C1;
	Tue, 13 Sep 2022 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663085247;
	bh=QaoiK9aHa52swA7QKWMCX1EdP80hRX2/nxRk/GpprBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKwZdm4WAYhORxtrjVWX3jK8jtUkf3+s7w9BGbo6zkFAHRSf1QOrT6JChhhPLzZJw
	 TAtv7ptoZDK38BBxg2FZvgu/H9mTVqH9We4eMUIMluzyz6xMHsidjGaz2fi0BtDEmW
	 +8FfilwaepdjbJuexMxP4GoFtFRPq37IrVKcPxXGpbHRzUW166rUVe2mAAsMDRmYKl
	 YSw5AbQ437TAr1DyWLmfCe+Ob0MnuS8eUx9BL4p9D/12MjQorRaKyXH8lyKs47k0Xk
	 y+5wCEtnGUVHKb4rwas4IoiOAg9ph9cFXrG6oIsXzFGewkl6kjfxgUXv0vm8hjP+VA
	 spKB4ZGPlS9SQ==
Date: Tue, 13 Sep 2022 17:07:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Chunxu Li <chunxu.li@mediatek.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-mediatek@lists.infradead.org,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine
 drivers
Message-ID: <YyCquxBE3q+kOZuH@sirena.org.uk>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <166276355052.332114.1969052042106279493.b4-ty@kernel.org>
 <96cd0c78-a76d-e32c-8f05-32e127df3fb0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SU6+datVMQKdk1vm"
Content-Disposition: inline
In-Reply-To: <96cd0c78-a76d-e32c-8f05-32e127df3fb0@gmail.com>
X-Cookie: One FISHWICH coming up!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_090730_825243_3193E3EF 
X-CRM114-Status: GOOD (  12.94  )
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


--SU6+datVMQKdk1vm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 13, 2022 at 05:56:00PM +0200, Matthias Brugger wrote:

> DTS should go through my branch. We can see if there are any merge conflicts
> in linux-next and fix them somehow or you drop the patch and I take it
> through my tree. As you like.

Sorry, dropped now.

--SU6+datVMQKdk1vm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMgqrsACgkQJNaLcl1U
h9D/Owf9Ed/45wBsYkHFdYgI94NFz7iEMKYxN0ldW1A09VLfXzSGfRbdW9ziBNRn
9772Ua4+Z+YUJMkSl6Y93O41N/Rpqlt91iSOnI12R8++h3rCpzjzhSM3slgULRCX
vVnAJ4W4X1ArVJLq9LAizAg4bXJqdYI8rQ2IppS1J29Kwym+/yUyZvcAsyVKIeX8
o8Py5HgC2ycUEyG46b49g7LqE5qosl179z9AtUix8LD3op2TSIfNcfxuOOM42Sbd
FHo6UbBHpMoHSIQgYRcCOcCPsiQczcdAFXThtwgJFFR5Cq0JEW5Nv1+R3DoDETdY
gSWLGLBgtmdWDlBojKg0J203ZVUFOw==
=jebS
-----END PGP SIGNATURE-----

--SU6+datVMQKdk1vm--

