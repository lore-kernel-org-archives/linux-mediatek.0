Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B553ED132C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nouysTNh3Zd326+1kv3PE2U0GwzyP8B1+4gO04hKIQ=; b=JTCQ2fvaKQDCK0
	3jjjb61rPVSuuqUsBLShN1mQoNdXzByhpk4kF2GBznZEcRtzvP/sn35mAri0FUzxgf+PKSOD/l4ez
	+FI8Ov0UxpGGK7jS6ct2MlCh/DYYWpIeCEGR2xHqvfqpAyBs1j1SEZ7T0aEWfg8sUht3GBNlNxDTl
	82qZcNNiMUyv1kWhTV37o3R4V8Z+M42MuYkSaN2KQgCOFH1tbCwP4n34QfG4uJ9QTqIlrfKP03KuE
	XbNSkBiYmuHvgXe4NzxU2muaTsX1xt7Mxr23Oee5qFrb2m+cVGle/aAMYbN5eh77+iHHvu48HvGbs
	eJgJ9QIYAI9NDIRsbwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wsQ-0000000DnhE-1vLc;
	Mon, 04 Nov 2024 13:12:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wqg-0000000DnKn-0wiv;
	Mon, 04 Nov 2024 13:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730725823;
	bh=9HrB0hRfb9MPWXWPeZXQEXRRgtlF7QfDTCZF/aQwKS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GbGCE6C8wudOGBSfu79muvMfKAR2yVIJY6fKZ3raaCqVJIaEX6fTCGnObJv5S9xT/
	 LVcV69AQ/8Ic/fjsFUkOGpfUa3ye/hkVUzvgxHf635JfVvPj5givJN5R5OfiwMp2og
	 oaMIEKQMW9AhQOWlVCztjeRseIPGGqaMZNn1ZUxi0LSKrqvvhbl+PFidY8kbPL9EkL
	 gzC73UaJQr/1jJgT+Q1E8BDKjvymTZgHsGT1U2WBKNzN2cyPugLZUWGYIekG3XEJFQ
	 Ni+VH9w3FQR2vuUZVrhyehfa3m76omIpOFcT3SmARcIwp93kKL4J75Yj1VI9Y74iFI
	 1uM9UR5RxPozA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BBBB17E3630;
	Mon,  4 Nov 2024 14:10:23 +0100 (CET)
Message-ID: <f8ca0f82-2851-40d9-983b-2a143b44263a@collabora.com>
Date: Mon, 4 Nov 2024 14:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
 <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_051026_457469_97D2C75D 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: robh@kernel.org, ryder.lee@mediatek.com, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, bhelgaas@google.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/11/24 14:06, Krzysztof Wilczyński ha scritto:
> Hello,
> 
>> +	if (err > 0) {
> 
> You could drop > 0 here.
> 

I have no strong opinions about that, would be fine for me.

>> +		/* Get the maximum speed supported by the controller */
>> +		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
>> +
>> +		/* Set max_link_speed only if the controller supports it */
>> +		if (max_speed >= 0 && max_speed <= err) {
>> +			pcie->max_link_speed = err;
>> +			dev_dbg(pcie->dev,
>> +				"Max controller link speed Gen%d, override to Gen%u",
>> +				max_speed, pcie->max_link_speed);
>> +		}
>> +	}
> 
> I wonder if this debug message would be better served as a warning to let
> the user know that the speed has been overridden due to the platform
> limitation.  Thoughts?
> 
> Also, there is no need to sent a new series if you fine with the
> suggestions.  I will mend the code on the branch when applying.
> 

A warning seems to be a bit too much and would appear like something to worry
about (or something unintended)...

Perhaps a dev_info() would work better here?

Thanks,
Angelo

> 	Krzysztof




