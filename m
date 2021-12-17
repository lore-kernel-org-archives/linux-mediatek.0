Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C184C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmPTVLYQrQEKsLQSOOzvay6bb/ZYhhHox52k0nMTWyU=; b=IO+bTaiuPweme8Q4oC9+r6tXSw
	vqUv6f0YOdzvzH3JpYHTfrtKldBl6TPWrOsBORyhCvCMAljGEHYwtzfNGGfJ0CPLBr96JWrkJAu17
	7xfI+sSSEejDXG9nSmhZMjbu7AtTS/Z3x8Yqi40BGcpweAkR9X6DtEx6IqLNYK6n2byd5xBaBq1NA
	qR8C5jh/ydvOlRf7K0P1GgfrpWV4B7uvLuaEiH5r1bi2aUgzgOdrexTd5tfmj/SqulL15ttFGRhq8
	XYjWRCFEy9Uq5ugFWxDmUFFme6OOmEoxv1Y6F0TVbkwYTvS77N6C43tYcSZk/W0ho8GooEW+/zDW9
	fNBPgxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my7pH-008sSj-I2; Fri, 17 Dec 2021 07:38:47 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my7pE-008sP4-AX
 for linux-mediatek@lists.infradead.org; Fri, 17 Dec 2021 07:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639726710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x11yMX0KsbJcjPNKUQ/1GVC9s0S6w50A5zeidXkvOPc=;
 b=B9irIFy+SpUutOy1WR+v4AfT5S22njqyJftQpewPNxmQRe6I9Pf5ZorzNwGVFpq8tSojWI
 zovZYvUzkifoEaQcs/SLh/SQqWPe+wY+D262mHIrPrHRUHXIfJiH1mWjIGmtWXy1Pdg1uD
 WAma4+jwO2P/Bs/BDmnhQlSR35nJ3zI=
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name,
 jf@simonwunderlich.de, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>,
 sw@simonwunderlich.de
Subject: Re: mt76: MT7921K monitor mode not working
Date: Fri, 17 Dec 2021 08:38:27 +0100
Message-ID: <2379616.QugRJdfsTW@sven-l14>
In-Reply-To: <YbusBazb4GAC6YQl@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate>
 <12706913.cppxkphV4n@ripper> <YbusBazb4GAC6YQl@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_233844_549776_42D3FEB3 
X-CRM114-Status: UNSURE (   7.56  )
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
Content-Type: multipart/mixed; boundary="===============6660919268629929385=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6660919268629929385==
Content-Type: multipart/signed; boundary="nextPart4742295.SFTHtOJNxW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4742295.SFTHtOJNxW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name, jf@simonwunderlich.de, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>, sw@simonwunderlich.de
Subject: Re: mt76: MT7921K monitor mode not working
Date: Fri, 17 Dec 2021 08:38:27 +0100
Message-ID: <2379616.QugRJdfsTW@sven-l14>
In-Reply-To: <YbusBazb4GAC6YQl@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate> <12706913.cppxkphV4n@ripper> <YbusBazb4GAC6YQl@lore-desk>

On Thursday, 16 December 2021 22:13:41 CET Lorenzo Bianconi wrote:
> can you please try the patch below to see if it fixes the crash/hang in monitor
> mode?

Thanks. But I don't have the mediatek card with me and can only test this in 
slightly over three weeks.

Kind regards,
	Sven
--nextPart4742295.SFTHtOJNxW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG8PnMACgkQXYcKB8Em
e0ZJXxAAqLsrz0RPe0KAydHDa/+D1RrY/pCqVqDZcFyAUzww8J3K7lqbdGlcxoc3
PlvoYCWsIJiYpIxRcshYkdEGAIN/RdqzUtpEDQgF+EYqrNcE3BbKBy61zvwGKLIU
jd7/aePHPD4Hf4gXPrsHuPTlHMPy88k+9w7VUhvq2jXl+irlQ17QHafdpL+fhiDp
vtzMKBo+z53tcssRdabBxnaB/2FMzps/WrnGf2q1LXuqtOJpPKst6kmDpBVpO6ju
E6uQIf6wjjUYpxRApL8s/j7RvuF7yDYc3WgxsOlWbm11b1oszWd7WsxUSRfYEIlw
3W2TFOAKMXOR+nZATaMMJY5C6yi+vrTiyQq6d/5ncHbldogq5Aa0L7MGmKcbASus
Li51h9Y+LaHbYVqacG/ZM4vzJ8VLJ2W6hs0I1RqQtAcx0xxsr75OcQKdOzqYqfvD
qpWmn1t0J53/L0gdXL1tK6QMNEwPAjZHeVmB9U/5PKn+soQj07N6sCA2oNtZecXn
M9E6cIEGL+Cl5qRQcGu/IoJ9UZYBhFT3bq/qmwZ/SbR4CLUSNSY1bmxW+jIjmBbK
sunJmNTODZ8N6HUUTEEplreUpJzhOC5YV0tdQWJKb4Xgtjz/inq4TPXJdaVZrDlq
Qa3WfXks0XNbbXAE5LDIt+9YqbzlR0KsYDrXbQaSwrMJt2fXoEA=
=6go4
-----END PGP SIGNATURE-----

--nextPart4742295.SFTHtOJNxW--





--===============6660919268629929385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6660919268629929385==--




