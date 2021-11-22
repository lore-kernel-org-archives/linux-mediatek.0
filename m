Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onn2u3FXM1VDGoemRez3wzkP1apgGHu5OE7VOy+ce1Y=; b=FcL9mP2fgrEeLkSD9RmF0aErPk
	EJwHWTPuMLZ3O1e201QKILKmOd004ppkkQ9gly/YObRurA5yrzDITnZEVn2F/nwRKGRW9WVS60lhv
	n27oMoG89+ZuPhjuftidgbpJ8qfR8yOJdwhoQBiZ/i1f4gYWWWETfMfh6/XouG4Jni8jqnGNGFj+L
	txP8tb+vh8Dd9XV1V6ykla1c6JoJWNDBcdoumcKgicZwCBJtEL4o740a5d3EvpVQTxTdFymqnHc9s
	P4x0gySnlBOg4Bjq2Sc2jVqCksf5N+P1v0DEN9EdL5QmNZHIZ6i+XXF/C7XOdDKIiJFmEJCZm2YyX
	QOzRMnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpDm5-00HJSo-QB; Mon, 22 Nov 2021 18:10:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpDm1-00HJS8-DL
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 18:10:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F84160C4A;
 Mon, 22 Nov 2021 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637604637;
 bh=PFN2CROc4S+afWA8sCWkdKWg1HgYXMCA/zlJA9iHrs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPd0ptLK+G0guUXtybwpp8xVuOuiDR48peevICOEHk5Hzoe5A5wR062lwESZDZG+n
 yHPIB5Z9slnNUKDLz37MRpZXxopFWcLW1a2ZSTXhImB3btYOfPBiFEvPWNzW4p3ALH
 WS5oNlJM1J0sfbihyKDvInBcg+aEpWqtmznk+8qPEeHtBQHGRMoja72D2KIcDdpx/w
 U6cQy37tRCjIm4ERn8Mg01HdiWPt8pRuu0vqWT2yvJqvyQoShIDwlA8S/3Mc3d0epk
 xzZ3D2kxFgn4y8hlLYZNcH84n+sPX7GFZSACnrMfYZ9j0W7W4f1FfVapZ2LvqM3s5/
 zk1j9RUNkaL7Q==
Date: Mon, 22 Nov 2021 19:10:33 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: lorenzo.bianconi@redhat.com, nbd@nbd.name, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mt76: mt7921s: fix the device cannot sleep deeply in
 suspend
Message-ID: <YZvdGdUYZIIp/LNU@lore-desk>
References: <YWcuGcFPGCtaPh+2@lore-desk--annotate>
 <1637601035-16521-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1637601035-16521-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_101037_526034_5F090DB8 
X-CRM114-Status: GOOD (  22.81  )
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
Content-Type: multipart/mixed; boundary="===============4944834500433458439=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4944834500433458439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4xMxxhlRwqFq70N1"
Content-Disposition: inline


--4xMxxhlRwqFq70N1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> From: Sean Wang <sean.wang@mediatek.com>
> >>
> >>
> >> <snip>
> >>
> >> >> >>
> >> >> >> -		if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
> >> >> >> -			if (!mt76s_txqs_empty(dev))
> >> >> >> -				continue;
> >> >> >> -			else
> >> >> >> -				wake_up(&sdio->wait);
> >> >> >> -		}
> >> >> >>	} while (nframes > 0);
> >> >> >>
> >> >> >> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state) &&
> >> >> >> +	    mt76s_txqs_empty(dev))
> >> >> >> +		wake_up(&sdio->wait);
> >> >> >> +
> >> >>
> >> >> If doing so, mt76s_txqs_empty may not always be true because
> >> >> enqueuing packets to q_tx or MCU command to q_mcu simultanenously
> >> >> from the other contexts in different cpu is possible.
> >> >>
> >> >> It seemed to me we should check it for each iteration to guarantee
> >> >> that we can wake up the one that is waiting for the all the queues =
are empty at some time.
> >> >
> >> >IIUC what we are interested here is there are no queued frames into t=
he hw queues during suspend or reset, right?
> >>
> >> That is not completely true. Take the suspend procedure on mt7921s as =
an example.
> >>
> >> That should be "There are no queued frames into the hw queues right af=
ter mt76_connac_mcu_set_hif_suspend."
> >>
> >> The MCU data and WiFi are all handled in mt76s_txrx_worker so we
> >> should synchronize all of the Tx queues are all empty and then handle
> >> mt76_connac_mcu_set_hif_suspend to guarantee mt76_connac_mcu_set_hif_s=
uspend is the last one to access the SDIO bus and there is no frame that ac=
cesses SDIO bus afterhand.
> >
> >ack, correct, "there are no queued frames into the hw queues right after=
 mt76_connac_mcu_set_hif_suspend."
> >What I mean is we are not really checking there are no frames in the hw =
queue here, but mt76 sdio has processed all the frames, got my point? maybe=
 it is what we are looking for..
>=20
> It seemed to me there is no a way to check if no frames in the hw queue f=
or mt7921s
>=20
> I think we can discuss the topic "it is ok move the check out of the loop=
" with another patch in the future
>=20
> because it seemed not related to the patch.

sure, fine to me.

Regards,
Lorenzo

>=20
> >
> >Regards,
> >Lorenzo
> >
> >>
> >> >
> >> >>
> >> >> >>	/* enable interrupt */
> >> >> >>	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
> >> >> >>	sdio_release_host(sdio->func);
> >> >> >>
> >> >> >> Regards,
> >> >> >> Lorenzo
> >> >> >>
> >> >> >> > --
> >> >> >> > 2.25.1
> >> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >>
> >> >

--4xMxxhlRwqFq70N1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYZvdGQAKCRA6cBh0uS2t
rAOBAQDPXyiptC49D6WH6nCNkYxDwpmkEfAXXVJ/h4rf7kcNQAD/ZHfX0Vb/Rhvx
HMXd7wt5kW94R0MzviYqoDxnVz53sAY=
=kLhc
-----END PGP SIGNATURE-----

--4xMxxhlRwqFq70N1--


--===============4944834500433458439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4944834500433458439==--

