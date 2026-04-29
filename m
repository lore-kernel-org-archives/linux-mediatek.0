Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4B6FF8867
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRSTvAjZfu7K9fiQSB3Ep0oWJak8xVdn/Xl9VAisUQM=; b=myVHAMa7BISglwQRqbxyLtHeVL
	CvDAdf8Bd20ExqPXnRwNIWLxmUYvVnec8e59D0Ni1IHsqOIN3rKcajCy7ZidBFvbQBNmDlgL3sXAC
	TOmfgfwMdwdjjjNklIgzjITkE1lDxavyVYC5rp7GRCn5HBgJymB+WoUsiyXFPvETiMSgp/8+eRunG
	nH1nxsMPJPZgkzC9+P5STm7rRuqjlxtIbmhlAJJRSIXZV3xDVpbOBw/qTVfIGCAk7wYHvx+IhCdRr
	IAXWiJEUi9o5ZUAxUMe1Qvwuqpax/ne9JjFcZxzxex4dsKHpIe0CeFTlF/7cO/EaIQO7ebe94D+1k
	NxoR6TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Qr-00000003MHS-1LvP;
	Wed, 29 Apr 2026 09:42:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Qp-00000003MGm-0NnU;
	Wed, 29 Apr 2026 09:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455728;
	bh=qacrdInfJDRgJywanIsHYkdfJi7YKcb1x05Pu8oRmXk=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=UaGJZjDMsH8tHhGBx8l6nwZ01zDV/zKQUNd2k8y0wwy48Ik7GpioIyPIrR4KippiF
	 loOiEIx9bagh9JMNV32uEvbXxf7C0sr4gHQS77zKVVjyDCQVZe0uXz5FsBGyxtq6CH
	 ct9tymdb+K6/eRMUp6SQLxPLrHATL7PEYaneEb8g3mo2pifVyTWTjZDp09hMWj3anK
	 +EZVlhwWDF1hX9Pvknm3VE+sHkLHVZNKBnafkOhVYzVQb9YqHy3xw5X9jeP5S2a9c+
	 YznisSHnl3zI81EfBx6GHxxHxI4Vynfbzc7LhERn2VzYbfdDu2NLSNXwZuPKdR9kxJ
	 568TjuvAAZgrQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD74F17E0610;
	Wed, 29 Apr 2026 11:42:07 +0200 (CEST)
Message-ID: <b95b8342-5438-4f44-a5fc-b5a6cf3e90f5@collabora.com>
Date: Wed, 29 Apr 2026 11:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] arm: mediatek: MAINTAINERS: Include SoC bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260329085353.8649-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bb0e5f69-d451-4d95-8a4e-38d18582ccb2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bb0e5f69-d451-4d95-8a4e-38d18582ccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024211_285093_6E981096 
X-CRM114-Status: GOOD (  11.42  )
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

Il 28/04/26 17:07, Krzysztof Kozlowski ha scritto:
> On 29/03/2026 10:53, Krzysztof Kozlowski wrote:
>> The ARM/ARM64 Mediatek SoC maintainer entry misses bindings directory
>> for SoC devices.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> FYI, there are already patches on the list which used get_maintainers.pl
>> script and did not CC Mediatek maintainers, so they might get
>> forgotten/missed.
>>
> 
> This patch did not receive any comments from Mediatek maintainers - do
> you plan to apply it?
> 
> Best regards,
> Krzysztof

Sorry, pretty-crazy-busy days around here.

I can take it or if Arnd wants to take that directly, I'm as well fine.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

