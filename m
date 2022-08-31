Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD72ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYatsX+z37UqQlitY24Bpci+iERi8n8ef371ctLL2AI=; b=SVHWtW2y/Voi5kGjq4k5VNYmc5
	PRmMBp69E5sK/dLpXzjAOh/Pi4DeDH7GG++VQLSYBau77HcwMMnLbOOPx7k3PITeqWxSBU6D7ndoI
	rHZgPicj34q80MPru6ulW46AlEoPwA0dibsblQlXRaznGpg3c+I0SF86vlhEPwlb2FjqrloZFiML8
	WkygFbywbx2+Eygyau0kf6ccNb7VqYivg80V7CXgAmYDqWBRHdDCgh9287Mwcw1lVULWUn9SOAl7K
	S0630uQiucNF4jF/d5ST2phqo9dTS/z9yAZjdGCbHprSgsdWCH5Iv8VFWdGUrSzUaIPC2nLTQVhNp
	RDOcD9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTISW-004gia-EY; Wed, 31 Aug 2022 07:48:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIRu-004gPb-Qc; Wed, 31 Aug 2022 07:47:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C8206601688;
	Wed, 31 Aug 2022 08:47:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661932061;
	bh=W0y4oUWuQ2sZvJSfYO8MdMV3XL/CKswNqbqU/lyBoyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ln16OWmxMVHFq6RDvuyB5G4weOtKDPCtEvlw/LKzyRI6QvqpqazUNDh6p7Y8kzufF
	 gRJwaOpeFU/rIfp6mbRB/lBHK2aUjmb8QIB1hTdoME0XKp3BlF7ga6nC4112pkglzZ
	 jmCuklfEHfDvmXPeTiGBJOkG7rRf9DtvFS5RhwJb8kpUoUjyZZ3ufojMvr1lzMCdJq
	 4q0SUs+ox5wdPLjqxMy6+gnh1ELoTZkB+V1TBlYa1H9Tlemp1Rj1uhVwQIiWjTjPnq
	 Za9XmZaGxAERAKVxeD9rEo07KZxRpodMEZnlDWL0SD04POTQ+XCBi/AjhOj3pJ3skX
	 DnoBqoYG+wbHQ==
Message-ID: <2620c49f-1e55-efb0-bd21-ab8567030485@collabora.com>
Date: Wed, 31 Aug 2022 09:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
 <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
 <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_004747_037522_54D0FAEA 
X-CRM114-Status: GOOD (  13.03  )
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

Il 31/08/22 08:04, Krzysztof Kozlowski ha scritto:
> On 31/08/2022 05:29, zheng-yan.chen wrote:
>> On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
>>> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
>>>> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>>>>> Modify gamma compatible for mt8195.
>>>>>
>>>>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
>>>>> vdosys0")
>>>>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
>>>>
>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>> angelogioacchino.delregno@collabora.com>
>>>
>>> Please also perform review on the commit msg and backport status.
>>>

Ack.

Cheers,
Angelo

>>> Best regards,
>>> Krzysztof
>> Hello Krzysztof,
>> Thanks for the review,
>> I will fix it at the next version.
> 
> This was to AngeloGioacchino...
> 
> Best regards,
> Krzysztof


