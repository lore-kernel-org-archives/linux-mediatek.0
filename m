Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C50C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 15:07:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81E761131
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 15:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81E761131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2c2MaS9Bj00E5vcYOjawNAVUlDUjWDoV+AILqhefrjM=; b=Itb+4gvVv8iiV+U0NDLeDzSPm
	tj/pKeGxaQ2qX2kAxunKuRToWsDogorQLHzVutBhIb/Vz7+072yPCJSCSX3/mGps/LgXVVjX+Y+nz
	msyyYFbfHcsG/LCLF5cDJCDk0nAbIlQkMGO7VK0O9rO/0+Y7jhho/4DtTp7pUKEhLmhfk3dAWo2ny
	jF2m/xqNZvV7Ec1VsbDop6gVEmcWorZVhIMVzafgfImS92YhhlbB7ovknDgApOQoJUAcw38k49HLg
	Tqe7Z60PvUa9eIFSPA3bI7kvzSQGr4jTpioX/QxpfPhl825jW8R5wh953y2NskkFxQUDswTorf+5B
	/OVEavvIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX3ab-00GXug-Hd; Thu, 15 Apr 2021 15:07:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3aZ-00GXuP-E8
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 15:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zBWxi7URNugZ8vpbyoc0dUWsI68LLaY+i7YKim0MEIg=; b=sDRX7M+1z14WRZlbe67kOal/CY
 +X3Lr7asssNzde4+jTeHc34zKgeRSyQUPtDLRLCMRLmrQszQQhh/lHv49OH6Si7eUIP20BrhBfm4d
 0c5aB5DFg628iQSTq4sqP0VQioLoJgBYDaTGVkzKY4mF5sdOdN8CuHll0K9RXwt9DLnyDNiLjL950
 BxIEYrzVCF7idXF94zHOJiDzAfk40FocrrXtXOwmg8cRn6G85rz3T+Z0zEsE4lk2HdOOcLrggTZOO
 f9axAZ2yF6cPDqryAQXQ/EuCQ5RGiqb9LOAtHhN4WTfG4a1NmXeXgeerSX5hrZ+MSN39jRUkzsrdo
 +zlMUmYg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX3aW-008ga2-Q9
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 15:07:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB306113B;
 Thu, 15 Apr 2021 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618499244;
 bh=RmiOkE+yEjly6qFzcvN2j3KCw5xw9cltH9i65fwS0Wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkIMyvVfpCVy5CA4eJCzBb6gOofXw6KYsMXE2z5vt9qQBlbnDGu4X92pEvoBtT6UE
 XL+thrViMdf/HWGKQNq9Y5LcwtlB0u2UWNtdHo1jyN+/zZ5MgHdGCw6fsTFvljQZ1J
 BCuaRC/6lZj6ggAbIalXoQ25xNTZnwrTDtZo/Pk/D4xdQvXBbrfPIEwHmCJggiHx1F
 Cwg5H2W2pOeCmZcxiiL+GEi3RyjZTpx1iLX0usPjNRRaZSIS/FTfKUx0nuXcBfVDi9
 OwBVaHX9TEBTsgbO2tnefRiFCqVkLQqEhrUvzJtWnZHCG1tOgDqCurtAugRTjCeDlo
 CUVvrXrN3u9vA==
Date: Thu, 15 Apr 2021 17:07:19 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: add debugfs knob for performing wifi
 reset
Message-ID: <YHhWp9nwW3ggZtNC@lore-desk>
References: <YHhFXcgsfziGlCag@lore-desk>
 <1618498409-7155-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618498409-7155-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_080724_890432_52B88407 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============2221076546848062231=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2221076546848062231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koRfRL7z2HBwFUUM"
Content-Disposition: inline


--koRfRL7z2HBwFUUM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> From: Sean Wang <sean.wang@mediatek.com>
> >>
> >> Introduce chip_reset knob in mt7921 debugfs to export a way to users
> >> able to trigger wifi reset.
> >>
> >> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >> ---
> >>  drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> >> b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> >> index 024524173115..1342a0b645e3 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> >> @@ -302,6 +302,16 @@ static int mt7921_config(void *data, u64 val)
> >>
> >>  DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7921_config, "%lld\n");
> >>
> >> +static int mt7921_chip_reset(void *data, u64 val) {
> >> +	struct mt7921_dev *dev =3D data;
> >> +
> >> +	mt7921_reset(&dev->mt76);
> >> +
> >> +	return 0;
> >> +}
> >> +DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7921_chip_reset,
> >> +"%lld\n");
> >
> >can we use chip_config for this?
>=20
> i think we can resue the the knob for chip_reset. i will do it in the nex=
t version.

ack, I agree. Please rename the chip_config in something lile reset or simi=
lar.

Thanks,
Lorenzo

>=20
> >
> >Regards,
> >Lorenzo
> >
> >> +
> >>  int mt7921_init_debugfs(struct mt7921_dev *dev)  {
> >>	struct dentry *dir;
> >> @@ -322,6 +332,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
> >>	debugfs_create_file("idle-timeout", 0600, dir, dev,
> >>			    &fops_pm_idle_timeout);
> >>	debugfs_create_file("chip_config", 0600, dir, dev, &fops_config);
> >> +	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
> >>
> >>	return 0;
> >>  }
> >> --
> >> 2.25.1
> >>
> >

--koRfRL7z2HBwFUUM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYHhWpQAKCRA6cBh0uS2t
rIcRAP0bqNspW3EBKaXFKYMxpiP5qAeSRN7IygG6fpZj1jhkggEAlnHQLCAycpzi
+SDATzjZP9EL4s9uhOUop34GaAi/hgI=
=nwD4
-----END PGP SIGNATURE-----

--koRfRL7z2HBwFUUM--


--===============2221076546848062231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2221076546848062231==--

