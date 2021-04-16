Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A70C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 13:47:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCBA611ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 13:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCBA611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qdgen4T8DoKNDMTL0i4OCrQemrQ3x0hDsH5+4cFIogo=; b=ZDEh5yWfDhUzgAPV94Mf1bi3J
	Q7hSFKIOkq8oUgvvHN30A2QEsv16tKFqiWu31uF6H2UvciKdFYTeWPsaG8xqtroPLmYBqGtsDaL17
	puZN8S7s7jzXS2DhRqR7X/KV5ErdYOsJXdLdF/b/dC8Kdu0Y66g91m6+Z8ma+m9G8Hq+zVdFkybB2
	RpjAlkJgM+eAoqVDzgVhc5ZaJAuC5DVEPEENYeS7BuoNfFAujMr1hTgxaMgwIIQigAeMkIkScSCzU
	ZGb/jkGDwomDFy3uFvu4Cj89IQJVDAJdCnvl7YDwFkkb+n8j/TsNDwwMd7MJV8wfrtvTgTOP7HdTr
	4D3RCJ+RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXOog-002Ik8-6A; Fri, 16 Apr 2021 13:47:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOoS-002Ihn-Qa; Fri, 16 Apr 2021 13:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=oaTfMkYPsBCDtAthG0CJu16m2/k8gE4SEf0KTzjciKg=; b=Fr1Ypp7PjjZ3dJttA9o+clSnxx
 CPv+0GRmwOGVWU3jL6jZLmy+lT3IdO1KES8HR53OW+Fcs4ycry2gWYfH/YQOTDj/GjSJajmBZRWbR
 MfV1oNFQa0vHkXgYKrGaZoF3VRED7Ov0gPRjzk5c6FiY+w8exVY+WIEgwLzWGW8Rlq82FEo7v3m2i
 GINqpOXjxO+vgSiEG8KsXGXLmRZNhRw+ybZHtoWFokG7al9yQ06ZXoIJau7d+bRaoQAd3ONnixmOd
 RQxoWRrjzQBBvuoEqNg18IO6+vtM3UzXWt3hVrjxUSTOXkZZ/pVjh6SJ699iSMesyGVPIqN/AjrwN
 FExLFgfA==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOoN-009Pey-4a; Fri, 16 Apr 2021 13:47:11 +0000
Received: from [IPv6:2a02:810a:880:f54:c1fa:1310:49b:e88e] (unknown
 [IPv6:2a02:810a:880:f54:c1fa:1310:49b:e88e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AFF61F41957;
 Fri, 16 Apr 2021 14:47:04 +0100 (BST)
Subject: Re: [PATCH] iommu/mediatek: always enable the clk on resume
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, will@kernel.org,
 yong.wu@mediatek.com, kernel@collabora.com, dafna3@gmail.com,
 enric.balletbo@collabora.com
References: <20210408122842.29009-1-dafna.hirschfeld@collabora.com>
 <YHhA4u7zat3vtJfD@8bytes.org>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <3c1f184f-e666-5198-e89e-c3774917c6d4@collabora.com>
Date: Fri, 16 Apr 2021 15:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YHhA4u7zat3vtJfD@8bytes.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_064707_340957_EE428199 
X-CRM114-Status: GOOD (  13.25  )
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

Hi,
I sent v2, removing the word 'comment' from the 'Fixes' tag
after a problem report from Stephen Rothwell,
could you replace v1 with v2?

Thanks,
Dafna

On 15.04.21 15:34, Joerg Roedel wrote:
> On Thu, Apr 08, 2021 at 02:28:42PM +0200, Dafna Hirschfeld wrote:
>>   drivers/iommu/mtk_iommu.c | 19 ++++++++-----------
>>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> Applied, thanks.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
