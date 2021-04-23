Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF187C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 16:47:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A8B61482
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 16:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A8B61482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tw+MR68Y16rqgImtYs+0TsMCj0TjW2asQr9xIG3RzQg=; b=hKku79Z9pdKPctsGR66HjQJlx
	cIqIhCh+sNV1cYLOBjhQCtVf7KjI4nrVfOfC1IeogyK2p58AiMoUhWhmqzskmr4bZhu6mVfvbAxpM
	fjhNZmvTE2V4wJhfHYjGh/Cz3roQfXQc+AZnO8SvmvqCj96EbrQbQftU2rDficiftFyFJAA9sKPSV
	o/RlSmRqW15LxUxC6WmamRSOlY2H8WDGzGSKx7qNZvEcJByMZXcbVPbx/Mo+Ev4j2le3Ge99gsfo6
	kfjx5TuOL1TvRPRMpBZiSwnofPNa8WpnYN5OxAUis4eIF3Xwnak3XokFgCbilOJUIpiraQsNBaWbU
	1ynXNmB5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZyxj-001vL8-7P; Fri, 23 Apr 2021 16:47:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZyxT-001vJY-5V; Fri, 23 Apr 2021 16:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jiu2CnPrgJlZKOacLkwJ8LJ+LZThWvCdLjqGPP9/CBQ=; b=CDBrnAjnGWn+2WtmZ8VUZdOBdc
 SnTlDL874JPkAKzdZsPf1M3+JvK5FXJ+I6259LgE/2QIMu4Gd3vpRPIB1ZAgYQTIOVry/y+JQcF2D
 a1DgbGb9JUSWFo9a62KYBcS/2EFiFBNxU3EWonpAGnsHKZ1Rpd3sr9ZA8KPsWYMoQPPGYUXip7Fdm
 7Pm9l7CPTVxJbFdHcrWsmD2CvBcr77a/yMRP6smV8T23mA3rGeRJcxHRM2Hz1XJSnkDVsPSEouvvg
 aErbWQo1qWocFyhrClTlt0e7b2CziVYSNppBV5IYJz9y5+TwNZxGSOW1/H3YUZ9Wr1yvAFcfgii5R
 VpEt8bFA==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZyxP-00EYwx-TR; Fri, 23 Apr 2021 16:47:09 +0000
Received: by mail-ed1-x533.google.com with SMTP id h10so58132258edt.13;
 Fri, 23 Apr 2021 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jiu2CnPrgJlZKOacLkwJ8LJ+LZThWvCdLjqGPP9/CBQ=;
 b=I6GEuDgJNDT+Qs+mwBu0cU71fDssIorLBZ+1WPka/mh9dnoBGLeT7q/KdEOE2rZdmB
 GYrLgQj7tnit4o5Qw+rhee/H1vLmV5m1RgBufwd8rtvVGXWNO26QrJfvzj5drP8EQlY8
 m3iRLYayyxnn0S58d3zLrK83tSjBAO+UN6r/8ERJpAT0QLm3FQivr6dZq037/RlugCQL
 4CbD6wfzCnoLL5mQxtde1Sng+r30b3+p3JW5m9QEzMQ11E8oV43/YiTQuLNORSRCy2kh
 85Nc2QB2j8UfEZfQNawxVEofGTE1yupGLwuyEwplalE//d9aljwJh4Hd77f4ozTqhI3h
 JuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jiu2CnPrgJlZKOacLkwJ8LJ+LZThWvCdLjqGPP9/CBQ=;
 b=K/UJrdMdblKjDpjGpDGGTYq3fAEn+6kdY5sjonHuuYuXq1gft4dBrDtc1BLCkorPd3
 nWXwlx/9kS64uQu20h6WG3adSqWpBCixZHWE4co7jmABnYgfmcSptAlVl48YMB8nd92/
 mU6/X1h4o2FqQwDKDRHpOCTfSuA0wZo5aaEMEdE0WUe4OYno9AtNR1kXMwm063F3yTW3
 HK5phJqilo6fTgCyfFJVu/IcD3D1Cgei4fAl5hYdhOWZ1JuwXr7Ri+0opXAOthuje3p7
 PzdpofvpBKjTOMmFPDY0/IZfm7hgogPu6b5XxfT1pt2eTPYGyn77SzdgTAC/7VGpNbQ7
 MNfA==
X-Gm-Message-State: AOAM530IQxaBSY1cXLBpjvyeGfGL8GdTVTsdpQzb+ODGbnZfUJwOI4j/
 eOcQB2OyhXWAi4vj6vCmPnk=
X-Google-Smtp-Source: ABdhPJztzmxtzdsfzQYgnh3Csc0vESlubuEhwO8pHyjkXw6UK6ImN6Go/GxbiALYAyrZX1X72TORdQ==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr5556664edu.100.1619196426033; 
 Fri, 23 Apr 2021 09:47:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id mm8sm4456113ejb.28.2021.04.23.09.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:47:04 -0700 (PDT)
Date: Fri, 23 Apr 2021 18:47:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: remove unused function
Message-ID: <YIL6OoqF+CtGyi1p@orome.fritz.box>
References: <1618475753-102123-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1618475753-102123-1-git-send-email-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_094707_976735_3FC19D68 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: multipart/mixed; boundary="===============8358257957554019204=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8358257957554019204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UDuYcdOPnu8vXxWU"
Content-Disposition: inline


--UDuYcdOPnu8vXxWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:35:53PM +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
>=20
> drivers/pwm/pwm-mediatek.c:110:19: warning: unused function
> 'pwm_mediatek_readl' [-Wunused-function].
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 6 ------
>  1 file changed, 6 deletions(-)

Applied, thanks.

Thierry

--UDuYcdOPnu8vXxWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCC+joACgkQ3SOs138+
s6GMFA/+Ov/ZsslM92MqD1LXtllAdQoyXgyArwL6x6OfuwJlg9S/tgH94R2efhpR
JuMMyW/E/zpvLI+22EgS/ASWtGE2R+Y6NnjHz65mRBiDgo1WLhHOn2b90YbIN7wG
C7usfcDOex1KKJxYPBboKkcqyKpU60eGkPI8Wu/H9tNgLz2KnzUSxy3vvI6nI70d
SP9341phubwxTsvV8hABZsmeKLg89UfsnvQ9IdEQBcvvDnHBlb3R4oTqkGdvy906
Z1EOrtD3BrCQjTm6H2FlSLdlpNiy4jAa5ptfsaAUhA88Wyawf0KWN7kpX1pT5BkI
mieOLbsEPWiCnIzktGt9TvAQ80pyAu/vWiaO1jnadYGwOLIUT8Eb/K1rJjnvfiO/
IjbjIkWz68LCA+qZ0lPQPRbL0ZmeaBL5RDdj7npFLutLHOCptRbHgg3BfI7SZHrY
N6B89MRIJlRhsqCGbyGCAVzqftQdaytGfx0AwHCsvTRHTxrPKNxuY7JYP/iaVJo9
mF+nPNhcTxdH/RJaI5qVnJhIYvb1yr6cpXSkjSsesHJBRqP++SEyeBeyzFFw6j2s
kECJtkMjw39eNAFcg5Pfol8pFp0PCdHkCr2THp24qNy8PGTuo7Fy+kwbEndP/I7l
RyeY8duMnJ+8uHw7PTwwU30hynY2nqk9hTo/XTB/jBNBeJ8u7uM=
=Z3fH
-----END PGP SIGNATURE-----

--UDuYcdOPnu8vXxWU--


--===============8358257957554019204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8358257957554019204==--

