Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F568CDD56F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5rW+UOPbgjcmK4qV+KS2eF5X3h1ICmUe1mF7wcNqpo=; b=gYhOTHKzQ31EIC0VyT0GzYJ4Ok
	5AFRCgF07HiywcMMnYiF14TsuDuiInwZHXg1Nk4qLtIzNQsCY/n2ZpqUaXVeaBNNDogGsMnh+7rIA
	Zjbt90gCD5M72c/3kz8tBVqkRaehz/zbFWvvpL6YwPb2DBIVOfRvfr/o6l0yZO0e6KyYDlVDOtWFK
	/zZU15fG7UcqYBhNPyF4v0qFRAEcUciK58ePwj32DqTjc0lUI+cglWMekZ641iQZAM8S5XaItlk5n
	gPlO9D5lSMyB9Z9MrcC+HEoUgiO2VvNQWI1sCWPRUIUrvPhPRhOs2FQBGws+lGyLoAdo00F+T3gEi
	KDXie8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srGkp-0000000AIBd-3gk7;
	Thu, 19 Sep 2024 12:59:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srGji-0000000AI5G-36OJ;
	Thu, 19 Sep 2024 12:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF644A438BD;
	Thu, 19 Sep 2024 12:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B9C4CECD;
	Thu, 19 Sep 2024 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726750697;
	bh=W5rW+UOPbgjcmK4qV+KS2eF5X3h1ICmUe1mF7wcNqpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MaM+65ITLgexVSOBdzMZzDe3/k/CsQ+DLdB9VYYcYmA/rsIelll8GkISXbDsR2Wvf
	 ANhxMttVF97HY7ulw62NTY7XjoBUFxlDME52Yl06iIQFNlihlBs4HDPKqzl+1f84mJ
	 KDJuWgN5j6VWB/eAuhmNs/S/XFB2xwr0GYY3B8PSP9tz/2UwsLOi+sdUJB7Dqy1221
	 rqKfcNvfL08zMas2mrPTBij9L5LNt01frBQ19lqO364Lf7bACOLRwcT2SkqPbdyQqe
	 R6ugVXHG/R17LzRMtJpWjIO2oxBda/ViPK7lwdy4g7LlcPkPzPiywFFgCHtS2pNXZM
	 sRBaDd9yy1aeA==
Date: Thu, 19 Sep 2024 14:58:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
Message-ID: <Zuwf57d09WBYKtSS@lore-desk>
References: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
 <20240919074210.GE1044577@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MUSAIOmjrs55SWjh"
Content-Disposition: inline
In-Reply-To: <20240919074210.GE1044577@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_055818_867158_33CFDCAC 
X-CRM114-Status: GOOD (  20.04  )
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


--MUSAIOmjrs55SWjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Sep 18, 2024 at 04:37:30PM +0200, Lorenzo Bianconi wrote:
> > Align PSE memory configuration to vendor SDK. In particular, increase
> > initial value of PSE reserved memory in airoha_fe_pse_ports_init()
> > routine by the value used for the second Packet Processor Engine (PPE2)
> > and do not overwrite the default value.
> > Moreover, store the initial value for PSE reserved memory in orig_val
> > before running airoha_fe_set_pse_queue_rsv_pages() in
> > airoha_fe_set_pse_oq_rsv routine.
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> This patch seems to be addressing two issues, perhaps it would be best
> to split it into two patches?

ack, I will do.

>=20
> And as a fix (or fixes) I think it would be best to describe the
> problem, typically a user-visible bug, that is being addressed.

This is not a user-visible bug, do you think it is better to post it to
net-next (when it is open)?

Regards,
Lorenzo

>=20
> > Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN758=
1 SoC")
> > Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> ...

--MUSAIOmjrs55SWjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZuwf5wAKCRA6cBh0uS2t
rPFPAP9xnrw2/lCkRgHlcVpazfjalAUsglQFFQuurdgduIO1QwEAyTuv1gpeDlEd
h2YB6NlhlOtRJUuPIiVFTpAZ2jED4w0=
=ppxr
-----END PGP SIGNATURE-----

--MUSAIOmjrs55SWjh--

