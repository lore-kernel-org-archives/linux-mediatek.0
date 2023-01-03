Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF12C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNcgxNLrMP0ObiUeiUV2qBm0Q2P10GbILBPXF0O27jY=; b=WdbOYK4+PUF5Hj4CVBAcSIf2HH
	ZeBSOund5LbIHuPv2JkEES1QO3wAgilPHN3UGoCeJPIYtWio8caz5OIkcZ5JByQz955UIzJSDfPfr
	CY8jnP7JKw7qW9F7LNFyt4fADimSji23UZT9QJvOo0Czh5IRFOK5tBTnVzlYVgkkHDqroru8IkbT4
	1LsXw0LeYT78Ka+WJ0cBPxSWYbcOEqjsYRJ07Akox82oWjbONJ03zG2xKn+0Hqfr61GYFj45SDlr5
	rip93PILc07l0HqaSye1oYS0X+sPdzBxCBDvISoTUcDcgqOy+G2trvoSkGRgFkaVergLNqQMZZohc
	pIEl2e9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcHO-0003de-2N; Tue, 03 Jan 2023 08:04:14 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcDS-0001k8-Qk; Tue, 03 Jan 2023 08:00:13 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3033rgmb028440;
	Tue, 3 Jan 2023 08:59:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PNcgxNLrMP0ObiUeiUV2qBm0Q2P10GbILBPXF0O27jY=;
 b=xxa2ch6McfHSRjGdCal5Jq9fg60bsM9BzY+X1vRnUQGjXLLvI+WgOC5xcSAh68cICj0W
 D72QMnHvDxMOrdfP9kSQDeMtd07yUSJTXnEuDQ+pJnelFZKWyEWRX2mI0LolVEuLsYgJ
 kfOg+YTSokgXYbPXkq73wdDFha4RljTplvQ/GBcDQshNzgumh6+oHFblLSSQU501YWwr
 lmL2NPFr0zYsYzwPw/RQgmNGqVdcbhaCz4wkpvg/vD7wY29LhXJJ7X+DWHjtpYc4NDg5
 +XygFdf93FzpVNJ8I6eGGbcgV4N0R2NGwpPqDa1kKYf2d7hWgNoJkWGpgsomjMFM25nM OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e3mf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 08:59:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFF4410002A;
	Tue,  3 Jan 2023 08:59:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB08A2132D2;
	Tue,  3 Jan 2023 08:59:54 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 08:59:53 +0100
Message-ID: <e16e9030-931a-61be-d034-9a1206f0f906@foss.st.com>
Date: Tue, 3 Jan 2023 08:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/7] ARM: dts: stm32: Remove the pins-are-numbered
 property
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        <devicetree@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-8-bero@baylibre.com> <7hlenm56lb.fsf@baylibre.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <7hlenm56lb.fsf@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2022-12-30_01,2022-06-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_000011_807317_B2FF25AC 
X-CRM114-Status: GOOD (  11.06  )
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

Hi Kevin

On 12/5/22 14:21, Kevin Hilman wrote:
> Alexandre,
> 
> Bernhard Rosenkränzer <bero@baylibre.com> writes:
> 
>> Remove the pins-are-numbered property from STM32 DeviceTrees
>>
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Now that the driver & binding qre queued, I'm assuming you'll queue this
> one via the stm32 tree?
> 

Yes I'll take it.

cheers
Alex


> Thanks,
> 
> Kevin


