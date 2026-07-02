Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77CEC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=; b=jsG5OVaHyowJZ0jqFfzRW0dgH0
	cvyLwtv9kZhFfWDPQ3qWXp/UhCdSOf4XGj2YtsT7J5CkSjAt6gu5i8VhB7vJbU+HVXQp1dj6gE/XS
	uT29flMFd+1stehA90RAAXW8135HdrUahrs+uQdjDEevYqqenOA4C7HFKd+FU3nSXYm07W2t7Bgis
	ME1yqf4zuArCVVH7jDWKSiiMmPUO8q0MpofPhLoGRpZIVfEsboT2/RolrZs9n3gMYSXSO+CM/tqcQ
	CSeYfeHJWC5uMOr7n3A4kd+zTsrReJ1F8Y5B9+MNscgxCb4WAJbxY6eN8VfjvljgrrJwv1CgiN0L3
	4IysXfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEFR-000000047jg-1HED;
	Thu, 02 Jul 2026 10:02:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEFO-000000047iZ-3yJM
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 10:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782986538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=;
	b=P5ms3SYDYuxgXZ5OShfS9Iehx4CCpELFuI/MNI2jdAPWDWuSOmcH/VtTl2Khni/rCAhIBU
	iymC6c0tpC8Wj64FkLNvm5d8qO/AA/05+5NsA7OxQA9kHVB+VRJjyah/0RHLLUEQlKEFMj
	rbxByKwF5AHCzXobguEj9j+a7V5QKp4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-m8da4SzsOzKT6BnSNFqgvA-1; Thu, 02 Jul 2026 06:02:15 -0400
X-MC-Unique: m8da4SzsOzKT6BnSNFqgvA-1
X-Mimecast-MFC-AGG-ID: m8da4SzsOzKT6BnSNFqgvA_1782986534
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-492714d002cso11747915e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2026 03:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986534; x=1783591334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=;
        b=IBRBHn09cPJ2m3ufZv1HdwkdrLzPxpmLPfeLf/2Uo+ND9kjfbZyeXy1ChwoSfk/lUB
         Q0UH4JddS1VtPKFXBCmsQxyTZ25PaBBdWR+ngMOtpLddYn7dTprKbu4SxKM4nZ63k2/3
         2HY9EUtAqLbpqmtMhBvpVkMgdxDpJeJEJ5/D/e2VysiPulGP3ymZnYjdTFLSHenbzKok
         tPGxx9RGQLDmZ54ViSjBXGuGvoHpfj/4hCa4aMks4CNUD8ZjYqoowFJdt0GUQYxNZ5cJ
         EZ7DvNSfWHksJ+GNsBTKBsU1ERncv/nXwmDEsk1j6d4MDzS17sU82xZaXa/dyjVQ92Ny
         NMfA==
X-Forwarded-Encrypted: i=1; AFNElJ/NM6kOPNP/g/EkYftzDmrsrwcOnSMam2Z+/X8f4cYQ2CFbgA/oaSoZl5ZZ0wSiUMer1fv/Vcjt5AW4ycDYVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9G6HnljMOEVFzHgiJ94FtgAtqLcdYlznJy2CitEtQ8XEwgNvL
	gMllpeDR8OhCHky6pMvRJli/1xruLOtJMG2IP6MxNy9DmcmWQwgietius8VOMgD1OmrXPH/VfIg
	QXZqojduMQe+NaHkJkdAHlLEF2A575gEOUehIcsOUgLhf7fbzDHGl6PgbMRi5KV3vnhKpfPVMBw
	==
X-Gm-Gg: AfdE7cnHdSZXYCnQxWnknhNgT/1EvgjcoH/QJAWb0UAEYcO1mfsuGud7tIgmyXDf8oV
	STQXwWBa8PuHw9XaMM5/ovtAjdPHHXSvDnO3lvZxceXkHZLm6jAFySCo1uvpgwLIzP4PWyaxICL
	mnNO1cFEpzBCCWFTcKyFs8N6eePABhFki2My5ZbZxBBBiRS3/irTmtuvWXsUKgqO9MPaowXxMGM
	IDtn6xNI7Vc4jusl7t9q3B0b569I3JFO5vycyYjGAyxtesqrhbmeL7W1BlfEA3ec5BBipyPHsCB
	lCgkuMAK12u5Pb6phyJ40pr4zIH4SEYNzaZ2fC5W4wjchl0rmR6lQny6AMh05hW1+TSkLTjaCE0
	UDx2OITuLeWZA5QNTIOq2P8uwk9JSId+ZVLFwWWO9YvkkFnnB2v5KwU7QWPlMfIqitBsmeCfxVY
	UAOl3V1/ig2g==
X-Received: by 2002:a05:600c:1547:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493c3cfb04fmr58962425e9.27.1782986533625;
        Thu, 02 Jul 2026 03:02:13 -0700 (PDT)
X-Received: by 2002:a05:600c:1547:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493c3cfb04fmr58961865e9.27.1782986533117;
        Thu, 02 Jul 2026 03:02:13 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm80193455e9.1.2026.07.02.03.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:02:11 -0700 (PDT)
Message-ID: <3f540a8a-4167-4727-9516-6fb91335333f@redhat.com>
Date: Thu, 2 Jul 2026 12:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Subject: [PATCH] net: gro: fix double aggregation of
 flush-marked skbs
To: Shiming Cheng <shiming.cheng@mediatek.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 willemb@google.com, daniel.zahka@gmail.com, alice@isovalent.com,
 sd@queasysnail.net, eilaimemedsnaimel@gmail.com, imv4bel@gmail.com,
 nbd@nbd.name, dsahern@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, lena.wang@mediatek.com
References: <20260630023512.26927-1-shiming.cheng@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260630023512.26927-1-shiming.cheng@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2ATcRbujsVlSu28vZbgy4CvTt8BWtth5UG0QysYwx7c_1782986534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_030219_053122_FF04CD1F 
X-CRM114-Status: GOOD (  12.63  )
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

Note: the patch subject is quite uncorrected

On 6/30/26 4:35 AM, Shiming Cheng wrote:
> The new skb_gro_receive_list() function is missing a critical safety check
> present in the legacy skb_gro_receive() path. Specifically, it does not
> validate NAPI_GRO_CB(skb)->flush before allowing packet aggregation.

skb_gro_receive_list() is not very "new" and definitely
skb_gro_receive() is not legacy.

> This allows already-GRO'd packets with existing frag_list to be
> re-aggregated into a new GRO session, corrupting the frag_list chain
> structure. When skb_segment() attempts to unpack these malformed packets,
> it encounters invalid state and triggers a kernel panic.
> 
> Scenario (Tethering/Device forwarding):
>   1. Driver: Generated aggregated packet P1 via LRO with frag_list
>   2. Dev A: Receives aggregated fraglist packet and flush flag set
>   3. Dev A: Re-enters GRO, skb_gro_receive_list() is called
>   4. Missing flush check allows re-aggregation despite flush flag
>   5. Frag_list chain becomes corrupted (loops or dangling refs)
>   6. Dev B: TX path calls skb_segment(), crashes on corrupted frag_list

I can't parse the above. Is this something that can happen with in-tree
drivers or do you need OoT module to trigger it? In any case please
clarify the actual order and the involved driver. Possibly a stack
strace leading to the critical aggregation could help.

> Fix: Add NAPI_GRO_CB(skb)->flush validation to the early-return check in
> skb_gro_receive_list(), matching the defensive programming pattern of
> skb_gro_receive().
> 
> Fixes: 8928756d53d5 ("net: add fraglist GRO/GSO support")

The fix tag is wrong, should be:

Fixes: 3a1296a38d0c ('net: Support GRO/GSO fraglist chaining.')

/P


