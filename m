Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D53C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Apr 2025 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=; b=hjVrB1gja2f4uZkwHV76KlFloJ
	aMHMqXRlW1lwh8+S1Uq8BdYtvYHoNoCLCE8ymwMdyN54YXY70PaTeRjsleMhZHKZwRPAciprwDTWm
	2WlS+jq0ZgwJyE1BRUxDIDmFtrnzq1NUeydXhEISIAZxaT5g32l5vuErouI5WsRAbzjUdRssOHqjl
	7nGpc8JwqDBkwW+h5kTlaQunE42G58ruv9TJR1f/jqBIoERK/asYv5gjtTRkhmx+nFSFZXS0O/Opw
	4woLIaOOGpc2h+XTm4CwjQfDw8vA1QcjBJERR8j1r6ZY2cD/Zbq2X65s/HAm+r8gwKDGMeG2KyZop
	95tOj6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Mn7-00000009HGf-3Fsv;
	Thu, 03 Apr 2025 15:47:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ml9-00000009GmR-1JGH
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Apr 2025 15:45:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so10601915e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Apr 2025 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743695137; x=1744299937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=;
        b=iWr/YNUqxXkVkFdw+lFPMpzajGFFqgbxXNX+OF4SMn7P0nr5WZcHExXk/PeNsZyEi4
         xIbKfrBYZLwe69BEseWm8QndgL5rXSVCQrOxjvg7WB19UhVP6a0BbmEs5ylLCSfB+64W
         le5J79Yu+OmlEs7wfNP9Z1OrzA2v91HkitTagTDE+YBuYoWwKh8554gfSQUWxLa3ApUf
         GyXit6DA/AE32frALx6ryXM7b9VawDVMy6b6yAlqGj1v6FvrXGGK0akytskOM5H8rU9S
         Y6QbGuyrF3VdJGmKjxY66ogay+mqt6Yl2jTjx9WJ9O5FgE9OP5ACL0d5sQr2RHSdo3Z/
         4DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695137; x=1744299937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=;
        b=wTwxDWj/bj2JMuZ3LE9Fmd9q0bROU545opg9ss6AM8g2jyu/8/Rt8SvwinXIjsD7Ut
         fuSAVxKbgwAqR18rEK0wydWo2DUjBvgpMEEmgdb0JsLVsqUvwsFo/IiYaQO+/azefd+C
         RuG/iBYMB1wxKCJGiYmjYTh6DgSjtoQkn8H6/9dbWE7AFIrdmXO+6TMtV+JZ+D6Up5EH
         MW0TYWdeotOjwq/qgYO/Yubr3wMFS/27o1MY4UH+NyRabMVFHrFWX3rMc7qRFU146YJv
         NI3Zs29BT014RQgpcfC/P14Ch4OxSY8slJK1Wm38FXpobBUTzyii5zuGCTNgQbS7bJjb
         sI0w==
X-Forwarded-Encrypted: i=1; AJvYcCWWrGK1EVA31JNzedx1BfpDlV+SzhO0klAgfzUybZUeaYDTRu32en/UZt0CDDBVKX4NOvM8UbEY+HkZuZsskQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YytouFZZjhbjRAx2TuBqI1H5gFglAwU3dV8NL1c01yHaDnO7Yf2
	MEZctxlQ9uBsLJ6YuVTTsH136i9v/5sJKM1V6L8FAKsV/HM/SOlHSaRedtW6rbY=
X-Gm-Gg: ASbGnctPEeHQqFLun61qko9e37hmi2erpgQjeoGhG8qzH+OV3yPoYC1KAuyGmEpd/ai
	8ZhWm8va3jvztdlLLVG+wDnIF3E5kabZfUIten/Bmdonqo+pzf/0VmhkXI9a0QWoEbZ/8SD8d1i
	31sty8jTgG2a6D80OslDpxr8iHPrz9znFun0KUMjInR/zvX/pvElv65a67ZJDuwLatw+LotuJtb
	0tyJO2pbr43G0bEZqsmB0mZWEHaD3eYR3dDjnp5voI6dLH//EbgZoJbRgoSfulFcNAdNQaa8pg8
	gxVnjTtQ8BqOjlSuG3vwdWs6gFpo+bXI2W7OrOC+jcaD11qYhXzUOUOFdTt9A9GO5MFQkvvuOD1
	G3ntBlqt/6vY=
X-Google-Smtp-Source: AGHT+IEE+diWQwT3xdVd1/NUrTaV0zbs1L/rziH3lZrkM6YZXL2Micftxvudk2YHYcCtgwg5qaTPJA==
X-Received: by 2002:a05:600c:6dca:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43dfa59a802mr133654535e9.33.1743695137355;
        Thu, 03 Apr 2025 08:45:37 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec366aa29sm21727755e9.39.2025.04.03.08.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:45:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 17:45:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Simon Horman <horms+renesas@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, 
	Patrick Havelange <patrick.havelange@essensium.com>, John Crispin <john@phrozen.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/3] pwm: Fix division by 0 issues
Message-ID: <6hwirawnrsvyo5fer3km453fwhoic52st5e5enrctimatpirjp@lor5kdhnvuus>
References: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnasbrze7ocgubdr"
Content-Disposition: inline
In-Reply-To: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_084540_003057_F89A357D 
X-CRM114-Status: GOOD (  10.79  )
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


--vnasbrze7ocgubdr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] pwm: Fix division by 0 issues
MIME-Version: 1.0

Hello,

On Tue, Apr 01, 2025 at 12:28:58PM +0200, Uwe Kleine-K=F6nig wrote:
> I'll put them in my for-next branch anyhow for wider exposure. I happily
> accept test reports to (hopefully) increase my confidence in these
> patches.

FTR: I did that. The 0day build bot already found a problem with it in the
rcar patch that is already fixed.

Best regards
Uwe

--vnasbrze7ocgubdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfurRwACgkQj4D7WH0S
/k7JeAgAsYjzNk8bIempZA0RtwLtBpw9k77opaBkwnfzeHOr2KIGeFwILhiIH5nQ
rQmZ6xP6Tth5QT0wSAWPrhhvkNPDo2VExXFDG2YkKWHxkR2Zour2JOLQVIU2JFhZ
Ubj3k+R9MiZQ2PEkXfd0OoWrLdG/hwhYDgD1Ui3MOE5AmA+B+iLQ01AhtaRjn0ZP
Ud709bne3Q19clrQPwy6l3v6Yu+Nekmyh3OMkCwsPMhOHYsaKuw0qe6GTbY6Psd/
MBH65M+fv17Ck6kDgUqU5AKHtGandmmnRBWx2BLRyFhQqIQmmAhOpwZuHpAqCahH
+qQKNDCHtkckEGjTsobRus/EnDCNoA==
=mH1Y
-----END PGP SIGNATURE-----

--vnasbrze7ocgubdr--

