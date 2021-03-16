Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06322C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:53:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA0564DE7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA0564DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l4bR9w3MqaO2N8Z25Euwza+5kfYIBynll9J3FjDCB6I=; b=Jljo2an3Gzek/lUlNMQZoBrwY
	X/7l7fxeS0Q0Aae7UrwwPwHmvhiVX8HUW4eh8KF8BIuqe6V2QBKE268Qhn6reM6PZRmHFj8Q7qjes
	ct6vMFOWBWSuyUiJ49Aprh3mq8aHvaycEoT2QbBLCe7vKF/1lIX0TP9OFaltmTZjdPlKalW5qSMlb
	x9GVRlEA4s6mvDTqmdIX93QWMXLuKz4AnFkONrjMRu75RWjqGI1zWkM4JoSQNPc0eTXQHgYcW72ni
	UcNOkgDwhzA1oZNBWw8STFn0QuJ6ONmfOsyfVhCk6JEiiPJ5JpUgigg0x8wf1Zg09j/+yykjLJ1So
	oySFMi/Lg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDt4-001TKE-IH; Tue, 16 Mar 2021 17:53:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDrp-001SzI-Pa; Tue, 16 Mar 2021 17:52:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B57765120;
 Tue, 16 Mar 2021 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917148;
 bh=AzDNWIakpV6kbVyD7mjxNrEJxc3kYf5SEm43UCNUWF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rFYiJR/9X5zpZaiPy4Jjpf724cR4XAh94ugE3KkSc3qHUKTZWMJ8hMT67XayFNWpc
 nJJaorFHkN8umklWYKxY0lppxEqqjTxb8aftsIldEvAVsWZyV5DNKeJTFUA8n14Hzo
 2m7wmdBKNqOvfFt1hUIHMkotK26e2X4v4+2aMiL82hJWDa26DTZfLr4W2IhuHrdo+m
 bBrvucRxFrUcuuy6ix1EcPLXXhTUr5KlxH0zAABC6dDp+S7Cm5V7X6i/7hZKTR6dET
 uaIil5JMPAOVXnrXdYQZ34g2JJEcDEfV/Fge5AVj5zgSXw5DusSmK86zAgsD1OZxeU
 AiF0uMtV1FfCg==
Date: Tue, 16 Mar 2021 17:52:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 7/8] regulator: mt6359: Add support for MT6359P
 regulator
Message-ID: <20210316175225.GD4309@sirena.org.uk>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1615829757-3223-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175231_260999_C185B04B 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Type: multipart/mixed; boundary="===============1648753039650033978=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1648753039650033978==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 01:35:56AM +0800, Hsin-Hsiung Wang wrote:
> The MT6359P is a eco version for MT6359 regulator.
> We add support based on MT6359 regulator driver.

Acked-by: Mark Brown <broonie@kernel.org>

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQ8FgACgkQJNaLcl1U
h9CdkAf9Hbz0m/xv65ZqrW8tLgUxjCTjcWpw/fLlr0NuMnmtYANHKy9Pjs76Vl2W
2kyXSeAcDdKV4/j8aEK8fd8JOMZTqUuN5OmJDoUvIN7DSDd0E3BFeT5bvBvUTnWN
BbP8WBJPBF9pIHsv9D2xT/QlaXVvGjohZHFG41XSfllNGw1DjPFAjkAhTOyXzT1t
s+tuHrpLJxzxyvK07WJnt9LfFMz80mgKT7PEhalXP1KRbkLM2wXuSEBgoy4bm5ZZ
XF7thh112bug+30SXTGVBzutbHJr3o4YSRNbHOysnpalWONxfVoZjrRoTgeW5SeK
bbowgAEaY7/4sEMAKWFqF25+fW8QCA==
=C2bz
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--


--===============1648753039650033978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1648753039650033978==--

