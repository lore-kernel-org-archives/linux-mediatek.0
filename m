Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55154C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gdxuNf+Axr67LtZ9uJ4KzAt1BhlIlNW7JVJbQsQ2a4=; b=ABBa5ZsnV+W2cuGiTeXumyVIuU
	UopWt5IJje2TD6ITYuLMo7c1fDJVi3PR5lJmr1PndAcIuCtUvrrXyz316ngLl036IXSjUFMEQYqAY
	nmohh8fmvefAWmToHXeXB+sry3ZX86AYG6Eztj1lMLlfTUPErjZYQigtTTRXa4omrTbE+OpQTdc5F
	Va1yD8VcLXedOaog8urlEEzsqza3FcZe9qshEA6/bmasDG8Ck7Y8d9J24mN2Fes6XrUdhNO+2lRxV
	l1hPncHd7RTU5zppLSqsIMY4Xp7m4+37f29uljd2UvkcElLXVtgKvadnpF/3GMAoCj/0Z2Yjzixbn
	G97dNaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piB8h-006hHZ-11;
	Fri, 31 Mar 2023 09:33:43 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piB8Y-006hD5-36;
	Fri, 31 Mar 2023 09:33:38 +0000
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Pnw7y6y75z49QHd;
	Fri, 31 Mar 2023 12:33:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1680255203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3gdxuNf+Axr67LtZ9uJ4KzAt1BhlIlNW7JVJbQsQ2a4=;
	b=uXy9sQTh/lvsZhI8D39u2L7eRoKWTZqYrBObxWhgUi19wSqbDOo4bkQAA+JNPylXaevKjR
	wX/cLSrqWnxfqJwi4d4ID9rAxNsHIQ112pOwbAz1+s30nbtRPb6oqSXDqy0o4h7CfBdn81
	s1JlPIRZe3B6HLaH92Oc2D9xJ34xUDkPrP/OS869Ave1kMhR/xsCCUgB4wRAPKdfbzqn8Q
	4NBmnKpHUV3JDk48b1eihaTahad1sEMxctjY6q+Mq3Mf/JTxKV3XBLkyiQBlnv++n6jGvW
	yezJnJeADvPG6kYbfW+aVWBXvLybXRjXRe60kZFJgPe2xX0mMZR7Lch8VRNzcg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1680255203; a=rsa-sha256;
	cv=none;
	b=Y2mZwfIhcSXk29ca9bHqTLn/zar/UzrZyA15qi7nfy1qho/19EEqw6j7C++olU6O/EUuKU
	B73TSoLjdSUX5WFyBllNzObNCbJXuRpOSRgBgBK3g8xAchzvJOMYNwAh/cO0vFbwaSOjLO
	W57CeqdPyNDzZMbFKXxktS6jOQQf77Ed8EhR3rB1SsZFqGMfgZ1PCVbGLAnhW41lId6jf7
	IB8nQDQboFRYhBKJR5eC2GYQbfmhaCsdtitIvOYg3sNpbt5sLSVuLlgp1bElmbkenu+2rB
	oFaropMfL/y7VZmCxvcb3bmKAx/tUBavgkBuB4pwuJyqT4vlrmiCXgXks7v1EQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1680255203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3gdxuNf+Axr67LtZ9uJ4KzAt1BhlIlNW7JVJbQsQ2a4=;
	b=E2uOv63ikqvai+QjOg9zREzxnZCJkC84meEtQzTTa7nzCuzXVI/dbifCOExzIHLQM+BepV
	EhNPoaAmQE2hr0gXNblU6SPC5ScIEEimrRd6DPY63TxoJS0wWHczl2ukMPynVMubfz6EpD
	+T6xspQJ+7wT8ELSfD0u8gPTVc0hH6hzm3iHcSdXGG24mqVNCEDwlhgjnLaH+fGLfKAhaa
	JmbkXn/Bp2/+tNw6qjbUHnekPOVMDTR/SQcDPFtlSFpR8xDynoJrmaIN2I5J4xnWeLb3wS
	U/KGktAh2MVh6tv7vpwbCl7mMQXJIK4IMlAWJDRshfxdjuNAysNfaJKHXHR4xg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D0C70634C99;
	Fri, 31 Mar 2023 12:31:03 +0300 (EEST)
Date: Fri, 31 Mar 2023 12:31:03 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Joe Tessler <jrt@google.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Heiko Stuebner <heiko@sntech.de>, Benoit Parrot <bparrot@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: Drop unneeded quotes
Message-ID: <ZCaoVwRuxVOTZdI4@valkosipuli.retiisi.eu>
References: <20230320233944.2920964-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320233944.2920964-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_023335_208557_78D17EAB 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Rob,

On Mon, Mar 20, 2023 at 06:39:42PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

This patch contains changes to Qualcomm bindings that have been already
made by other patches by Krzysztof. I think these took some time to get
merged to the media tree.

I've dropped those, the result is here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?id=d75cae0884e80bba486f85e82b33a1dae3c9c976>

-- 
Kind regards,

Sakari Ailus

