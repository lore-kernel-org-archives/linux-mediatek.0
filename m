Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524E4C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:50:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B37613E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B37613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxvu3jtMknnxMiuzTHVqvr3Z/yemmVFDpEXwG5EDOgI=; b=HE84rdbAAiZQIuHCsdpKN3aSk
	Q/nnpA6USIxcIM2Rm8QhotOEp4QGMdi62XpRbDgy8hm4BN2igAoqBQPM0xeClEVZA8zxkos0jCUZT
	K4NtaKPCn+O2y9+aqjq4zv5bzzSF+7Oi31y8Dj5ZfrGyP/mBnPFvPFF3n+ELicqOWqzKGJblV4OjD
	9fjsvncvLBUB/C7IsZ6qKPMYAIup1MITvoCZW02KhbGKFHTWveiXwmMhp/t+35VYeHuhMTWrnProz
	vyAix/LLwNbDHaJw2htvhfh26urVgkGMLM24zMQwPU+nsAdAvffDQ7TbCHZSNjufBBSqpZWHf0kiw
	KuJp87jgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSlw-000H55-Om; Tue, 11 May 2021 13:50:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSHl-00036Y-LU; Tue, 11 May 2021 13:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0RZRfcu4XTr4wjrVYiucCJloysCohAVnW8frXeN6LDA=; b=B6NpPidylsQiVz7cDGHEglhfc+
 2II1q+r93laQtpzr7GEEgWUrhS0t16OpCdNeyTgi3//sPzdD/Z7Y7gTS7f6Hnr0Xv37B+5mBvjt7q
 S2VsERkaWzU2ZX84XABHh7D+0ZDOLSdErCqYhTydlouiTclEs66jfacphyNwpu84Jv/7fVGM2vrtj
 VyFOXviqncJjY/d7ua5z9uEnlpFlAAIFjHh5qTUO+PbEF2xoVPwUchcuK2p7r5UNuKP60i5g3KZig
 4leL/2GXUmfnVWjiwt4unC1D+YMTYeiECPs1a/p8/WVrUR3ehjz16qP09WO0U8bA6se/gDmiGkLio
 xzK6Xu0A==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSHi-009bwH-NI; Tue, 11 May 2021 13:18:52 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfdjQ55Pfzkljf;
 Tue, 11 May 2021 21:16:26 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 21:18:32 +0800
Subject: Re: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_cec_probe()
To: Baruch Siach <baruch@tkos.co.il>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
References: <20210511113200.5439-1-thunder.leizhen@huawei.com>
 <87r1idwh01.fsf@tarshish>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2997093d-16ef-6cd1-b920-39b76143a3ca@huawei.com>
Date: Tue, 11 May 2021 21:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87r1idwh01.fsf@tarshish>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_061850_934581_7F500D8B 
X-CRM114-Status: GOOD (  15.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2021/5/11 21:13, Baruch Siach wrote:
> Hi Zhen Lei,
> 
> On Tue, May 11 2021, Zhen Lei wrote:
>> When devm_ioremap_resource() fails, a clear enough error message will be
>> printed by its subfunction __devm_ioremap_resource(). The error
>> information contains the device name, failure cause, and possibly resource
>> information.
>>
>> Therefore, remove the error printing here to simplify code and reduce the
>> binary size.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_cec.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
>> index e9cef5c0c8f7eff..fd593ff99bfd447 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
>> @@ -197,7 +197,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>>  	cec->regs = devm_ioremap_resource(dev, res);
>>  	if (IS_ERR(cec->regs)) {
>>  		ret = PTR_ERR(cec->regs);
>> -		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
>>  		return ret;
> 
> You can just return PTR_ERR() directly. No need to set 'ret'.

Right, I will fix it tomorrow.

> 
> baruch
> 
>>  	}
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
