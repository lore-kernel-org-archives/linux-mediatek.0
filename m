Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AD9C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=; b=Bva5WMTQhfdzUjvs/CbKtCLPg+
	PINhF35STD/OxfHVIZ7cYLpuB5CfIdryy8DQC5QJ9EMaTCzfOtJ2xAGw43ndNmvepCvwpyRpPrSqd
	CmOeV+Mz+ZIVFUn+PJEl5sVAtfbso/LrVd4dC+eZVDagSH70/PftGtO8F1rORnadG8N0Krh7RAMJa
	wJi6EL3XCu7b0RNsgWqr9h61OM5lU9UIDkM7uz5h5MnI3mt92zhNUXZzGxgSojxCY8xrKrYcKqj0D
	YCGpsnyNchy5OUaMb5b19v+1YgPkld5a/lGqJbHnqNyDSeYNwfKGn7Jj+JqUVqMhRMedkNwUtxQtx
	Uc+uWBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weadF-0000000HP2t-0yoI;
	Tue, 30 Jun 2026 15:44:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weadC-0000000HP1Y-0P5r
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 15:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782834252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=;
	b=bBwUtpYbVRnGjCklhcCKGhjnlhUY4/zvp9iGnVegH9ipwen5rIeq19y1vvK9Hv92z+cecP
	blYK5Ph5AiNSA5rmoel5kDJwbQeeuf5CXRk5HxPF/9NdFEt+ZjRAqirsvM5dWlTEumE4lp
	+5oVz+meejkoKsYgajQRZK93JTOGoqM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-rVOivuZvP3Gjh-P_jGELdw-1; Tue, 30 Jun 2026 11:44:11 -0400
X-MC-Unique: rVOivuZvP3Gjh-P_jGELdw-1
X-Mimecast-MFC-AGG-ID: rVOivuZvP3Gjh-P_jGELdw_1782834250
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ff58c89959so99417177b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834250; x=1783439050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=;
        b=LmuzArLajUy1/jdJ0oHSAZ93tQMoPHI9SfQz5pdjcr5V0AzyzaJRpWxth5B+g3//S0
         BNExPFDtW/18Uy0yZsFGJhgSBDQbgWmO1xWRtH91Oupwn2qmKtKCUEWfWmhZFav57Iae
         rGvLym+vbj8BgUZ8jEUQgr+FMiDAo/CfxRZ3QcDHLwYSXosdGSHiz4rzvuC5J/DZC6TV
         rXdlRw7MFzVRC7lplqTwQ8cwBjI8gX2p527Iw7ERx3oE4DmFQl1Oh9N+HCzHARZQ48bn
         be2kehcuBVnvxSoVr0U+vFCNiqFRz5Lc6/7eN0TXUD6osSlVsHomhUKT99gFfhA6mMWZ
         +AOg==
X-Forwarded-Encrypted: i=1; AHgh+RpWHAE8gu+xuGoqdds8f6M/AYAVY+Z0FGnMcQ4xiBxfa7srn0vMI/yOCHIzS+i0oH/wD482i6dL8Hv/YVZ9nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YztlkHSaIs48WqQqVtqM72/ISrURK0puiplZZXYO4Z3iq79aZ1z
	86Njk/r726jZkT9My7t9FmsBAGmx2A2xQ4yNM5a7QAmQgLOc9TREowGzut/URUfBjUU3bYurv+w
	1A3I1yBHIJBKeIdqdvelPCowfrlOMa9iIefpv/9ZTqu6IH/UAB0aT35ZIE79PmPFJ60E39dzEIA
	==
X-Gm-Gg: AfdE7clzX2FxDQbk6g1YA41M8WvLaQOAmAafmMI2HQvcQRgunCcBUP0x/0F/bwqJfZP
	NO6+gQezUTVbBnbYc3TDhcdHvlNuEv58gSnB5i/kqCvNUaGPpiJLRD9BQqOkMVYUy73YGdyKdDf
	V6GAVkOCdaqyZyVurX4StvmeoGdqOmI0YtA59JaPRxLTVuWPzQ5KpgbseuNHJVbhqtvgF/lpdz6
	2FFhcVLgSVVG1ZiRkgSHJ7VkUfy1vBiTW0Pn0I3kybcqqy38CTgSSiIn1PevrZJ3BXDn8UM1Ppg
	f0OVxKHilNhB+F31zxgSRp4DZUSeCNFYZwMsJtP50iJMrbgd/14haiEuefwisOd6YeJRcNjLC+X
	bAmxRWvLOqa/M1XnhkuKNNagOP3JR0f+gh9MsBb1l/IA3KdUvCGXuaaIiy8+GxOHZkZKTanLUj8
	0a/1fOgcwSkA==
X-Received: by 2002:a05:690c:34ca:b0:7fd:9dbe:4d87 with SMTP id 00721157ae682-810da312e4bmr47934777b3.52.1782834250414;
        Tue, 30 Jun 2026 08:44:10 -0700 (PDT)
X-Received: by 2002:a05:690c:34ca:b0:7fd:9dbe:4d87 with SMTP id 00721157ae682-810da312e4bmr47934137b3.52.1782834249734;
        Tue, 30 Jun 2026 08:44:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7288a7csm12312487b3.2.2026.06.30.08.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:44:09 -0700 (PDT)
Message-ID: <94901706-e7f3-4ff7-9b19-9965f593e228@redhat.com>
Date: Tue, 30 Jun 2026 17:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: fix max receive size configuration
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260625-airoha-fix-rx-max-len-v1-1-45b9b827358d@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260625-airoha-fix-rx-max-len-v1-1-45b9b827358d@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BAizTkZEIrK2jPzOS97W3wjD2bBfAMwJ41wETs8h8Xw_1782834250
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084414_216389_680DE0C7 
X-CRM114-Status: GOOD (  10.41  )
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

On 6/25/26 8:49 AM, Lorenzo Bianconi wrote:
> Set the GDM maximum receive size to AIROHA_MAX_RX_SIZE unconditionally
> during hardware initialization instead of updating it according to the
> configured MTU. This avoids dropping incoming frames that exceed the
> current MTU but could still be processed by the networking stack, which
> is able to fragment the reply on the TX side (e.g. ICMP echo requests).
> Move the per-port MTU configuration to the PPE egress path where it
> belongs, and set the tx frame size running airoha_ppe_set_xmit_frame_size()
> to dynamically track the maximum MTU across running interfaces sharing
> the same PPE instance.
> Fix the PPE MTU register addressing to pack two port entries per
> register word and add WAN_MTU0 configuration for non-LAN GDM devices.
> 
> Fixes: 54d989d58d2a ("net: airoha: Move min/max packet len configuration in airoha_dev_open()")
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

PW bot is on holiday, no automated notifications for a while.

Applied, thanks!

/P


