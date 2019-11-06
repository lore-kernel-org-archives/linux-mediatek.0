Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAD9FC6194
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:48:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040B42173E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E4XrQ7yN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040B42173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGY15LO9nVfjSQBot0k3dXSsXHmzbeLl6bOWtUUiQXk=; b=E4XrQ7yNiDdVxW
	GQnNmnc+1WAjQv+bva0iJ35H3y5zffZ8YUu6VtGIh1gqLHlIxz/IEsrPKJQTejm8k2dddRwuE9fqy
	IrF+s4N+wUyg2Ihv178LAXfnCCFdSR6z/rfhE5m7/QWg26RR/gf8yXrx7ZbOj/9/C/e58q2eHC32c
	KLIxNpH25mNJgjgrflVwF12+Ekl8Z5j2dfjBwtx9Di19nIPW+YmKFfrOd7eTlOnI/9EXGNCphSZoc
	6co4W4GbUoWYgE3TlMZE1qHN16VJO8aNXHIzgwE3mb/ml+WxwGiyHEvVty6OLfBv5g5Btc2Xdmg0i
	zG5nNUTM1oOQapcUJKFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSV1x-0002u5-CE; Wed, 06 Nov 2019 23:48:05 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSV1g-0002dr-9z; Wed, 06 Nov 2019 23:47:49 +0000
Received: by mail-ot1-f67.google.com with SMTP id b16so365747otk.9;
 Wed, 06 Nov 2019 15:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YghF0O9CdijziXRtYqs4rBgfocxRjD2jrxaldxrfZPA=;
 b=L4jO9pCHKwI6d21uIsZ0AJ65GTVXdpK1qfMqRsJR7ztiffZUw9nuOiPRz5DCIVUPvT
 1nczISNnXkA08DU+wc1iNE/fXYz/RaRGBNl9cPwg8apm+QxSROus99KZuO/eSr47PWDw
 DZs3BMduHWm/bsUJhpfF/1w+S9CvNrMNQWjOBVfh3/zsrsFx/4dpt8i76z3WewmweycY
 fsIbffyZLHkFE9cujaeMk3GFeSFO5d6xAXsiCzJ7TDr9GGqPW0oBgYvRUG6kt9kipcKn
 J6DeGDebGVbwt+0c16o5PokzzhVyUEIE2H6UJb4k+r/iNHqeXa0nVAa8PDuz86I/GEba
 tE7Q==
X-Gm-Message-State: APjAAAUuy7Mt2QTm5B8darf/uCvV2ik3PNAaHLGuWFY7fLxibLmV2Rzu
 OGcK5Zm0g9PA3issYm7dHg==
X-Google-Smtp-Source: APXvYqwgUlLWV9jHJ0xyKT6tWKqUtqWriZJeI42q4NAZ1iSZ8g0t2OjEoqRReV7onJSmLDH/dWe6Lw==
X-Received: by 2002:a05:6830:232c:: with SMTP id
 q12mr319872otg.168.1573084066922; 
 Wed, 06 Nov 2019 15:47:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t12sm150529otl.71.2019.11.06.15.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 15:47:46 -0800 (PST)
Date: Wed, 6 Nov 2019 17:47:45 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v1 7/7] dt-bindings: PCI: Use IRQ flags for legacy PCI
 IRQ interrupts
Message-ID: <20191106234745.GA29524@bogus>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-8-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104163834.8932-8-andrew.murray@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_154748_375015_52E04364 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Toan Le <toan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@axis.com,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rfi@lists.rocketboards.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon,  4 Nov 2019 16:38:21 +0000, Andrew Murray wrote:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  .../devicetree/bindings/pci/83xx-512x-pci.txt | 18 ++---
>  .../devicetree/bindings/pci/aardvark-pci.txt  | 10 +--
>  .../devicetree/bindings/pci/altera-pcie.txt   | 10 +--
>  .../bindings/pci/axis,artpec6-pcie.txt        | 10 +--
>  .../bindings/pci/cdns,cdns-pcie-host.txt      | 10 +--
>  .../bindings/pci/faraday,ftpci100.txt         | 68 +++++++++----------
>  .../bindings/pci/fsl,imx6q-pcie.txt           | 10 +--
>  .../bindings/pci/hisilicon-pcie.txt           | 20 +++---
>  .../bindings/pci/host-generic-pci.txt         | 10 +--
>  .../devicetree/bindings/pci/kirin-pcie.txt    | 10 +--
>  .../bindings/pci/layerscape-pci.txt           | 10 +--
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 40 +++++------
>  .../devicetree/bindings/pci/mobiveil-pcie.txt |  8 +--
>  .../devicetree/bindings/pci/pci-rcar-gen2.txt |  8 +--
>  .../bindings/pci/pci-thunder-pem.txt          | 10 +--
>  .../devicetree/bindings/pci/pcie-al.txt       |  4 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt     | 20 +++---
>  .../bindings/pci/ralink,rt3883-pci.txt        | 18 ++---
>  .../bindings/pci/rockchip-pcie-host.txt       | 10 +--
>  .../devicetree/bindings/pci/ti-pci.txt        | 10 +--
>  .../devicetree/bindings/pci/uniphier-pcie.txt | 10 +--
>  .../bindings/pci/v3-v360epc-pci.txt           | 34 +++++-----
>  .../devicetree/bindings/pci/versatile.txt     | 40 +++++------
>  .../devicetree/bindings/pci/xgene-pci-msi.txt | 10 +--
>  .../devicetree/bindings/pci/xgene-pci.txt     | 10 +--
>  .../bindings/pci/xilinx-nwl-pcie.txt          | 10 +--
>  .../devicetree/bindings/pci/xilinx-pcie.txt   | 20 +++---
>  27 files changed, 224 insertions(+), 224 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
