Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF83BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qPNsHee2IvijG9Uqa5Z0AQiQ5KBrCmawGSl8JXdFR8=; b=o3aIGOWjNLPiyq2+wBp1wSwgjA
	+u3VdFHGzd4roi67oVhFfce26nm/ymDG+wH2fIz5YtKyxi8ibFnsNfrkr8gtlH6lxRvCnBOabGnlW
	p++s4pNQzZOsZ05nS4AGBV9RrKrustQwkwZGfTnSdb5mBwT201dl2X0fbno/Xq4662rO2Y8tStWlc
	sB0JYMlx/yNfRexK6C3BGLzo6N9uvXdyuCIwN8vB+nTr6o9y7/G2W/nRKd+pniKxuqeTiVywo6Tq4
	PQOPotXWEjHLHCCa0Ypo8lajdxRkLjuhfiaRiok18UJMiiFwi8Sm8RWKVH1RJqXEFoci2xL2f/t+Y
	0Sgw1LKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKJn-00EG4i-Iz; Wed, 02 Nov 2022 20:26:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKJc-00EFzv-MY; Wed, 02 Nov 2022 20:26:26 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F4EE66028C5;
	Wed,  2 Nov 2022 20:26:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420783;
	bh=SiBvjEqjOQ8graHul0d5aAHZ7lbj/evLfaj1eQjt2V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng3Sf5zbd8v3RnHNOf/X0A1C+ftRd/MMRqo1nP2oAWf6OzA4V3bw/09s+fPXFQRK/
	 kbE9nwOVpOLLWW3DyqS6q2HwBULZxVeU87MjVUptsIXrTGul1AcA3L9vqMKRCaMXgw
	 ufzaZbtGUVM84QHrSF7F9vq0iW5iT8Xvg1xzWd5h6Vs/p2Vb2fXDjGwl4MMAtZJ19H
	 Q+39kLTE/n3s94hMo0HtnJhjdNyfW7LUe5nAnLu8zpYOeFInwKzDUg3fV+aVatKGlg
	 GlJr+fCH10ywr4UhwTw4rMoHh0kvepd2Xg9hK2xGzrtUHeUfoGvqo5AK7Nx5H8GXZM
	 22vaTblxzOGdA==
Date: Wed, 2 Nov 2022 16:26:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 5/7] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Message-ID: <20221102202617.ailu6xc5qfstnl6c@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_132624_887315_8BB7D108 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, Nov 01, 2022 at 05:01:14PM +0800, Allen-KH Cheng wrote:
[..]
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
[..]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        watchdog: watchdog@10007000 {

You could drop this label since it's not used in the example.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> +            compatible = "mediatek,mt8183-wdt";
> +            reg = <0 0x10007000 0 0x100>;
> +            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> +            mediatek,disable-extrst;
> +            timeout-sec = <10>;
> +            #reset-cells = <1>;
> +        };
> +    };
[..]

