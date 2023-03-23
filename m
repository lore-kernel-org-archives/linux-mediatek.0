Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0F3C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpWKH42NsTdaDJUajUtQ5xZu/PRnq+Imq4L0qFIinEY=; b=IdgeA6qWtPn/f9RVNM7e8F6+av
	MOmZ1U9xS/B6MgnA8XhNjZ36FKzl1NTTMuiunD/bHo0xTf2Jzhw0asO4gDce9UoFLMbDzbD377IIK
	Vx75XIIKvHbINnqrnTUewO8KTlocCZKMhuAsrdQFq7IOZXWnzwhsCq1vFHdYsGKmOOKZ96OEeAZaU
	iXlnBAY4RrjpP42Ef1fIVBXP5TQ5i0oDyNQ3FeMW/cgn3r5YKU+NO7Q1szW9qr/xRp3bK9SZ5uE0V
	Apc2EHhCTSeNWQ2AX/PB+H9sGCRCkUth+oTGwQojgXu1bhBv9inLelewzKgRpn/93NQjs5u7HHvhY
	6SGOjiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGCS-001Evj-0o;
	Thu, 23 Mar 2023 08:21:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGCN-001EuC-0l;
	Thu, 23 Mar 2023 08:21:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 351C56602040;
	Thu, 23 Mar 2023 08:21:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679559684;
	bh=WkfVZaU1hGdCt/oKmuUQTlY29LYg/sO4ppTQfj1dwh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KJiie0flpILVaELOJWrnaav8rz30ABohddv/omm6IPerUW4oWTlnIAx6u5wQKLIGR
	 F6ZXCudHAKIJEft1CZZiPHlurJHPs47Ut5Hip4+W5INECYTbn4MrN5pUNHfdUvMC8h
	 Mb7omBV14I8ICAiWhRJ+iszkO9yX36Q3wyOQg6oTD8rzN3cENODjdJFbyY/TYQN65V
	 3k2Kzq2BwJu5185svNkw6pczDqaANoAs8UQuWDixCTcUBNq52he6foe5Wkd++3yk35
	 w84koAGwMPnvVs9MExqphycz1iKr0Sm+z8TRFXSWXWqVmNNn2MY1aR1G9fxc2wie6B
	 pbQkx+8g597Fg==
Message-ID: <aa682e7d-3a0c-b820-9978-3f9eb00fbfda@collabora.com>
Date: Thu, 23 Mar 2023 09:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, sergio.paracuellos@gmail.com
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <202303231145121987818@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202303231145121987818@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_012127_485326_8847FECD 
X-CRM114-Status: GOOD (  16.08  )
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

Il 23/03/23 04:45, ye.xingchen@zte.com.cn ha scritto:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/pci/controller/pcie-mt7621.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index 63a5f4463a9f..964de0e8c6a0 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -220,10 +220,9 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
>   	}
> 
>   	port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
> -	if (PTR_ERR(port->pcie_rst) == -EPROBE_DEFER) {
> -		dev_err(dev, "failed to get pcie%d reset control\n", slot);
> -		return PTR_ERR(port->pcie_rst);
> -	}
> +
> +	return dev_err_probe(dev, PTR_ERR(port->pcie_rst),
> +			     "failed to get pcie%d reset control\n", slot);

That's breaking this function. You're unconditionally returning.

I think that this is fine as it is, but if you really want to use dev_err_probe()
here, this could be...

ret = dev_err_probe(dev, PTR_ERR(port->pcie_rst), "failed ...." ...);
if (ret)
	return ret;

Regards,
Angelo

> 
>   	snprintf(name, sizeof(name), "pcie-phy%d", slot);
>   	port->phy = devm_of_phy_get(dev, node, name);



