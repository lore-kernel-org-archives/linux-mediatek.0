Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2407C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dttGOdvSxmXHPQgtjzcjg6GmMa11J7O1nf+3j6Do9x8=; b=oM0JGPDCT8wUF1OToKiJ//gRtU
	TmPhgo2dWkwTwKws2mqZCbib9rsM0SY5ES3nmB2LtWfmRpb8ioaP9P+oF+0nvYQ0NYZWX3LLKroMQ
	CS6/TH2OzVpySOyAmMvzNVR5MPlCyqRZuIsrZ9mX6XI89qHT3zskBFCmobmM+4AAyN4+u5Sz37RDB
	k5q6Gm3bhUJRcN35FHtU57YoWflZvmIdSGlqUk7hwBslRKbpHhh8tAIESL2VkjCdv4yMK3vIFrQNX
	SdBSbxxoofye5rCbfkC+H6zX4IYbzd8m0656CZEUMvFCCcl7f3puonQzNlQHlYVtA7plIHzZ4ZOMC
	RMxLVoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no8aT-00FwDU-Oi; Mon, 09 May 2022 18:58:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no8aI-00Fw93-CF; Mon, 09 May 2022 18:58:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3D420CE1B0B;
 Mon,  9 May 2022 18:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70CFC385B8;
 Mon,  9 May 2022 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652122691;
 bh=ICjgh2SHUAfsGyKVspdhXwxyeTpLD0tJ1XV/0qJNQgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNOfUt66xaeB9Y2OieOzu+BQCMSPIV/o++Q5uNjXXxOojRb/2rqrD3qCl/8GGhLme
 5PlW3HJImr989z4mRU7QMmV9LiewWaF5y7dwYyx/QCMAZW6DthHimUk72B9J4511Zy
 WZTLc0SuSP+HuRDnWvmjcAVIFNvhXrJZcL+kr1v2nt3uE5bvk77F+CzG8PcSVAiHS9
 ndIgjQsAQDIcTPurHpY8UVc4ru68mDkI1hsAsUOlntkZawahJEYsjkhv0/hXyraBqz
 0AqI5h3DlQFMz8agBSVk/tonMQCA7dBYiTn/jqkQ49wHDIrJGTfWNhbP/Q3c6nDz8+
 SUOMymOk6L5kQ==
Date: Mon, 9 May 2022 19:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Revert "ASoC: dt-bindings: mediatek: mt8192: Add
 i2s-share properties"
Message-ID: <YnlkPTUqcoRk0pNv@sirena.org.uk>
References: <20220509185625.580811-1-nfraprado@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220509185625.580811-1-nfraprado@collabora.com>
X-Cookie: Boycott meat -- suck your thumb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_115818_622909_E618F4AA 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============3876076871397631452=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3876076871397631452==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GjheQb+H4dAxuUfA"
Content-Disposition: inline


--GjheQb+H4dAxuUfA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 02:56:25PM -0400, N=EDcolas F. R. A. Prado wrote:
> This reverts commit e056cf4341ae3f856f1e38da02b27cb04de4c69b. The commit
> was merged while the property name and definition were still being
> discussed. Revert the commit for now and a follow up commit will re-add
> the property after it is further discussed and reviewed.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--GjheQb+H4dAxuUfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5ZDwACgkQJNaLcl1U
h9BBOwf8DEntKvg1X9xyFzUILjpwaenS8uKLDQGKJ8FH2tF11PeS9kYPLUbP9twY
qWF7VO5OYA4wPhBnLf5Ivc2fNWgr0so+LCY4scCEQMxsn9udS+FfRTlBAPx2kfPj
GwrnQtj59gWQrt/9dbe4RZ1JNcPU471ghlaXqPacg+wNQRqcRVdcPtAn4G9uBHxm
rYPBGIcCyMV1hKtPAGfirZ7F6Py1G/DFCKAvXC/huj9nFWsvNOb5uiFnkXZDTlQX
OooS9UNpAbe5uNG91MoRx8lBxHLc6WNnDwFxUVcF5O234cIRI6uNm25qlYQTzgD6
MJOe9k1CWfsum8VGBztL5mYqwi/IQg==
=/Syt
-----END PGP SIGNATURE-----

--GjheQb+H4dAxuUfA--


--===============3876076871397631452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3876076871397631452==--

