Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E12C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpjiDxO7BGUdjKg/xPiZJGtQIB3/nFTNQ+hhSfVtEHI=; b=vvtE8fLlnGZ/7KD4y/dvVENhXG
	gNmDVJPbomtGmAiOEWQO5ZQbxkNa9JQ/rV98VCO0KJLhWALlgIvv7Tz9sGCkKgDqmvVyfib+fuCTi
	jZsnyjgJAzObODXxjPmTLIIergz7Zzo5/VsQFoJ8tdlO4NR+kNR+jh/zfpcj/IJkzZqfNOgEcomnf
	b2NwoeCWksCY6Nut8NY/1+DN3zPJi4Ka+Z5pEbm4+vyCVHIPk+YOPQP1QKk0ESPlZ8kqcRo2978kz
	B1OUtxLMzQMPS3CRwCGBWXXCcpZehUuK0iQiMTfosERQrUJyTbhotZp6XsR/8LCi1hjlGkOjoq5cr
	pCi/3E/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvJt-002g8I-Ew; Mon, 09 Jan 2023 16:48:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvJp-002g52-LN; Mon, 09 Jan 2023 16:48:19 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309CcS0M004755;
	Mon, 9 Jan 2023 17:48:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HpjiDxO7BGUdjKg/xPiZJGtQIB3/nFTNQ+hhSfVtEHI=;
 b=Xf4ggyfezBBZz5tGahk6Ry/CmwDoWSua995vphfp4I9FRscTEcEZHSkdHTmccbFDrIzV
 DDyZSCiHKpn4xfm+mx4d2r1/Qi/ua0KrbDy8B1amN3LNzgO7loZIVblEShE3zgyKo7Dz
 vfUQ6goV7a+AO8V+I975A6bwr5U7e9T2deAA3lGxv8yAr8CTVVP5BiWpVKQwvmp8IW+N
 ml/aKP7TOmyGNBewcSJWtRNs5GfuenWVhRAWYX2wjAXRMm6rjUFNKQqjaElFBlvDkTMI
 +2R+ybQn/aBQQiW0l2aKclXIEwQRN0yDNar9XzAFfIWKG8uB7iHt+4Jaz+bFtsblW3Ab Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3my0y6ugtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 17:48:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05F9010002A;
	Mon,  9 Jan 2023 17:48:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8399226FD2;
	Mon,  9 Jan 2023 17:48:12 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 9 Jan
 2023 17:48:12 +0100
Message-ID: <6219844a-47d9-5edd-ff9f-6e5df0602d0c@foss.st.com>
Date: Mon, 9 Jan 2023 17:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] ARM: dts: stm32: Remove the pins-are-numbered
 property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <khilman@baylibre.com>, <linux-gpio@vger.kernel.org>
References: <20221205135158.1842465-1-bero@baylibre.com>
 <20221205135158.1842465-4-bero@baylibre.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20221205135158.1842465-4-bero@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_10,2023-01-09_01,2022-06-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_084818_002922_E691D561 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi Bernhard

On 12/5/22 14:51, Bernhard Rosenkränzer wrote:
> Remove the pins-are-numbered property from STM32 DeviceTrees
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied on stm32-next.

Cheers
Alex


