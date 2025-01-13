Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2667E7719E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=; b=tQs9TEEPPyKsY4RO++jLn4Mh+G
	pJQgaZFzGaYgdA4i/REd5DibyO1Fkp+77+SluIb+ybXPEuScUkkutMOQgAmo/kfS6Pf+HqJ/xUZow
	PDTYnPYH7nPnqdykWi00vE/gA2J8FLytCaqMlgGCvgzBI19VQvkxVxoA0eBcQiLV1WKEwd3ubihKv
	bUgYug1EvFECtKwtoqJabVB3zGbGAi/kYniOlIjy/NGDg17tyOSnNIX1MyyEr3JwC1QuRYx19bq2E
	Bbc00L6jFcnVa5jmgIKv6R0IW92aqFokITmTHlFCqVnAnLFA5AqI4uke4gpAUnqLoK2Q7ggVq4dAI
	34nE5e4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGuZ-00000004egz-0LlM;
	Mon, 13 Jan 2025 09:39:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGqh-00000004dcI-3N2U
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jan 2025 09:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736760907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=;
	b=DwtOLoES7p/JEDkvcKRfzn/ZuV0Tb8m6jcWX42H+OJfbx9nbvs1pfxDqK1FgqLVP5rLtlX
	kwaSkdbJhBmzHuBKzRYir7jcpkteu6YLBq2RbqhpGYT2L83cFI5TWznR+95gI4luGwYbGj
	uvDmA3n/5RZLWkzUIXNVV/04KT5ZG8g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Fa7d8HkpNXeBECGkKVyxrQ-1; Mon, 13 Jan 2025 04:35:03 -0500
X-MC-Unique: Fa7d8HkpNXeBECGkKVyxrQ-1
X-Mimecast-MFC-AGG-ID: Fa7d8HkpNXeBECGkKVyxrQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38a9118c486so2483820f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 01:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760902; x=1737365702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=;
        b=F7sVS5rs9sp1Kdfrg2ec4AuTV5BT88n38OPoj+wVQLHAQgX3n/v+HtFhb0vRspAOuz
         47Mdw5mrxxBmyndzOebr/kO0JV8GTOwsqAzEoh2L7CSDgCDlySKQYi2wNWdhQeFt/j2L
         KsmNWMjGWPesXH8EoO1F1NwrRL1Gm8Qt79yiCMRc5kykYCdlKMIs1QDfKryFzz3AupTT
         fg3WP+V460GE9aSc8FJdIUVU73hfxkngL5HWYFdqmFfk9QjSmhU6SxebykA845CCvOkt
         P2SjM07nXAYf6cqUvgAluJA6c2HPQG6IWwW3i25tR3KRV53hoMUV03WGkTd9H+asHHJK
         hU8A==
X-Forwarded-Encrypted: i=1; AJvYcCUSZs12FC54euenkfN4o+QZjfllq5AlaU36Nrb/weuaup3ORuNKZYGW2g6YY/H/F2OAvI9bIkk2fSE1VdWDuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGiakwvEuyEqjt5D2jylUl5c3YPjNQ6+PNFS5IOqeDtJb6yB2I
	d1eVsMGPL+NsaiVqZz8djDUf5DpTDUCUTk43SIBc6SuPG+S0OyY6oXo/0LoCEiG5LxCj/ZrlTHm
	SHbUDqaiQ8qriIzoGUQGMP9srriTosvlO0u9NRBlgMN13kyH9d7+cjHA8SuU8OG7DvYb6bA==
X-Gm-Gg: ASbGncspgIJUAIRRbBN9ATWDsds3HEsTGlsVs4i2GOrQUjzsVt4h8HXzHlThLfiQnPM
	DJsoi7OIa4GaqMzVfpkPvIF4nWgYvqcj9xXqmF5SLn5mVayo5FCJ6p8XAGABRi9FcAFJaMZLN1Q
	upLidWozrwJsIWmR7JAjzrL+zmpEnxtFDSw1vETp7DBrHjl71JoBT3P60jAG+44akv74Ch0Ibow
	LDffJe9sJkrqAolxM3W5ylWK34ybxyLC9GByjIV2LTU21ACY3iyxtU=
X-Received: by 2002:a5d:648a:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38a8730fb57mr18342359f8f.38.1736760902191;
        Mon, 13 Jan 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKWbgJ+p8D2nSL1Tg89dORue0vrIpeKEyO3MQ6XFunbZcOEjwxPA5lI+qzzFC0qFwWNbxBmQ==
X-Received: by 2002:a5d:648a:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38a8730fb57mr18342327f8f.38.1736760901806;
        Mon, 13 Jan 2025 01:35:01 -0800 (PST)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38b15d3c7a5sm5224226f8f.32.2025.01.13.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:35:00 -0800 (PST)
Date: Mon, 13 Jan 2025 10:34:59 +0100
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Enforce ETS Qdisc priomap
Message-ID: <Z4TeQ0b2d6vt4AID@dcaratti.users.ipa.redhat.com>
References: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AZwiZ7OaYlz8e8aigAO1jlbMQaGwIWNT41cvox2jSOw_1736760902
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_013507_905673_4BF09027 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

hello Lorenzo, thanks for following up!

On Sun, Jan 12, 2025 at 07:32:45PM +0100, Lorenzo Bianconi wrote:
> EN7581 SoC supports fixed QoS band priority where WRR queues have lowest
> priorities with respect to SP ones.
> E.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn
> 
> Enforce ETS Qdisc priomap according to the hw capabilities.
> 
> Suggested-by: Davide Caratti <dcaratti@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Davide Caratti <dcaratti@redhat.com>

-- 
davide


