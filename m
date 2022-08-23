Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C1C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc7h/kVnvC9kdTpSvxbBHMd/BzbnifLnlAHcP+hPXgU=; b=G5X4kqyGIKCXBhw7agvL+4Ie7/
	VM5xuq10+4YOJVskkBgEBuPHRArwSiPdS2kKLE2qs0/E6hHMuB7QpIrl8TyAL8kptg11WolW70lzK
	1oWeuK4yk3QiYS8hs1H7j2FEztw1y6SqI8NL93q0YjhVfAgylr6pki6mYx7i3dylf826x4O4fXIeH
	lzXF975k/eIP0LPHGUrqURPSy5Gm8kIgc43CIqGIcb4ie+u/EpCZVw7OcDrSinSUhFRXumffDhMRF
	bhsOhgnpcFf2Y1PdoZx7kFwDRWmSgFugkvHc5Zt8My2OHfT3bO3YWuRiRsBXy+nvwgv1G8EcncXbz
	dyqa4jBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYw1-008Dal-N5; Tue, 23 Aug 2022 18:47:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYvq-008DSI-6M; Tue, 23 Aug 2022 18:47:23 +0000
Received: from notapiano (unknown [194.36.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 029976601E65;
	Tue, 23 Aug 2022 19:47:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661280436;
	bh=yvZ81keYhwI6G9e7JnIqRWODLEgNPMGKYnHuBSLuw5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOxcpNly5jz4ZfzlyvGKuCt/2JZYpTVvicwdFzsY8NSJP2fR5fEWwLVzSZPYP2dXD
	 qQQYgIIqom+9AgdlxLQKBnefxPDWQDJH2AGSlhF5xrcrxwsQLXoOPNU7eWAh7Oz+p6
	 yE82v1LU6up8+LSZ/DcXDZhy03GJ5+6T+g20A3eNVOKIGSAOVy+Z5SGgFNjt9u9LR0
	 +sLYNGjNX8nqdS6tyORZGrvZpOt8Gis02jjDxXG5tuwUf0NFGtb9ugrEYKqXXKwB8Y
	 +ajHow3J2rjrpOD/LKGnxsPrRe+0E0zevTcXqArW2XUrKOKdV3uylc5dQ2RSpISlVS
	 xbIXEt2LLT7CQ==
Date: Tue, 23 Aug 2022 14:47:05 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v4] regulator: dt-bindings: mediatek: add mt6366
Message-ID: <20220823184705.6fdpczguait2la4v@notapiano>
References: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_114722_402530_5DAB362B 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, broonie@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 23, 2022 at 08:37:45PM +0800, Zhiyong Tao wrote:
> Add mt6366 regulator document
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
[..]
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
[..]
> +      "^buck-(vcore)-sshub$":

The parentheses here don't serve any purpose, so drop them.

> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
[..]
> +      "^ldo-vcn(33)-wifi$":

Ditto.

> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      "^ldo-vsram-(others)-sshub$":

Ditto.

> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
[..]
> +      "^ldo-vsim[2]$":

Based on the example, should be [12].

Thanks,
Nícolas

> +        type: object
[..]
> +            mt6366_vsim1_reg: ldo-vsim1 {
> +                regulator-enable-ramp-delay = <540>;
> +            };
[..]
> +            mt6366_vsim2_reg: ldo-vsim2 {
> +                regulator-enable-ramp-delay = <540>;
> +            };
[..]

