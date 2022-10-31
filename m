Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF09FA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6WU26MBOt8WJip0LsF+/o2BON0nZWtJO9/skfyzMYys=; b=RCHOLtICqchMs97KYIwZ/hj1nM
	6U+0NpaAES+M1gmvdQ43Cv60BDu9TaDB/wIsfmTtlqr8Ojmyh2Vxx5NPz/psBBSSZm+BXuuL9xIbA
	3wiEbQPcMEWqPPRspmM5sdg3rbXGZIbcIfz3rELC91aOLvqHewH1FU2bao/dubyXHkjmDobjuZEUt
	Z+WqOkkWX6dRo41K6egp5i2k/r3jSlwMzqY3Ih3wcjkABqV3DdGz8VdKze7g6bwpVgfdvgDfi1QNJ
	5bvsRl/xGYgS7xrHcaf/8werJOEhStUo5Vr9tb7iJStfk0Yqzxf76ccXjwvRUUeJCYPAHBUxR7EqB
	qv9A5ZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opR48-00A4Sx-E6; Mon, 31 Oct 2022 09:26:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opR2v-00A379-HZ; Mon, 31 Oct 2022 09:25:30 +0000
Received: by mail-lf1-x130.google.com with SMTP id p8so18248576lfu.11;
        Mon, 31 Oct 2022 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WU26MBOt8WJip0LsF+/o2BON0nZWtJO9/skfyzMYys=;
        b=l9Ec6Z3pCXkd/0PTcwHkH7+fM6BIWq9SSTBElCmHDmP12O19aP/1XUl2kowGBBfSU5
         SOxQ/i+u9Vgo1beE6pzWMWl3fTxd/ZjV+Yr0Kx8Y80OSmj9Tn1PecncY5g4FDnKqAbxL
         eM3nqIt+vxJmx1KKet+q7PJY8XH2IZeoUCDYft69i36rS7iL/lstV1faHoQIpIOLolg+
         OAKeADCXW7ZXzf8JijPKPbptu+c5Kvhmz9D+biGjBxcdo6IvfHZvUaDnD4/2KvWWRjS2
         BB0Ooas8nyXPXLJ76DjhtD8enNTPyOeQZNhIRVAAhGbjqFNJf3U30CqiXSH6zebSH57j
         pG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WU26MBOt8WJip0LsF+/o2BON0nZWtJO9/skfyzMYys=;
        b=TXeznSkgrytHJ4p4/5jJnmTLbPfqTc3e4ASu7r04+VtFEgKm0yfGZVWJ+lh1Dvn6Tb
         sNvv4Ap089N4GgGlVQTwqF4O0PmUkAzepOlK5a/53sXw4VmzdDOBQPsv4u5vpZ+xv57w
         JYilDcOYOQ522E0vhRTsR9ebu9RG+jG395r7tHby28gWQlUeYkWdBKw15Uzr/99Eto+l
         CFxeWA9BEISuPrng2vcRPCYy3XKOXtGHE8ZM4KMGz4Qg9PP93dBQMVJ62Q3+nD1hkHW7
         POhsP6jXFcQt1rSnC1mFiaR3FUQLfNK/U3KqHMGJ7BbDsRbftyBlodAPnkfYinyt4CPA
         UhXw==
X-Gm-Message-State: ACrzQf0U3U/dg+R3ChWCv6wdoWhp/evQrWauTyOaCqnPN/pUSisZPiLW
	JSCNXMCxjR2NYBPpKUJbaMo=
X-Google-Smtp-Source: AMsMyM4+8FD7UeMjok9pXXcM0gZLvNIuCQiyoXprPxWuWz6Gf31a80EiV+fpLs6m7K9BmQJVvF3j9Q==
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id u20-20020a05651206d400b004a20f89db7dmr4718215lff.125.1667208324715;
        Mon, 31 Oct 2022 02:25:24 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id 190-20020a2e05c7000000b0026f9cb6d10fsm1239260ljf.45.2022.10.31.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:25:23 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:25:00 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: mt6360: Use LINEAR_RANGE_IDX()
Message-ID: <2c6267efae04a3f64d88baf2e34ea309af438d40.1667208242.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="spmfeW7Hd1DSSs/Y"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_022529_640611_A991D970 
X-CRM114-Status: GOOD (  11.12  )
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


--spmfeW7Hd1DSSs/Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Do minor clean-up by using the newly inroduced LINEAR_RANGE_IDX()
initialization macro.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Sorry, this one evaded my original grep so sending an individual patch.
Would've squashed this with bd99954 one if I spotted it right away.
---
 drivers/power/supply/mt6360_charger.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/m=
t6360_charger.c
index 3abaa72e0668..92e48e3a4853 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -113,16 +113,13 @@ enum {
 	MT6360_RANGE_MAX,
 };
=20
-#define MT6360_LINEAR_RANGE(idx, _min, _min_sel, _max_sel, _step) \
-	[idx] =3D REGULATOR_LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
-
 static const struct linear_range mt6360_chg_range[MT6360_RANGE_MAX] =3D {
-	MT6360_LINEAR_RANGE(MT6360_RANGE_VMIVR, 3900000, 0, 0x5F, 100000),
-	MT6360_LINEAR_RANGE(MT6360_RANGE_ICHG, 100000, 0, 0x31, 100000),
-	MT6360_LINEAR_RANGE(MT6360_RANGE_VOREG, 3900000, 0, 0x51, 10000),
-	MT6360_LINEAR_RANGE(MT6360_RANGE_AICR, 100000, 0, 0x3F, 50000),
-	MT6360_LINEAR_RANGE(MT6360_RANGE_IPREC, 100000, 0, 0x0F, 50000),
-	MT6360_LINEAR_RANGE(MT6360_RANGE_IEOC, 100000, 0, 0x0F, 50000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_VMIVR, 3900000, 0, 0x5F, 100000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_ICHG, 100000, 0, 0x31, 100000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_VOREG, 3900000, 0, 0x51, 10000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_AICR, 100000, 0, 0x3F, 50000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_IPREC, 100000, 0, 0x0F, 50000),
+	LINEAR_RANGE_IDX(MT6360_RANGE_IEOC, 100000, 0, 0x0F, 50000),
 };
=20
 struct mt6360_chg_info {
--=20
2.37.3


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--spmfeW7Hd1DSSs/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNflF8ACgkQeFA3/03a
ocUITQf/Vr2UgDLY58WdZKQDMEovsWmrPfqqvVaI8lXvunXIoru48z0u5F1LPzev
X65VfIgyQ4rrH+sbgBpatfqcMP9EsIe0Qu9oDEAu97ycfO4iNiWHHJKxvqqim/D2
gDu1jgH+zlgtSp/N5QKCH7R1157yQ96JFIP6Ka4Tr7LQcgjQGoygS51wMNF3G41b
MaMmrXM6ZqDNuaMOOhXMo7MQd1NGO2wAFU6bQt9KoGbHNTMM68NMlowyHIE/pLJc
5ysNufmSt5NkIEhLO0SkQNkeUYoerb4mBRYfshBlonftVuFkpcLQqyec+KAyMbRo
6zM/giLvVS8M3NJy2I514PmoEYCENA==
=KmNS
-----END PGP SIGNATURE-----

--spmfeW7Hd1DSSs/Y--

