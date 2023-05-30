Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6D5C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYhpHMyjgWGLjoRxREB8A86AzLc3p/BKId25Tz9nFlM=; b=1xm0Z6QOdtIH/J5gX0s1bC8WHg
	bgjb9zFjoQNUk6OvVArwrby1afurGsZ7XwyvfksfmLyyqGtTAhCFqjPUXoaYNBy0MMYs+f6657Gp0
	L1s3RWfGyac1AbczKBLb0oHG+4CQpvpmJyOPfPHE8Z9D8kes7nUBOPSsxi4jrLBDhUXaXZbWeMcKI
	+YpG3r6qLb+EhSif/NnaJCchjStxv8QjTlJNP/P0j+DorW1ZTTGfNMf5KXQ1W+LRLsPPj3YbAEM6s
	lKwm0QN2x/XSyQNsH3Mjvug6mSr+MY+3FgCJPDHXizjquNXTzyCCFheTghrBmxAqyhU9VCJPrIK+T
	aFZTj0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tXa-00CgUB-0l;
	Tue, 30 May 2023 07:13:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tXQ-00CgOU-2H;
	Tue, 30 May 2023 07:13:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC49A66059A8;
	Tue, 30 May 2023 08:12:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685430779;
	bh=FbpwufshqCYmNrpgiCFM4ItKYbmX+m5YBtViqULXOjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOKg+P6tVPHrrKQ0M/uf+I1xV1pegKrpKuwLHG5M0HBi+Pm64B+cGXL8DUXlkHvOR
	 GhrCP/MhPAZ6YeebuMDGhauYBfsxo3xEBkcBBsqFMcyLcH8hj8hFZu6WAlLiakNB8J
	 0Nw6SRWMLBe9Uy58PHGmgqpVJcg2XnjwiScXu6pDiXrR1llIWuRj2h7AC0BWXHiCv7
	 s1YS/pXBUwaTkSfXvpeMpyo88tK8j8yh9pynh2Vx/jZOdjuj0IMdneiWkL+HCSFE7M
	 GR4OF+rTQSd7qBm0uWgsmI9O13w5/I8EmyRTUUvvqlbJKisQq766z1N653hWyLp4Vo
	 LEeyBf5s/JnaA==
Message-ID: <d39b0e77-e013-fe7e-9523-9bdbaacb5853@collabora.com>
Date: Tue, 30 May 2023 09:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp
 firmware-name
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230220093343.3447381-1-hsinyi@chromium.org>
 <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
 <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_001300_878642_C6DF436A 
X-CRM114-Status: GOOD (  11.05  )
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

Il 30/05/23 07:12, Hsin-Yi Wang ha scritto:
> On Tue, Feb 21, 2023 at 11:25 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>
>>> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
>>>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> hi Matthias,
> 
> Kindly ping on the patch, thanks!

Agreed. Matthias, please pick this one.

Hsin-Yi, can you also please send a version of this patch for stable?

Thanks,
Angelo

