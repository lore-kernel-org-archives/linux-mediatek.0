Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DbKHdcaMqd8rFcyu0DLQ7jWqLNxxFtQ3HqWRuE02Ko=; b=k9T14w0EWnPuhMJjRkmUQZ5iqK
	EB3/MPLm0NRiTayRfxlBA7fQqPGkrZ5+3dAM6HY601EcvzKZD/a7q4mqkXArkZTDTWSyL3Esu19fY
	9Em4xuOD7j4v1a2RA48XHE3MIifoXjG69z5QFFy7WLfE7vsHqx2lNfoy3wet1Hz7EorIOQmKvv3jr
	sWgHhS6g7hsl1ZLqeN35P8KMdT9hHdv1Q9zpQa8nVzDCpHNJ70e3WJ0NAd3UBXyMYmf+NS2XCrfas
	rfQrrB8Br5+o/gL5rYvPLqkUd2amw8W+Ge1upiFoA0fRk0m+yuoWGDw3JmSgOE/vOckBUcYrJjxPr
	aMJ8O+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JFx-008bje-Qy; Fri, 14 Jan 2022 09:52:25 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JFv-008bhD-2Q
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 09:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1642153937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLaupujYUIyWM+riOpBqKRJ0S0xnm+HoiMPD+r7hoME=;
 b=a7FxUdecDzVAATA4GGXFCiZpb3d591RfqPYPCRADWRzxVViyw6rFh6U9IxyC+BLcvxwHNE
 38o5ct9TUNWJH9IOe//zjTjnTmpii1gbTG6wypQUT1OfhBuDW/t6EOhuurNWebl6tfpmNK
 JKc8LdquZK2Epbmp1UkN3R0bZAMhxHk=
From: Sven Eckelmann <sven@narfation.org>
To: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Deren Wu <Deren.Wu@mediatek.com>
Cc: Mark-YW Chen <Mark-YW.Chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>, jemele@google.com,
 linux-firmware <linux-firmware@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Date: Fri, 14 Jan 2022 10:52:14 +0100
Message-ID: <46921394.S1zCe5f9UI@ripper>
In-Reply-To: <8badb0ca1c11e2060d997c199d20da8a1e0e59bf.1642141259.git.deren.wu@mediatek.com>
References: <8badb0ca1c11e2060d997c199d20da8a1e0e59bf.1642141259.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_015223_462545_99A13505 
X-CRM114-Status: UNSURE (   8.04  )
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
Content-Type: multipart/mixed; boundary="===============6594984400310934020=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6594984400310934020==
Content-Type: multipart/signed; boundary="nextPart3643850.YqUZ2QbrSU"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3643850.YqUZ2QbrSU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Deren Wu <Deren.Wu@mediatek.com>
Cc: Mark-YW Chen <Mark-YW.Chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, jemele@google.com, linux-firmware <linux-firmware@kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Date: Fri, 14 Jan 2022 10:52:14 +0100
Message-ID: <46921394.S1zCe5f9UI@ripper>
In-Reply-To: <8badb0ca1c11e2060d997c199d20da8a1e0e59bf.1642141259.git.deren.wu@mediatek.com>
References: <8badb0ca1c11e2060d997c199d20da8a1e0e59bf.1642141259.git.deren.wu@mediatek.com>

On Friday, 14 January 2022 07:51:24 CET Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
> Version: 20220110230855a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20220110230951
> 
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

This is not a regression but I've just tested whether this firmware fixes the 
problem of missing beacons [1] in monitor mode: No, it doesn't.

Kind regards,
	Sven

[1] https://lore.kernel.org/all/Yd170LnF5Y2D8by5@lore-desk/

--nextPart3643850.YqUZ2QbrSU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmHhR84ACgkQXYcKB8Em
e0YKzRAAyOYq/uNn8TEz9bXXXHShuKspeRz7GT2vYp4yOB0WWjE3lXAzUXkujwoF
s0DV7YDb9sK2l1/JDqUVnilfGR1o5aDXe76eo5ICDqiqzAgbrWdjdPmROvYDBp2t
us7JDNoNbWS4t377TiRZFhDX3Il8uSmSUzsWM1bo7kLNB6Vv0OFDeOjc3CHJC3of
Va02Xfo7+rhz6n/qVxjnDLOa86VctR6was3LBpZ8lBXPvhNfIW/x/VdjJcdpTqLu
zsVHYGdLASOMsWJhbDIHeJVKlF/AODgI6/OXWcQVbbrrTu69oecIF8KbEbM3rGYp
T0kZisepJrL456NEt7M+GYD61LXzPnEOgymoqLyG+YNT+4S+bqTlt6aXU+CmkxPq
Xe5tIwMl5XZdTwBY8n8tM1fg2BrCZ8W43lCGgOyRUKrqvABhJuwcuHXegru2SKY3
zb6k4uxib1S9WZrHC3Z/0VSEithnMusMQ0h3AHzmtpOItw/HnUOxvhCx1DhX60D8
tUretH3qCtkgV473tSgmuo6io1FKS5loowOE1vmQsTRFZlEcm33smPKkhhfvnTrX
GxXubSwkQj1rO17tt8vFKrlhosPHC75CWjjsqkvTD5qgBQFyey580uLBoIQ2w39R
Jx89RD5VPyNoSsSU8JJDlk0a4GNFGpGhCISoMQQ+JlH41iRSovQ=
=QAbs
-----END PGP SIGNATURE-----

--nextPart3643850.YqUZ2QbrSU--





--===============6594984400310934020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6594984400310934020==--




