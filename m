Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D60CCA9EC7
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 23:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=; b=3rGoXvL/TmDLVV5U0bMApWzNqu
	d8/QLyctbiaKnQEB8pJ1a70+eEjU/z5lm1MQ9Yq3Mks/es2SMKAWoYZ/4nT/UiKIWX6H1WexHQzqO
	qMQwqwc9PRFZl9TMIA7Boq+i37lAyxXNch2/txmh56CCHYOdCSgZ7Ge8gfkfl1P6+y54Y/o95X/mU
	ylczlfxRXHynuc7LSE/QuJB0h09XZiKgegBuFNS5tKKSnDOYijfvSV26TsuKhdy+dgSd2t0csXKQO
	x0UVbSQzKJfn28CgpfeWE6MKA+Y5NJ4c0sc2e/Jp0UdQBGgtGwglHHsYPVmJ+dycm4su3w1nLAofp
	ERKic9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2ce-00000009Twm-1hGI;
	Sun, 11 Oct 2026 23:06:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2cY-00000009Tvy-2Axh
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 23:06:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48870973bddso750105f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791759980; x=1792364780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=YSAPy71IHA1Z9YdNqFkPYWM1U5yTF82Q1KjlMP4Cee8fTRr89QnvzUIfx3jEY3SyIV
         3+xj1W3cUj8RvK6axQWvqgbPiQ9OUwPYu65axRlvsbmViS7Xr6UXZpLg0mXKfcb/3l9I
         CaKn0/mtOXgo3uar9qMXGWUIg2MFSLod9WP1ff4YvzSCjmXNln7YAzqwwQJsYRhgjdqD
         4bwxJXaq98ZQ8VvcazEFDcodzUd8b/rfdMdwTlMgCiKjPNLeC9Zm1S1cSYk6SrPmiMS9
         3qa2FB2gh1AkFAMnGGm3elvbIuY2Yy4ekPlwuuGFSltx58XXx+9Z48qUGmdFWftQOcMw
         3uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759980; x=1792364780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=fpAnrsFlIgRs2VkB0ZeozRDbAv3G1lCiRqe6ez9iK7bk4FWHJhwoCZX0sqPP/OtJc/
         nmCAtlxB+36rbcvlKQCy7HGd/XhRcBIFkx6zM2lttSjnz6AdW/OdQw6cDDpaflY8WCY2
         4q9G3rpdfO8Uiu2oD5ukV9dJG6XQ2xZwFeUeirJwEGD2KfMFLLuTDh6vDHt3aB+XlAub
         b+TkIMzcCEb1RhTsPjGW8EzjTRBZ6uuyillTypgSKU/cl9clUTsrOEg5E8R5SmBxf8rj
         09wxuNeP9sFdm35DFGkTinXRR+QII1gAXvC7TYAQZuduzTuYlO0hosbS4RFP2OvxAgi8
         iJGw==
X-Forwarded-Encrypted: i=1; AKwUvBz05kkkUjbKOw+L+TLmRVy+EzxxpaV2+NDfI5tVLV2nHdrqcWyC2FlZMdiyuijN8XgO9HMoeVXfzF7as3HOGg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKwmiTlGcVWy4roMVIXSdiGsH8LNcCQW/OfsHweSJAtGywJ1bzv
	eHVUrY0lNyWCweuK1bPRc2dTHvBCv786IyB2z2JGYJE4qAKhMSfdeouKw1xsFbF2lD0=
X-Gm-Gg: AYBFou0B7wenJlEsxLo3kusIZ7Pe7r1V6MOAxF0jE7vfedzo9JmkVivUQNosHgEHNbe
	xt4KTwsltyx1l6rx2J/69ze93e0ex8BuwsZW0QvTPyX2jzVqTyG4eXnbm03YZM3XxTbFY0MLenO
	7zRCpl9HUT5H/Ds1W/GwOpRVRi4ZCu49sl56LXdMJAGIt6cwNXvKKKHMEq64blY1OpE8vKRtQEd
	vGtvX2qhqx5yxkeBofEz8ToJkncLoDPyKw0HRjKuCfi7BKSCYI2hG+aaQBR2Z6ZERNmde+wB/Pc
	QRob1F0jWzO0n0fx+JYPqPQ20F3o76z1eKh4VjWH0oaiMbPC8EP/Kfq1gioKPlzZvOQ2lqzBbqr
	m11numYHFK92DUT5As1xGhDkFUGZBMy3yE6J2kd9pcwd1E/Qzn3eL+sKPO3n0HjnMxj9jNhpVyF
	VGJ+JLRcgTG8eh5VHG1gxJjopA1WtajhVLZRsziyBWyaNtjIvq1oIHDhrmXhyiLciHKD3O4ywVJ
	Z4=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr13299157f8f.7.1791759979566;
        Sun, 11 Oct 2026 16:06:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dc1abcaecsm12488698f8f.18.2026.10.11.16.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:06:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:06:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org, dmitry.torokhov@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, allencl_lin@hotmail.com, 
	tylor_yang@himax.corp-partner.google.com, felix@kaechele.ca, dianders@chromium.org
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
Message-ID: <aswV0ATke05Aa-q5@monoceros>
References: <20261011181633.1778969-1-michal@nozomi.space>
 <20261011181633.1778969-3-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zn2xrgow5dc2xy6"
Content-Disposition: inline
In-Reply-To: <20261011181633.1778969-3-michal@nozomi.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_160623_071344_F857A1EA 
X-CRM114-Status: UNSURE (   8.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--2zn2xrgow5dc2xy6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
MIME-Version: 1.0

Hello,

On Sun, Oct 11, 2026 at 08:16:32PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. This file introduces a
big amount of unneeded dependencies. You can rely on <linux/spi/spi.h>
to provide of_device_id and spi_device_id (which are the ones you
actually use). Alternatively---if you want to go full iwyu---include
linux/device-id/of.h and linux/device-id/spi.h directly.

Best regards
Uwe

--2zn2xrgow5dc2xy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFmMACgkQj4D7WH0S
/k4MXgf9EcZ3GfDdHxsy9EN8ExCwEfNg60ObLE8QD0gdVxF+YdCbdpGNF2XrpYvk
exy5MWNHx1evhGI8uT/bu9C/jyhN3agP3CnjN8IYUDxTDMIt6AnsMR8o/K87exej
Jwx8C3Y9Yo3SQpDDR4mJF9ftPo4LgbCWne5l9cEAMH4M2i2xBYSZrMNHdPsRZ8rh
91JD5Nl0fgYKcD290dVrM6Yyzy0jTpbUgTEm039g0ev8eEvvylQcfsP30oqEDaI9
sHPHaxeZY+jPpKiOqzfBMP1IzFSQNXt86mzcWDLKLVHalJWEh7O1dnfv1SqWhPEA
s2aLRmZvKqCLimKqBYM+vLnmUtqynA==
=yG/u
-----END PGP SIGNATURE-----

--2zn2xrgow5dc2xy6--

