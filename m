Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134E606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BCnkm2CF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=p7dXzX1D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYox+SzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=; b=BCnkm2CFe4dVaf
	0j4qSQQ+2XNMgidGqvExH6A0MC8JpA1fSCI5BJNsEC52cTBPr+Zlb+O2a072ZCUSqopXHA1osB7Sw
	OrFnMzyqIUeoIH6vS22faxXn3pl4k+RgxH74hyYtiAOO7fY4YQMReF2Zq2HHhB60Npq0Pprqi1SZG
	wRFahkzIKB0LIHWGqLOn2QyO8wOpAOBJ/+ou3nj1ZRcrR8m2eqTj3ujfRT9uijEsWCjGFo3a6/g/b
	ehctjn2fjoA9u1OTYJSKOZNy0pfrcprogUF7Wt0ZIfyr9JMn7oeuur5rv8PWcRfXY3xTIVJvC16W1
	IMBmcS3UQVxEBZGzI6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV0A-00000003k5f-3hxo;
	Mon, 23 Nov 2026 14:26:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV08-00000003k4P-0Xu8
	for linux-mediatek@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=; b=p7dXzX1DvMgL2qjG7wVXg5qKSt
	o055IyG9CLq3Z0fd49uBGvZhSBrm1uxH2IHNt58V9zcwL1XQv/HLXCaw+FGvQRmnRgnQ/rNhaADqF
	mlJHI0UxPYWzz6qV8gVN+jyO16pXCadK8hIk7Hf/vBk10Vl4SD7LiA7Tw6IMGuWWcuHvpx7d87KS1
	AModRjX+bt+lNXIVTaoTX7QMBCH84+yPKRLL0oXptZSTe4jRYdwES1CHFfsEql+GlhreOy4oAfTYz
	cTO4jYvfhpenQzF8/Fv9OT/qvHGpRipSNrUNtRj0zRmVip9lrHnqCNd7TWTUakksap8WgvfL2L1z8
	ZUO//ywQ==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV04-00000003Eg0-1gBx
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 14:26:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3adef977ad9so25180911fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443988; x=1796048788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=qYox+SzKO1pVJPkcumDXYLuBeg0+E1a6a1H2mVOh1VGpaA73Z3aLjPD4SI560hB5bT
         GysmIhi63h+62bGE2p7TbuR/Vrbxz+c1eAT2+8Eu4IZjsWfe+HLEWBpQRz/5Na452Gek
         6Z8HgxNqwZHLx3QrxPqy75zH5XVyPu/MxbdqRiPf9RVrnCIK092AP4s8arbJjnbrlllo
         BP1uE3ouViX3+JWI/g+0PybatnH7zSGYiG6kdHNfl18roWYugysLSbHQeHpUNCryIA8k
         Y2CVh2VjfH6mTXsj8SplUg4bFtPIeuVyKhquQ4EWE4kyKikDUz2ZbtEEQuWuSQN6I8dl
         10FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443988; x=1796048788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=i13VQ4518cdmZ9r7X+JRoe4rl/54L++NPq0W0aKmCF3l40EXlVenjjgRgQxfwb9g7w
         WQlYzh6bZ+3RySXIK9lqAg0AiAm7fhiymS8jegRvqhukN4ipqxmCJpQfblq1YktszmQL
         sRCnJyZnRItvqXgODfr+EUzWQjlS6lQwUKazoSieV2l/2JFKcWKRD/KGOvEt0GQJPjje
         6UiCrXkREX9WSKvVJvJL0huK3R+aCFC5Ic1OZ0ifeilJMGc1S9VasUMqUFSz4TdmdH/T
         FOVIlo8FW/Nt1nCJahWrTIkivAqdo0QboGQl+WtiL//KzK0mBKQJHGxdTzAxPj71OlBd
         zjuw==
X-Forwarded-Encrypted: i=1; AL+hErFPQi6UPadOB5ObzuEi1fyf0ghnAihWeHUFWC0DJR39NYO79Y1YFU+7hf3+aT+7a7OH/6Snac/7eCg2VEdswA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8fJfZVFtkRnH4IkWUePRIUe7GsRBescdmiVMRcTnGFV3BbNm0W
	CoBZRdrNMJm5I0qqFsUM5htcISMx6pDeEWSHlOvfw85i6x52tDOS3+sh
X-Gm-Gg: AZFdTZcmWSoJQnSdvOj5G060Kg9vYgKCY2eW7q9VNRE2MFa0PfRFNpgbUtFC6MUTXdl
	z++6KnR+8WU1F0EqyrX54actrEJG11dOQFJF0VR9jkPLG1JZ/g4R/fC0el9/JXhEmKZycuzrOk8
	kjCV4DAfmwtGNo4Aqx6zFtnojE5PFIos/S6SfgX1hovqyetWRNKWs2y4jClHtFQg21Vlstikp10
	WKo2kDWWyMuGVsiQPyZsCGbNUEnzZNH2dlgv28w1LsQ9ZNUzT6ifiKc2M0EAJe1IHRMEEuoCQer
	PxXPjwtG3GC8fywGErvhGd49sGlf/tS5ZbPw6Z2wM+6kgqSYrMqlMAIhek08qoncYKmuLPpqxAn
	85JI4lnsllIaPVivwpytqkuG5l9FLQR6s+TdHjFJ38LuxBdwSzTGuZXnPk3uEZ2S4f3pirY9E40
	ZOCr/GLFIltj5gq8UpGHWrc2KRQVj6gpe5t+wuXOdaEil1KVXfL/MrQV99S+B+2CmRudAWLPlL6
	xVc0DG1uw2jiRPIEow3fbpBoslf6IKGSqAJBe9RCP4ntcVhbcISEpHUqQqdkMetyQpelzem/SU4
	T4h9/KBMmWqjOu7A509/n2wZ0CTAkFmYx+bMcSB/GyO9nAi1q77xzBpJ8m+CCq5yvVVKfZ+g8HW
	v5Cc35W+HXQ==
X-Received: by 2002:a2e:ab0a:0:b0:3ac:e4b6:b93d with SMTP id 38308e7fff4ca-3ae7f9a072fmr31420641fa.8.1795443988058;
        Mon, 23 Nov 2026 06:26:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80536529sm33679491fa.27.2026.11.23.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <bc178673-54dd-4811-acdf-cb6327ec2417@gmail.com>
Date: Mon, 23 Nov 2026 16:26:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/17] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
 <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142632_275499_8469537E 
X-CRM114-Status: GOOD (  10.90  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 13:18, Uwe Kleine-König wrote:
> From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccountw@gmail.com> # rohm

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

