Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4V8DWeTKF5kXQRFO7QM87vkmXZmCnTegmnj5h2H1fO0=; b=DUSmJlX7IVtrQ2
	RKYLgXWPO/HmMBFDJJzAv1Pr/HZBPauRVQQxH9CTTWmwai5P4pLpEK99+XzOEafnRQ5pvr/Mta2x0
	+4yfe989NdaCR9TNyvuCRweZ6nBvHPua8jjrBJtE+yi3YhPjdd0k+2GY0SRkJnreQtlEDUIwzldP0
	pWYttEkPpct4dUDuSjRBYNHB7rc3d9rukkf124lqbf3GEFZMjxHd8EfJNlBXHIpJESq7XO4nHu8dM
	1RRIhjwo1XA4umKdufvfLGrUI8xoRQyYRgxZIEWRFBb5Kq/u+ZfJ8k8UzJqyxDYFSc29zcx38tPPk
	/EuSTIOzQu1jynhwdm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfRG-005Tni-6U; Thu, 03 Mar 2022 06:59:50 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfQf-005TOD-1W; Thu, 03 Mar 2022 06:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2m4RpdrvDWJ2Lbwggqe1wkzLSnbf7tDq1lOz4LACayk=; b=GclwX64l6V5f8kehmfrWiI/+J4
 8RzkcfMFFgiuiQCodv/2gnIC3ikLB3SpzKZ+MKquDyTvf/2qcEKEzwnC6vkUyw5AA6m8mjD6nBBat
 vT32LnKyaFoveOXK23R0XVuJkpl2HRzOcOM8BKTQACcHejpQBocleespRVWlGy48Yi+s=;
Received: from p200300daa7204f000c852a81b34becd9.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:c85:2a81:b34b:ecd9] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nPfQN-000124-AR; Thu, 03 Mar 2022 07:58:55 +0100
Message-ID: <2bd80da6-944c-4c9d-febf-f83b4302492a@nbd.name>
Date: Thu, 3 Mar 2022 07:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 03/11] net: ethernet: mtk_eth_soc: add support for
 Wireless Ethernet Dispatch (WED)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220225101811.72103-1-nbd@nbd.name>
 <20220225101811.72103-4-nbd@nbd.name>
 <20220225221848.7c7be7f6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220225221848.7c7be7f6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_225913_300356_81C47E41 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 26.02.22 07:18, Jakub Kicinski wrote:
> On Fri, 25 Feb 2022 11:18:02 +0100 Felix Fietkau wrote:
>> +	page_list = kcalloc(n_pages, sizeof(*page_list), GFP_KERNEL);
>> +	if (!page_list)
>> +		return -ENOMEM;
>> +
>> +	dev->buf_ring.size = ring_size;
>> +	dev->buf_ring.pages = page_list;
>> +
>> +	desc = dma_alloc_coherent(dev->hw->dev, ring_size * sizeof(*desc),
>> +				  &desc_phys, GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	dev->buf_ring.desc = desc;
>> +	dev->buf_ring.desc_phys = desc_phys;
>> +
>> +	for (i = 0, page_idx = 0; i < ring_size; i += MTK_WED_BUF_PER_PAGE) {
>> +		dma_addr_t page_phys, buf_phys;
>> +		struct page *page;
>> +		void *buf;
>> +		int s;
>> +
>> +		page = __dev_alloc_pages(GFP_KERNEL, 0);
>> +		if (!page)
>> +			return -ENOMEM;
> 
> I haven't looked at the code, yet, but this sure looks leaky.
It's not leaky. If the alloc fails, mtk_wed_detach is still called, 
which cleans up even incomplete ring allocations.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
