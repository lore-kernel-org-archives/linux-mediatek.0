Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED175C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+GZBbJyoa6yiGEsYykRuOLt8nI0iGKdKgp4U86SJvY=; b=0a7ETTCprPZYe5ZLsH9Zc3+s/P
	fpUsy3j+odZgwLbUpnYDVGCLF+X92giFwKdwuudr47zQdaNjUd+R7gwd0UzzBt0vbyRm6eTTX0Sjp
	TKOcLgiwjSs84gnNcfbWn/kdYQ3GxjwkgI9iaUBO13uhBrPYaFuHCkwq5WbNy6yFjjO/ps1uJO2sd
	mP0ZvbJXUNrHLHg37gBnzorduvYMvPYQSt5uSZucPG4ccVHL6eYs5lkXjXjCwO6S3igvHq/vDkinH
	gQBnsQZDT3HdXGml00YiviG6ZnpbMqbb+c73tFOR74uyFhp5OAT+DpuXXLKe5PtrgtLZxFnMExPbQ
	z7YK9xQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFmx-00E1KC-Ta; Fri, 14 Oct 2022 08:11:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFmv-00E1J6-2U
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 08:11:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0658B82241;
	Fri, 14 Oct 2022 08:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126B7C433C1;
	Fri, 14 Oct 2022 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665735082;
	bh=/2YzZDSriZZP47ugqgBa+WOk7JL//L8icKVDiTA4OCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3sRhDq8W6s+mPky9BkcvaCU+3EGDA5zhXsBnTRfsaF0QQuplogIf5pwg9iv1jnl8
	 C3rxZx1kF0qvJMWzGS0ya8etmdQaUaylMcIGNuvT0spD+SJNuOesHYbr4UTvaRaUO5
	 rjryV0+LiSXWT8OXuQIMccnbU9sTzvX/ncmR/yTu38/yjhPrMNHfyw1DcXTmOs8Eud
	 6IDrjgCT6gFw4rPuSgEvD303tIWG84LBEvRMkd5G8TD78mzvl2umB+ZscM5NnMFK8w
	 zTmrGcqtNwDVk2MbQxQjnBTTjYJB7bGAFrqZk7bAMECK7q2nNQmnKsBkdDDGsr939P
	 VZsGentG9E/kQ==
Date: Fri, 14 Oct 2022 10:11:18 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] mt76: implement functions to get the response skb
 for MCU calls
Message-ID: <Y0kZph3yi1Kd2Ljc@lore-desk>
References: <20211008130007.GA23161@kili>
 <9298fd82e4b49b965e9f26957510b9e968e8b691.camel@sipsolutions.net>
 <20211008142734.GI2083@kadam>
 <Y0gM2jeo/X5Vq+lq@kadam>
 <Y0g8Ev4hE7m/kP3H@lore-desk>
 <Y0kP/WOjnCexAPCy@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5pLxOw79BPeYd/sX"
Content-Disposition: inline
In-Reply-To: <Y0kP/WOjnCexAPCy@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_011125_427473_7D877364 
X-CRM114-Status: GOOD (  35.00  )
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


--5pLxOw79BPeYd/sX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Oct 13, 2022 at 06:25:54PM +0200, Lorenzo Bianconi wrote:
> > > I would like to revisit this question.  Last time I complained about
> > > this Johannes responded but he misread what mt76_mcu_send_and_get_msg=
()
> > > does.  I have looked at it as well and I also cannot explain what is
> > > going on in that function.
> > >=20
> > > I have looked at the callers and my first instinct is that maybe this
> > > is dead stub code?  But then when I look at mt76x02u_mcu_send_msg() I
> > > think "No, this is not stub code.  This should be returning the newly
> > > allocated skb to the caller."
> > >=20
> > > But then I think, surely at some point someone tested this code???  It
> > > must be stub code.
> > >=20
> > > Could we get some clarity on this?
> >=20
> > for mt76x2 and mt76x0 we do not care of ret_skb (in fact we do not run
> > mt76_mcu_send_and_get_msg() directly but we rely on mt76_mcu_send_msg()=
).
> > For mt7921 we set mcu_skb_send_msg function pointer and not mcu_send_ms=
g.
>=20
> Ah thanks...  It's easy enough to silence the warning in Smatch but I
> was never sure if it wasn't a bug.
>=20
> > Moreover mt7921_mcu_get_eeprom() has been remove a while back.
> > Am I missing something?
>=20
> There are 12 callers for mt76_mcu_send_and_get_msg() and 11 of them
> assume that the "ret_skb" is initialized (i.e. they assume that
> the ->mcu_send_msg op is not used) so I get 11 Smatch warnings from
> this...
>=20
> Why not just do something like below?  It moves the ->mcu_send_msg()
> call to the only place where it won't cause a crash.
>=20
> regards,
> dan carpenter
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wirel=
ess/mediatek/mt76/mcu.c
> index a8cafa39a56d..6bf0b7d8daee 100644
> --- a/drivers/net/wireless/mediatek/mt76/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mcu.c
> @@ -58,9 +58,6 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int=
 cmd, const void *data,
>  {
>  	struct sk_buff *skb;
> =20
> -	if (dev->mcu_ops->mcu_send_msg)
> -		return dev->mcu_ops->mcu_send_msg(dev, cmd, data, len, wait_resp);
> -
>  	skb =3D mt76_mcu_msg_alloc(dev, data, len);
>  	if (!skb)
>  		return -ENOMEM;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 87db9498dea4..99f931c08da9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1383,6 +1383,9 @@ static inline int
>  mt76_mcu_send_msg(struct mt76_dev *dev, int cmd, const void *data, int l=
en,
>  		  bool wait_resp)
>  {
> +	if (dev->mcu_ops->mcu_send_msg)
> +		return dev->mcu_ops->mcu_send_msg(dev, cmd, data, len, wait_resp);
> +
>  	return mt76_mcu_send_and_get_msg(dev, cmd, data, len, wait_resp, NULL);
>  }
> =20

This patch seems correct since we run mcu_send_msg just for mt76x0 and mt76=
x2.
@Felix: what do you think?

Regards,
Lorenzo

>=20
>=20

--5pLxOw79BPeYd/sX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0kZpgAKCRA6cBh0uS2t
rMHVAQCNa78vrYtzPu+jYUzOdqNamrK6pERLMwr//WqW6yD/DgD/aawfF0nuNZbF
+GL/u7xR+aqtjBLhw4zMhCAoHrPdPAM=
=sjpR
-----END PGP SIGNATURE-----

--5pLxOw79BPeYd/sX--

