Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E162E784AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 11:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9QwNkPSTtcTKwaLTfAdmE766Dc+fsAcDGPpeO+E8EE=; b=skjGZJjnUvj2I3Zd1H2OWoRyoO
	mIZlLc3yB6wfydKrZJr3evNTIRGQIU/ZSk+VtWQcX3K5edg2uYoS//v9yqlVcD3eA8me2Wi9+ljir
	VFK75jlxU345B+aphu4W4yE9XBNLZAjaS/BBwZYEoC7nIfmpIz3AJsXqNJnlXox8rbT3MlLWssEXR
	5iMfsoLMqzshF8ZD5DqTwSsxSYqGHE3F721LwVUr2eT96hCJr75BpmKqyaDgQ21yZbEJDTxjPR/vT
	9zAurQo2gtSEPDKlYB2Dbketx1Nc4Us+vgDHl8ye848P+PsiPvv6O/O6+MgmigkgCMNazIWTDKYZN
	z86f5Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGvI-00CWc5-0L;
	Mon, 02 Oct 2023 11:17:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGvD-00CWaL-2A;
	Mon, 02 Oct 2023 11:17:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31B2266071CC;
	Mon,  2 Oct 2023 12:17:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696245426;
	bh=bCVKgfEyIBfkvclrAUIZ1OqNvdnA9MnuxWdGlizqr6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dGelpfmPV3Gxl9o94SX9HiLf0VftMd5vk6eZVPdw++neoIcApTKChhvU0BNtLYC+F
	 nvFr43vSS8XCuT+E2hhIKGn+THIgsk6eTDwf8b5oWymd00sGVhbX65dmBBApURW2/9
	 NQD1DbxxQSqYFrbb7+i8PR4kf5fpj30amplLu3aCfrc0OspFxAHB6ejhXuLEXoPYks
	 DM2yHcuk+cgogdQffJ/miCYK9zirv17YiwAioRtHptpzrJQmhM7hnYfMjJSSf62PLl
	 /Iro39qCVKbrc7i3+bAQGrr8WunKR4n84t8ddzipPi06rQRQ+GBs3OcLfkQuwfQhkt
	 zO4wxNgWYC1mA==
Message-ID: <318c050c-3007-d1d5-e727-6c117de12522@collabora.com>
Date: Mon, 2 Oct 2023 13:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mchehab@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
 u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
 <e4311804-bb06-ec04-8479-dfa0466e4b35@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e4311804-bb06-ec04-8479-dfa0466e4b35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_041707_908712_A8C86FF6 
X-CRM114-Status: GOOD (  13.32  )
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

Il 23/09/23 19:38, Krzysztof Kozlowski ha scritto:
> On 19/09/2023 11:59, AngeloGioacchino Del Regno wrote:
>> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
>> specifying a phandle to a SCP core.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> index d639a1461143..0e5ce2e77e99 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> @@ -46,6 +46,11 @@ properties:
>>         include/dt-bindings/gce/<chip>-gce.h of each chips.
>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>   
>> +  mediatek,scp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the System Control Processor (SCP) node
> 
> Why? Why do you need it? For what do you add here phandle? Your
> description should explain the purpose.
> 

Sorry for the slow reply, just seen your feedback, thanks!
I'll add a nicer description for v2.

Cheers,
Angelo


