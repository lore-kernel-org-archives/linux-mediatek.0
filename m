Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaZRxh9ASi+5xdUVIIhGOjftT0naxzdXgUuThw7JNZQ=; b=e8yq+Qt3+jsoJD2+gwFd5Avpmf
	5WDTCpN2IxF4pAtdmkxhGQLdasdyGf5sKlNFC7RU/fcSEv6Zeqslqo5G9urNDMmgSH9D4kq9NfWUQ
	Y6mCP+T8ECC/a9j+O93TxK+6qDIULW7mKFE2yg+4FO2dlURIEzczqK/nJRrw89j3quQyPi7lGjHgJ
	uaRm6A+JE8WbExU0d+Q2JY2DXdiv30psbz3WOcfEJDqcsg9o/yCCQK3smbEGM8ZFYmvbFqnrGbGaa
	nBEqTDSD6U3taZj3xJDGXbM0gaoAau3pz2P689ZlQVRsxHMtk1bOHcqs7j/lN4trKbHANRT0Di7jq
	iTDFHOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxy4U-007coC-UI; Thu, 16 Dec 2021 21:13:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxy4S-007cnP-2C
 for linux-mediatek@lists.infradead.org; Thu, 16 Dec 2021 21:13:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08D8461F6F;
 Thu, 16 Dec 2021 21:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C0BC36AE2;
 Thu, 16 Dec 2021 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639689226;
 bh=MS5FF1VG4IZiTLDz/nnBsePZTzIr2R/HGLdh82hp7Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHTULAiOiNPdaVndChiufNR3O16WLnlntyAURgw+xy2RE7teQfWtXzU5sEqY0qslt
 hda5ucWwWlc5FXlxfC0sln614R4NXl8xMEuXVLm0g+m/xZ0Io1JkyYAcWCoFNl0cAS
 BawLfVz/yzc0vlQ0hGG5nle+tj6mLFXr4jHOzZYvnCmLpMIQrPEx7XeAPjunykGw1E
 p3rCZOpKSnGF2uZU8P76Bp5aS0oXh5QJXmJ/0UlPNCWcUeCkXdBZr2H8qwdUbsvaJx
 FAGoqKNeoWfcftxAXgdyk0qj2an8OyhVOi1xgop225GmkYbWdWNNrsJvfj/sfDGBxU
 uuYGlfPfri19Q==
Date: Thu, 16 Dec 2021 22:13:41 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name,
 jf@simonwunderlich.de, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Message-ID: <YbusBazb4GAC6YQl@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate>
 <1638579304-17794-1-git-send-email-sean.wang@mediatek.com>
 <12706913.cppxkphV4n@ripper>
MIME-Version: 1.0
In-Reply-To: <12706913.cppxkphV4n@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_131348_236068_F43E035D 
X-CRM114-Status: GOOD (  26.69  )
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
Content-Type: multipart/mixed; boundary="===============2844306410272152554=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2844306410272152554==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDTqb8Ng6mZDpRDO"
Content-Disposition: inline


--sDTqb8Ng6mZDpRDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Saturday, 4 December 2021 01:55:04 CET sean.wang@mediatek.com wrote:
> > >ack, I agree, but I guess the point here is what is the difference (fr=
om the fw pov) if you disable runtime-pm/deep-sleep before/after the vif is=
 added. I guess it is supposed to be the same, right?
> >=20
> > yes, it is supposed to be the same.
>=20
> Two things which were noticed too:
>=20
> First finding: If I run `iw dev mon0 del` after a non-working tcpdump dum=
p=20
> session then I get following error messages before my complete system fre=
ezes:
>=20
>     [  492.812050] mt7921e 0000:04:00.0: Message 40000002 (seq 14) timeout
>     [  492.818587] mt7921e 0000:04:00.0: chip reset
>     [  495.883934] mt7921e 0000:04:00.0: Message 00000046 (seq 15) timeout
>=20
> Second one: We cannot see beacons on 2.4Ghz and 5GHz when runtime-pm + de=
ep-
> sleep is set to 0.
>=20
>=20
>=20
> Regarding the initial problem: following works (when ignoring the missing=
=20
> beacons for now):
>=20
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/runtime-pm
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/deep-sleep
>     iw dev wlp4s0 del
>     iw phy0 interface add mon0 type monitor
>     ip link set up dev mon0
>     iw dev mon0 set channel 11
>     tcpdump -ni mon0
>=20
>=20
> What is often not working:
>=20
>     iw dev wlp4s0 del
>     iw phy0 interface add mon0 type monitor
>     ip link set up dev mon0
>     iw dev mon0 set channel 11
>     tcpdump -ni mon0 &
>     sleep 10
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/runtime-pm
>     sleep 5
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/deep-sleep
>=20
>=20
> What I have seem to break sometimes (but cannot reproduce reliably):
>=20
>     iw dev wlp4s0 del
>     iw phy0 interface add mon0 type monitor
>     ip link set up dev mon0
>     iw dev mon0 set channel 11
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/runtime-pm
>     echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/deep-sleep
>     tcpdump -ni mon0
>=20
>=20
> The channel 11 is rather busy. It is for example also used for our commun=
ity=20
> mesh network in the city center - so is rather easy for me to see that it=
 is=20
> able to sniff traffic or not.

Hi Sven,

can you please try the patch below to see if it fixes the crash/hang in mon=
itor
mode?

Regards,
Lorenzo

=46rom 2502ead5ba1f580d63bbc65165acb0139dc94ed8 Mon Sep 17 00:00:00 2001
Message-Id: <2502ead5ba1f580d63bbc65165acb0139dc94ed8.1639689141.git.lorenz=
o@kernel.org>
=46rom: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Dec 2021 20:40:16 +0100
Subject: [PATCH] mt76: mt7921: fix a possible race enabling/disabling
 runtime-pm

Fix a possible race enabling/disabling runtime-pm between mt7921_pm_set
and mt7921_poll_rx().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 3 ---
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c  | 6 ++++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers=
/net/wireless/mediatek/mt76/mt76_connac_mac.c
index af43bcb54578..306e9eaea917 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -7,9 +7,6 @@ int mt76_connac_pm_wake(struct mt76_phy *phy, struct mt76_c=
onnac_pm *pm)
 {
 	struct mt76_dev *dev =3D phy->dev;
=20
-	if (!pm->enable)
-		return 0;
-
 	if (mt76_is_usb(dev))
 		return 0;
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/debugfs.c
index 7cdfdf83529f..59b047dceca0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -276,7 +276,7 @@ mt7921_pm_set(void *data, u64 val)
 	struct mt7921_dev *dev =3D data;
 	struct mt76_connac_pm *pm =3D &dev->pm;
=20
-	mt7921_mutex_acquire(dev);
+	mutex_lock(&dev->mt76.mutex);
=20
 	if (val =3D=3D pm->enable)
 		goto out;
@@ -286,6 +286,7 @@ mt7921_pm_set(void *data, u64 val)
 		pm->stats.last_doze_event =3D jiffies;
 	}
 	pm->enable =3D val;
+	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
=20
 	ieee80211_iterate_active_interfaces(mt76_hw(dev),
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
@@ -293,8 +294,9 @@ mt7921_pm_set(void *data, u64 val)
=20
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
=20
+	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 out:
-	mt7921_mutex_release(dev);
+	mutex_unlock(&dev->mt76.mutex);
=20
 	return 0;
 }
--=20
2.33.1


>=20
> Kind regards,
> 	Sven



--sDTqb8Ng6mZDpRDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYbusBQAKCRA6cBh0uS2t
rNWVAQCEmO1XHjFoyizzH/sjQVWmUZXszwI88O0/evoQltqvygEAoyCESogs6xmS
LwnmXFArFt/1PwRaguhO2fu6NSD6xwo=
=AvsP
-----END PGP SIGNATURE-----

--sDTqb8Ng6mZDpRDO--


--===============2844306410272152554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2844306410272152554==--

