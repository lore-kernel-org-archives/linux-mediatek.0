Return-Path: <SRS0=qrwZ=H5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683E6C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 10:23:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4E464EDB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 10:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4E464EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDVobUF0UzkVmlRsLK59QAJiSUmRC0+dx7up/Jiw/gI=; b=kF0ywnypcSBO5hOwyF3raZk2l
	7iZY+52Xt6cweOOnQOTXk+ivxmII6ir1fGEW54E7k4lyFv7RWqlKGFF6dcP88flSbJFPovN8FnP7T
	PN5O5u2xpfGHRih5kBwAZtr6/NPXQR4u+jeE9YGnF4q8M6RmIUNfuSGQaS6U+QjFZlucPp+taq+ek
	ybOyx4AyuisT8iO/UISP3hW/0+2wTpU9hlYIR2lurK7Nb3iPDWD4b1Hbp0hk22Ef9H81hRpvkRVXs
	kFLcMMzVruwSTnZhYM70CkESHLInrsCHk8QtcuvPWFJXwx8BJ8KDN0tjD1hH6Zf4AOBtwqq+wRNNq
	IUF9uIG4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFwlE-0004zN-3O; Sat, 27 Feb 2021 10:23:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFwlB-0004z3-Fg
 for linux-mediatek@lists.infradead.org; Sat, 27 Feb 2021 10:23:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABDAB60C40;
 Sat, 27 Feb 2021 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614421420;
 bh=d35awyMx+zvfndcIRzL/TRwPxUZq9gKbGdfr7GTZCcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UR9Ehi6uCdnsbVwfGY6AvK1tRzMZUbnFR6YdunRnYqMFRww+JbomdWimjdWY++PWf
 u/+MTU5FY9pAvep1gm+5TeF5Dl6R3VI0UFzp8/wPtk4GitAbMFhWvTTsVbKdxFJuGO
 KOJs3dEsO51CSEsVUqv8OcU3HiP31ObqZCfutzQEvuMnTLP4wxHNPi/gjbFK3WgUtw
 mM+hiD53nebk1dhl822kYAGUgoOesFFRVrJeHVQvF7Jr7283iZ3HgZ+cwC8cFxLeC1
 eAxraAjVJuxAT/1JhcA5xX/JFfA2myAplSd8x88/xPZQCnZ6o9v3J3+iAJMKxAtGEz
 tDUcIRi5i2OeQ==
Date: Sat, 27 Feb 2021 11:23:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 2/5] mt76: mt7615: stop ext_phy queue when mac reset
 happens
Message-ID: <YDodpxIQzPA8754l@lore-desk>
References: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
 <3794a3ffadc4a08548a1223e6955671977e78e49.1614411256.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <3794a3ffadc4a08548a1223e6955671977e78e49.1614411256.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_052341_627755_109663E5 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============8397462999493548535=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8397462999493548535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z3bhdhiqw4YTHhg7"
Content-Disposition: inline


--z3bhdhiqw4YTHhg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Stop Tx burst for ext_phy after mac reset.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index df2dc77a323a..0f613063c1ff 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -2085,6 +2085,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
>  	del_timer_sync(&dev->phy.roc_timer);
>  	cancel_work_sync(&dev->phy.roc_work);
>  	if (phy2) {
> +		set_bit(MT76_RESET, &phy2->mt76->state);

Hi Ryder,

since we run mt76_txq_schedule_all then and mt76_worker_disable few lines b=
elow, what is the point
of setting the state to RESET?

Regards,
Lorenzo

>  		cancel_delayed_work_sync(&phy2->mt76->mac_work);
>  		del_timer_sync(&phy2->roc_timer);
>  		cancel_work_sync(&phy2->roc_work);
> @@ -2118,6 +2119,8 @@ void mt7615_mac_reset_work(struct work_struct *work)
> =20
>  	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
>  	clear_bit(MT76_RESET, &dev->mphy.state);
> +	if (phy2)
> +		clear_bit(MT76_RESET, &phy2->mt76->state);
> =20
>  	mt76_worker_enable(&dev->mt76.tx_worker);
>  	napi_enable(&dev->mt76.tx_napi);
> --=20
> 2.18.0
>=20

--z3bhdhiqw4YTHhg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYDodpQAKCRA6cBh0uS2t
rAo6AP9KKosBajGY7uX6nsVb1rdvB8jy/jMYre+3BCnjSVydvAD8CNYS+0rQnZll
0oVEPkDnr0WIeOzN2rSdUrrqI1WZdQY=
=nEED
-----END PGP SIGNATURE-----

--z3bhdhiqw4YTHhg7--


--===============8397462999493548535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8397462999493548535==--

