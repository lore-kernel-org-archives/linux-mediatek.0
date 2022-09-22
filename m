Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617F9C6FA90
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBdNrwpDakzbC5A0nS4SeFarWHxN2U44qwNrPdNu1Xc=; b=MBl40gPruqJ7j5dsNoHUJfRQTk
	iAwxPSrAjafTmLFj6jgasZbQXf3bqoH7sOTlAdGcbesok8CoK4EyhaBRPLPED2U6uSewbh9K+ipWV
	N3/3F71bOwt2YfCGm9cJopT96JpwEGhwJ1cJxYfvGpofOzC8sCnMbHR1wS5H5feB6Cq5irZX4rMeU
	LfFAJcvvxTIZ9YOsjDLaoKMX2j+G85QxrhkKCbRSLbRetJ8J0qimNBK6F7+aPQxKLjVslAC8qNVlt
	ZChWReT0NCxZJNUCXycrZk88llA8DGnzciPFeJVKGGAVj03JjCvmHAyg6Nz1ravZeLE3YlYgm/Lnv
	r3/kVwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHrJ-00EG8I-T5; Thu, 22 Sep 2022 08:47:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHpa-00EFQ7-Ch; Thu, 22 Sep 2022 08:45:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MY80r2ztkzpVSH;
	Thu, 22 Sep 2022 16:42:20 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 16:45:09 +0800
Subject: Re: [PATCH 2/5] mt76: Remove unused inline function
 mt76_wcid_mask_test()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jakub Kicinski <kuba@kernel.org>
CC: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <pabeni@redhat.com>, <nbd@nbd.name>,
	<lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
	<sean.wang@mediatek.com>, <kvalo@kernel.org>, <matthias.bgg@gmail.com>,
	<amcohen@nvidia.com>, <stephen@networkplumber.org>, <netdev@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
 <20220921090455.752011-3-cuigaosheng1@huawei.com>
 <20220921061111.6d960cc3@kernel.org>
 <73a16853-d6fc-8a14-8050-d78c8fcd0e3a@quicinc.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <cfe96d7e-c7b0-4320-35b4-958190d601ad@huawei.com>
Date: Thu, 22 Sep 2022 16:45:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <73a16853-d6fc-8a14-8050-d78c8fcd0e3a@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_014514_690201_B7D60E45 
X-CRM114-Status: UNSURE (   7.85  )
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


> On 9/21/2022 6:11 AM, Jakub Kicinski wrote:
>> On Wed, 21 Sep 2022 17:04:52 +0800 Gaosheng Cui wrote:
>>> All uses of mt76_wcid_mask_test() have
>>> been removed since commit 8950a62f19c9 ("mt76: get rid of
>>> mt76_wcid_hw routine"), so remove it.
>>
>> This should go via the wireless tree, please take it out of this series
>> and send it to linux-wireless separately.
>
> And when you do that add wifi: prefix to the subject
> .

Thanks for taking time to review this patch, I have made a patch v2 and 
submitted it.

link: 
https://lore.kernel.org/netdev/20220922074711.1408385-1-cuigaosheng1@huawei.com/



