Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B7DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xfvWTcakkMz+dD74MgZoUirhWIu9CjogfKx4EA+nqZA=; b=1gjH63nuDgr4ek
	cocoG6vCO2ip6K6M2pFXQhO0f8vps+kSl+OtGkyuL+8n1yu3VEOiJvThoyDRQL/dzojhmBoqR3ikD
	m35Jn/nPsIe3axSEml2ioJ4abZt7wiF2IJEpQRaNI6jHmF8bnyGg72gedM7dCTNAvr+tFSVrC9Cw6
	OUzabCzyVKTyRX6BU2+S+7fctaGGVLGRtQ1Roq0SrScGtMnbI3CtQp+JFM+3lfisdKRCUqFXE22+u
	eh4Mw3Dn9UM9WfwkSCkeyL2jX9LFz8iMV9KF+OLYPOY/5zQomHe1BkdiaVJaWTwZNcuMfESr2VS7i
	7YPUaCd7UX2fX+FumHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muPfr-006dox-Km; Tue, 07 Dec 2021 01:53:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muPfd-006dm3-Sk; Tue, 07 Dec 2021 01:53:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 35890CE1986;
 Tue,  7 Dec 2021 01:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42ADC004DD;
 Tue,  7 Dec 2021 01:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638842006;
 bh=eXTQmCkV7TlQUUyikTeYDDeh2Q2A+dhlVrouNNuPuY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pfNIZhoFL5Z2N5wUx7SiDtzqqqsGp1pcVzcbnxzFyBCCu69un9CTSEJm20HqpSa26
 NWERhDKFPo2tvCk+QBNApNV2R0BjzaQb6HEhQPPFiQSS0jfiQdLbxZ8UEMeJ2R47Ek
 RyeS8Q1XhA8bxlJD55FyeVJQqykMHY0AwiVtQOd/qiAqPpL5Z6xLb8vgrfb/8EaWn1
 5DjywXW46pWw0i9TqyPkMmf67XVcYTDuPFW2Q2jR7KumamuczRDHZDMk0vij1pkcNk
 EFuhijwDHyQp+EGTQTaXV75F8r8RbqRorE97rcvUYYRoHosPsrjo3gJsAe41zp0l+9
 2VaYeiXJ7wPww==
Date: Mon, 6 Dec 2021 19:53:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczyi=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Jiey Yang <ot_jiey.yang@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to
 become stable
Message-ID: <20211207015323.GA26237@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_175330_128515_2E45425D 
X-CRM114-Status: GOOD (  16.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 04, 2021 at 02:21:44PM +0800, qizhong cheng wrote:
> Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
> 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> be delayed 100ms (TPVPERL) for the power and clock to become stable.

Thanks for the spec references.

s/setctions/sections/

> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 2f3f974977a3..b32acbac8084 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -702,6 +702,14 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	 */
>  	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
>  
> +	/*
> +	 * Described in PCIe CEM specification setctions 2.2 (PERST# Signal)
> +	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> +	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> +	 * for the power and clock to become stable.

s/setctions/sections/ again.  Otherwise we'll have a typo-fixing patch
eventually.

Please also rewrap into one paragraph.

> +	 */
> +	msleep(100);
> +
>  	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
>  	val = readl(port->base + PCIE_RST_CTRL);
>  	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
