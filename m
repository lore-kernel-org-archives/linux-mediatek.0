Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7A4C64E90
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 12:23:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C79722206
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 12:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C79722206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hw0Zglr5xc+wd18phbgkUYCd23F7wQCT2x28TgAlt+U=; b=N+FlzC5bFdlSQpuYn18vGP2Ql
	0mOSq++2mMBSw/N8XWQlZ3A0WcO07HU2Zija/Il1/F8ANU1m7qgqB1bc1H6JildE+too2w/zm6kBo
	TU5oeRCnJ3UMQXMptnLEoDezlU4UQnCJnKa9Dt+5u/EsOXcchLMJjcsuV62M7R9J/DwigUIiNHh5S
	Lhbylu/5qn3TzLaUs7YAI2rjEydk1ZMdQZvRO9y5XmJsepHUBuZ0QsZprCDr0nnpphlDHxEdGOI2y
	ADV3I2CBPQw6NiwNhWYcy8rs1vagpMROFbrRuH3nTLFscOF+l/j16t8z7NLDqtNUIbFnzLyYmPZ8m
	tnR9pCwlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkRAY-0005yJ-4V; Wed, 02 Dec 2020 12:23:38 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkRAS-0005wM-Qw; Wed, 02 Dec 2020 12:23:33 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 5BDDE1C0B9E; Wed,  2 Dec 2020 13:23:29 +0100 (CET)
Date: Wed, 2 Dec 2020 13:23:29 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201202122329.GA30929@duo.ucw.cz>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_072333_026866_0A9C2EA3 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============1912874988790520908=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1912874988790520908==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-12-02 18:46:49, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add LED_FUNCTION_MOONLIGHT definitions
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/leds/common.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 52b619d..843e65d 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -78,6 +78,7 @@
>  #define LED_FUNCTION_INDICATOR "indicator"
>  #define LED_FUNCTION_LAN "lan"
>  #define LED_FUNCTION_MAIL "mail"
> +#define LED_FUNCTION_MOONLIGHT "moonlight"

There's "torch" function that should be used for this. I guess comment
should be added with explanation what exactly that is and how should
the LED be named.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8eHQQAKCRAw5/Bqldv6
8pVXAJ4tYF70hprb4/4PCWCbjb4eUQZMggCfTWFQi7Zc8SFGxzn0gUYPceNUWSg=
=d03t
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--


--===============1912874988790520908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1912874988790520908==--

