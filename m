Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E54C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:09:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D82664E4E
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D82664E4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sPdNk3IL7HVV8ig3y5OaQnAiw5cJnctqRMB7W/pSEv8=; b=LcAJQTub9izTLiyKWueV0XR0t
	hrW+x0rRnls50tL0wG4xJAig1wsTXLuvNKJiInRKojxpKT/sLrLvRkvF7V1xre/71ZxIytxCIoKEX
	ylhEUjojt8WQVmf1oX0Ew7oueR6P9QTyRZre3CusbJ30K1oyGzB9tAQ3GeVWIXjPLPJjU1MvU3xLp
	/maOKr/1svq1tN2/Tkjpq4iob0zcE+KYE8lJk8Okn4XcY32G1Bmn/cb9x3FU3ZX1t5mdtWunKgQ9f
	7IL+O1ATmCeVVbE3nWwUJvrO06SCUaVjb4WSYR961OumkacbiovfyugTAwgnMY0CJWTWhsVVBpmrb
	RyqELc2sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VCl-0005GQ-3O; Mon, 01 Feb 2021 09:09:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VCh-0005Fc-Nl; Mon, 01 Feb 2021 09:09:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E090AE72;
 Mon,  1 Feb 2021 09:09:02 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8183: Add domain supply
 for mfg
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20210129101208.2625249-1-hsinyi@chromium.org>
 <20210129101208.2625249-4-hsinyi@chromium.org>
 <6d24fad2-84ac-1cd1-128b-cc36b115502e@gmail.com>
Message-ID: <26423e96-bbb5-a7c0-576f-5dc41801715f@gmail.com>
Date: Mon, 1 Feb 2021 10:09:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6d24fad2-84ac-1cd1-128b-cc36b115502e@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_040903_923840_85F8C9D6 
X-CRM114-Status: GOOD (  18.67  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/01/2021 13:05, Matthias Brugger wrote:
> 
> 
> On 29/01/2021 11:12, Hsin-Yi Wang wrote:
>> Add domain supply node.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
> 
> Applied to v5.11-next/dts64
> 

I just realiezed that we will also need a patch for the MT8183 EVB. I'll leave
this series in, but please provide a follow-up patch for the dts.

Thanks.
Matthias

> Thanks
> 
>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index bf2ad1294dd30..ebd53755d538a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -709,6 +709,10 @@ cros_ec {
>>  	};
>>  };
>>  
>> +&mfg {
>> +	domain-supply = <&mt6358_vgpu_reg>;
>> +};
>> +
>>  &soc_data {
>>  	status = "okay";
>>  };
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 5b782a4769e7e..bda283fa92452 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -360,7 +360,7 @@ power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
>>  					#size-cells = <0>;
>>  					#power-domain-cells = <1>;
>>  
>> -					power-domain@MT8183_POWER_DOMAIN_MFG {
>> +					mfg: power-domain@MT8183_POWER_DOMAIN_MFG {
>>  						reg = <MT8183_POWER_DOMAIN_MFG>;
>>  						#address-cells = <1>;
>>  						#size-cells = <0>;
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
