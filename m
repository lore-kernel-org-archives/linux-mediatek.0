Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DDDF8FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=; b=HtTeOp3KUNFvjnixNoIeNqgTFX
	Z3gOiLFNZsgTbD9bvr8AdCIs4TT6cpMhpL8uRYGFhk/s2cTbS+/duSzm2xvF4ZOHAEFuYVY/EYAK7
	o2QMbjiX5GBuSHqq2HQ73Xcr7coLU0go7nua7O5KNUCOSNt0R+sLDjhex1wT/RaENHl74Z4WR/FvO
	gaIY0oxkBWd+9U9ZAHjz0uLIicWB4MkdzbhP2LJdPkvONc1pogI+GrPrjcu6WG78+MCe/kPkJ6wUR
	dOsFRrAe2Jhc9UPB6JeAt1AwTPvVegCAuCJRTw/qwJdQ0g7IzDdkxHHy6hr2XmlqSxLT/Q/+Wa6MM
	IfjdbO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExj-00000008yO6-0dgn;
	Tue, 21 Apr 2026 17:32:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExg-00000008yNL-3yXR
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 17:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776792756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=;
	b=h0YUd/O8xPulR4Z9xjURbJbH4Y5TNfk0SJZMHApM2RlGN1brllARQH2oU0mWVC6tPE76Y4
	pftUU4QdqQ4BDj0+uJZ3703MK5VG56qHfdE3pCopACSfX3zLGC/9sVgEuOoFj409e24aiM
	PzUAR5Xp44Oj4DwiVnOsWgH0XoaA1t4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-H16n-7sOOUOelxuWz3otvg-1; Tue, 21 Apr 2026 13:32:34 -0400
X-MC-Unique: H16n-7sOOUOelxuWz3otvg-1
X-Mimecast-MFC-AGG-ID: H16n-7sOOUOelxuWz3otvg_1776792754
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso90105225ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 10:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792753; x=1777397553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=;
        b=o6sdK9JT7BipMHvnfdjpem0dCJ5ijAmYSSePDCh3uc8qBdpiuKwZZ33JC0BLeO4Jye
         BoMDjqIY7FrdItUJpWCJqfb+jDZwv5jG5BjwA5p+ps4718Vmf8mWqgfvT33xFoXQhvR6
         fo4q5LYUxnlgiGuSdJeCKC3pi2JptbOZIxnIBqWtAvCWVyOowyWlIUzntsTEQ5yBWpgb
         DLy92SIJ+OJXKn6zhkA6GixiWxmofkIFoOuxOvWqcd8UYnfP6R84FVoZH+3GE01TN+GB
         qGnADVbodRdHVMkTamL1vsJUM3JOH7kzVtPYI//he9w+sT24XSreRr/egXLmxOiEbiPe
         I5EA==
X-Forwarded-Encrypted: i=1; AFNElJ/VypN95yu1UPnFNMIohB86V3n/j+2X67l5nv+7eT7gyHOMRqtp9lDkQLUvlhghpzkdhQp0HBoals/o6BOboQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTtqoNaFBvKbiYWWz4DR7tsnKSULhJnsrwNss2sH/uGrdzGzF4
	q1MwHLsShs4Ubjqgu+ScHqQeyZTcJVMEZaETeFLsCeseXuZ4oNkNwSKEg50mNPTCz1vPZnOgIxA
	t+xec6FpRBeN1sqPFEBnzd6dQjw0/mf/pw2pJr5ohAT3yxGtYK6oPA80r5soZUzlmWnlJHpLubg
	==
X-Gm-Gg: AeBDieuPUI5KnnhyFb3zmiOH3tE7x6oEg/wuE89IEuOfzGa76AV5sCkzdTtTWJZv347
	uH+ItU/FSChMeIKjKpz1U4P42EYYuGm9wu/97Jo/XKvrUgw5bAGr6Oz+3t73Y1MFXViwBlZSnXK
	iXASd35i8DxFBnXfPn9Fx5TD6h+Jz8g7Er/aZeBf5prsSSBph7YFuIEPFX5fGMdaNp+ON8k1ECE
	qAmw1pSmCzIDdtaAnnOFxldr59IPYjD2DD6tTirtTjUQrI/MzNOIewR2zayBD/bfpSiBS7yDRKI
	aAUwgM6utXqs69nhxVGIW8DXEVw0lbq5KCCeRH18K75uNb+0im/R5nD2VajnATa69fSWR7wjiUE
	vLPApzDjuVzFDYxIfnx0iw4T7q5nRBRgT48jTP3rWqNVWLpglUICMn/WvB0YAOO5tXXc=
X-Received: by 2002:a17:903:b4f:b0:2b2:ae89:fd44 with SMTP id d9443c01a7336-2b5f9eaf3d6mr212359695ad.6.1776792753283;
        Tue, 21 Apr 2026 10:32:33 -0700 (PDT)
X-Received: by 2002:a17:903:b4f:b0:2b2:ae89:fd44 with SMTP id d9443c01a7336-2b5f9eaf3d6mr212359275ad.6.1776792752543;
        Tue, 21 Apr 2026 10:32:32 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm175412135ad.7.2026.04.21.10.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 10:32:31 -0700 (PDT)
Message-ID: <b9d1e3b6-ad3c-4bdc-98aa-2e00a2937585@redhat.com>
Date: Tue, 21 Apr 2026 19:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
 <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
 <aeewoVjN7EHLZTW_@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aeewoVjN7EHLZTW_@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 10aFOKG-4fZXMznJI5MK6NW3PPyuqIPzk_rIbV0eFrw_1776792754
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_103237_081702_D4886022 
X-CRM114-Status: GOOD (  19.46  )
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

On 4/21/26 7:15 PM, Lorenzo Bianconi wrote:
>> On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
>>> @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
>>>  		e->dma_addr = 0;
>>>  		e->skb = NULL;
>>>  		list_add_tail(&e->list, &q->tx_list);
>>> +
>>> +		/* Reset DMA descriptor */
>>> +		WRITE_ONCE(desc->ctrl, 0);
>>> +		WRITE_ONCE(desc->addr, 0);
>>> +		WRITE_ONCE(desc->data, 0);
>>> +		WRITE_ONCE(desc->msg0, 0);
>>> +		WRITE_ONCE(desc->msg1, 0);
>>> +		WRITE_ONCE(desc->msg2, 0);
>>
>> Sashiko has some complains on this patch that look legit to me.
>>
>> Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
>> IMHO almost ineffective, I think you should address them in the same series.
>>
>> Note that you should have commented on sashiko review on the ML, it
>> would have saved a significant amount of time on us.
> 
> Since this series is marked as 'Changes Requested', it is not clear to me what
> next steps are. I guess we have two possible approach here:
> 
> 1) - Post patch 1/2 ("net: airoha: Move ndesc initialization at
>      end of airoha_qdma_init_tx()") with the series available upstream
>      (not merged yet) in [0] where I am fixing similar issues for
>      airoha_qdma_init_rx_queue() and airoha_qdma_tx_irq_init().
>    - Post patch 2/2 ("net: airoha: Add missing bits in
>      airoha_qdma_cleanup_tx_queue()") with a fix for airoha_ndo_stop() waiting
>      for TX/RX DMA engine to complete before running
>      airoha_qdma_cleanup_tx_queue().
> 
> 2) - Since all the issues rised by Sashiko are not strictly related to this
>      series and they are already fixed in pending patches, just apply the fixes
>      separately without the needs to repost this series.

Given the current flood on the ML I think option 2 could be the better.
Note that the tree is currently in Jakub's hands and he can very legitly
disagree.

/P


