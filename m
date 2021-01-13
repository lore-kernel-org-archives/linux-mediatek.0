Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6B8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C8F23340
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C8F23340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m/GaRT76HGsbfHuhNb9eQv4ui7qC8dB1nwRqdhfVR0A=; b=otovOMlga2l3ayJAUfeqANcG8
	txTbJn/9EpogtHsYIGB8P878VrII7rRt8KnuKNRCb1XD33QeQLgFOMyB5/zjEQwn7WjZnKRPGnkBS
	FqGwuOLpljrKSEJv+ayo2VEntZqoVrTgD56+2U3yOQBs/rmc9sQZfNoo61v7OKFdLTzbxPShnh5HB
	tGzzN9b8TJJYx8d8YZOEL6KZa1YPfTsep1ijj6ek7SGMvN61y77RCIcFzy9wotM+aTOsURa0lf2jf
	D+BYEgrDaG2B5LvgnDGJrFdPeRgZjtMavlvpCjdoDwYKmcgmkPrYDxRDjcTLhPvuA+6Y1dQecbhXo
	A4vJj2sgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzblA-00048X-5N; Wed, 13 Jan 2021 08:44:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbl3-00045O-Ck; Wed, 13 Jan 2021 08:44:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 996AF20719;
 Wed, 13 Jan 2021 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527440;
 bh=8vD1H3OBrji7Dv+kAqzSHBvZ1Y8zqi+AIhvBHvXdkAY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Dgci0hrZfjczwUjic4g0YR0DrOQaaJoxD6++1tHes235IYmqfyUXt9I1U7cRn/Ckh
 Q92XZgHLG6aDil4yb8JBhMKBdjD4FmDEW7TKVMRa7eMKwWMaRdnWdAVWd8wG17CODp
 bfKkvAUf0VL4jSNZfx9kz9NmNZNpxEE7wrEMb5pRtU1suphFbyPT+9TzpQ94jGDmwP
 i/otaCfe1pXFG5d22KQ8/BOFXMoKlN8NVlgGvzgHU50RVM56wHVbvI1fGfFXmYlOxA
 86V+fvRqPpbhTzbIdjHggKM0icJOBHmAklEXpGG/ZGOi2lwOxhhj9K6HmJLQFXdbI6
 jKHBrIgkyTMQA==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 06/11] usb: gadget: bdc: add identifier name
 for function declaraion
In-Reply-To: <1610505748-30616-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-6-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:43:52 +0200
Message-ID: <87bldt446v.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034401_542566_E9F5BD1A 
X-CRM114-Status: UNSURE (   6.80  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2014482194656024658=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2014482194656024658==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> This is used to avoid the warning of function arguments, e.g.
>   WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32'
>   should also have an identifier name
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+ssgRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQazmQ//bb6xGov90wMn9log/XdzaOXit7VvKbXu
sWNfiu6HJMkqC1OicAh2Wdye5N7zM9+tBSCcQU9Yq792ftvN+9cAlpZS8qBBx/o6
J1A8+XIt591sOpVZi3qxxhzNwZrvsGsnFrUriNVB7YNuxwdfD8/syHMzZvIWXF9R
eZw89PWRbxMPGKDfLOxMLMoyGPdGJGOzzslBx0UXUQ58Fwr8wb/qePz7Gdy0MrLP
FBWniQnRU6KdRUAGC23duAP2bOcejXLwBoCVhaJ07hqoAnnvj5UOhO6UvFORGvCq
+knL/tkeSLUOXythEPBSTNQKAUlupuNGr+fGzg3ot5fETOKtFSJM/QfHKvSnHXO0
ItJiKSuL2RPJxsWzW6XS8856tUUmThheAuB7AY8GbihkuSDnsR7/Wd0aknbgCcRp
mhgO4YslYT+YlopeyT1WY/w0jtoa+aqW0rdiPzzl+sjgOr+k+VQFPsndHNg/eDL3
EjnSMZHUAvcL+ruocOsPPC8rgH9fP/fbBewLioSR4V90om0KyGC3ZEo0Y93qWY2d
3CsNaLw/p0BdZQK2fxyWAu1vw1CNW2RyuvZbidS8vEjM+MCEt73H3JQsxdDH/C3o
4bgPLciJSxfZUa2WC0ioM86aGIGsiEytfzr/VsqiZ/CQ36WLuNlLucz+TLs6pVe7
N9F/E1BXVeY=
=duvH
-----END PGP SIGNATURE-----
--=-=-=--


--===============2014482194656024658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2014482194656024658==--

