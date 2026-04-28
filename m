Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E1FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=; b=tGNdBrLFFw3szsIzfcsCKii7id
	RWu3plVGoDJ85mOnSfn+nICf8HNOUNRCCyBTASHBYWP6vOvvo56DSHVJ8KYs97WszHJLRa08x7o6+
	CnYMoAYCP/iobCgP25+oj3KlOyEbnBQEVfvhuASK2hAdsbO+yAhhpzi2lidL4uHu0l1lLKnQnoiwR
	f8g7aoqOoh4D19Uy8O1Zu56jy1KYJhYGyyO7kzOcftvXfJUxA3bUxCOfKD21LFzhSFObroTX3MxsW
	YCp4blPt9yp5QfUyUMUZFXwHgNmJ+N5Bjvtmz7K+RglMevE1LYe+SEXHLOge1hpirGuCZg6Z/ZXOp
	QnvwJb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiRH-00000001XHT-4417;
	Tue, 28 Apr 2026 13:25:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiRF-00000001XGq-2Ht3
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777382720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=;
	b=DQqL1ppBPXvGrj+eMtC+Xd1NZZdy+F10GIS3/ReRvO/FrqVpMPpBuYea+LJDh5Bjux/lkR
	wErJK9j7R/XKpiS9lJ2/5na6nmj227NJTtSn4um0c4LRdWSLFTgEhZLt5mkzTbAnXwUvfL
	il58aBcBwScxZ9yXbP9g2KZiP2vRShw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-p60w9_GiPpSVotePhC-iyA-1; Tue, 28 Apr 2026 09:25:19 -0400
X-MC-Unique: p60w9_GiPpSVotePhC-iyA-1
X-Mimecast-MFC-AGG-ID: p60w9_GiPpSVotePhC-iyA_1777382718
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488ba2f4094so73095765e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 06:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382718; x=1777987518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VoR+r0EdztbuqvfyfykBdYULmnz7rnigVpq7HE85tk=;
        b=YoG0M270SzmbexDSEsFDj+EfkTr0wFa3QdbpTluJjz4NcvP9eMufDpm1vKZ20n0hvD
         ym08lj6N1Miw+/JCNI8wWQQOrSgtDDNJ3SBn+brx5raUZ/shcbFmwhOtWGv6KtbT0xm1
         UHSFxotYfTPKUYQm4bftVqGZ6B7amG7aPCoyROnRTxyRb3YgxIppyFZLJSnyHKJRR/7A
         kxhsyJqQCLdAFWxNwNKOL+YnEL3nMT6JtJMIGKMWhQhVFzgo3Xb1XWY/P7tBiZTF/T3+
         IuK2lhwrN3QdYNr2dvWGLi/KT/BZYTt7LKAU+bkFs0atc7uyw0ZGT2XOpjjkp3pMIeu4
         AjWw==
X-Forwarded-Encrypted: i=1; AFNElJ+L65BAuzGFriEKMZbPhFq5Z73w7S4AZxLQNk2jfcrL6HGyycWgmFgkvwRBnmPGcAPSwlngFFnQ73BZnlSPhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys0QyZimqHa/4Xh4zqbDtdsg2xPAuTbdp+vsN/oNBMAPy4tdWD
	ZjCF+IYZBjaLDPZPyniIx9g9Bvl5uIOwAN/FZN43cMoCF/VQ6Su5Wdi7n5f3h1xlqjShB4ZSeQa
	tD6EI1Sqas5w8E65YekyeJSGpYDHd/d/4zf7mOxm43Enx8rNQXHc70qMxaoZNVXHbpvW2rtO9dw
	==
X-Gm-Gg: AeBDietgjnmg8qtbvWOuKoCjN6o84CT6kiv+IBIHvunpqTXG4uPT3lQ9O74EAH8eo0U
	2MkwMj8FnNyUT+/o4xGQA1tcz/NdfXQyc6WMyu2kuo/lW01ZiN3qsAc0N74ao6B3bNBIPjWXTLa
	9mSY1ckZFGoc5X7IbiV/nxS1BNqiYoEpnLSbkNOuCvmyv77IH5uZI15p5ekPPLe5+kKs+zkeBg7
	r9mAymF/m8jQTmEkU7gIbJd2p4GbxRbiBvWxu96puF0Ne+luaftMF0RPdI18QbVjLEcbB7i1+D5
	REs/GAWbEuXHXcVxaJ4tpFRBkCpmz58DsipnXesRGEkoqbEdFfHzocfl1jYB6WoENurFGhKSwky
	zHsYjn9/xalOWBwzFI1Th0T3E9hSGq98gcGWJgNOHxaxCvg5/uL4ceARL2ZahI6d0hw==
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48a77b1da5emr55604805e9.14.1777382717849;
        Tue, 28 Apr 2026 06:25:17 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48a77b1da5emr55604145e9.14.1777382717385;
        Tue, 28 Apr 2026 06:25:17 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773a874asm72235935e9.3.2026.04.28.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:25:16 -0700 (PDT)
Message-ID: <679ebe0a-5889-4a84-afd6-3da50a07bced@redhat.com>
Date: Tue, 28 Apr 2026 15:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Move entries to queue head in case of
 DMA mapping failure in airoha_dev_xmit()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cb660y8spFL2BmjOhbwTpgjRHvWRdtdDm-thvX0Qy2g_1777382718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_062521_658520_7690730C 
X-CRM114-Status: GOOD (  14.07  )
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

On 4/28/26 10:44 AM, Lorenzo Bianconi wrote:
> In order to respect the original descriptor order and avoid any
> potential IOMMU fault or memory corruption, move pending queue entries
> to the head of hw queue tx_list if the DMA mapping of current inflight
> packet fails in airoha_dev_xmit routine.
> 
> Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 5effb4a4ae84..82018a085e46 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2123,14 +2123,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
>  	return NETDEV_TX_OK;
>  
>  error_unmap:
> -	while (!list_empty(&tx_list)) {
> +	list_for_each_entry(e, &tx_list, list) {
>  		e = list_first_entry(&tx_list, struct airoha_queue_entry,
>  				     list);

Coccinelle says:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/airoha/airoha_eth.c:2123:1-20:
iterator with update on line 2124

I guess you should additionally drop the statement above.

/P


