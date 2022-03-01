Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A33C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 23:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/swjdZe3WI3HePN3WIElm5vSj0lBycjystGIzApFEnA=; b=AyK506O4LHu/QY
	Tn0BMePMSWi/fUnEExQ2fP7v/fCdclPi9CxfjONzjN2PPjKXhMAQeGlRXCZUFCfL/8pyMOAa0TuWo
	hTpIxyMHvqAYzf/rcpXyz45gPMupRa6F1ZX15JT0FNODa9QUlKQ/nkUlEI13+3Ju7W1NETDDPwAkb
	rs7Jdh6p5VeFeYC7bwDAc0F3qJ1orrsLkADPbnSJtynCSWQl/sqkCKrisJ2hR1IIvjDzdIQXGFWoJ
	3POG8roug+LnnAo79LcJ0vsgQ5LdyOc2cxbpGg6f9pMtpJ6lZjMX7u/dAL6cHrqhwm6462i+6Gg3q
	dRE/3AdsiLop+cq5eVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPBwm-000rgE-QO; Tue, 01 Mar 2022 23:30:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPBwa-000rdK-OT; Tue, 01 Mar 2022 23:30:14 +0000
X-UUID: 488d4ae129964c4b9596edbb8434abfb-20220301
X-UUID: 488d4ae129964c4b9596edbb8434abfb-20220301
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365094582; Tue, 01 Mar 2022 16:29:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 15:29:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 2 Mar 2022 07:29:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Mar 2022 07:29:53 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <Ning.Li@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <stable@vger.kernel.org>, <will@kernel.org>,
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: Re: [PATCH v2] iommu/iova: Reset max32_alloc_size after cleaning
Date: Wed, 2 Mar 2022 07:29:53 +0800
Message-ID: <20220301232953.17331-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <b10031aa-8e49-70b3-b498-8aa6b7021fbb@arm.com>
References: <b10031aa-8e49-70b3-b498-8aa6b7021fbb@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_153012_811896_4B4CA40D 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Yunfei,

>> Since __alloc_and_insert_iova_range fail will set the current alloc
>> iova size to max32_alloc_size (iovad->max32_alloc_size = size),
>> when the retry is executed into the __alloc_and_insert_iova_range
>> function, the retry action will be blocked by the check condition
>> (size >= iovad->max32_alloc_size) and goto iova32_full directly,
>> causes the action of retry regular alloc iova in
>> __alloc_and_insert_iova_range to not actually be executed.
>> 
>> Based on the above, so need reset max32_alloc_size before retry alloc
>> iova when alloc iova fail, that is set the initial dma_32bit_pfn value
>> of iovad to max32_alloc_size, so that the action of retry alloc iova
>> in __alloc_and_insert_iova_range can be executed.
>
> Have you observed this making any difference in practice?
> 
> Given that both free_cpu_cached_iovas() and free_global_cached_iovas() 
> call iova_magazine_free_pfns(), which calls remove_iova(), which calls 
> __cached_rbnode_delete_update(), I'm thinking no...
> 
> Robin.
>

Like Robin pointed out, if some cached iovas are freed by
free_global_cached_iovas()/free_cpu_cached_iovas(), 
the max32_alloc_size should be reset to iovad->dma_32bit_pfn.

If no cached iova is freed, resetting max32_alloc_size before
the retry allocation only give us a retry. Is it possible that
other users free their iovas during the additional retry?

alloc_iova_fast()
  retry:
    alloc_iova() // failed, iovad->max32_alloc_size = size
    free_cpu_cached_iovas()
      iova_magazine_free_pfns()
        remove_iova()
	  __cached_rbnode_delete_update()
	    iovad->max32_alloc_size = iovad->dma_32bit_pfn // reset
    free_global_cached_iovas()
      iova_magazine_free_pfns()
        remove_iova()
	  __cached_rbnode_delete_update()
	    iovad->max32_alloc_size = iovad->dma_32bit_pfn // reset
    goto retry;

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
