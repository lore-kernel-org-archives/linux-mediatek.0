Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4C0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:Date:References:In-Reply-To:Message-Id:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6c5VTiMv6AfZVBMNz3DxVLxCSIdNaJFVMcQk71zPTY=; b=wS7rOrvKUsJ7yddq+j9O2futZy
	Vupl2A2gyaUqS6TRDp+iC01Q3Hdg3UGYAiiZ4nATJVlukdMKOK3Fu32xy1nonEtR/FbqLayGIfBSm
	HYe5bf/FcLXEh5U9V/+A4LJzbDYMMB/y9u2bWc6iarp722ihVVyOm4mzOeneYbMGnVLp7dYw03+IZ
	dhXEC73T2W16ZO+XfZY6Ok14WMs8GGxxZdoVSfGFAYl1uUFFxrhNy+J8cYJ/6a7cHUOgBDtO9vrqL
	PCrHWKXodJIeVFw/WGal/Oc7lV2bZwZaDN0Bplp1ilTFq8fnccgx8fKtbcqClAXuu2hKGkPmVyt75
	5v2ZTh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peX6R-00BdR6-2l;
	Tue, 21 Mar 2023 08:12:19 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peX6L-00BdOV-3C;
	Tue, 21 Mar 2023 08:12:15 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 052262B0769F;
	Tue, 21 Mar 2023 04:12:03 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 21 Mar 2023 04:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1679386323; x=1679393523; bh=p6c5VTiMv6AfZVBMNz3DxVLxCSIdNaJFVMc
	Qk71zPTY=; b=uVCWvJx6nGWx/5u3VSJfVJjj/h5Ng2P2Yhqie0BJHMjvjzYTE1H
	S3000Ce0+mrEAYEo+fTrrkOwrGIyGM/RtSIJpIl+AMe3IaZe/M9yfHnG9yQfEsGB
	osDTshQUiWc3Ls9qw2Zw7uWeyKKv9pZtQgUyAYyK61kK6H6zm7ZRw1iyIFDATAh6
	bngnkf2pqjCtTHy18W2iC0jMSPclRhXy7pawiFxq3uFJa37/Dw0UOVfoCTYIxNid
	kVhGUwaRgeQY4B8o9mWH+SDBN77zX5XpwykUHuqV16i9fCmBftgO42riFzH6w1Ei
	GyD4hF/a4GlUL9X/bR9I68HXVhkZhUlJJ3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679386323; x=
	1679393523; bh=p6c5VTiMv6AfZVBMNz3DxVLxCSIdNaJFVMcQk71zPTY=; b=s
	1KchFhGt52dzXyN5O79HxuLj6FqmtaoRirc8tC8IgABafDJR6lWnVdeusmW3YgwN
	FJAf+yx/n1aoiR0A753RChyEfaoIpIQzkZeE9GElnDfGMGVe4oIkqtFw9qR7h1WP
	zxqQpmzCduK4QJMEm9wue/7sWeCfuf6P6YHLtFguSITKE6rIm8h05WV74PgknMBG
	2bAxDrbC+Le26NytxoV2l9iQeICkXFr8qbpiOdPcrl+yCtPjEeppm+ecm6oJOczI
	x/6d20UEibueIHsAvJp1EBg4CLfe3Tl1BSAVsdcOQAbqRbpMjYLiXHNTVklS4axM
	ckago2w0Vsl5TtYiY3MpQ==
X-ME-Sender: <xms:0GYZZJjZT4P_yV-Mx_Quzl7wy0YQtEhKnVKu2qt6FAe5g0Nu5umXIw>
    <xme:0GYZZOBRlFaFGXG_FQkcgQEutyw7RZhEAYkiTJLcbFTaKAx0oZHJTkyPwuMSM-9_n
    _kFQQURc5ACQt9CvsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefledguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffkedtffejkeeihedtffevtedvhfdvhfehfffgleekgffgveeftdefgeek
    vedvjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:0GYZZJF0ltCZr-3PUVxWiK0aO1a98gJRJ1RIE6_3xBjMQmp3OqMi_Q>
    <xmx:0GYZZORTWXWGlKctJD6dpm53uhz2MzndLAhOFP-b7JCl5028QMmYHA>
    <xmx:0GYZZGxU24J2mJwqKURxfuq2oxh3zplPa2ump9UmR_oOSDgOlsWU1w>
    <xmx:02YZZGNbMwV1BEbfQ41yDSjvKrVTgq4nxJ1za-0qfoPrs4jKp0pJRPjrGNk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B3F8BB60086; Tue, 21 Mar 2023 04:12:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
In-Reply-To: <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
Date: Tue, 21 Mar 2023 09:11:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Joe Tessler" <jrt@google.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Michael Tretter" <m.tretter@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Jacopo Mondi" <jacopo+renesas@jmondi.org>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 "Rui Miguel Silva" <rmfrfs@gmail.com>,
 "Wenyou Yang" <wenyou.yang@microchip.com>,
 "Bin Liu" <bin.liu@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Minghsiu Tsai" <minghsiu.tsai@mediatek.com>,
 "Houlong Wei" <houlong.wei@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>,
 "Andrzej Pietrasiewicz" <andrzejtp2010@gmail.com>,
 "Jacek Anaszewski" <jacek.anaszewski@gmail.com>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Yong Deng" <yong.deng@magewell.com>,
 "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>,
 "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Sean Young" <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 oushixiong <oushixiong@kylinos.cn>
Subject: Re: [PATCH 20/28] media: platform: jpeg: always reference OF data
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_011214_359423_96E3BDC5 
X-CRM114-Status: UNSURE (   8.66  )
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

On Sun, Mar 12, 2023, at 14:13, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be alwa=
ys
> used and the of_match_ptr does not have any sense (this also allows AC=
PI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error:=20
> =E2=80=98mtk8195_jpegdec_drvdata=E2=80=99 defined but not used=20
> [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I see now that we both submitted the same patch, but now Hans
merged a worse fix [1] without a changelog text.

    Arnd

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?h=3D4ae47770d57bff01

