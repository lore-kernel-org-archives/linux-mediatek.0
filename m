Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A395C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Tv2ZpZ4EBfHDQXBRoOFjpkIvYdowOtvJfHHvZlbShU=; b=pKLgxMT8U8l+ZCfdUBs8TMV9p6
	RlV6v/+5VUD9YK+SMayjPF+4ArUT0GYoeCFlIFbDNt/gHf/1EVcKjd9I0UE4hrl34uEY1yK3/aKoG
	S8l+4hAzt+98fOP5y4JoV+phjWxWtSKraTs4kKBDSo4a3q+n/osPP13X6fVwpDJKvUTeR+THd3IKx
	1jue3VnBHGfgp1iW0Lkk/IY/OHzqIDM9zTiLKVcoOqQzfN1vYnL4R5EXZW32sd8WzK6qd0O66yhIh
	IRCJn3HA5apALnG9sFtm4ngcZwdr3FvMTgOdQiEVoLZ0pWvuAxrViXXFFBOrS9kHv1iUAXgnHo4qH
	E5HP0jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeGO-00AKNW-6g; Thu, 16 Feb 2023 13:25:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeGN-00AKN2-At
	for linux-mediatek@bombadil.infradead.org; Thu, 16 Feb 2023 13:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Tv2ZpZ4EBfHDQXBRoOFjpkIvYdowOtvJfHHvZlbShU=; b=PKr8RR9TOIIeM23GuXn1Y2q2Lf
	/ohceOTBkKwcG216bJkjOuxsd0DgDEKohulSad4+SyRPD0yi21PNeG2OpKWEbYCvueDv9CRLvVMw4
	8VZpH5088n5hiO7uFp+Nh3kUKuMt1dfhP46obzhF8W6Itgk4ANunx5AQ9a9WktxqQdjoS0R+8fgH4
	8CExL7DtsVLnlzyJLqoQWSH4bxuVJjTY9L/MlHLt+MabG3viJjPktioPgft5esQMfmIX0LfeGGIL5
	5W8haf5FKY/ViLLMg+HeVU7LllArn6z+mE2yhf5f952NgxXm5hL+qPlsAYg/nqsN5a7tFtMooAMzn
	B4CdXj3Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pSeFd-00AIBM-1N
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Feb 2023 13:25:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34AD261FCF;
	Thu, 16 Feb 2023 13:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59C7C433D2;
	Thu, 16 Feb 2023 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676553916;
	bh=uHtnhWLsn2Hd9jpxap1Di2ofv0wWPnKj0G7sCTRuaFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qn+bH7b9qPf23owDpFfK6jr/LyLh5edvLARebuXfAFd1VxLWIRELfo3gt8PIlJ9Rf
	 RbtlyL0xXOAVEUINyu2HRyNdrNweygWtTTo0xgjnEnLy/kMk1ileE++wMFL5zo4YSj
	 tUMPcac2HgwOu8NGsX/qNTVZ0jXjGCNBlIQAYenyoWhWcrkdShtL5c1J/p+cMeQE6S
	 rOA9xPxTFW2HQVFyh4uZOuq8e8lZnvCQEg3VdxTN5fiuOFu3ZHFdtlM+DhTdobjsQt
	 JSG2HTSQnQPslDl7LeqbaQBdwS+ntQiSipKOScD9f5aA4nbU/OQxaj7LkLTjA4omDs
	 5HTdRbZAAuaPg==
Date: Thu, 16 Feb 2023 14:25:12 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Howard Hsu <howard-yh.hsu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Bo Jiao <bo.jiao@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7915: unlock on error in
 mt7915_thermal_temp_store()
Message-ID: <Y+4uuOiVKegnfrq/@lore-desk>
References: <Y+4eSSqaHCpfK1EG@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTNt1ROkNg+Crel6"
Content-Disposition: inline
In-Reply-To: <Y+4eSSqaHCpfK1EG@kili>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_132524_093948_06263709 
X-CRM114-Status: GOOD (  14.10  )
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


--xTNt1ROkNg+Crel6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Drop the lock before returning -EINVAL.
>=20
> Fixes: ecaccdae7a7e ("wifi: mt76: mt7915: rework mt7915_thermal_temp_stor=
e()")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 1ab768feccaa..728150b35537 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -89,6 +89,7 @@ static ssize_t mt7915_thermal_temp_store(struct device =
*dev,
>  	     val < phy->throttle_temp[MT7915_CRIT_TEMP_IDX])) {
>  		dev_err(phy->dev->mt76.dev,
>  			"temp1_max shall be greater than temp1_crit.");
> +		mutex_unlock(&phy->dev->mt76.mutex);
>  		return -EINVAL;
>  	}
> =20
> --=20
> 2.39.1
>=20

--xTNt1ROkNg+Crel6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY+4uuAAKCRA6cBh0uS2t
rFNFAP9hqG8m0lMLsz+ZVwJWSdLkAflxJ25xi4RlZDISOt85qQD+P9/K9GlAjh+g
hZTD6jjLdMJdd5+mX6ffbAnkcah/KQk=
=xAWw
-----END PGP SIGNATURE-----

--xTNt1ROkNg+Crel6--

