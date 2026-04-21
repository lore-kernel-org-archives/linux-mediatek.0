Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C036F89251
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=; b=34flzixX+bYsExjYZ2icFU0/fj
	cq5IQ5WYgI+rGuEJ4nCbk3J1d8W70iXFpWewpCZZE1n7sCcIjGnDtH/FFZurF/xmZqXF9DqWMJb5O
	iuGAxngFS1/psyIPX1PmVxHtql9d3g2f4C2dJB99pM8N5HMpGskbncf7wCi2ogw469l0vM8sIK5FR
	l+DHBaDOVLVw2LX6huYakhPJ3U8k4xIDa+fWcPx+AQcf8hejbD9gdF7xfckCSXv7nmGYgrLubK2S4
	CAa+vTV9fPhsA2FmmGasXD72V5bVa6DYy0IlQ7oxllZHS8aYX0vvWvNwUQDUCH9ApUX4S4aNkEAkz
	/iAGo5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF99f-00000008VUo-0Ghm;
	Tue, 21 Apr 2026 11:20:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF99b-00000008VTv-48mj
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 11:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776770429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=;
	b=EeVXawz0keu/wpq7zby9C/d9D2YD8MjMtKz0sCmL6KGMx4a1DgMKW/UYLAEMjSFfaVJ40H
	L5gYMVUWy8oxBL1bGPzXvVX8OlQk0LKsjoWNIvgsMeBYpU9vD2eW0sSatsa7JsjM/4eedw
	L669R9gKrmyDMbWIOLjnS9gJvGJLt74=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-1KBEeFswM_u-PjELRkj4uQ-1; Tue, 21 Apr 2026 07:20:27 -0400
X-MC-Unique: 1KBEeFswM_u-PjELRkj4uQ-1
X-Mimecast-MFC-AGG-ID: 1KBEeFswM_u-PjELRkj4uQ_1776770427
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43ff19e54beso1690938f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 04:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770426; x=1777375226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=;
        b=GcP7xQ4vCtZjAVAnoD8MvHYou6jBJcyEelJHcuTklhMzH7uDrWs5IU6OZhKDthk0t3
         FF12CjmR3GK7B6Gtgj9U8FQ2ZMazTGrpdtdJ6uTv0NgFFf5KQ/S8ljHG2QmUqwd8fi9D
         oJGUH3dIMvtmWBIMaIhhvf5zzqhummcJHzNqsjAfKGTPdEXBDDPKPiSrciqCbwTRHziv
         mwiTidD7W4JIJ0ESRhYiIkcuVwcPO7+GWjsMrLKj4d0/4bBqK6nEPnb3oU0tVs4QLyf5
         ahaKNoFfltZoYU+KVOKx/eIyEax7549u25qgMoC6ln4lWOLJqJTzrwwY4MJCKF6SLEqf
         ahug==
X-Forwarded-Encrypted: i=1; AFNElJ/qhhvtrXDyt8/b0brx7uCa3F39ITpJV/PJrQdqJnte03+Zg+Kw0HzE9wOF0AtSL3tVC41u0yMor+3cWsyqgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuV3y4gVfDbjXJRQjfN/16R9jEXMttQvhsMFQhSO1pCWbEwXqp
	aQkzggey4VxK07GDyQx6F94QFxULNmWrb7FdNfbc/kAbbX7cR4d+8j7tnQoLJaQl2/hvOVUmpO5
	dlwVhbXm3CERBX10LUsj1Myva1fXCNE9l8qvYJjXzxHaXw9Z1e48Zq7MOhRk+IWhRcLT7VUA5qw
	==
X-Gm-Gg: AeBDietKAtV1rl19E6PBWtZhWq9J21s5gHOE0TM/avqJ4qOveaHr6ccNFCO9+21eQIH
	DygywBMjfjqJk0MvGObEd0L+5ocv62EfPY0lTzwMrbtz0lF0IiBM8BJuRXGfJ4dcVeLxJy4NMyb
	PcUOMvwBGiRWZcDhkPmNAAa3FmZ133Pl7XGYL9QolkROCdPXWTgx99TEm/DcjVeijJ8YijzinQd
	MOratWt8teuzgc8HhZZ9/qFBZCTXp4hx/0hOLE9fUixD/swrBnfoeCotP+1CNuTXFErB8cYFXSC
	4mRKXGOwFku8YUw9Xq45Cmh7CbXlOfWUJrcOSqEoZR4UbF2g4fHMmbFTE3ssuV0UnKjZ4ZlDUqJ
	HaMTPhzrNTM526Snbi0FY2Q9JNWrwIgSjfv6YCMk0/I+FuhNJFtS9zy8/JdDHVPQOQuo=
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43fe3db39c6mr27082063f8f.7.1776770426443;
        Tue, 21 Apr 2026 04:20:26 -0700 (PDT)
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43fe3db39c6mr27081982f8f.7.1776770425956;
        Tue, 21 Apr 2026 04:20:25 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm34927627f8f.34.2026.04.21.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 04:20:25 -0700 (PDT)
Message-ID: <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
Date: Tue, 21 Apr 2026 13:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 91n9uxXeRo_H4jLWQqTPxcNY2lQteSjzOR1jWpmiol0_1776770427
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_042032_168959_6BD767EB 
X-CRM114-Status: GOOD (  10.66  )
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

On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
> @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
>  		e->dma_addr = 0;
>  		e->skb = NULL;
>  		list_add_tail(&e->list, &q->tx_list);
> +
> +		/* Reset DMA descriptor */
> +		WRITE_ONCE(desc->ctrl, 0);
> +		WRITE_ONCE(desc->addr, 0);
> +		WRITE_ONCE(desc->data, 0);
> +		WRITE_ONCE(desc->msg0, 0);
> +		WRITE_ONCE(desc->msg1, 0);
> +		WRITE_ONCE(desc->msg2, 0);

Sashiko has some complains on this patch that look legit to me.

Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
IMHO almost ineffective, I think you should address them in the same series.

Note that you should have commented on sashiko review on the ML, it
would have saved a significant amount of time on us.

/P


