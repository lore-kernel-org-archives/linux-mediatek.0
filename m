Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C3C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J0W+HH37Pv2efIqlvJY+CSNriVkpd08G6uC43n+CxY=; b=DPM8DdSXO/L9gK1ppyc+ZxS4eE
	nmCvXwN1ppHgRqiIjMVlWKCntIabirb2JyF75+Xs1573DnfRkfd+2WCDa7igdPppy5RnJSIxrUUpw
	fFepXRTbONweSANF/JjX6mqd2CshuFqpfbb2vf0hM+obKS2abQJtlmfMR8ka0mVX8miykFvFct/5s
	YFHKgTHC2DQlmbvdIIy43svc5Kq9MFpTxNAV0m6sN7OSAXmZewKq+VO7g40+RQ28zT9ZCTmA/HW1W
	0q/uK1eIV1dexbOwsJ/MSKNywiLW9kmC95izNxpxHHmSi2ciIvwn+ErGQWfcFiGG6wXle4X9/F/4p
	cEwvwywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1aY-008g2g-Vz; Thu, 28 Jul 2022 11:21:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1aN-008fyn-R2; Thu, 28 Jul 2022 11:21:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 49FEE6601B43;
	Thu, 28 Jul 2022 12:21:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659007305;
	bh=cQKa4cD8+Dc8uivpLk6aRVwpns1CsSwbo+ldgdagj1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSBPIdgbeM9yM9T8Rey7+jygYbHH7L6TwPmQFrJ3SlBTQwx4Lo3qnurhN8zy2+Fef
	 TsObUv0p9KZHI2pRs72OVlwWSSgOPKBBE/qsNnVhPK2JZsEHCQL5VsTgW2ySr4Abio
	 dAhGWWa1Al86qwOxaZbTiYKSmrmu/H/vcqUMzFUSt7p4c+2VFjVFka8DasdqPBVsAP
	 OAK8xoAQp+4IyIjtszy1/Tw2Bmfjd66nZzwtQYFsJSAyuOGTSxNUNtPJm1EwxSsuFE
	 /dUpJxahzl/ZhGPMrh5FHxvUwkghSbY2tTBAgxmFrS+QzebY8hsamBrHTAjGRALmwG
	 sqxJNc8hVyi7Q==
Message-ID: <c455adea-2d18-60af-7175-a4e283e3dcb8@collabora.com>
Date: Thu, 28 Jul 2022 13:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] arm64: dts: mt8173-oak: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eizan Miyamoto <eizan@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Evan Benn <evanbenn@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220727094034.1372745-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727094034.1372745-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_042148_040361_52E93D0D 
X-CRM114-Status: GOOD (  18.29  )
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

Il 27/07/22 11:40, Pin-yen Lin ha scritto:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v2:
> - Move the modifications to mt8173-elm.dtsi and add some comments.
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e21feb85d822..b2269770abc3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
>   			};
>   		};
>   	};
> +
> +	soc {
> +		/*
> +		 * Disable the original MMIO watch dog and switch to the SMC watchdog,
> +		 * which operates on the same MMIO.
> +		 */
> +		/delete-node/ watchdog@10007000;

Unfortunately, we're not quite there yet.
The comment is fine, but...

There's no need to /delete-node/: you can just do it like

/*
  * Disable the original MMIO watch dog and switch to the SMC watchdog,
  * which operates on the same MMIO.
  */
&watchdog {
	status = "disabled";
};

and...

> +
> +		watchdog {

This isn't addressable, hence it belongs to the root node, not to soc.
If you did that because of naming issues, I would propose to call it
smc-watchdog instead of watchdog.


> +			compatible = "arm,smc-wdt";

P.S.: No timeout-sec?

Regards,
Angelo

> +		};
> +	};
>   };
>   
>   &mfg_async {
> 


