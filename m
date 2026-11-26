Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D65606A32C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pw7LqTSf;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VxHay0ay
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=; b=Pw7LqTSfcapsKTPA8JTFUSdBkF
	c2vWW1EPCFtjTGKRr+7Q2dUp/T89JWFpsbgg66fK7E1Ss9vb5R41327BzIOfQNLMgumBthXyc8qOr
	qpiENaeZnO/XI+QCg9uid59ibeFiVWIwcAApFW4sxUwVIEqxblBpLSCEedy2/yeLeIIGFaHTA1tak
	cx/hVwJQz5xZu/UC72ZEB25xo73Oz4wdPam47mb8ENFvmPmyFhJjyJ3eEDmc4rUOa4JQxKo2PpJBu
	ki3+xkQIeI6XP9MoprsmFT6P1rfwx9YBDYUgcJcmto6h7pAmVlMgpBhvcAvtWsJ0xa6aklje+BD8V
	rkBm6APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdSb-0000000E5YN-0VSq;
	Thu, 26 Nov 2026 17:40:41 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdST-0000000E5Vo-22RF
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 17:40:39 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-92107df3f13so68474306d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714831; cv=none;
        d=google.com; s=arc-20260327;
        b=KvhU7BzK3RZ4UDu11vaUQ/0xQ/S2Pjn9/nczo/eHACPKIYrl+pI2vLZY4D8wBuwqgP
         ruD6ITm9XPcy0z46gFfR1ouVjkeZy6tpN07sWqyIaskgIVzJ9aqu9Q/GuD2zTetZK6iE
         4b2exLhxnlY3CCOXexkgeuYHnMEW7G4BAUveD/Lhk5Rn+uMiLYIroT3YhpbNIKSZ7YP2
         Wc8iR3y1jUp7fOifRgAi/F4lXFQJxvZFcTp0x9Bt8Tp4VGQH/Mlpn6t7XTK6j05VuclQ
         38eFa1keiQAKWIGhjuoMx9dxIFLqax3mpbi6yztwyMoUShVfkarYiMiiSQl3VpKycWIy
         Lhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=enDipwNc5kJfjY69bggdCGyJsxrvnRpdrhruzF5cLJ8=;
        b=EXdeI+asqM6qKNYxOQyhM4rkRwPZiWvjZWg8BN8G8fS4aEAFGXcWSgV31vuVsOBsnB
         ZYPIq/drPzn5vJpO5uE1vt4cwoDW33KNvQeyYziR6t0BB5H17+1bUoBRilPmwfUuLnUY
         YsADrR7gli59V0dkHtgwVbhKtb25XSbh5OeKdt6z1LJs8nHqR6IPxuFlZxvRkYGdwwK8
         CLhvg/tp0wsaUfY9GwXOF16Y3khYsCcRhq9kpLUBuF0izEOVXXF/pUGFmlib6mdbyIBo
         HKWd9PBapXaq4JHSDZ+1WkDR6mKNAbt0tR/sGK/v8b+Xxwmj9FhU9WtrLafRRiW5bMxX
         OHZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714831; x=1796319631; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=VxHay0ayWMBkPrR0IZBE3l2e6MsS1rFkyEQdtc0XVyFRu7C9YzynpPlxsiZlnxe+yk
         SohBf2dEGbu5BA+fZl6132ElL65aad9Rt8XKBfCtQKneMQRrkygkzaoWZfHqgjGiIa6P
         Uss8KKmAAz7zSDbQR6jxKltr4nY8Y2OZceahiMR6Ou5ztvl2m7E/M0hc5/t7gT3nfT1b
         eHlvvbvFgyHe94z2CGyxC6laN5eachos4FMm5CTC3wf7h+ooxXKrv1DAlq/YtdVw4jaO
         EDUvA8BlpDbdFDN4He3pCNdsaECBMqSyR3N17zfy0jZ2KeeRtBVH9GEgSNn8vi05qM4H
         p57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714831; x=1796319631;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=L2iyQVmr9HeGe0fHwtFhhBOd75eerNXRmFrymKFjjwd02uYxOaOvsLrVMkWNoyCn4O
         DkSF6YuqOLDCHCLj3si6j8c8Zcyi9yGiOCcehBWkuLQEnVGTqAKiaCmMOp18e7JFj6S+
         SoceXc5nc5P6Sj4tMHcO8VgPbvhob80EtrIHGznmqBQNN2TjFHB5DyJApK+z16TBA8JT
         PPjn6uHtovLgq88B4+TD2ZRQ3sCvyTKfZTzeLFpC1KwCyk5VHncs74XPCqoc7D7jnNJ+
         sf4Ja4BfQRykrrdApV3IeCU85PwllOcfXSAqpDJR5diuLheiwBfgvySCNrQKz7wMB6q4
         /EbA==
X-Forwarded-Encrypted: i=1; AL+hErHxwqx5S5dNqyN8VS7jKl6azRPtPNECDkfEonIAga8h3LyCI6gQq0xjpoWYMNsPxoMfJDtavvViHxeNOp1iLw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9RvjkFG+ohdryOCHAIReTc9jDoHFpk6WLhJ9EfFxbhuyMwwiXE
	Pvs//hKPWNyb6eX26q+H+84yDTCYEplO2Oep1m8pfX2H3VqeS43MEMZLuN+G2v3NB7YIIGD1rrH
	S7BMcVDfeEy+8qdnvV+WIqzWb7gwcR8YV1vB9X3yRyw==
X-Gm-Gg: AZFdTZdfUDnPfw0CW2JO8y8vECevXZXO/3K355vi+bLbtk7942ELafYehTmrMNgyeSw
	31rJJt8HbSJTvF8ys5Se2rP04veZ7M4M0DehGXbE5E4lQAAdsBofWGk2zfuhW0UUPQgtuaRcit3
	IDGb75XXnVDH4vtipSNJylOdmLyry/NDe8oUhYTwNqLyVSev1k3EuHMRPyCq7vkyASCvdImE3rF
	yjrBD6q/YfehqwfJRdRGlicQ/ykYWEARvGP9dENRvbZNUII4/TAHXK+tBGYQZRrfsq8kFXBPIE4
	U5XwRPdIB6y7gTFWHWukPwYmXrRDtCcCOHDp0OzIJqua7hAP3WanTeC1vgO8ELPja/wtVgKnbtW
	nxg0r8gegXjR6KHqqa+oR4nEOTiRszwsQm030HrVd3M0o67g7qtXeAR42sZIdmpQKIoS2LHU=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_094033_650548_28CD7DB6 
X-CRM114-Status: GOOD (  10.60  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel

