Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2193C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmEpqig2xiKkrBgLdfyn9BPdIHufarBJafkNOXMgZ90=; b=TzIYTAeP92ckLrtISIrZcpdt7O
	W/Y3jauopZMvKGelW0Mzl/zk8qsBbYXjvSS17OS23FfXDZsl4amx2hnBLFHFiCdr2MFUDFr9dpxt6
	/aYwxequ9Lt/yWU+Hysto1gF4xVKQf1ihBTNzgwC0WSs2wHyMSSIR9sLj7yg70lk5TVZqy5Dw65vm
	KYf5xxDfHE0Hezy+XKuFza2jqipzsAm3KHsCXwsvMGzp1j8ZR6oKN+m2+lmKtKGr3SyUjdoDN721j
	Jy/QQo/AzerRxSe0FTOdUOzVnZIo5gJJIsJJpyMjKu0onPDJ8OvQpt7a3K+r2i3G7hYijNL0X/xgG
	F5/23xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msuKi-00DXq9-5R; Thu, 02 Dec 2021 22:13:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msuKf-00DXpn-5U
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 22:13:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3BF262825;
 Thu,  2 Dec 2021 22:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A01C53FCC;
 Thu,  2 Dec 2021 22:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638483215;
 bh=A3raQgcb+4L8AD7EbGTwN4lEFvWI8rGV3Y+jJbN62ZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQ00CU7BoXkCTj19d0qfpwmwcaqBCHzBdPJrXMN3AE5QCtuD4zdM29JlicRbkLFPb
 3CzkXGlLAZ5R/RsFUIKRxH+nMll7Vjg0aGm+jzTWS0rNDMcXBqm7canP1SNugNgB9H
 uuN7BR8paFJ/9B7X/I+d/SQqCu8T7jeTE15tRBiizFxmRwfceWbskvlJ7aDxpi+pfB
 1MeCMV+qpfkRri9bA65ewI+7tggP8nxeaaERJ09VHeLbKDrRtxa4AGhwE/pHFmPld1
 4JlYP2gf5eZcf9iIZRTGo6gW6xrACPgWK8mzBaO+a3/9EraH6XHHhF0o4JDUb29Qse
 v9YNIAL8YYPqA==
Date: Thu, 2 Dec 2021 23:13:31 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jan Fuchs <jf@simonwunderlich.de>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: mt76: MT7921K monitor mode not working
Message-ID: <YalFC7UlCPsCSZqE@lore-desk>
References: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de>
MIME-Version: 1.0
In-Reply-To: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_141337_279129_0A54EAB3 
X-CRM114-Status: GOOD (  11.79  )
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
Content-Type: multipart/mixed; boundary="===============1057762467421155876=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1057762467421155876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MoRz4FRtRneXt4LG"
Content-Disposition: inline


--MoRz4FRtRneXt4LG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,

Hi Jan,

>=20
> we are not able to obtain any packets when packet capturing with the
> Mediatek MT7921K in monitor mode on 2.4, 5 and 6 GHz.
> tcpdump will show you 0 recorded packets. When doing a "iw dev wls1 scan"=
 on
> a parallel running managed interface on the same phy, the packet capture
> will contain beacons and probe responses from the scan though.
> Can anyone confirm that?
>=20
> mt76 (https://github.com/openwrt/mt76/commits/master): commit
> 6fad970893dd26ef6e6c8344b958344254f6362a (HEAD -> master, origin/master,
> origin/HEAD)
> Kernel: 5.16.0-rc2-next-20211124+
> WM Firmware Version: ____010000, Build Time: 20211014150922

IIRC you need to disable runtime-pm and deep-sleep to proper enable monitor
mode:

echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep

Can you please give it whirl?

Regards,
Lorenzo

>=20
> Steps to reproduce:
> sudo iw dev wls1 del
> sudo iw phy phy0 interface add mon0 type monitor
> sudo ip link set dev mon0 up
> sudo iw dev mon0 set freq 6115
> sudo tcpdump -i mon0 -w 6g-capture.pcap
>=20
> Kinds regards, Jan
>=20

--MoRz4FRtRneXt4LG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYalFCwAKCRA6cBh0uS2t
rA9fAQCjuXbjvrk8usgB2jb4Xufp0ODoUjWxtaFKIaacNVV8hwEAo1cq+5rXGfHy
t2QTactR7cLbUSQIL1/MmaqsKzqCIAI=
=Gtqe
-----END PGP SIGNATURE-----

--MoRz4FRtRneXt4LG--


--===============1057762467421155876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1057762467421155876==--

