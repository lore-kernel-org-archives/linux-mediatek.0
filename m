Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FFDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB2523340
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB2523340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ws6QacYPdzJW2SellNU66ikPyYfkA4IEimYpbu/PxY=; b=lXem82q4fVFcBuYaUaL5LpHOL
	ZgOkf4tgPQGVnls2icc5hmO6KufGfKlaJa49GqB0JONheQwkw/673GRhvKGxfUP8E3Y/fDAuQLBPR
	OuJ5Yc93Nrbx/VpWP1zyUqXBhaTaYIc0VTTo4vcl8SImH2eCnk9eZCJ3G3ZPYI/RKawbvi+KY9QS0
	Tq7y0yV3ZUtldeDckK82keq4Ob4g58xnsMtY9i87RaSKHZqWSk+cHIzfbV0CSAzlFTaoKHMJtP10Y
	4o+4YgEv2Rhh3rfVrnCaWBWCdbWbMLiqZ0MVRD7Tkf1LLD6LUAMnB+L485MDenToWKMWKEmNoLRq1
	pNS9Q0gig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbmE-0004cs-O9; Wed, 13 Jan 2021 08:45:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbm7-0004Yf-BY; Wed, 13 Jan 2021 08:45:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B74723357;
 Wed, 13 Jan 2021 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527506;
 bh=J5AH/X5ZJBUjsFBjCNo6yI3/HraZf8H+zBvcMaxAtmQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N6fF53sifO8+DCGfY0fcT5OU8GR24WjZMNjAWGec9gn90Hak4nyAdonHVZuV3R/75
 G5yck4bWvmuZzdpz68MYtW/1/ytZ8HL2S/nHS/cUFwwXRNgjwYeITWKjdU1abuu9f2
 +8WtVbWOseRanQuIO0lUc86Q/jQlOWjlSZQzUUmm+Yqbf3UKagv40F3vApOOtyArEp
 n9+GEPJPNnJ6lRasWKZ8dlCKh0POh/863Oxgbx2TRJKdoMmv71BWZsHUMUR3PDS7Ob
 G2lmjSsDFnCN7VGyEZUOJIYoLhONze1Pzk1QlgcPbmsYvj9ks4WXo0lHhk4qrg52Uj
 PlS0c1lLJCkiw==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 08/11] usb: gadget: bdc: use the BIT macro to
 define bit filed
In-Reply-To: <1610505748-30616-8-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-8-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:44:58 +0200
Message-ID: <875z414451.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034507_499851_0B0B51B4 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Type: multipart/mixed; boundary="===============3571949828011159695=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3571949828011159695==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Prefer using the BIT macro to define bit fileds
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+swoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZIbBAAyDsUYaTfmSE3fF9yqrmSLkPRQtTqHDVx
FcKurpUr1GelJpfjnPV2JKcQpS/xnu7nVWAFyKfE4DQigYFp8AvfwHbf3HsduLYH
dclO9TNnOfqlbqxC4fg/9eO+rJjpl15N7q5lXl7fPrALP/5+AZltIsq4fhXWK/0q
naxmlM/9ay+ORf8YT9AABmUt6rcV2uN/MRRUGucff9Y6Q8RnvNCQ0ukkFlA2wuF/
mTfzR6o0j2/wUuCE3rU5BYcVUxE2hsaYu8Td5YBouQ3p0KAWFPUPe6j5KWVZ/QbO
tVKd0uHCxih/wMxoGJhF+vVcRH+Bch0G/207/kJL2pAZiIpjQD9bxGPZrB9ixF5u
CSvm7e/6j3whpoKlk3FgmGFVqS8zaoYOXp9FD1djbOi/GuXChYmVjFUQm4CT5Xgj
cHwik5skerDBtKOIkBLepRtuOEbslhsx5OK8fcqGrH1B+MAjYOa9HRel3iS05FYE
4S0BqRyE0p6DS9TQlsswiTRqpNttXolGCBh+g3NLDifp+MTsndgudjeArcCChmjr
7S7ZuPXRN1uhwQVXm6/To7alk/Kv7Ytmp8cPQtqMBDjg/bYkI/AS7b4CEnqXNuXE
ywS/QuONzokDS6rTtz5oIhMPx6ZksXfnvI0sWBJlTo7CBSrOcXws/60X8DrBDSNq
T2S+lGYI0Zc=
=i64L
-----END PGP SIGNATURE-----
--=-=-=--


--===============3571949828011159695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3571949828011159695==--

