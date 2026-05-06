Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8295CCD342C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Yn1siduxQdPynqGnjuL/BLupMMq5Muv+EwIc3BEU5A=; b=ctG1CyfRvvMKAYLTdPdyr1yGnI
	DZOdWG2KvCOuhmCWv9M1Vgs4FKiwx4PKu39OtTLtnH2JSMgkhR1oO+vmCNUr9yhlt2tFGok1GQz8j
	dWDYRkKNk/FmB3Zsw9FioTMLpr32BWIvBgWO+hsu7duS93/TxIyaE1Z4ky2hHdEyk4ihnOpUpYg0z
	4edhiGr7FZPOfyCORtJSvXLJiZ5h0ISVjIP8Rt7Z0yIp83oIiKXDBk8piFUKT1VcbaNayR/fNjm9C
	y1U+Y/X22HgH0LNltrQUFoTTa/XPePrpgEisH9EIiQWI4aEElDuUYzmAwXVn2woOjFRIHeqAaYyLt
	Pywoap0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKerQ-00000001Sek-1moz;
	Wed, 06 May 2026 16:12:32 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKerO-00000001Sdo-0ElE;
	Wed, 06 May 2026 16:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=6Yn1siduxQdPynqGnjuL/BLupMMq5Muv+EwIc3BEU5A=;
	b=hbRddbGvHTc9parUytwp2o919Xf/aPaJwOvV+9zOFYnPwWaoqIsiZhxCMTI3ag
	loWpxGBClFczyjHQ3iPlfHtflcuTWbsbkv+aH1Vn1WftmtkEhnQQXyCESE2DJEtw
	/nJ/nu6FyaCpMzJz0Bh+yHcW6W29ao8f1c1mvYPdxVelg=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3PwAqaPtpQDXyCQ--.172S2;
	Thu, 07 May 2026 00:11:26 +0800 (CST)
Message-ID: <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
Date: Thu, 7 May 2026 00:11:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms
 delay after link up
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org,
 s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-5-18255117159@163.com>
 <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgD3PwAqaPtpQDXyCQ--.172S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xJr1xAFWxKw15XryxKrg_yoW8ZF4rpa
	y7JFWfCF1IqFWY9Fs7Z3W5ZFyaq3Z8J3yUJrZag3W7uFnxCFs3JFyIqFyrJ393KF4kZr12
	yF13tasrWFsxtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMrWwUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxA5+Imn7aC5W2gAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091230_539955_2B004131 
X-CRM114-Status: GOOD (  15.78  )
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



On 5/7/26 00:04, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:42PM +0800, Hans Zhang wrote:
>> Set cdns_pcie.max_link_speed to the maximum supported link speed
>> (obtained from the device tree property "max-link-speed") in
>> j721e_pcie_set_link_speed(). This activates the post-link delay logic
>> added in cdns_pcie_host_start_link() when the controller supports
>> speeds greater than 5 GT/s.
>>
>> As required by PCIe r6.0 sec 6.6.1, and following the same approach as
>> commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
>> waits 100 ms after link up"), this ensures a 100 ms delay after link
>> training completes before any Configuration Request is sent.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pci-j721e.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
>> index bfdfe98d5aba..ee85b8e04f5b 100644
>> --- a/drivers/pci/controller/cadence/pci-j721e.c
>> +++ b/drivers/pci/controller/cadence/pci-j721e.c
>> @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
>>   	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
>>   		link_speed = 2;
>>   
>> +	pcie->cdns_pcie.max_link_speed = link_speed;
> 
> What about other glue drivers?

Hi Mani,

pci-sky1.c:
There is no time to handle the corresponding DTS yet, and the attribute 
"max-link-speed" has not been parsed either. There will be a plan for 
the subsequent upstream.

pcie-sg2042.c：
I'm not familiar with this product.


Do you mean something like a dwc driver, similar to being placed in the 
file drivers/pci/controller/dwc/pcie-designware.c?
pci->max_link_speed = of_pci_get_max_link_speed(np);

For the Cadence driver, it is located in 
drivers/pci/controller/cadence/pcie-cadence-host-common.c.


Best regards,
Hans

> 
> - Mani
> 


