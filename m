Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rK1BKUnDKpUviBwjS+ecNO+WnZg6AMcQ7Nt+wg0cxc=; b=jdn9s1d+lSgCu0e+SjU7frQbrm
	9XD3ku7ct/OFvc9cT7IUOiBFclqtgyJ75S4s+QPxJ674l0wGM4EGa2B75Y2Kualthi2Z6mFl8V3wF
	dhHRCx45iMqDD0EY9mM+EqZhGc++qvrK8nENDc1A4ygGcGlanj+muyBiI1Fzx6nbH0Dccp0L0Pk8F
	32oeJBNRdyn2mEzfHaqw1Cb2rnT6lYphkGuHTExtk9L6kwR5aQlEi1cMCIliJ0RM1h7RoSYXocy+l
	Ed8gvaOazGU3JuyafF+PdyzgXenKPAONFlN7eRre/nZ0D8+X9PGOIYCNgxEzix8htPNY69E1zdjb7
	ei0ID/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKt4-00GSV9-Aw; Thu, 09 Dec 2021 14:59:10 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKt0-00GSTO-SZ
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 14:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639061944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8rslS1FwdC6+mnfMg8oxAldamxYdPmhK7VgY20Z0JM=;
 b=IzcZtoVd3D39YHEGONQtIMkASDH+SBLZfKC2ANEC0PXE0/0RSpFrV/enBt7NJV8IjMWNPO
 tsko/yGGBLH2Pu6W7VQUGL43r5TzSxGYVbf/15J3n5ChE+91GctpAN5fVu0oKJONPrAVOs
 bAz2uN1XEMPnUQ/uyiZtVtXwq0WcUL0=
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
 Felix Fietkau <nbd@nbd.name>, Deren Wu <Deren.Wu@mediatek.com>,
 Mark-YW Chen <Mark-YW.Chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>, jemele@google.com,
 linux-firmware <linux-firmware@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, jf@simonwunderlich.de
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Date: Thu, 09 Dec 2021 15:59:01 +0100
Message-ID: <3198471.FQF0JACdhR@ripper>
In-Reply-To: <YbIPFIaya1vKF6bM@lore-desk>
References: <67f30cd5235e2065e6c20cfb4662e4ac72ef6395.1639037336.git.deren.wu@mediatek.com>
 <3841963.FhVex8QpIh@ripper> <YbIPFIaya1vKF6bM@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_065907_080000_8AAA6453 
X-CRM114-Status: GOOD (  11.76  )
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
Content-Type: multipart/mixed; boundary="===============5258092604898551874=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5258092604898551874==
Content-Type: multipart/signed; boundary="nextPart28758891.yo5t8FPOW8"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart28758891.yo5t8FPOW8
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk, Felix Fietkau <nbd@nbd.name>, Deren Wu <Deren.Wu@mediatek.com>, Mark-YW Chen <Mark-YW.Chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, jemele@google.com, linux-firmware <linux-firmware@kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, jf@simonwunderlich.de
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Date: Thu, 09 Dec 2021 15:59:01 +0100
Message-ID: <3198471.FQF0JACdhR@ripper>
In-Reply-To: <YbIPFIaya1vKF6bM@lore-desk>
References: <67f30cd5235e2065e6c20cfb4662e4ac72ef6395.1639037336.git.deren.wu@mediatek.com> <3841963.FhVex8QpIh@ripper> <YbIPFIaya1vKF6bM@lore-desk>

On Thursday, 9 December 2021 15:13:40 CET Lorenzo Bianconi wrote:
> does it occur with an older fw?

Before this version, I've used WM Firmware Version: ____010000, Build Time: 
20211014150922. This version was not able to connect (and stay connected) to 
6GHz at all (so I've used 2.4GHz/5GHz).

But the old firmware version worked fine as station on 2.4GHz/5GHz with 
runtime-pm/deep-sleep set to 1. And I didn't see these crashes when starting/
stopping wpa_supplicant. But I've just reran it with the new firmware and
it seems like this is not 100% reproducible all the time. But when stopping 
the wpa_supplicant would leak to a crash with the new firmware then was also 
a problem to receive packets (not sure about the TX part).

I also didn't see the crash when using runtime-pm/deep-sleep == 0 and then 
setting up the mon0 interface with the old firmware.

But interestingly, i could also see these crashes when
runtime-pm/deep-sleep == 1 and then starting/stopping wpa_supplicant. Just 
didn't notice it because I've never used this configuration before.

    [   95.246429] mt7921e 0000:05:00.0: Message 00000046 (seq 8) timeout
    [   95.252734] mt7921e 0000:05:00.0: chip reset
    [   95.386747] mt7921e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build 
Time: 20211014150838a
    [   95.386747] 
    [   95.407850] mt7921e 0000:05:00.0: WM Firmware Version: ____010000, 
Build Time: 20211014150922
    [   95.447509] mt7921e 0000:05:00.0: Firmware init done
    [  102.403012] wlp5s0: authenticate with 4a:13:65:00:0c:92
    [  102.524727] wlp5s0: send auth to 4a:13:65:00:0c:92 (try 1/3)
    [  102.536201] wlp5s0: authenticated
    [  102.542294] wlp5s0: associate with 4a:13:65:00:0c:92 (try 1/3)
    [  102.555600] wlp5s0: RX AssocResp from 4a:13:65:00:0c:92 (capab=0x431 
status=0 aid=2)
    [  102.582864] wlp5s0: associated
    [  102.716868] IPv6: ADDRCONF(NETDEV_CHANGE): wlp5s0: link becomes ready

Kind regards,
	Sven
--nextPart28758891.yo5t8FPOW8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGyGbUACgkQXYcKB8Em
e0YDyg//WHZBiTC9+jIIJdjPUNzZ+MhRdLrrCnREj8Cs1rZiGja0nd8btXkWvUpz
h7MHwEAj0Ka4gNj3XWdl4NDqQCNCAeNS/J3cFjyrc9rhOts1tAtGc4AsMNO2O/Zs
judT4R+SMhX+ZQSayalzDgc5sQ13NJNdmSwYAXcbFMuv2xX8oHwDtYQd9053STZC
pGqP6oe8FQUKBMy+yVgZit11rknDYC+MVlqta5y4SdlK2VIAx/SWFvcotlgZsnx4
ueLrAnQu0MyikjgbKbVkxFZhbhYF66H++yeAXPQq/Pv0i7g1g6yv3TJaftOMDGWw
vhoh6GBr9ldLd7f2nPWf8yo8ersHbleuGiWbDBG2O1KToMGPJrPCaIuwtGgPy2N/
8omO9forOEdrwChyavOl1uiZAeSxnSIyV64mWJh3zsj3v/VXG+P/yJD7D/Cg6XUx
CONmgDfHPfPQZv438k2Z7EAVdISDV62yQRLkx4VLi77NduB7jnwo2DgjVCaBfITx
mBL+DUZ21jm4m4cd4uW6mq7WDUyo0KwMgc2rb0x19MAvk7tzA2Owi6uWWUTmk65D
xWMUMz0YcNelbUqWqAlMDqP0OleT8iSN9FzCpC3IEF3P9O79FSiqtadn3p5ZVyzU
MppRQX2uA/TBIOQy12VvzPm0j9RRlVrHqWJf3k0umPfHQXmXCZQ=
=meGf
-----END PGP SIGNATURE-----

--nextPart28758891.yo5t8FPOW8--





--===============5258092604898551874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5258092604898551874==--




