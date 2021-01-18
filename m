Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11802C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 13:15:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B0122BE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 13:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B0122BE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKiYpNATnjg9k07fVlJoR02gsKskiXukWCjmQ19s57U=; b=MxvFhmoA4Ekhmb+U5EJXCABng
	OCMWZdyRVKMyk0/73ZaHm+3pQW0ck1J2Y4trJClyro231sCuqLNtJ2TliH4m0kGtLTmfDt5AqPJu+
	/A52uqCKioYtkUP0sFIYTLcYgvRKzOmo0SAVFKO9VAgNHpUfqyzxPO9BlY3SlDArnwUAnXShC7u/k
	r0FIOB3vtOFEX6nweH1cmephAaXXY/pUV71R+8IAgwMtCCRXsTzzEqGKhCua0Q3bVnYJSXo27QqiL
	mXbpp6zdXS3M0r4AJa9WUqUviAn3SBHcWBKGz7SyPn/Oc72ZucXT4ZuygQ0icWWnHtyQYCByWWY09
	zjdWJrArw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1UNW-0006bo-4b; Mon, 18 Jan 2021 13:15:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1UNP-0006Zb-Cu; Mon, 18 Jan 2021 13:15:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 191D522B49;
 Mon, 18 Jan 2021 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610975722;
 bh=N0+tVAiwuF8I6w8LmM9DR4Db2xUJ2qKlqrmMh5l6bZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvQe3qQl9Q+qTHfN3YaUZnuuPso0FQLFGiDF3YrKlx9Ul8tV24pynj6CKUT6G2u67
 4vg5xFUoKmyUNjcxSaTGq8+gDf362cuBSr3gJzljNRhjO38yghrqWs5rM0CcooDLCX
 /oEiEcTfYcUteOJ0GSiQGH4qhPADCYIl99s0vmKg8wZS0GriSw5/ZaWpTWs8EAX+z+
 l0WcUkFxoc5ZyxAXN3cQVSasV9dU9eBXDijiz51BUlB8M9q7zKeH+FGMMwm/WJN2ip
 dgPk5c9CbKpbMSW7NdjfZaP1ycp2FYqLB18D6HXDxVzrkEemFgh6mnmYr+UhSudepK
 kDLw6j+3yMq+A==
Date: Mon, 18 Jan 2021 13:14:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 7/9] regulator: mt6359: Set the enable time for LDOs
Message-ID: <20210118131445.GK4455@sirena.org.uk>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1608104827-7937-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_081523_538003_EF6A9276 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5523558106157534814=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5523558106157534814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M9kwpIYUMbI/2cCx"
Content-Disposition: inline


--M9kwpIYUMbI/2cCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2020 at 03:47:05PM +0800, Hsin-Hsiung Wang wrote:
> Add the enable time for LDOs.
> This patch is preparing for adding mt6359p regulator support.

Just squash this into the previous patch, you're only just adding the
driver and it's not a complex change that needs separate review.

--M9kwpIYUMbI/2cCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFicQACgkQJNaLcl1U
h9CSTQf+MLJVFfQZUGnoHLl3SN5QXQPjtmsJepqX3sgPg8KHO/d1P4mBOMVyHZfe
/CRnecyY0Lc0We/d2WkY6FM0cC3sY3JC6juVUdfdxNlmZVxVWReKF7VHLXf/8OWQ
P3aMNUX6uZIHcGJi57fPs7rEamcT94jUFeMQIsi/nRtPY9YgjpUOj0EVY6U92Dsx
DfG2W64Jc3Fd+AZD4hRLxinGcMwMPm6RckTAQmFO9R5KfXs/Qt1vHWo1l9XgZmdh
Hqcp4AGAMs3joVHP+bbbSqZHqmEhfi/kTBRftcum3eXnf1lh3bn3BTTCYD0y46aF
O+MkY4JW53ScIreKEOgqkdrl/xSa/w==
=svi+
-----END PGP SIGNATURE-----

--M9kwpIYUMbI/2cCx--


--===============5523558106157534814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5523558106157534814==--

