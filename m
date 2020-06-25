Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211EEC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 08:39:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C9B207FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 08:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kb7ExXzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C9B207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FPgYxOnfx5vg5TAX1MGicPxyBEUkzuuzWZ0G1u6I10E=; b=Kb7ExXzmuRZDm3q2ZBZHRo3Lt
	LRXdEq2G2JIHSkgSyWhNQhwDVBFjeKSntOW5iLZeN0L0ARcI4YOE22Cws95gu6j7OXjbus5wavZEC
	LlREej+H8xJYFzKru00gp++xouqdnlOyAzto8am244kweK6DwNaDGYSF1kS787UWp3H146kiPksIE
	x9BW8hwHMghrw1HC+lwBivR1n0jqTVnUrA7D5TeXfKKB0/zDws9fv/Ca2vvKErzjKU2KO6YMd4dN+
	Ve3ke7+wJBi5iIBHNn+MOO6UC8C9yarp1om08d7a1o/c6Hou8Ar5RnO4S0mc++Vj3pEsdRMSL8opg
	MG0LsvUBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joNPp-0004cB-QL; Thu, 25 Jun 2020 08:39:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joNPj-0004Zk-RM; Thu, 25 Jun 2020 08:39:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3846A2A087F
Subject: Re: [PATCH 4/7] arm64: dts: mt8183: Fix unit name warnings
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
References: <20200619102757.1358675-1-enric.balletbo@collabora.com>
 <20200619102757.1358675-5-enric.balletbo@collabora.com>
 <ec4fb6c1-37a3-08b2-ae57-3e35868383ef@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <c519de37-1377-9860-d831-0781c259cc0c@collabora.com>
Date: Thu, 25 Jun 2020 10:39:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ec4fb6c1-37a3-08b2-ae57-3e35868383ef@gmail.com>
Content-Language: en-US
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
Cc: erwanaliasr1@gmail.com, drinkcat@chromium.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

Thank you for you review.

On 22/6/20 12:14, Matthias Brugger wrote:
> 
> 
> On 19/06/2020 12:27, Enric Balletbo i Serra wrote:
>> Remove the unit address from the DT nodes that doesn't have a reg
>> property. This fixes the following unit name warnings:
>>
>>   Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@0: node has a unit name, but no reg or ranges property
>>   Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@1: node has a unit name, but no reg or ranges property
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 00137ec61164d..e356076749148 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -168,7 +168,7 @@ CPU_SLEEP: cpu-sleep {
>>  				min-residency-us = <800>;
>>  			};
>>  
>> -			CLUSTER_SLEEP0: cluster-sleep@0 {
>> +			CLUSTER_SLEEP0: cluster-sleep0 {
> 
> Should be:
> cluster-sleep-0
> 

Ack, I'll change in next version

>>  				compatible = "arm,idle-state";
>>  				local-timer-stop;
>>  				arm,psci-suspend-param = <0x01010001>;
>> @@ -176,7 +176,7 @@ CLUSTER_SLEEP0: cluster-sleep@0 {
>>  				exit-latency-us = <400>;
>>  				min-residency-us = <1000>;
>>  			};
>> -			CLUSTER_SLEEP1: cluster-sleep@1 {
>> +			CLUSTER_SLEEP1: cluster-sleep1 {
> 
> Same here.
> 

Ack.

> Regards,
> Matthias1
> 
>>  				compatible = "arm,idle-state";
>>  				local-timer-stop;
>>  				arm,psci-suspend-param = <0x01010001>;
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
