Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF1EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuJ7yuL/ZabeLcqysch/6yWhUBuUv1uihLVJExawXRc=; b=qDEjtLkYzjuCe2Sy6XkZrDqTYu
	Aa4eodCTb6MzQKS3bJAnZkjcOc/FPbkXbrdQn/bMAyy83jBwr7MRIcQW9U8PHGfaG6tXh7jgtkFCl
	9DJfqFjKZv1RuS6jh5AEw/Psc2nj/+JgDsAY7HlvNfQIGjIiqriugwlbzb4EkhanH7+B1yB9AZ+uK
	c2EhkFOF0YDkgez0qyVUg5M6ZBYQKQSgLZJmHEuOy8O0RJGJlji3s6drH6Tc1uOxdloncA/gt8qiT
	5Jt8oNpwhzI9CC5TEfJ0s0JwZEMBMzNgHArqtf/SzCFpIV3h+s02knqs2BVAiqYVVMJpcjHk/bmlV
	OiGVWSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYIL-000hyQ-D0; Mon, 14 Nov 2022 12:10:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYI9-000ht8-VF; Mon, 14 Nov 2022 12:10:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 49C74660231C;
	Mon, 14 Nov 2022 12:10:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668427820;
	bh=dx8y/g3WohBsZ27OyP/AIlNklm8U3hPwF4o+Z1udj+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPQSPsXQeim5Y+H7GKLFPg1VcJM12PHQ1BjIEK2Orot+ACy1o7770oH1MTEZSjKi2
	 OWiwwd7I2CKwIYBWTACopUjBDtj5F/Sq93OyjHKTexT2kj7Y0w8vZvLkqXNDi/39f0
	 QZInlaHGvJRQHlSUD3gi+8eRwXuf8p6WlZ/OhpWIwyXyCqrYqZdWPYeq2TZDSjI2wX
	 Z+Q5gLZWeRud6JugoP+kPQP0XbuYARgS11EEqm6PY1NnfFLcKld3l/iJjTHDdBtcag
	 iCriPiysO3ZxCiV0FzsMlQR89yKZrqOtGu3rQnO8HeZe6rnCKvjzLI9EGzL0O5FKfg
	 QEqEVMizPky7g==
Message-ID: <288b510c-1ff3-ddad-1e80-dfe3de4b2a84@collabora.com>
Date: Mon, 14 Nov 2022 13:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 10/11] arm64: dts: mt7986: add Bananapi R3
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-11-linux@fw-web.de>
 <ee410f80-1697-6146-9755-981f2d45e88f@collabora.com>
 <A22EB676-EBD4-4E07-8E8F-BC200EDBCE1A@fw-web.de>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <A22EB676-EBD4-4E07-8E8F-BC200EDBCE1A@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_041022_172083_7D2B16DA 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 14/11/22 13:03, Frank Wunderlich ha scritto:
> Am 14. November 2022 12:50:40 MEZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 12/11/22 10:15, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> +/ {
>>> +	model = "Bananapi BPI-R3";
>>> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
>>
>> You have to add the machine compatible to devicetree/bindings/arm/mediatek.yaml
>> or you get dtb check issues.
> 
> Have already:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v6.1-next/dts64&id=8c80453864efea0a0ed5ca2b399fd97f2f55a5ae
> 

Sorry, had missed that one.

In this case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


