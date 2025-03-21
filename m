Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15409C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 18:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=; b=EatgUi6ZfyHzMuDt4eJFBkQYUh
	IW+f1BtUI4pkIh6cQUtvcp4ntZfymgvgp5/oySg0zqOqPKzg9r/3Rv3pMyMhlZxS1YZAlJqhbZq3L
	Tz20E25sBWqHaWMG71UqzVHzik6b+mvrf42g6c5ZVopcS82cWFmfaPoRvCeHkokuTDPk/MA+Ca54B
	wz3XfO7XK8dJ6VuOTyGapBefCYYUs3oAiUuAbz4DCpaipfghX/3wWoHcXklmscSr927vIyvgvzIrD
	F8TYh9jYrnllp1eDPuN6+G8RgjfBC/M3r0QT5PV4BGTLWFnszldeIqZjn34UZ1ydnhfkUnTwaaxTi
	orEZ8dCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgwp-0000000Fp6O-3nLZ;
	Fri, 21 Mar 2025 18:18:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgwn-0000000Fp58-0eOi
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 18:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=;
	b=MwDjxEiWgSNCqW7Ka+LWh3iVQrcNjYxlz3zROsyv6YAJKFX/0L53Zk1Nv6obO61cZ7czXo
	UK/aJ7TBfm/mD9QFiq0k40+n/uQcAujYj8105FQ/R/VAcVavFPtq86cWsGn/64NbI1pKk9
	7AqdHvxsNT0Opldt2S/8cullj6qvf+U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-xg1BLRCxOnCKH8Gxdk6D_Q-1; Fri, 21 Mar 2025 14:18:18 -0400
X-MC-Unique: xg1BLRCxOnCKH8Gxdk6D_Q-1
X-Mimecast-MFC-AGG-ID: xg1BLRCxOnCKH8Gxdk6D_Q_1742581097
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so12890775e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 11:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581097; x=1743185897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=;
        b=NNOKiRjXq19tjUmp57xmNUKxV+g7QWzqQprJwZEa/B0sJnKAjEeouyvoSvSADFiHnj
         F6r062h8WpDRY1gtfuVdPDT/xkn1azPzFVQvl0054HCM/OUjpc8PCBvhHh7+SJNvYKHu
         XP2QHx7TfItyVuN/rq7EHTpdRXhf8lrB5ds3KNbz4Fb9QBeRanVfG3xNxSICxWgqKhcT
         AYDkiGl81KKsQABlz7yVoXaO6Ix7WWb/vkqPOV5iirjFoUK61LlVdBh15qZWA4OsB2sY
         e9R9OtqP0c6QX8iCJUTLQvOk+IyqMqzEdO6roW1yDeLA2NeqQPLK8FAkm16l87sPPzJB
         fqzg==
X-Forwarded-Encrypted: i=1; AJvYcCUtPA21NXl5mDe7Rok0t6jFw+NJvCyMF7z1YBzTGmlZ0tgY0S/iOKu/lF/dqYefF7N/qU+hx6mtPcOHIghjvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1HmwnjDxtNbcY40nyTO7WCzRRaMQqNnET01Il4MUVFpSMl1i1
	AHG48oQPpJJaKmv63JFMSaBf+/P3nWcYuVjPkDhn7qcqO3h2XTWCyyvb//9XqS+0QD4j7NJxCpD
	o3+KrF5hSEzPRwdVuO5N7xip1V9NgBPtp40HEtraDtx4Sc/A1janaT7y5Nn5a3Fsi4KiTBg==
X-Gm-Gg: ASbGncuL29yXxTBhJV0HzTWLX7NUhNJ7Q2qhv/wjBrRkSwiDXCWOEy1zVhl2TUlwucB
	fx5Cqz4xChy+ZLTZdvMDQ4yDUTWquwFK3k1MPIlrIlSKQp1S1Nyb4n8XrQ5YOgKRfMNPOmfmXVT
	Db4c5xMFHkcUMvB73gA9MDbpBSulbHww2mDPJTsF65FxyJFdWCVAScgrtbqNsbR80EB5X62sVCR
	+ZPzmUsBfgmQLdxzlXm8Zpj5XGElhPwjh7PF7mnJU8w+RuVfiBpp7VEHjfFVmUIc7zfXx+wufef
	HMxLpxaLTxXHt5WdR/UXMYGHqGq9LwIsn7YrC/Htm1/pxQ==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr32999225e9.21.1742581096865;
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4hjspn7nFbirV1vOF+PWolmKka8uULS32ZeHXEmfN9pXrlTOZAy5VVuhKwl33XEm7itFSrQ==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr32999005e9.21.1742581096493;
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
Received: from [192.168.88.253] (146-241-77-210.dyn.eolo.it. [146.241.77.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm84371215e9.1.2025.03.21.11.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
Message-ID: <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
Date: Fri, 21 Mar 2025 19:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
 <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch> <Z9WV4mNwG04JRbZg@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z9WV4mNwG04JRbZg@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -QPgDy8iaDBSY7iSz9ka_5VaJqaXJ2xjcTkiu0KXuZs_1742581097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_111821_293730_DE8FCE2E 
X-CRM114-Status: GOOD (  13.92  )
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

On 3/15/25 3:59 PM, Lorenzo Bianconi wrote:
>>> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
>>> routine.
>>
>> A more interesting question is, why do you see an invalid port? Is the
>> hardware broken? Something not correctly configured? Are you just
>> papering over the crack?
>>
>>> -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
>>> +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
>>> +					struct airoha_foe_entry *hwe,
>>>  					struct net_device *dev, int type,
>>>  					struct airoha_flow_data *data,
>>>  					int l4proto)
>>> @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
>>>  	if (dev) {
>>>  		struct airoha_gdm_port *port = netdev_priv(dev);
>>
>> If port is invalid, is dev also invalid? And if dev is invalid, could
>> dereferencing it to get priv cause an opps?
> 
> I do not think this is a hw problem. Running bidirectional high load traffic,
> I got the sporadic crash reported above. In particular, netfilter runs
> airoha_ppe_flow_offload_replace() providing the egress net_device pointer used
> in airoha_ppe_foe_entry_prepare(). Debugging with gdb, I discovered the system
> crashes dereferencing port pointer in airoha_ppe_foe_entry_prepare() (even if
> dev pointer is not NULL). Adding this sanity check makes the system stable.
> Please note a similar check is available even in mtk driver [0].

I agree with Andrew, you need a better understanding of the root cause.
This really looks like papering over some deeper issue.

AFAICS 'dev' is fetched from the airoha driver itself a few lines
before. Possibly you should double check that code.

Thanks,

Paolo


