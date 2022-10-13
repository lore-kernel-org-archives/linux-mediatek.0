Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D08BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTNYopgtbiILVgQC03TdOSCy7LC9F6xBvBsVZFPrUac=; b=UKueD09fhmcFAnKDmV7GvNAl7Q
	k+9QCuD2WJ3IWaNDw/9MOsEmTBbUVQxviCyLrYZ1K8KfoPvDGbNLI74xM4jGrXIwKjBZZP/QzPWv0
	yOOe1yueaRAc/UOA9nDzYSNtFEakmtZgCqnk0RzXqM+7yviz26DzGVAEI6P5I4CwqI8GOQjUDWRu8
	e9j6SNf7RLgGDg0758CwPzO4U3Tc3apAg4uOB1U7ZkGi1zKyx3cWlgwYX6xA+ipPZy786yLSXeaoD
	V/KTENuvLS71JXXKd+vsXFVkdiMvbfcrVwq8AI7we/dy+5mmsbQ915dvwTALZutayUjuLHqEWUWil
	5Kxxr0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj123-00CQYN-Kj; Thu, 13 Oct 2022 16:26:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj120-00CQXa-9o
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 16:26:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFFD1604EF;
	Thu, 13 Oct 2022 16:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C18C433C1;
	Thu, 13 Oct 2022 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665678358;
	bh=0ZprB8JJOEWP6AIX59mAnfcvCDhO84Hoakg5vDW+wH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDBhHIlywcm0Sj5MTFIEnPCiTB+Xr1BVPbpE37MzVoV2EG+QsFrYKsLUPz9QZLbNF
	 fWZORxKHM98pJ9/qB91fTNMKE1TDk5YyvFVRaREVcOa6HQzNgMpsbzoTId9rEr1jgi
	 2+zZ9PCP+OzXmQk2dv5W4OVPv403110N1WAjRI5zs+XGgEMX8tRCsO5shOYYSgR2su
	 NDC1pp6IIRr8TRPJ3gS7ItZHXcyZIXkWlJSalwLKnVMTYdrQlw8QgJRVADBNgdx6+1
	 L3zipe3cmT4SGFSphbhQ0r5/NKkoQruzY1syNNHvjEwVotDIDopIr0MTTb5pXFoN1y
	 iUsO3sMS1UYnA==
Date: Thu, 13 Oct 2022 18:25:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] mt76: implement functions to get the response skb
 for MCU calls
Message-ID: <Y0g8Ev4hE7m/kP3H@lore-desk>
References: <20211008130007.GA23161@kili>
 <9298fd82e4b49b965e9f26957510b9e968e8b691.camel@sipsolutions.net>
 <20211008142734.GI2083@kadam>
 <Y0gM2jeo/X5Vq+lq@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DOS5cU2t4woqfPoR"
Content-Disposition: inline
In-Reply-To: <Y0gM2jeo/X5Vq+lq@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_092600_458281_E34F2410 
X-CRM114-Status: GOOD (  31.76  )
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


--DOS5cU2t4woqfPoR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I would like to revisit this question.  Last time I complained about
> this Johannes responded but he misread what mt76_mcu_send_and_get_msg()
> does.  I have looked at it as well and I also cannot explain what is
> going on in that function.
>=20
> I have looked at the callers and my first instinct is that maybe this
> is dead stub code?  But then when I look at mt76x02u_mcu_send_msg() I
> think "No, this is not stub code.  This should be returning the newly
> allocated skb to the caller."
>=20
> But then I think, surely at some point someone tested this code???  It
> must be stub code.
>=20
> Could we get some clarity on this?

for mt76x2 and mt76x0 we do not care of ret_skb (in fact we do not run
mt76_mcu_send_and_get_msg() directly but we rely on mt76_mcu_send_msg()).
For mt7921 we set mcu_skb_send_msg function pointer and not mcu_send_msg.
Moreover mt7921_mcu_get_eeprom() has been remove a while back.
Am I missing something?

Regards,
Lorenzo

>=20
> regards,
> dan carpenter
>=20
> On Fri, Oct 08, 2021 at 05:27:35PM +0300, Dan Carpenter wrote:
> > On Fri, Oct 08, 2021 at 04:03:10PM +0200, Johannes Berg wrote:
> > > On Fri, 2021-10-08 at 16:00 +0300, Dan Carpenter wrote:
> > > >=20
> > > > =A0=A0=A0=A01146         ret =3D mt76_mcu_send_and_get_msg(&dev->mt=
76, MCU_EXT_CMD_EFUSE_ACCESS, &req,
> > > > =A0=A0=A0=A01147                                         sizeof(req=
), true, &skb);
> > > >=20
> > > > If mt76_mcu_send_and_get_msg() calls the dev->mcu_ops->mcu_send_msg=
()
> > > > then "skb" is not initialized.
> > > >=20
> > > > =A0=A0=A0=A01148         if (ret)
> > > > =A0=A0=A0=A01149                 return ret;
> > > > =A0=A0=A0=A01150=20
> > > > --> 1151         res =3D (struct mt7921_mcu_eeprom_info *)skb->data;
> > >=20
> > > Looks like possibly 'skb' is always initialized if
> > > mt76_mcu_send_and_get_msg() returns 0 (success)?
> > >=20
> >=20
> > This build is with cross function analysis enabled so Smatch looks for
> > that.
> >=20
> > The problem is that the caller has to know if dev->mcu_ops->mcu_send_msg
> > is NULL or not because if it's non-NULL "skb" is not set.  Perhaps that
> > means it should be separated into two functions and we pick which one
> > to call depending on whether the pointer is set.
> >=20
> > drivers/net/wireless/mediatek/mt76/mcu.c
> >     54  int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, co=
nst void *data,
> >     55                                int len, bool wait_resp, struct s=
k_buff **ret_skb)
> >                                                                        =
         ^^^^^^^
> > This is the parameter.
> >=20
> >     56  {
> >     57          struct sk_buff *skb;
> >     58 =20
> >     59          if (dev->mcu_ops->mcu_send_msg)
> >     60                  return dev->mcu_ops->mcu_send_msg(dev, cmd, dat=
a, len, wait_resp);
> >=20
> > The function pointer doesn't set *ret_skb at all.
> >=20
> >     61 =20
> >     62          skb =3D mt76_mcu_msg_alloc(dev, data, len);
> >     63          if (!skb)
> >     64                  return -ENOMEM;
> >     65 =20
> >     66          return mt76_mcu_skb_send_and_get_msg(dev, skb, cmd, wai=
t_resp, ret_skb);
> >=20
> > But this does.
> >=20
> >     67  }
> >=20
> > regards,
> > dan carpenter

--DOS5cU2t4woqfPoR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0g8EgAKCRA6cBh0uS2t
rCVPAP4rEv8YfBHfUwLvkIVSKOH+whFxPKd0hF+QEAQNYifD8QD6AtDBpfK5YWO+
7d88bOrTJFkglOlVFYDqN1eO+DqSMgE=
=dXar
-----END PGP SIGNATURE-----

--DOS5cU2t4woqfPoR--

