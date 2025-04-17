Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3763C369B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=; b=XV6sdUx/tWx8m606SnLNb0zwio
	JYMKZp4vro9HgYZBCHqiB2ZyMWuW9jjaoIT57eSBEuCP2g0o0lJWqhYO0ikIW6UbpzssfS+0Ycllf
	m3Jas5d5OHlY58QcH+s2hgCB5cOAl1IZhNP2IvNDzVXmXSYd0SuggQKZ7CuATh7P6QPCKSOPBw+Jo
	i9TQldPuSYJ8jdq2BmwAPcqfS05njXOur+ikig0BZ0FOP9mTr9QgnffmUSvoanqE6CD0LEQAEZbfr
	iDcXNvdmqRkfCh3sloriVVyBE1ytXfLSQrUSh0PI7Zfvu/zHfQxWXs6oBUGbiUai01Xz8vD5X1HZY
	qC0UW+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LJo-0000000CP5K-2tEE;
	Thu, 17 Apr 2025 09:14:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L60-0000000CMTw-0rWS
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Apr 2025 08:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744880382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=;
	b=GdlwYOr8wflWSbycV4CnbwvaUgO7rkIB58TN6qhrBAG5GhYsT/jcUGimvaNlNUiWID+SKY
	Hpq2nhYqsC2kxOLCJObtUWziLuBwgB7zHP5bA37EiLuEFepw4Bo7+ZFpmk3ZtNujqzkto8
	SQdJoZXD6qj/Nktf4scw3m0FHuljrvY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-GRfru2ibMWmfajwhNEYxVQ-1; Thu, 17 Apr 2025 04:59:40 -0400
X-MC-Unique: GRfru2ibMWmfajwhNEYxVQ-1
X-Mimecast-MFC-AGG-ID: GRfru2ibMWmfajwhNEYxVQ_1744880380
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so2579285e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Apr 2025 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880379; x=1745485179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=;
        b=uXBsw7JNGCmfVTBGb93U3GR+2nAbUBIjZ9Om+l6XBy0Tscczc4KoHgyjUrixrPMAfs
         bvHKRtS0u9nEW/olEtckHy7OvE3nGejVf2W+6nqdlguIAj8D3+Jy9BAU2zmOYDaCHiEa
         11wFAA75fMZBoSiXJwdgeBELrN+rJibhXVn+tmYk/b1yQlel+r/llQs8JTR6N0jcP5ek
         vMtdtHUO0fdPZoNmdzNjwdPJhmspj2GTIrCtfWSPxERIMd+BK6/mH1FfD6QgnkeIi8eQ
         j3CkK8LnhLnw2pne4/9aJSyuDuS8Y1tQoLk+eROhI4V9i7WO92xRzF6goT9a7helZ9W5
         Zaew==
X-Forwarded-Encrypted: i=1; AJvYcCWunvuELoXATjot7VplvfWr1Ar4nuiCsjBO+OVbztMb8FizPZET9V+FPx79nvvUvRYl7c8oQ011g62tAvAvFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlysIovcAJ4QBa3H/hWZ1CqDQ6OGSoh1sKuobEC4SKry52PqCN
	3PkLQjIAlpIbfZtSWLPgEz3SFjSy3Do7dA0sglYly0hHG343NIYeLSTsydX6uUm4eZnVRHXdDZR
	klgvBUWzIaxGQoeNIH8GdJKe58AvbE7CQfVqAfxZHqa/ZXj5KwkJgzfVryDXvDlSifQET8w==
X-Gm-Gg: ASbGnctKCmz0KQUTo+DFQUAbX5BVaZBNbUYNALrvAXka46hppanDdVPbu2p+0zi1Oa6
	QzrmRxiraSLf+geWuqvBWNWMbcPEmI+le+cWXv89zGVNGdTsFcn8TeH5b1WQPacI18k94CMCxH0
	qQ6ybc4xGIljAPt4n4+lewLr+rc88QD+a+WgmjDbfn7orQUfTpk7YOAKzP3lBNrMChR+2Fo/VX6
	UCXjKR6n/JNw2nJT/fZ0LnRJuY72c28aLt4HGmPYKeGshX1ve+XN0lQBWeYYw+01K5ydWCIm7Wm
	cs5yqyzq7yhynrtdytFXBxoeA4K/l/Exk9lu4KYPqA==
X-Received: by 2002:a05:600c:c89:b0:440:5997:681c with SMTP id 5b1f17b1804b1-4405d5fd8fcmr57027545e9.3.1744880379535;
        Thu, 17 Apr 2025 01:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6wnoEhMMEIcc2dVSD2Mi0/kYEuwxhffSm8Wyq9VeUY0iDYrT0ML62tAYo917pqBiSRXl7IA==
X-Received: by 2002:a05:600c:c89:b0:440:5997:681c with SMTP id 5b1f17b1804b1-4405d5fd8fcmr57027275e9.3.1744880379179;
        Thu, 17 Apr 2025 01:59:39 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c817dsm45422165e9.4.2025.04.17.01.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:59:38 -0700 (PDT)
Message-ID: <ba5b4313-6e42-4340-8301-239dac046424@redhat.com>
Date: Thu, 17 Apr 2025 10:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
To: Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
 <20250416154144.GT395307@horms.kernel.org> <Z__S_m9fBEKmoos1@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z__S_m9fBEKmoos1@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: urE__sCkD3xL-XVF9nZZDgy8AI_UdEVEk48sN-0eky0_1744880380
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_015944_306712_32B5D678 
X-CRM114-Status: GOOD (  21.07  )
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

On 4/16/25 5:55 PM, Lorenzo Bianconi wrote:
>> On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
>>> The official Airoha EN7581 firmware requires adding max_packet filed in
>>> ppe_mbox_data struct while the unofficial one used to develop the Airoha
>>> EN7581 flowtable offload does not require this field. This patch fixes
>>> just a theoretical bug since the Airoha EN7581 firmware is not posted to
>>> linux-firware or other repositories (e.g. OpenWrt) yet.
>>>
>>> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
>>> index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
>>> --- a/drivers/net/ethernet/airoha/airoha_npu.c
>>> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
>>> @@ -104,6 +104,7 @@ struct ppe_mbox_data {
>>>  			u8 xpon_hal_api;
>>>  			u8 wan_xsi;
>>>  			u8 ct_joyme4;
>>> +			u8 max_packet;
>>>  			int ppe_type;
>>>  			int wan_mode;
>>>  			int wan_sel;
>>
>> Hi Lorenzo,
>>
>> I'm a little confused by this.
>>
>> As I understand it ppe_mbox_data is sent as the data of a mailbox message
>> send to the device.  But by adding the max_packet field the layout is
>> changed. The size of the structure changes. And perhaps more importantly
>> the offset of fields after max_packet, e.g.  wan_mode, change.
>>
>> Looking at how this is used, f.e. in the following code, I'm unclear on
>> how this change is backwards compatible.
> 
> you are right Simon, this change is not backwards compatible but the fw is
> not publicly available yet and the official fw version will use this new layout
> (the previous one was just a private version I used to develop the driver).
> Can we use this simple approach or do you think we should differentiate the two
> firmware version in some way? (even if the previous one will never be used).

I think it's better if you clarify the commit message. I read the above
as the current (unpatched) code will not work with the official
firmware, so bug addressed here does not look theoretical.

Thanks,

Paolo


