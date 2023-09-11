Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6B0EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyULDSJmlmk80uLNBMZ9JdSMfkxjBy+QxnTerAoC9NU=; b=hq/QnONrZGNmeT1OJFKtbfTRTV
	HEVsjfboaw+s3F/5fp8zTj3j4AZnFw/v+bDkIhiXaE6jNTNlH2QYNFupiVbNxYxWFr3/qzuWINyeN
	Mu8wILyAko4sN8HbmwwLKi9STNrKoujll1rMaPOuthM0+QBGV/jqBWcou5Qs0eJXwVTfVry41+8t7
	HarP0gU6uIFtSSwtlfoSZatS2l8t4jGlLgh3Z4iMZywUetqLll2HVBxSpauyfb3y9QBMm2zetihZY
	L2kvStYWUc9aCZBxnXuBExKllKn2ikdY0RBD8PQ2W4e6XC43WYWj+4MLW70HOQYaE050Rrna0Ckxa
	dVx8BtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeeD-000L2u-0L;
	Mon, 11 Sep 2023 11:00:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfee7-000L0T-2W;
	Mon, 11 Sep 2023 11:00:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 84DB566072EF;
	Mon, 11 Sep 2023 11:59:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694429995;
	bh=jBzaFr5k4/eZ3Li9acpMFw0WcWRQMS/ZD6V8L5702SE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QHWsiitFmF6Nw68ryThCOJXIDQ6fKSBwr0ryO+wXkp/oUGHye9i6KwPfEYe0LaZKL
	 8HPS7oEQ7fzxbnkLGGIgX/kWjCBO80BWRVtdy2UijbV0ZvtDHozSibN/8CRc/J6CqE
	 bmWaqZwFNf235+QS5GhBv48A7nNW88tfTjrnDLJMpdhosmPR0I6OsFOzQHiGbU64X5
	 2ipfpjgOGjVZ5u7+6qZIQmds3/BzbKWBOjelG1R5qIlRQaMCUZWoHU/215g4HfbZ39
	 IlePE3zz52r7wXuqFGNRdiYh+jcyXLDdITMAp5UTfj2L8AQXqT3MFD6GAi7IboFtMX
	 at2yGrvPxBdGA==
Message-ID: <799325f5-29b5-f0c0-16ea-d47c06830ed3@collabora.com>
Date: Mon, 11 Sep 2023 12:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: change CCI OPP scaling
 mapping
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230911080927.17457-1-chun-jen.tseng@mediatek.com>
 <CAGXv+5Gqpuu+QVtixOK=ULKkBaqhScFz7tgVqtczknx6CbdjLA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gqpuu+QVtixOK=ULKkBaqhScFz7tgVqtczknx6CbdjLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040000_146828_E2281C08 
X-CRM114-Status: GOOD (  22.09  )
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

Il 11/09/23 11:47, Chen-Yu Tsai ha scritto:
> On Mon, Sep 11, 2023 at 4:09 PM Mark Tseng <chun-jen.tseng@mediatek.com> wrote:
>>
>> The original CCI OPP table minimum frequency 500Mhz is too low to cause
>> system stall, So it need update to new version, 1.4G ~ 1.05G.
> 
> This doesn't read as you think it does. I suggest the following instead:
> 
> The original CCI OPP table's lowest frequency 500 MHz is too low and causes
> system stalls. Increase the frequency range to 1.05 GHz ~ 1.4 GHz and adjust
> the OPPs accordingly.
> 
> 
> I also suggest making the subject more precise, like "Increase CCI frequency".
> 

I agree with the commit title/description suggestion, but I wonder if it'd be
possible to solve this issue in another way, as this is going to increase the
heat output (even if only sensibly) and to also increase the power consumption
of the SoC.

I'm thinking about more aggressive scale-up and/or maybe interconnect votes.

Ideas?

Cheers,
Angelo

> ChenYu
> 
>>
>> Fixes: 32dfbc03fc26 ("arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table")
>>
>> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
>>   1 file changed, 45 insertions(+), 45 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> index f04ae70c470a..b98832d032eb 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> @@ -39,79 +39,79 @@
>>                  compatible = "operating-points-v2";
>>                  opp-shared;
>>
>> -               cci_opp_0: opp-500000000 {
>> -                       opp-hz = /bits/ 64 <500000000>;
>> -                       opp-microvolt = <600000>;
>> +               cci_opp_0: opp-1050000000 {
>> +                       opp-hz = /bits/ 64 <1050000000>;
>> +                       opp-microvolt = <843750>;
>>                  };
>>
>> -               cci_opp_1: opp-560000000 {
>> -                       opp-hz = /bits/ 64 <560000000>;
>> -                       opp-microvolt = <675000>;
>> +               cci_opp_1: opp-1073000000 {
>> +                       opp-hz = /bits/ 64 <1073000000>;
>> +                       opp-microvolt = <850000>;
>>                  };
>>
>> -               cci_opp_2: opp-612000000 {
>> -                       opp-hz = /bits/ 64 <612000000>;
>> -                       opp-microvolt = <693750>;
>> +               cci_opp_2: opp-1096000000 {
>> +                       opp-hz = /bits/ 64 <1096000000>;
>> +                       opp-microvolt = <856250>;
>>                  };
>>
>> -               cci_opp_3: opp-682000000 {
>> -                       opp-hz = /bits/ 64 <682000000>;
>> -                       opp-microvolt = <718750>;
>> +               cci_opp_3: opp-1120000000 {
>> +                       opp-hz = /bits/ 64 <1120000000>;
>> +                       opp-microvolt = <862500>;
>>                  };
>>
>> -               cci_opp_4: opp-752000000 {
>> -                       opp-hz = /bits/ 64 <752000000>;
>> -                       opp-microvolt = <743750>;
>> +               cci_opp_4: opp-1143000000 {
>> +                       opp-hz = /bits/ 64 <1143000000>;
>> +                       opp-microvolt = <881250>;
>>                  };
>>
>> -               cci_opp_5: opp-822000000 {
>> -                       opp-hz = /bits/ 64 <822000000>;
>> -                       opp-microvolt = <768750>;
>> +               cci_opp_5: opp-1166000000 {
>> +                       opp-hz = /bits/ 64 <1166000000>;
>> +                       opp-microvolt = <893750>;
>>                  };
>>
>> -               cci_opp_6: opp-875000000 {
>> -                       opp-hz = /bits/ 64 <875000000>;
>> -                       opp-microvolt = <781250>;
>> +               cci_opp_6: opp-1190000000 {
>> +                       opp-hz = /bits/ 64 <1190000000>;
>> +                       opp-microvolt = <906250>;
>>                  };
>>
>> -               cci_opp_7: opp-927000000 {
>> -                       opp-hz = /bits/ 64 <927000000>;
>> -                       opp-microvolt = <800000>;
>> +               cci_opp_7: opp-1213000000 {
>> +                       opp-hz = /bits/ 64 <1213000000>;
>> +                       opp-microvolt = <918750>;
>>                  };
>>
>> -               cci_opp_8: opp-980000000 {
>> -                       opp-hz = /bits/ 64 <980000000>;
>> -                       opp-microvolt = <818750>;
>> +               cci_opp_8: opp-1236000000 {
>> +                       opp-hz = /bits/ 64 <1236000000>;
>> +                       opp-microvolt = <937500>;
>>                  };
>>
>> -               cci_opp_9: opp-1050000000 {
>> -                       opp-hz = /bits/ 64 <1050000000>;
>> -                       opp-microvolt = <843750>;
>> +               cci_opp_9: opp-1260000000 {
>> +                       opp-hz = /bits/ 64 <1260000000>;
>> +                       opp-microvolt = <950000>;
>>                  };
>>
>> -               cci_opp_10: opp-1120000000 {
>> -                       opp-hz = /bits/ 64 <1120000000>;
>> -                       opp-microvolt = <862500>;
>> +               cci_opp_10: opp-1283000000 {
>> +                       opp-hz = /bits/ 64 <1283000000>;
>> +                       opp-microvolt = <962500>;
>>                  };
>>
>> -               cci_opp_11: opp-1155000000 {
>> -                       opp-hz = /bits/ 64 <1155000000>;
>> -                       opp-microvolt = <887500>;
>> +               cci_opp_11: opp-1306000000 {
>> +                       opp-hz = /bits/ 64 <1306000000>;
>> +                       opp-microvolt = <975000>;
>>                  };
>>
>> -               cci_opp_12: opp-1190000000 {
>> -                       opp-hz = /bits/ 64 <1190000000>;
>> -                       opp-microvolt = <906250>;
>> +               cci_opp_12: opp-1330000000 {
>> +                       opp-hz = /bits/ 64 <1330000000>;
>> +                       opp-microvolt = <993750>;
>>                  };
>>
>> -               cci_opp_13: opp-1260000000 {
>> -                       opp-hz = /bits/ 64 <1260000000>;
>> -                       opp-microvolt = <950000>;
>> +               cci_opp_13: opp-1353000000 {
>> +                       opp-hz = /bits/ 64 <1353000000>;
>> +                       opp-microvolt = <1006250>;
>>                  };
>>
>> -               cci_opp_14: opp-1330000000 {
>> -                       opp-hz = /bits/ 64 <1330000000>;
>> -                       opp-microvolt = <993750>;
>> +               cci_opp_14: opp-1376000000 {
>> +                       opp-hz = /bits/ 64 <1376000000>;
>> +                       opp-microvolt = <1018750>;
>>                  };
>>
>>                  cci_opp_15: opp-1400000000 {
>> --
>> 2.18.0
>>


