Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F0C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjwyJpQVDeFKjZxk3Pi6v1niFo2bjD6QgB8a2gI8X1M=; b=iPlsZjI7Y86BjNPDUdge2JXBmY
	n+CILrT/6njGTZeo9seHkHGIPEpMBS31wKYxe493B5pXDCocOCtKS9ttfLwRKPZKZxsBEK0w8BpLO
	CMLs6CGdFKY6b6pGl0Eu0YefgioSOuMibCrmw2rvmNe3oLxt3aksd2Ag6yHrgRSlza9VpaXbOm3I3
	QrN6fWiv8VH4VsSTIatZZoN+y6KA0geX1nD+1Rt3dXwhUYHxqYrNSJp4zo1cmXqjdxBWcwRSJMAkG
	wwI8WVJmVfqGB8K/Iy0j5TvaMYHh2G9sp0t0dR3zgaIzMgIIzeKkUDLIdtX/rfLO/oZbo7hGvZ0px
	9TcLjefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SXp-000vJs-2Q;
	Tue, 06 Jun 2023 09:00:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SXm-000vHw-1z;
	Tue, 06 Jun 2023 09:00:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 967B66606EAE;
	Tue,  6 Jun 2023 09:59:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686041994;
	bh=9ewOsk6wZ9Jauj2PbHOf5mz8ugJ5ye+vxu0IkujUUGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c208n0poJG3aPntXbpwumJ0syi8LNesiiX0Md8aZi24tVcK5IDcUiGxAuEVEVCxsh
	 4zvzpNT9qNnIjm6Sfr6iehoBOxJ25chXnP87w2c92L3FGWPN+fPMQssQgEzNL8inxw
	 yqBtF1mXYJLgoOfH5JB0+nJnoBaOIiT7ObZqoFSrm6isErF8c7VhSG1fX022R32the
	 LMKEd3vTfUwjjy8gdVp7DqG75txUVQsirut/ssvttwAO/xOfwkwroGClJL8AcmGoQj
	 QX6y1VFRXZy9mLO0EiCszCAb+tHEVXjCZsRfFAsTgJdwCoYLqBC/8roiHugWu9cnNr
	 pehh7f3UOkU5A==
Message-ID: <af550c9b-b776-db8a-b2e5-8fbfad7d5a03@collabora.com>
Date: Tue, 6 Jun 2023 10:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] mmc: mtk-sd: reduce CIT for better performance
Content-Language: en-US
To: =?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "riteshh@codeaurora.org" <riteshh@codeaurora.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>
References: <20230605060107.22044-1-wenbin.mei@mediatek.com>
 <47ee4c8b-dedf-d69a-dceb-dcaa34ddd0e1@collabora.com>
 <0de574510def6fa736a6dceaf8423ee80561642e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <0de574510def6fa736a6dceaf8423ee80561642e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_015958_834968_37A7CCC0 
X-CRM114-Status: GOOD (  21.04  )
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

Il 06/06/23 10:17, Wenbin Mei (梅文彬) ha scritto:
> On Mon, 2023-06-05 at 10:48 +0200, AngeloGioacchino Del Regno wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Il 05/06/23 08:01, Wenbin Mei ha scritto:
>>> CQHCI_SSC1 indicates to CQE the polling period to use when using
>> periodic
>>> SEND_QUEUE_STATUS(CMD13) polling.
>>> Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
>>> frequency to get the actual time.
>>> The default value 0x1000 that corresponds to 150us for MediaTek
>> SoCs, let's
>>> decrease it to 0x40 that corresponds to 2.35us, which can improve
>> the
>>> performance of some eMMC devices.
>>>
>>> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
>>
>> OK! That's almost good now. There's only one consideration here: if
>> MediaTek
>> SoCs *require* msdc_hclk to calculate the CIT time, this means that
>> this clock
>> is critical for CQHCI functionality.
>>
>> If msdc_hclk is not present, CQHCI cannot work correctly... so you
>> don't have
>> to cover the case in which there's no msdc_hclk clock: if that's not
>> present,
>> either fail probing, or disable CQHCI.
>>
>>> ---
>>>    drivers/mmc/host/cqhci.h  |  1 +
>>>    drivers/mmc/host/mtk-sd.c | 47
>> +++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 48 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
>>> index ba9387ed90eb..292b89ebd978 100644
>>> --- a/drivers/mmc/host/cqhci.h
>>> +++ b/drivers/mmc/host/cqhci.h
>>> @@ -23,6 +23,7 @@
>>>    /* capabilities */
>>>    #define CQHCI_CAP0x04
>>>    #define CQHCI_CAP_CS0x10000000 /* Crypto Support */
>>> +#define CQHCI_CAP_ITCFMUL(x)(((x) & GENMASK(15, 12)) >> 12)
>>>    
>>>    /* configuration */
>>>    #define CQHCI_CFG0x08
>>> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
>>> index edade0e54a0c..c221ef8a6992 100644
>>> --- a/drivers/mmc/host/mtk-sd.c
>>> +++ b/drivers/mmc/host/mtk-sd.c
>>> @@ -473,6 +473,7 @@ struct msdc_host {
>>>    struct msdc_tune_para def_tune_para; /* default tune setting */
>>>    struct msdc_tune_para saved_tune_para; /* tune result of
>> CMD21/CMD19 */
>>>    struct cqhci_host *cq_host;
>>> +u32 cq_ssc1_time;
>>>    };
>>>    
>>>    static const struct mtk_mmc_compatible mt2701_compat = {
>>> @@ -2450,9 +2451,50 @@ static void
>> msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
>>>    }
>>>    }
>>>    
>>> +static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
>>
>> static int msdc_cqe_cit_cal(....)
>>
> Sorry, I missed this comment.
> I think there is no need to return a value.
> Becuase msdc_hclk is exist, and if not present, it will return earily.
> Even if it goes to the default case in the switch flow, we will assign
> a default value.
> So I think it's better to return null, do you think it is okay?
> 

Yeah ignore this comment; I've noticed that HCLK is already mandatory, otherwise
the probe function will fail earlier anyway.

Thanks,
Angelo


