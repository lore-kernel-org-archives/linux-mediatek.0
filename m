Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCEh51OBFenEVG4YGKxPV2Yo+PgpkycJ91MZymCtfbE=; b=ybyYz0MzGey75dRRhLS+nrmUpY
	aDa6fAdQunMryO1zM+5hvAEJdv2tCseOpFhzj6pvKYUakKzc/PzFU/8G1crauZaPpC5ONViKEkq6b
	tcmaJ95ANfqX02cxNpZ5AycEnG5kRDQB7wsbZUSBctE2bIPi3T9qY6ESp2YeM6CjK/qjjI6KaYY0f
	H50bWOB4wfG1lzoCsSr1RQdA/ii9MWff149j3VWEBFftnNNqyiUPcw5lKM4h0OtH2jQCV3T49lfqS
	5AguppiNES9PM43UgF9C/COEkVoRxpA+mDBFPLGHpR1h3yMjXLjbWmFP5GxWLoQy2CmazHi3KXno5
	Kmoo95FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nO0JA-008GKd-C9; Sat, 26 Feb 2022 16:52:36 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nO0J6-008GJq-7d
 for linux-mediatek@lists.infradead.org; Sat, 26 Feb 2022 16:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1645894348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLPL/6H4X8JcWElgBNuArS0y3HgdcFKjMdKjusklxFQ=;
 b=pDvXaF/ldZx3ONow1Fc8fd3uVwI5adOOJ+RxnUAqpHNHuzRZ4z79V4tk7Stq8dtWJAPqdD
 kK9narwgeqAzI0mMOwQGuG2S9yY2SfGOZmDjwEWo5fTqqnlceI397dI3GWnriR8i3mVsES
 A6v1G5io42NTd3HQtzHr9tXChI08pTE=
From: Sven Eckelmann <sven@narfation.org>
To: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com
Cc: sean.wang@mediatek.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mt76: mt7921: fix up the monitor mode
Date: Sat, 26 Feb 2022 17:52:24 +0100
Message-ID: <4323212.fGEXD0vb5m@ripper>
In-Reply-To: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
References: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_085232_626527_EB578DB0 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8999262282101304119=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8999262282101304119==
Content-Type: multipart/signed; boundary="nextPart1807988.6yI58s65Oh"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1807988.6yI58s65Oh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com
Cc: sean.wang@mediatek.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com, jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com, jemele@google.com, abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mt76: mt7921: fix up the monitor mode
Date: Sat, 26 Feb 2022 17:52:24 +0100
Message-ID: <4323212.fGEXD0vb5m@ripper>
In-Reply-To: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
References: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>

On Saturday, 26 February 2022 01:26:14 CET sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Properly set up the monitor mode the firmware can support to fix up
> RTS/CTS and beacon frames cannot be captured and forwarded to the host.
> 
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: 1. add Tested-by tag
>     2. make mt76_connac_mcu_set_sniffer mt7921 specific
>     3. align the structure declartion
> ---

Tested-by: Sven Eckelmann <sven@narfation.org>

Tests were performed on

    mt7921e 0000:05:00.0: ASIC revision: 79610010
    mt7921e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build Time: 20220110230855a
    mt7921e 0000:05:00.0: WM Firmware Version: ____010000, Build Time: 20220110230951

Thanks,
        Sven
--nextPart1807988.6yI58s65Oh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIaWsgACgkQXYcKB8Em
e0aKrw//Vssi6/2O07yKa5Mz81cMImd530oXNbbubFtUBT7JHnA5nfqsiZbDyE2s
0oot4btSgkKhiqkMXiQiTb8p40yhZuEk9Tj7lm9ldo91RpQw9DIk3zAPZF5nrqNP
3UMuczn9qyzrvX9b+0cweVSavMtpd15JtxsbuWth2o+9iUuuonW3D9y0JRuQvXYq
ktg312fyfRV/VT/rZSipV53VKzSxA/vFb0Xw/9z2V+N8X3GgW9gOz8O4IToVNaTX
9SVBpHfvC7u7g5le905ibycredKmYdLTBB3PMAY6vLb2z1DEWiunkIBRlMyt0svN
C38NDCI2HAiVyrCDWC/xfobunpUKJI0cGwrqoL15GKhABta5oIdDfNmZ2Y3x3uy0
BjR6IKXvSMEVS/575Dyp6mCzBqMHVtN7QclG7CW3jTvAZEJLQqSL1rubgP2AD8gf
H6fGU6x8Ox/4Kmyl02pZOugzz+U9DqL23+IapvAh8UE54yF9uZWdg2ApvEUPyIh8
06E9AcC3wEfRbE6fYxO2tgsf3lRrtbA3FBU5eyd216RY+EgStHb94P6RfaEIp/5h
ukzypqCBG6Gn1460DpUkMfcX9Akr4R32X2XEBdQWFSBDymUjqj1fN6ONjB5/DkUJ
jEErzACmuPtOkEO2Xo2M8TKLVI7kZahdSoLUsuGA13sjBNRjpBQ=
=mdII
-----END PGP SIGNATURE-----

--nextPart1807988.6yI58s65Oh--





--===============8999262282101304119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8999262282101304119==--




