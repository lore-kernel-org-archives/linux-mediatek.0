Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7563C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I76nvSHp0bdHeeCg3//HPSzG9sLTn2qiX7DiG2enz6s=; b=T/SWtzGNSfjw7JmCkuDr1XCTrg
	feloIOr0mW3+yG/Sclr6d75LYAEdPEafmfl0tiuEmIpioolN17vM2PbeICJP1rlfW/2h4Fg8qbnvz
	2+Y01+gEFY/vJ9smtPJpTh3HdlFv7bbCDjQBdUYG6VXQuddQnTCASpsI/iXXCGPFKE7g8FF2Tnx1K
	LhqyZyrNA9Zb8YgRCY7zKzK5mj0luq03tzy2wvl0cZHiRrncZNtfenVj3SOtBjF+pUfZZGl3QsJD5
	60WaKgZg4O6dSP6f0oxHmZnZL7CU3WNKkezx1olBFCg6vogpOANcWChHGpS5apzifDaGnmTjvreaI
	olNV+8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7POk-007Hil-Me; Fri, 01 Jul 2022 22:46:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7POZ-007HeJ-1h; Fri, 01 Jul 2022 22:45:52 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 492C86601802;
	Fri,  1 Jul 2022 23:45:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715549;
	bh=dMkhMWDLV8DoGp5vVqOTNrDfZz6ODLc2/CxTYZKYwz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5qPKJ5W5EoBqXWpQldSNP5tojZTuOuvLuj8ZMTe7t14rhJtbGtUu12xDfmo7UlDU
	 VaOHn3sjgqKjn+ofEJg1WG3S2/JjcUAu5tsDETI59CCwXfTY7WdhCc3oB+cpPLqnRQ
	 kttdnYcehORKV/AlXZco1VrD9P6OLQVnQwSO336s49NFSeI2H9OiptZxkkxAzR4M+I
	 lC/ukgJ2k4bjGgm3FwTx2tNhDLPQU2sKPtSzHjd6Ulkbsps0vmJ3T4M9zfGJlHDKpp
	 1L+9i9AOnQnoV8B80e/nNGeOHnEnBS/wQcT0128sb+qoO0SlQb+LT7kVTvU6U1LgmJ
	 LmZB0Y/TMzS/w==
Date: Fri, 1 Jul 2022 18:45:41 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 09/11] arm64: dts: mediatek: cherry: Enable MT6360
 sub-pmic on I2C7
Message-ID: <20220701224541.nyjpv6fjs6ge6p4m@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-10-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_154551_261134_CB31E2D7 
X-CRM114-Status: GOOD (  13.90  )
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

On Thu, Jun 30, 2022 at 05:33:14PM +0200, AngeloGioacchino Del Regno wrote:
> All devices of the Cherry platform have a MT6360 sub-pmic,
> providing two LDOs. Add the required node to enable the PMIC
> but without regulators yet, as these will be added in a
> later commit.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 379d0e5c4055..1668aa1be373 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -161,6 +161,18 @@ &i2c7 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c7_pin>;
> +
> +	pmic@34 {
> +		#interrupt-cells = <2>;

The binding says this should be 1.

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

