Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fy/a6qYSkIt3i1WulJM+iwaDQ7Xp5noZHvsCr1LywXA=; b=0N72PY2VoQbsqO
	jK7XfgK1DmFGGp6hhHEcBhFdDRvG2Y4U3BB+109QJ4XL8wOdUKSfFqOVChwJvgn6QF7yptWfPC0RY
	jVqGf19g1wPIkg5Jj9tyJGIVGNnZKA5lsjBj/gb30fqY7UAou7H380zfz9bxsWebACAyOPH0uu6VE
	Ku4JFFIl/RDNrBPJAHbfeo0ls+an9RCTnpSDRVFziX/KC1A4IdoXpXVUx08w01hT7n+vLbTSq1J1b
	SXlOLqd0UiUWCXxPVEhF3VQFnMhe54uB5Gvuf3CrSGLiSOr4BnRldMX1Q9osdV64vTFellWWr35Cl
	vAV+L1mZWdjmg///dmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muZR9-008Ouu-SA; Tue, 07 Dec 2021 12:19:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muZP7-008NnW-Vw; Tue, 07 Dec 2021 12:17:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9B78B8175D;
 Tue,  7 Dec 2021 12:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C30C341C6;
 Tue,  7 Dec 2021 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638879421;
 bh=KDt8PPYWG58ffYc2l1pOEsORKmSleEnHCgAKOfDzXCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nglkm3J3vdcOyNSkEw2XQDC3fMXOim+pTw9GEuMSw/xSwQY3lvYSIKwmoxLCrVgh2
 wfJ0M6/wjx1plTYCtWZv/EBMbHjQeAfsml7uo43hBnRWQHBDPcpAWz7sD8nAEYqvfG
 T5Bgq3j/s+EY88LWu0nzypV/4Yw66LxtgIlirU19c3Fs54NicnBqeMHN4c1CJygezW
 sP74ug9x8kz6sWQ8QUtA7oCVSQZNZAxv5gP58qIRQmVucC7gJqewBj+i7nyiuZynUi
 VOgM5oxTM5xUdKoFJyMwcI2UcaOE4M8pQcxVgieEbhQVbsCpoCuYN9On4IQYKUMaf/
 Ax298oNyc6x2Q==
Date: Tue, 7 Dec 2021 06:16:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chuanjia.liu@mediatek.com
Subject: Re: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to
 become stable
Message-ID: <20211207121659.GA36700@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207060550.20918-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_041706_264370_9F2FBBE1 
X-CRM114-Status: GOOD (  19.16  )
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

In the subject:

  PCI: mediatek: Assert PERST# for 100ms for power and clock to stabilize

On Tue, Dec 07, 2021 at 02:05:50PM +0800, qizhong cheng wrote:
> Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
> 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> be delayed 100ms (TPVPERL) for the power and clock to become stable.

Please fix the typos above and in the comment below: "setctions"
should be "sections".

I mentioned this yesterday:
https://lore.kernel.org/all/20211207015323.GA26237@bhelgaas/

But maybe the "s/setctions/sections/" notation wasn't obvious.
This is used in sed, vi, and other tools, and it is a command
that searches for the first regular expression ("setctions") and
replaces it with the second ("sections").

> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> Change-Id: Ia9abe1e763564a5bad1d045fd268c38e76e2ae95

No need for the "Change-Id".  I assume this came from a gerrit server
somewhere, but unless there's something to tell us *which* server that
is, and unless that server is public, this isn't really useful.

> ---
>  drivers/pci/controller/pcie-mediatek.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 2f3f974977a3..a61ea3940471 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -702,6 +702,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	 */
>  	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
>  
> +	/*
> +	 * Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> +	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
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
