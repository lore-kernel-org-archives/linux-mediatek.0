Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0100C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD296600D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD296600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8GFBWTY7FeSDWXU2Ust431yJqhm2EbukeWgEhcLZGQc=; b=mXvz6fY97WOegbHkKyGtVwc8h
	z4RRY/BbQwhos4trCkIrGEDF6X1b2/2yNh/34wBzDW6/cVVVaxVZ2MJd0S2ZKl390v6FU0yYNwhKT
	QoohTRtjnb4dWdEmp1nPYOTQa8Vhg7iSVxAj7TZ7hCoSPOOo54vLYWsHxPgOVbWc6kRp3zFzDbrRN
	k1DwF7S4hMG/kI4/T7MYDb+RJfwNGnxYq+rsFwhy9Jxcm+/108Zdx+7Uulg8H8aQjZPlp8bq+FR9g
	o35s8IGtPEDIHjAJKsa7yuIl0dgocdm8rwxdt85b6vkD48ETofIkBWrCuGVmYYBaihCTXInVLl350
	uYLOoPUlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZUg-003vvD-Pq; Sat, 17 Apr 2021 01:11:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUR-003vse-MY; Sat, 17 Apr 2021 01:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=7ewTaJXM56a7xZ8YuNhCrNUpWd6hW+7w63yaJ8+2P/Y=; b=Z0T2NN9cF2sB0TETj85YMBL9gQ
 9Z/GE54Q1hGt5g8jZ/YREYIKFicePP5cLPl9N5ntNRoUnE6UOhYPLUdRAWelQvHVTgnj87u3rdEeo
 MgO4tF/Y36smG0T/qlJuC7AvjvPLPD0YLhvJgEgN2INUPBJwS2yAtH68ehsixMZPbJdrt+iacNu6Z
 fOna3quUcqJLAgzGqCjY+E585P1Y64hOolFNxngIKFF4O3in6ORWGIUy5TP1IisD2Di9cTGv+sxTw
 aKmtiyRa4Bzt5wS1YqI7YiUpZLt4hdnoXy17JWXX4qFRhah8a+0c0UiRJofWMB15waHsRkLIPA77j
 ypye7ndg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUN-009oyV-JH; Sat, 17 Apr 2021 01:11:14 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FMZhq67RWz7vFC;
 Sat, 17 Apr 2021 09:08:43 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 17 Apr 2021 09:10:55 +0800
Subject: Re: [PATCH 5/8] iommu: fix a couple of spelling mistakes
To: John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 "David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
 <20210326062412.1262-6-thunder.leizhen@huawei.com>
 <e04d117a-4832-7f95-7adf-dbece21aad8c@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <b3bd3aed-f02f-2056-1d98-ef164974b0ea@huawei.com>
Date: Sat, 17 Apr 2021 09:10:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e04d117a-4832-7f95-7adf-dbece21aad8c@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181111_826776_1210293F 
X-CRM114-Status: UNSURE (   7.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2021/4/16 23:55, John Garry wrote:
> On 26/03/2021 06:24, Zhen Lei wrote:
>> There are several spelling mistakes, as follows:
>> funcions ==> functions
>> distiguish ==> distinguish
>> detroyed ==> destroyed
>>
>> Signed-off-by: Zhen Lei<thunder.leizhen@huawei.com>
> 
> I think that there should be a /s/appropriatley/appropriately/ in iommu.c

OK, I will fix it in v2.

> 
> Thanks,
> john
> 
> .
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
