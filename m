Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FA4C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4526B20739
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4526B20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ebKBVVw6qSOjIbb/ktcybaBNx/VBdF83/oDatLl7k94=; b=LDJ8Oq5GeiQjps45UbKfxqmJK
	RgBLP/E/TPTnTRmXaYQo8LnDREuQyxx82qXXc+mkhbr3+o4E5rX+hPEevBI9Qti8QdcJEBDHEg7mS
	kW0eC3s/m68pXLIKUH7Y7KYq83pPZxcuHB4YHAThtTzocvLRwIEvqo0ywUEBFX9JwUCpPQ8trhlOK
	sqKWkcjsblY72obd3Rs8Rkqq4erv8ypDVVjG+rOnYKH7ffkFg2y4kkOEt0wCm/eXldjGgJLG653RI
	pS0OiT2QiPaY7x0INhLNaDXgIakjBQzdFzIJFxTr1kcSNfOsDc8XKpZuelDiZtD6dToDBUjh0/Ua+
	eg5vpG7nA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwj44-0003mG-Il; Tue, 05 Jan 2021 09:55:44 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwj3z-0003lW-Hv; Tue, 05 Jan 2021 09:55:40 +0000
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
 by pokefinder.org (Postfix) with ESMTPSA id B54AC2C03EF;
 Tue,  5 Jan 2021 10:55:38 +0100 (CET)
Date: Tue, 5 Jan 2021 10:55:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210105095534.GA2000@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
 <20210104182959.GC935@ninjato> <20210104183202.GD935@ninjato>
 <1609831496.23685.7.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1609831496.23685.7.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_045539_743559_4F747E36 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7462280375156987387=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7462280375156987387==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Could you help me add:
> 	Fixes: 8426fe70cfa4("i2c: mediatek: Add apdma sync in i2c driver")

Thanks, added!


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0N5IACgkQFA3kzBSg
KbYv7BAAnDggg4mbm29RRXNwxb2yO9vm0fVbb+W3FGF5JcD6Djg+baJqJwy3JbqU
UjUTSaZsvlhtI9qbWQaO39gnDSsFmVFm8mcTVK1yRAB2KyduAz0zEDPuk8tWGhgR
7LSS8F7OGLPM7iHEtVa1mhb+Wkt4Cq44bgbToXyYQymDgw4qoRWxFMQV2mAdc3xq
ZbzrJvqkDBRKF02K3bA734sTcGnILuA+31ewfgUBGpy5Tqx9I2WyJ5yGKO7DdYwy
+a3TQdrZHnE5LRpYkrZltKvHg5wyy2gL1Z+tLtgZOqzzavaG3TVyJfDzfvWS+ttv
1gke0PG5G7BjovGfDKoeNX2kYc9UyMNALebIv+aw3zqsOcfoMXrRHM3dsnsfAAKa
xnv4NqTeuGIbBNHEvje0AwnlOyMnsu9t8vwezwUNFk2jJmPDbEEHOcczS6ClXtnw
/AZraLbdipJqXMx/jDHAov2OOaSCu2gz0gaIyOc+coDJ9El2kbqQs74OS9wL/Jlg
V4YRaRi4f7yd1zrMwHUXv+x5MMMb/s3tJVVuSNyKeGosZ/893IfKxFUPmL1gUroh
Af7eyqY8X2FvzFA7AKSCY2Az/fofN4DZxA+2gGTHz35b1TRQdKWpuIOoK3JsK0Vk
yT1uFZOnDfQus358NOi+I6Jt2uK+BA5rRXKLyg5sQsqbz9L6cGE=
=cDDG
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


--===============7462280375156987387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7462280375156987387==--

