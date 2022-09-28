Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0BAC04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpfVHj+RDccjHYGjeoqa72Pm48ZvPePtdQJtt8JQZXk=; b=rBGLJXxBPtrx8rsm2zLo3CLeif
	gsJEDCum7/p5XV0tiqEjovSSW41P4W3yHh0Jq2Ph5ZEEffbycHuwL3Qsb+mugWvVTuRjWrNXpUKMV
	Jmzzujpd0xCfY/FcMywtshE0WE2DKL337iLqXxgDZvhcC6om9d07XDf3Fgj5UgKrrP1Sr3/19auCf
	sn2ytZDwXL8wmPYK5P5hXJZkSDBEFXxyYrfIy8bPQKIhO8r0O1MnepZFf8gterxOnIsXtAjSecYFr
	pWhJ49MQhLQP+Vfw/FCzz81YtWKXfQf/B5sSW9SmT+xeNtJkAOr3w72DBTnhhoDNORZptHZZ//hWQ
	tIhcQaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXbH-00Gbss-DT; Wed, 28 Sep 2022 13:59:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXbF-00Gbrr-7e
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 13:59:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id l14so27325342eja.7
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=lpfVHj+RDccjHYGjeoqa72Pm48ZvPePtdQJtt8JQZXk=;
        b=k7Zv4LgRiDjyJBlii7p5vFZBJyFH+e44eYv5nzGTZE46tV5K3r7cHb+eBBoBvLO3lK
         pl2jh6Ov24srBnGirRzzHwQlgFfyJSVa+OQ0F9nGec98lPOmtgD1O7qeGanfpiiadoG0
         RYULKpM25+w14uMV1IBmh1BmpIWMDlSM7d5RCPMlt5qWGKCDYyFABRFFit8l4ocl3J8e
         hihBXWhJriR0F7OpOeJT0VEO2PCGZr4FEGC+6E10GyX2uKwNwJdxiaL1kVQVL4DKaF9B
         1fWkXvfqgaEhdqQS8fKhxfyF1n7qw0czLzsxTXDQe7B9HIkvxyEJ1OTM4V1nJME+fcAQ
         MHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lpfVHj+RDccjHYGjeoqa72Pm48ZvPePtdQJtt8JQZXk=;
        b=4Al1oMDbS2DrYYDaSfWlxhE6kBi6RFjrBqkRAeeDP+lAqlcZWOAbuT0BHdNFAAJn2W
         fVvFmOhs23TEvf/JR52NeMPRP55DCKjub7Zd3lCl8vQXP7FEU714ktTWKT+lAtZWUtPV
         HE13HmV16uXHLwtwRmXRaQ5n9n2o6zcYuVhAc/QheQYDnotpvnvZAH/SyEawffmGyBXm
         M/eSwkdjQsm9jk8l8naTtPhYubCF9h2z/DrJpJscm+krkUyMu1MDq5pnpsmkEbmbHaeB
         Q40rtUSRovpI1tLGNgH8PscuSkiUoPx5pIs8UCX82hfpIb298mrhh8YIFAJViq9rPWgR
         OE1A==
X-Gm-Message-State: ACrzQf3HyUWRaHYKMyz6d/OlvQrdj6/v1LQMPwExEA3+rPb7gHT7fidM
	osMDFv0pkLAYpGvcrUsOAUZnCS6CZk4=
X-Google-Smtp-Source: AMsMyM5hBOvEKEWpHZgz3huI7BLk3tHM3vkbt2WoWDY6DRqLKZ5Fj/SdI+SaNpg7MlhI7XgiNtj4uw==
X-Received: by 2002:a17:907:a04e:b0:770:79f4:f520 with SMTP id gz14-20020a170907a04e00b0077079f4f520mr27033245ejc.730.1664373583736;
        Wed, 28 Sep 2022 06:59:43 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cm17-20020a0564020c9100b0044838efb8f8sm3387858edb.25.2022.09.28.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:59:42 -0700 (PDT)
Date: Wed, 28 Sep 2022 15:59:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: xinlei.lee@mediatek.com
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@list.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH,v2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Message-ID: <YzRTTGPAstQTnJdZ@orome>
References: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CmzLNmPwX482UbLD"
Content-Disposition: inline
In-Reply-To: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_065945_304934_55C47C83 
X-CRM114-Status: GOOD (  10.54  )
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


--CmzLNmPwX482UbLD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 02:43:14PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--CmzLNmPwX482UbLD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM0U0wACgkQ3SOs138+
s6EgCA/8Cln97n5y2+lTHYL2Vh12ctUxVaV7Fh2q63qXOofQ6M8htH+lKEC+g2fp
ijRlTNFATbA5KZOyJa2MAYHfcdx/hL4fwaEJitMBQoOiusTTAcv204BfC+ag1L+3
0CB3ayFrPF5mzEYqXvwq0vrQG2ohV86gDAF98O9kmHGMnqnzPEGMKcjz4m4bLGCA
3bWAlYlBVFRxptoLgc4sQFY4UgYm29JMxvq2QF+wHBC9zzzc0Cnl17bps6gaRzmD
HSojW19WJn0SJMzRNbZJE0AwX6lHmIQMO6cC2medls2UTiuWPneQDFsF9OdOw9Id
n9e3gH2NJk4bRl8rrUDy2XnN6YmQM3iYkx7qQjzGaIyaUP9Z9xT5HkXD+atHrQHA
aK98/D8DrfgM3lUor/3zE6OHdM/aU/pkUNEecWs7gURoQnlgIuwBADi81KZq0JHk
mG4Dlp1ElDofdhhvqd0o1MZ7H7cRqQKj9iaceY5Z+1n/xo8L8W65jdwdKP7hry3J
N3WMwlbHC/V/817fNNoEahE4MbwzSUbR/Ogh72Ye9F1Qw4dJ88xKGT/b6nqNZCus
ZX3W7Ay1pg1jVz/8S9/OnkBmPM+XMDVzga82JuaGZ5Obl7Pqyr4IWgiJX6MTyaCA
ILG4DBs/H4f6wlIYdek77xYg4Cb3KY3SCM43u8ucYTKW0/+MJHc=
=ojFY
-----END PGP SIGNATURE-----

--CmzLNmPwX482UbLD--

