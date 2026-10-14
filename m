Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B9CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=; b=By9Y5uzi8yKA+jaoKPZ9S7j8n7
	+ZnsTvo5gQo8GNdJQhBkc9juxYATfudlOj8/sF95Hx4AVPjAP0+olJcp58NUCSdGzMvDsXL3pOcIC
	o76Jpb0YkqBO12XTYdGJZ4EYUsEiwFGPuMq0zSdvOKdbmqzdn42sYCRbMux7EKHG1Vt4F8wUZTjRw
	eGs4b1D1oNbBTUSa0szAfXdxma7/tR6djQ4O4vyC9k5nuEO2bvRYcZceM8dslh/rm7dTrS6x8kUmm
	z0W95DByYg6f/fsHPSK7hBJPjKT178VrZ54D8RvZj6/b9Kd6VTdXOmOTm//972bnnXH5hBnL5Q5g/
	swwAYeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvqq-0000000FAAm-01VO;
	Wed, 14 Oct 2026 10:04:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvqn-0000000FA8x-1AVu
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 10:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791972284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
	b=dmRZW9J8Yuw2MP4JEi3Y8EgbKgdZM5cvpLu3lGM7VJ1w7/9PmhGMsBhbE+tHuzh9Cce4EO
	OnI3ZrzOov3GuJZlo175JF1czZGaiokTQdLdnkhIavi+5bnc0fB3Fm70ARBk9z2P47Wsp3
	TOIuTbxKKeME3vsdlEzD3ZsnAjBgbl0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-PT4LeaZpM-uZkHaJM0xYHg-1; Wed, 14 Oct 2026 10:04:40 +0000
X-MC-Unique: PT4LeaZpM-uZkHaJM0xYHg-1
X-Mimecast-MFC-AGG-ID: PT4LeaZpM-uZkHaJM0xYHg_1791972279
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso8869385e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 03:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972279; x=1792577079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=ViUI+2Op3btEbhNhA8EJPlFi8BEOzLuWDNSb/Gxr5CLy7MQK4Zd8gbdVvmCRJ+wgV3
         +4hjcb8jK5lX9SFWirjw9jAav+OONB2aTg8pGw7m7WqWQA5Qrtjq1ITmVYjLuvT4yzcJ
         FdPbN/z8ofhvSZhpxdviaLLqVRZGg7h0rLJwnPNJyNcFfkluKSmjnYHBZN0b1quFkJn1
         z7b2q5B9ZMxXsKYpjKSOYigvqyS11UaO/gXJnafNbJHFTqAhi+YRkWJQHBxOftoEXF2y
         /hgqV643uCh7/BFg/+ix/xndPnTZyyWQaCVZNzUYfAT1CncNVB8ICO6vVP+Tom9NFmY7
         sGsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYlU3RL032xvtA3SLCsz6ZWdTgqlzRJcwSJnrQEb8zcjxm5SYO4/anAytD5jR/UdtQg9Fhtker5jl/WAeo+w==@lists.infradead.org
X-Gm-Message-State: AFq9FYI03oaZV8BtSAGJCgOR+KAeslaJh2PQWSrhZe3QjpXM5BYtQ3AB
	ecOBfAnXfcwHALi8fncuXa8CEiz9yLMn0oK1VSj1cNw4Ur0geiG2ow3kJExkxeFO/zBPAHNlGk7
	fa3rwEUlUfE6Jj/AlNW6a/68/NgpXrYO3E2sRWfizzdaKleYdxEzoTJLCiucg0hIi6s3jYgbw/g
	==
X-Gm-Gg: AYBFou3NyZiAXSWNxhR8oUK/J1I7/5ylYUIU4vs5h29CobuPkH+cvQLrFGlvTsfAnuS
	xjrq7ZGDS3rBuOTbkERrjMXLyDfxHYq83fCiMOzByoJ/rUtoc9Ar4r/VnXnxNVJtTIYPkZbBFfF
	H4HeWKRP5ywtGdAJrtuLLpdeLAdPan2qGBKzivbSo/1n9YqdtImqTjwduRcJI8S2Vz0Hg74MzAc
	qc8LrBvSyZuRoH4A4gtd7ZulXe2dxQ3/G80xKbhLIicqKyijmwILMzfwPuB8AVhZPoCWTtE05/b
	5U7sP4IzXcdgPjJCKpgjdDQOe8qDRklZUb0lvUlpZ6eUhEMDpWW91vHfL82JWev609ihxPiOfQT
	bZlc4F6gABLfnX5QJCLCuR+RYcoBStbxi8XV8ZHNs9eIQ1up671Awi1BtISHmUv+A3iQc+9MxUg
	==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101285155e9.33.1791972279244;
        Wed, 14 Oct 2026 03:04:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101284465e9.33.1791972278755;
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm419838595e9.14.2026.10.14.03.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Message-ID: <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
Date: Wed, 14 Oct 2026 12:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
 <20261013151233.2474217-1-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261013151233.2474217-1-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ug_xkhSM4W2WbhuCFJ6rzX_WV2RUT_lzR17z93zC9cw_1791972279
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_030445_386030_08A13AB0 
X-CRM114-Status: GOOD (  15.56  )
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

On 10/13/26 17:12, Aleksei Sviridkin wrote:
> On 10/13/26 09:53, Paolo Abeni wrote:
>> The above looks like a significant amount of complexity for OoT driver,
>> and I understand it could be solved with a different kconf?
> 
> The PHY driver is in mainline, air_en8811h. Only the board's device
> tree lives in OpenWrt.
> 
> A config change can avoid it, but it is expensive here. Building
> air_en8811h in is not enough, since it loads its firmware with
> request_firmware_direct() from the root filesystem, which is not mounted
> yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
> 144 KB of blobs, in a kernel that OpenWrt shares between every board
> of the subtarget.
> 
> Is that the expected answer for a board like this one, or would you
> take a smaller change in phylink?
To me this series still looks too much churn for something that has
alternative options. I would like to hear a 2nd opinion from Russell,
Andrew or Heiner.

/P


