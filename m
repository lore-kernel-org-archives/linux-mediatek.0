Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B44C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27T/6LoOxD+SSId39cxSdBuQJMI/qSZ8wO0ARmxDJMI=; b=LOwjwgb4IO9oAGL8wGx52BiDtE
	/Doh5LldeCrN01seH+p2RLZL/ShdzuqRI8y9e4gCOzLe2v9l2vRjhJZK/fk9voqIZK7WZIOZGT0N4
	k4hlkLmzCikprS1ALQKOACFb7D3UBmv4d1ySrwY2EEIJ3uJmeANzQz8S5dHxPnNGbYkQ/TPhUyj5C
	RDHTgVNirKKgwn6rphbvEllU5wDVMv8H1kFDvyHlvKSBWmRHNzGZ0ub52+lQWzpAOrDyGMl0Dx2u5
	l4T77mJKftxJ6ZW6qmJTBpHvSZV4xFpvdahXcURfWNBUcrOhI4SbAT/1UzRVvWshvikrFaA3PjP6m
	ZhieEXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGH-00000002qsm-27c3;
	Sat, 16 Mar 2024 09:23:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGD-00000002qrj-2AJo;
	Sat, 16 Mar 2024 09:23:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5AC8240002;
	Sat, 16 Mar 2024 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710581003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27T/6LoOxD+SSId39cxSdBuQJMI/qSZ8wO0ARmxDJMI=;
	b=AAl02aKHKwclgwoGfoJdq9Au8gBV7lbmGgUDwS0yGJi7TZWiQ5fSFHr67XkhQsopb0W50G
	aZxzgQu8vCv3/ItrIMHS8grA4BjcNdj1WI7mlFH1Qc5b3I3m3+1jg0Pp8d+mlbAwyFvDRz
	aZZCjVEnC7gwnycK8ljQub799NU4eUtWxqJsBcykbssglT3qnGjzCj+SPJdzkRU+9Mcump
	H3kQHvFWLRaf7qWtiLLXrXxR4dh7KOxQzxlnUUVkp0g6kHqb0l/thCdU0OKnygq2GIzlKd
	Upu3bkFSs0dabllZjwzMCFOIU98sIEOQBmd9Tls3aLxBSuz29RFh0sC+/dLBig==
Message-ID: <e4ed28f7-782f-4f1a-8c1a-a33fc490fcf5@arinc9.com>
Date: Sat, 16 Mar 2024 12:23:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] mips: dts: ralink: mt7621: reorder pcie node
 attributes and children
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-13-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-13-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022325_709136_947B8575 
X-CRM114-Status: UNSURE (   4.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the attributes and child nodes of the PCIe Controller
> node to meet the DTS style guidelines.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

