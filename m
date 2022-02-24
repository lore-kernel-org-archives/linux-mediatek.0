Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYnpHAN4mMd5jrSCIr4WeHCpYtzDj+YfTsHFKkWuZuw=; b=YocZ9LGugc1BqscwsQ4ksvO9GO
	mBMXy4RZEtJslphJOl0xXSGPXKHZYI5/KnFV2uGkISoSQu/s7jhRaubCdo+Ox5v0ZuFNfEjcBr33q
	sg/wG2A6XjR0tT46aZWtBnI4cY2ZDjBYkfgIy6AepnkgLR1B5IppJXsgd++snVGh4sy0e8p1/3i3i
	BSlaujrZg3Oj1BUidpJEgW2a8p5FbVHvQvGYWXWY8VEEWV/K+bkSC5qy/AFVoUfGivmEN/7FYk7GW
	mPfe6Nh4Fo7p3agDYii/zSFHhclXMTQB/5drEQtmOrU0JK7G45QVOCFmaWd5swYsjlDh/l/VCmBqf
	U222O0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBDl-000I2r-7w; Thu, 24 Feb 2022 10:19:37 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBDi-000I00-0e
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 10:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1645697969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vYJqqUocECM9Hk86yzStCi+K6tyGJI/Kwj8g34mbC7c=;
 b=1CcefIP/19K2U25MWS84ALRWHITWEcFCwScTOeLamFknK9+VsywGbrrdFXY1Ez/5iSU+eN
 jZU7sBALnY4jp3bLE1eLeu4qGricv9FdFUdpKrdUJDQvwEiLL0HXKc8+xgIh3irME63puX
 0RZ0iNlLavkwq/cCnV9JhGJatQd/wJA=
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
Subject: Re: [PATCH 1/2] mt76: mt7921: fix up the monitor mode
Date: Thu, 24 Feb 2022 11:19:25 +0100
Message-ID: <3314617.b7RZopmeeF@ripper>
In-Reply-To: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
References: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_021934_398856_467B9FBA 
X-CRM114-Status: UNSURE (   7.30  )
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
Content-Type: multipart/mixed; boundary="===============1282225928297284932=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1282225928297284932==
Content-Type: multipart/signed; boundary="nextPart1809828.CJMapn5LVL"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1809828.CJMapn5LVL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com
Cc: sean.wang@mediatek.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com, jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com, jemele@google.com, abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: fix up the monitor mode
Date: Thu, 24 Feb 2022 11:19:25 +0100
Message-ID: <3314617.b7RZopmeeF@ripper>
In-Reply-To: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
References: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>

On Wednesday, 23 February 2022 23:34:17 CET sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Properly set up the monitor mode the firmware can support to fix up
> RTS/CTS and beacon frames cannot be captured and forwarded to the host.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Tested-by: Sven Eckelmann <sven@narfation.org>

Tests were performed on

    mt7921e 0000:05:00.0: ASIC revision: 79610010
    mt7921e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build Time: 20220110230855a
    mt7921e 0000:05:00.0: WM Firmware Version: ____010000, Build Time: 20220110230951

Thanks,
	Sven
--nextPart1809828.CJMapn5LVL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIXW60ACgkQXYcKB8Em
e0YjQw/9EnPdFv2OwQvh6Bwr68rYnACaXHR4tJ9VLvQ6Mwynr9B0mnvxIkWb0V0F
lp6aZQyij1m8MKvwqvya66gYo51JK6CU5Wcdb9XCZuBBUgllfWYQ8eDe4uykzcpF
Z5KGfqLlIIwL52KQhkqOkMt0R6i+Rou326wCgjAKKFbpkC41Z/i7LucK+sI6hHfo
WGFW2N/uIUpvQLYz8vGYwzsUZ9Oy6ZbCmzsT06C326lAu2VqHLWmpcMXlqHVmrwN
dava2zNWxK9x2U2AJLzb/qb427X4h3DrS6jDuYK+Tj6PV5yOQevfIPEY00/BANUV
DFVz4avbBThxMnqiX7sUMGGz9UJVsyGC3+QyMGUuTO9m7xcPW/2Ab6wi4Z05WJrp
u0ZRt9HBR57Ocpgr5RUH/x1jvqn2iZmQ6AmxI5BSEf0nliv9q0jSRCigQthmVDC7
KvLma5AxQPNPjbKVA/OzkqpJHAX1Ao3wtnH6Rt/32+prxShJR+APP5mfBDVICGEx
ZDTa4kTdi0tGTFybWs+sSvBx56rPkU85SODPjvkGjw2Z4OUKPqMFxA+FCfP5wqW2
Sh3gq5I606pDAjCAh0zd15gcX76KcDvv3Wy345/ibttpsk80sRq9pEucC98mFJ7Z
iQ6GbaO16M1IBlc/N1JXsvyf4PazJsBzSZEVOPHxW7ZRlL3AfO0=
=mWVG
-----END PGP SIGNATURE-----

--nextPart1809828.CJMapn5LVL--





--===============1282225928297284932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1282225928297284932==--




