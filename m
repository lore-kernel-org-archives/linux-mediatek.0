Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46572C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziyzXYVMDCNsR2aJrKLFWgollLm0LfWdZFf0eMhD1U4=; b=ljBMfa83miAVGrcHrHfLYgvatF
	5K1/fvX5k8cHtGMWSbTqSz+TphPcueUrlILgR0VaaXARupNTFGDVGwq3feHi6MPDBTNJlaya9roum
	lwsxN9eMLujw0z9L97WhILm0M0K5xTGvu8nR2trKof21UYlcdPucqo39LQtjxGwbThOe0XTo5hOY8
	GdjFTnPbruDtUZxu+tBI5BlB22me8hyQu9L1hSpKxD8GH2v4b9p3qtkeBnxUuiyHFa1l+fxpPk+KH
	VQoBOjGjzhxuwyl3sRQlmY4hwaaXKvRj8LBB1CwUok86X7n1cw61aEUHhYTLuCPca7MQ6B9POmw9b
	3p5zQiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPf1E-00BRzd-0m;
	Tue, 16 Jan 2024 08:42:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPf1A-00BRyj-2S;
	Tue, 16 Jan 2024 08:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705394511;
	bh=3vm3djyuGxuOvKgs02bBxiarOCcIXQxbzAdbmeHHzfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YuvdH5mINDH88ByNQQgmMqqavq2kD/OTj+hnIn/vhJ2hoY9kFAlVDpdHGyVAbufb9
	 TnN9ttDET06VwYH0F9MqEjRPM9xmRfBHjqRzfqbqBV17v+1Jx7OHqpNFoQNb1HdtyM
	 2WHGFrCycsT0IZSSXnsMMyWDm7q5pKG/eWBsPbL+ep2oAXCGDzPnidedHdidqABXCQ
	 p9BT/BRxDb7wzO7Z7ufOv4dmHvlUzQr5GavsubjYqejEjLbny2HOhKwlav6FdAIQ6j
	 VB9YHzoXZd9f7prbI0V/PeT0DywXtjLyPzJNarA58CtLhQ94TGUjwTXJnFvAF5n/fZ
	 jmYK1MXmbl/2g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B6183782009;
	Tue, 16 Jan 2024 08:41:50 +0000 (UTC)
Message-ID: <feb39d03-bc78-474e-b99c-d835a37dd36b@collabora.com>
Date: Tue, 16 Jan 2024 09:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] arm64: dts: mediatek: radxa-nio-12l: Enable System
 Companion Processor
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 hsinyi@chromium.org, nfraprado@collabora.com, macpaul.lin@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
 <20240112094632.66310-10-angelogioacchino.delregno@collabora.com>
 <106b925b-93d7-4661-a561-424f426dd92a@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <106b925b-93d7-4661-a561-424f426dd92a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_004156_968302_E14BAB47 
X-CRM114-Status: UNSURE (   9.91  )
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

Il 16/01/24 09:18, Krzysztof Kozlowski ha scritto:
> On 12/01/2024 10:46, AngeloGioacchino Del Regno wrote:
>> The SCP is used by the SoC for various tasks, including initializing
>> hardware video encoding/decoding hardware and managing other remote
>> processors. Enable this node and assign its own DMA pool to it.
>>
> 
> Please provide reason why this cannot be included in initial submission
> and must be split into separate patch. I really do not understand except
> some patch count stats.
> 

This was done to describe both the reasons why each node was enabled at
which point and the actual workflow for the bringup with each commit.

I don't care about the stats.

I will squash some of those patches for v2, anyway.

Regards,
Angelo


