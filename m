Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E10C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:08:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDBE61279
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDBE61279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/zMOPGEO78ORYJQSblYr0ncxtVoZOWJNlo1WvECvrvs=; b=E2p0KSSiWO8129J7DdnMGQXQ9
	DuGGmDiz7ltkgrK1nroYqjokkuSPszKmWpaPFIjEz7jWZjD4cE4RhLvG01YBKYPGm5LaGR/xqQv7F
	1HL1JbsKzvxLKR90ZeYdWn7fcwWex4tcaiXBIczVse7VMHXwjrOy7bKS74+J31l1X/ZIbCIIujd8y
	CsmZsqMZQCij1mJwSKvAG+UgF+t5kKKqb5ofCE4EMMMPE82fdnO6R15x4cWvgwzEPX+6577ijH/pJ
	GHmZvI0FcC8sltgIq+r2YcWiMq+7jBXIFuEQSCgyVF6M7/hE85gLdRqPQDUQJGW3ct2RHJyiRAVQ1
	4ww9H01MQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTicz-0027Xw-PK; Tue, 06 Apr 2021 10:08:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTicr-0027XN-1c
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 10:08:03 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTicn-0000Ih-L1; Tue, 06 Apr 2021 12:07:57 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTicm-0004j3-7j; Tue, 06 Apr 2021 12:07:56 +0200
Date: Tue, 6 Apr 2021 12:07:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3,PATCH 1/3] pwm: mtk_disp: clear the clock operations
Message-ID: <20210406100756.ijthlp2j3a3eygdt@pengutronix.de>
References: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
 <1617703062-4251-2-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1617703062-4251-2-git-send-email-rex-bc.chen@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_110801_254945_045AE170 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: multipart/mixed; boundary="===============8048464354460983548=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8048464354460983548==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="af63drcvcndnf3ct"
Content-Disposition: inline


--af63drcvcndnf3ct
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 06, 2021 at 05:57:40PM +0800, Rex-BC Chen wrote:
> Remove the clk_prepare from mtk_disp_pwm_probe.
> Remove the clk_unprepare from mtk_disp_pwm_remove.
>=20
> After using atomic API and get_state() function which are implemented
> in PATCH [2/3], [3/3],

Refering to the following patches as 2/3 and 3/3 doesn't make sense once
these patches are applied to a tree.

> clk_prepare/clk_unprepare are useless in probe/remove function.
> So we remove clk_prepare/clk_unprepare in probe/remove fuinction.

Does the driver still work with only this patch applied? If not, please
rearrange and order this patch after the conversion to the atomic API.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--af63drcvcndnf3ct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsMvkACgkQwfwUeK3K
7Ak6aAf9H1Hh1pupjsfSXeA1E7ELdVBhmy24h4j6m4zEM5wT8FAgdrYnnX04fAhV
qY6CquneoPnm5BvZp2CXMukAi67J0kL0C6APkjh3hpHfElyd8a//gsGID9uZ4hIj
S7EmQEWjGBg9unsnUJdyWrUHipA4XGktfoSGSUIFIPZjQDEmOxqPaYm9dHrSt92w
ukZ2PzqxCDIZqilIgijo3w2BARAe3n0w0pzWbB/hwjsF8a/bhCDI3ynkc45G5D2d
nPNBv6YTQaxKcxbpn13nF4RSxUKh43T7nN79KFY7xnA6fokm+hRoZV8Rjn2/kQiO
TZ0OO1o+NqYosUQWAJZp6kdMQ6zIaA==
=6z2O
-----END PGP SIGNATURE-----

--af63drcvcndnf3ct--


--===============8048464354460983548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8048464354460983548==--

