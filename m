Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC40CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AX2j8H+A9JJ6yxGxOWqpensFj//EnHL/7eUxAjSl/I=; b=YIZDgbnrxwmGPyM9BD/mRrt0jh
	9bWqGaW7L+4XmjEsdn8809DScPTvhrfgYRY1BAEdCweAvxnrEKtAYVpW6Va3Ny5nDgt1Ts3jCe7QM
	blkyZ+Tfli23XPx2D86PyFG0BfN4xTO+LTpFiBAlaU5j274Vy1RbDhiMM8uka2G5kocZfSANQmtuT
	NqQB1AS09ZZ4G9eis7e6IeBVs/Xj8Ld9NZ9A4op24VzwYInsW+aSZuHhrpOXNbcdHykyDauVIoWJS
	HlGEiNrPDv8adtcbSwTkF40+RW+5SP/JfFKUExGiCsSEqLmiMoPzIqPgQIkHTtehv/sRQC6/HuU9t
	AZgnNKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHIn-00000003qlQ-0Brc;
	Wed, 13 May 2026 21:39:37 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHIl-00000003qks-0nve
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 21:39:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F6DB3C8C8F;
	Wed, 13 May 2026 23:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778708371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1AX2j8H+A9JJ6yxGxOWqpensFj//EnHL/7eUxAjSl/I=;
	b=Lc/WHbHo6a9u6xmgYh9JFLTTLxmnZik9YBZLUFRc57EWchl2Eg4uXIQCWY7k+OnBLTjdwu
	qxjHsclPdRzQqAuCjpi7pk8KISVj2Zc5/siysgyuBSm6/urCAWjQQcQq+5l8bUAQrH+pgZ
	C4irwC4MDy2qO2WlIHaMj7AcMOOO/EAty83qcFnMBSV1Mt0hBvRCM7rmgSoOhUkdBKzpvQ
	1YRyUymTm5n2s38oZw/GL3J8YadgMbiIxQXB6OQfu2lQTRYMkfbRmCkyghGAbVP0FH10hd
	JxruONLBXC9OKB+N2laE7YjZv4OuT5NsszQj3P2HBw8t5PUc/NoKNEVDFUfj1g==
Message-ID: <65792ada-5e9d-4e3f-aa79-bb4a8ffd9161@cjdns.fr>
Date: Wed, 13 May 2026 23:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513210759.GA331283@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260513210759.GA331283@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143935_489839_C44BB121 
X-CRM114-Status: GOOD (  14.61  )
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


On 13/05/2026 23:07, Bjorn Helgaas wrote:
> On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
> s/re-training/retraining/
OK
>
>> + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
>> + *                    Gen2-capable devices start as Gen1.
> s/Re-train/Retrain/ to make this consistent and more greppable.
> Also more instances below.
OK
>
>> + * as Gen1, and must be re-trained once after initial configuration in order to
>> + * only Gen1 capable. Therefore it is most convenient to re-train every port
>> +	return dev_err_probe(dev, ret, "root bridge not found\n");
> "Root bridge" is not a term used by the specs, but in common usage it
> refers to the host bridge, i.e., the RC.  In this case, you didn't
> find a "Root Port".
OK Thanks
>
>> +found_port:
>> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
>> +		/* Let it go because the device will work as Gen1 */
>> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
> I suppose this will cause a warning even in cases where Gen2 is
> impossible, e.g., the endpoint only supports Gen1?

Correct indeed.

I imagine in most cases, if the port is Gen1 only then board integrator 
uses a Gen1 card as well, so I could try being fancy and probe the card 
to see if it supports Gen2. In OpenWrt the PCI driver is always built-in 
so I didn't really consider this something to worry about.

What's your preference?

Thanks,

Caleb


