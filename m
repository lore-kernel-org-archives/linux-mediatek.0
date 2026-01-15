Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E7D41149
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=; b=ddtDndJf5g1PA5ADCwFI36wOXO
	mE15B0GVc7WYjVP1absGnXYQkVSUJzP5TSbXS3M2umupzbHt4SYeWLqgWXPSXavfjaFSsaKDtS16h
	Hf/vCDfNaaY5Fegj6dPU7kE/UQhmgCYCw/FK6jRMQ3GL1dD7FZvwhnbHV8v7NbzA1aaZNogJU+IjT
	ufY1nHZTDRlit9+0pwyddH65KMS9JwJFJzFI21TCF2smdyKUeDE0ilTXu0qAijvoVGVc08585D3RQ
	+NGgLPaRYYNCY+2t1zN0B1/bGdkV9H4srgTNbQsNaYm2JXi9eHWtP0TrhJQtbBwtbM/0L1uCsTqOD
	dvc3T6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJki-0000000C4mh-066Y;
	Thu, 15 Jan 2026 09:34:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJkf-0000000C4kk-2PJD
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 09:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=;
	b=KvNWvnRcWxqYiqCCLA1qbeXHb1InoOe2IZhf5dk3IkrEQtI/HtuuI/D7QypC+xHoNVqLHQ
	iRkFZ3lpdMS1fZnPuOH2EAokXqV5Kih5cIGEGWFhpGPvnGetoUKLE0lfMF9kEwPnsmT4QR
	EwNs3dzB21l7DM0DeK9191BTjSL0ST8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-rK7OvoVQOl6gLtg3hsHePA-1; Thu, 15 Jan 2026 04:34:45 -0500
X-MC-Unique: rK7OvoVQOl6gLtg3hsHePA-1
X-Mimecast-MFC-AGG-ID: rK7OvoVQOl6gLtg3hsHePA_1768469685
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477964c22e0so5202865e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 01:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469684; x=1769074484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=;
        b=pJ+UAXu1cf0MpvMzYLYdeLREj0kMR8beJVFs5jqK27LYgNo0Mx3cdz7eU4JpLMhCrk
         Ht0/yXc4mC19/lONum5ogwwUTTtfn1lWW41lrTBXHs5F5rU97uQn+JP1kbR545t1ECxI
         63XiwklRc5dRr7gO5/yY3WMqGahHTBrg9tySvPDm5WUuEXmKokqauEh9zuSn4sKD3TYR
         r9yBa39EL1IpSuegf/bYCV+921PloNUyQrP5QVpYSK+39Y+M6DLzkOXPr3RmIjrfCJO7
         Uv0yuzhGW/b1yFlX3k57ZB1eL4DNuodzDUXl9Tv+wyXC2CG2eDf8Gk4qaS1yNBp1EGXh
         ZWwg==
X-Forwarded-Encrypted: i=1; AJvYcCWlWGF2WrHDMtLvfKF3MuLIJ2BDByZ8Daiy9qdb6LZziE05eB3odHXRdGVIAwd1KS9eCpNcX8Qz6U094AWCuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9vHtAQXpdTJoH0MWEsmX5ku6JIDcBMhOtWIPoe6ySf/e6Q/7
	+gS7bk+CrFnEwq/Z6lx8IIO9J/AqnZYbcJymxJqSxk6lZ+QLMDaQkY1p1u46G/quFAQohKKxlqW
	MBiQgp1Da3bpfonBxDRrwfsNaaA3oRRxXLWSilxPNstTfcBEIFJMRrGmSkhO1wkjjBQ778cOR6A
	==
X-Gm-Gg: AY/fxX7m3Fzj5DO4f3edvpkQmbRheLiYEluiAO7TaB33wP6GTFd0lH9U/1sJ64xuV/P
	ZYJ9icZISehYt6gQhzDjzX5A7QYkXqjrVjvCfLD1pdV7+SpHhGFJRxUZYClMmpfJ6YJ5cAElBEe
	vKKSQsF5aK4rjH+zl1nzACDdeanBvOtWRKpIvbw0BHpkTHTGmyHQtHBuO1eHqFq1YPWQ9ot4hlM
	Guo2qd594xQ9V7XhEYJHyO3cECdAHIo0wDrQsYOpbXnujRA9LEdaJTgyqGOxGaVQoU2v0Ax6Tze
	sQlrYNv0e2fUughnZjt/H4X8OHCQgquhWxBKZCWrK8x7t4R64QEMg2YC7WFnegqwFhqCXdpIFfw
	zgBECfjBx0gXyZw==
X-Received: by 2002:a05:600c:3b82:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47f428f7447mr30633295e9.15.1768469684609;
        Thu, 15 Jan 2026 01:34:44 -0800 (PST)
X-Received: by 2002:a05:600c:3b82:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47f428f7447mr30633005e9.15.1768469684215;
        Thu, 15 Jan 2026 01:34:44 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428afd9csm37134515e9.6.2026.01.15.01.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:34:43 -0800 (PST)
Message-ID: <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
Date: Thu, 15 Jan 2026 10:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
To: Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com>
 <87o6n04b84.fsf@miraculix.mork.no> <20260111141549.xtl5bpjtru6rv6ys@skbuf>
 <aWeV1CEaEMvImS-9@vaman>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aWeV1CEaEMvImS-9@vaman>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzOVPqdDWRnVuxql01fBMHomIwlyuMxY1JPMGXaaCOk_1768469685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013449_720469_5C854369 
X-CRM114-Status: GOOD (  11.31  )
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

On 1/14/26 2:10 PM, Vinod Koul wrote:
> On 11-01-26, 16:15, Vladimir Oltean wrote:
>> On Sun, Jan 11, 2026 at 12:53:15PM +0100, Bjørn Mork wrote:
>>> Vladimir Oltean <vladimir.oltean@nxp.com> writes:
>>>
>>>> Add helpers in the generic PHY folder which can be used using 'select
>>>> GENERIC_PHY_COMMON_PROPS' from Kconfig
>>>
>>> The code looks good to me now.
>>>
>>> But renaming stuff is hard. Leftover old config symbol in the commit
>>> description here. Could be fixed up on merge, maybe?
>>>
>>>
>>> Bjørn
>>
>> This is unfortunate. I'll let Vinot comment on the preferred approach,
>> although I also wouldn't prefer resending to fix a minor commit message
>> mistake. Thanks for spotting and for the review in general.
> 
> Yes fixed that while applying

Could you please share a stable branch/tag, so that we can pull patches
1-5 into the net-next tree from there?

Thanks!

Paolo



