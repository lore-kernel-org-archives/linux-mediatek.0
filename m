Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE30C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EBD764E2A
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EBD764E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7PaowKsJGsTjV5xQ1Xkf2V6YGVw1U7EwrB4S7t1dIYg=; b=lmPInsR3dY5h4G+G9xhp+w/SD
	MWWLnhvT2k+4uVZYRYOOfeoC2BeAaIb5ezrVGbb5GTppR/L86eYeAp3cpLGaskD/oeulAWZTJK9O5
	PZ056TzhtZB74E9FzciicMvZWCPYBw65h0UlB1dgDesVjxkETDJ7L4h+OIcpWIKv4nkmcc2A6yoJK
	A7+Bj/DF/pWCgutwZMQsyQi71JcPiSA7exDThTMFePomtmAp1xSsZyti5ZncZdIZ3DyjYQSeH5bvr
	kV34+wGwKo8Fh812IHrzzsdY03HUvJ40wrQqq2Vp1jKZuKkg/mlitPjHEtzsg/Y5NTDXaio651TkT
	Rwb8S5oNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ArH-0008Kx-Rj; Sun, 31 Jan 2021 11:25:35 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ArC-0008K2-Jo; Sun, 31 Jan 2021 11:25:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7543AC97;
 Sun, 31 Jan 2021 11:25:27 +0000 (UTC)
Subject: Re: [PATCH v1] arm64: dts: mt8192: add nor_flash device node
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Bayi Cheng <bayi.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
References: <1607589283-31225-1-git-send-email-bayi.cheng@mediatek.com>
 <174ae215-38a1-0bb4-ad72-a3f59d35f2ad@gmail.com>
Message-ID: <ca03bea3-dfbf-9ae7-a02b-e01d9f0c01b9@gmail.com>
Date: Sun, 31 Jan 2021 12:25:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <174ae215-38a1-0bb4-ad72-a3f59d35f2ad@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_062530_798062_479323A6 
X-CRM114-Status: GOOD (  16.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/01/2021 11:26, Matthias Brugger wrote:
> 
> 
> On 10/12/2020 09:34, Bayi Cheng wrote:
>> From: bayi cheng <bayi.cheng@mediatek.com>
>>
>> add nor_flash device node
>>
>> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
> 
> Applied to v5.11-next/dts64

reverted and replaced with v2.

Thanks!

> 
> Thanks
> 
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> index e12e024..b15b0d3 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> @@ -379,6 +379,19 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		nor_flash: spi@11234000 {
>> +			compatible = "mediatek,mt8173-nor";
>> +			reg = <0 0x11234000 0 0xe0>;
>> +			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&clk26m>,
>> +				 <&clk26m>,
>> +				 <&clk26m>;
>> +			clock-names = "spi", "sf", "axi";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disable";
>> +		};
>> +
>>  		i2c3: i2c3@11cb0000 {
>>  			compatible = "mediatek,mt8192-i2c";
>>  			reg = <0 0x11cb0000 0 0x1000>,
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
