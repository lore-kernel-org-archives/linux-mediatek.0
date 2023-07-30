Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B9FC04E69
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jul 2023 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeeZC0V5tcLftdWQywOYSHKqO0Nv4KQcKmETrSmJ6ss=; b=t4Fqnty1iMCkdfddH2GWdwGBLC
	GZMnt9T+Ktgaeg8gdkpdBkjJNA8dnAy6xTA5MwJskuSRt8Lg1WjDQ29ZCI04uxEnzmCUhT4IhVV2I
	ejqaRvpniyDXKYCVG/EeQxsPQTubb8IhyBQCEUvygweNX8VRVe/Hnaa69Yffwcq9hoofkXdTXTbjf
	S/WUK5CbREDs3OSdyAgRJft4rOH/4lCleaHg+Elu1W0XTPO3rq2gzzCiwkLPHZIgJGjRsVna18MK5
	RYY3XTR8SnICQsyblbrMKUFIgtqNU97WmfGsr+WERzoO1yGw7V0QANjWyVf5ixsVAkL8CXHNhN0bi
	dNuU9Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ6OA-00BYaM-0I;
	Sun, 30 Jul 2023 13:23:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ6O7-00BYZG-0S;
	Sun, 30 Jul 2023 13:23:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54C4760C56;
	Sun, 30 Jul 2023 13:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117F6C433C8;
	Sun, 30 Jul 2023 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690723389;
	bh=aKQ6zX5k8uIcjBF07axyeQZQbvOI44YmLbkG4ePV7a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUc9R2fD3LNYnghaSowLatJqOC0h3Y2XynN6kqFmy+/1gQtN/wJWL5LHHL082jjy0
	 IABgpRJt3vZ9qo55KWopUKXkl8e+bE6luBhHk+tdF6Zq/f0HxW0J3LZ8SYs8mQrc3Y
	 PbwBY2nG3bE0iT9E/yQX2+fLqFvSNt8eLRtly+jFQtml7+8sBsKTjqI0gMe8boRTgR
	 p+jQ9Bn8JgTdmDQPZEsFxzMMyDdWNxPu5kBS06tQ3lMAOb2y0+KxkvJVGE3nkKEMVY
	 /gTDJgH+UTRye4U/s/vI2LemmXQ+/txfKNc3NYCSnXBPE8SOWckXJo37ioRByB1Bmb
	 oKmDqoCTKgYbw==
Date: Sun, 30 Jul 2023 21:22:52 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 4/6] arm64: dts: freescale: Replace deprecated
 extcon-usb-gpio id-gpio/vbus-gpio properties
Message-ID: <20230730132252.GQ151430@dragon>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
 <20230724103914.1779027-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724103914.1779027-5-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_062311_221103_27D90E3E 
X-CRM114-Status: UNSURE (   9.33  )
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

On Mon, Jul 24, 2023 at 12:39:11PM +0200, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

