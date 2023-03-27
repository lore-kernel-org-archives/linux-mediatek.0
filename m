Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F08C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whmHzBhw7B+Zr9L5n58deDwFMAnWWL1yQEgO3Ax5E3Q=; b=FnQHpkvMB/owUtCq8FU9hxxbt9
	UQxoQgiZLMwpOdDCSCwdXfExNsY63mhtsT6TmtSKaujED/0p4h4tGpTb3EEBgerZvLRDLGfCL28Ux
	iG6nBOOBfkSK0Q5M+IXhzfzIz9ZrWwvdgH+Yi/gCU1fShmII/HCm57hOeXJxs2DVXoionmeZeqllE
	B1jXTFWTA/m35vBRBCS4+Qb1KnRhbPVQYyG81gE2V782G+D2M3341EwWQXyy8W0xm7EN+xnq7I0Io
	aM3bvuPivWM/jERioWRelNzIR5RPZbp5Ru33BPY4zkeIq5oR/y6IwxNRCEmr3Xr2yXKKXAL7CTdAr
	ROJExhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiA9-00AEix-0R;
	Mon, 27 Mar 2023 08:25:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiA5-00AEgb-1F;
	Mon, 27 Mar 2023 08:25:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E40CB6602087;
	Mon, 27 Mar 2023 09:25:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679905502;
	bh=/9QZ2Jz7ZuJXIYiAQSp0kMC91j8S/hZsSZYz2NRG6JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OwoJesY8b989WtHjNl9UQ75G3lC4dZjgAMMO/0R9Y8KpWgV1gqq9J6DV1hvJw7TEh
	 0QCIbJ1XhSgM+SC1DHAF3RxYTKhYOs8z1W6PFgo5VPEfXJr4s6uIpGeRigQLhADsPV
	 ZoKrMJz1TuAfa1Y2LQeMOAU6hXnY4hey7+c/MAdDKHyaGEdEvkVifC4rbkPHS4OH9M
	 OL5UJU/7UfWZrluC5uC2kjwoXkZ3DNjTjmY777MyiX8JA38B68kqYxFU1ndKJYO0uV
	 nVHU1zDApj7cFlvd+OcA3Xhs6Og1/FNHDn/oAKFShM968ClqSE2098/svUN+yZiElR
	 ss02NvPMr+bNg==
Message-ID: <85b215e9-e8e9-054d-455b-699a92c8553b@collabora.com>
Date: Mon, 27 Mar 2023 10:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 08/18] dt-bindings: gce: Add header for MT6795's GCE
 mailbox
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
 <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_012505_555490_0B8AF6F5 
X-CRM114-Status: GOOD (  15.06  )
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

Il 25/03/23 12:12, Krzysztof Kozlowski ha scritto:
> On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
>> Add the GCE header file to define the GCE subsystem IDs, hardware
>> event IDs and thread priority IDs for the MT6795 Helio X10 SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
>>
>> diff --git a/include/dt-bindings/gce/mediatek,mt6795-gce.h b/include/dt-bindings/gce/mediatek,mt6795-gce.h
>> new file mode 100644
>> index 000000000000..97d5ba2d2b44
>> --- /dev/null
>> +++ b/include/dt-bindings/gce/mediatek,mt6795-gce.h
>> @@ -0,0 +1,123 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> 
> This should be squashed with previous commit adding this compatible. It
> is one logical change - bindings for mt6795 mailbox. There is no point
> in splitting one change into two.
> 
> Best regards,
> Krzysztof
> 
> 

Sure, will do!

Thanks,
Angelo

