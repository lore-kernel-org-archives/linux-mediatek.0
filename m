Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF0CC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxiqDGFIicHFEtEIHtNQNblDDB+Ip0Yoq6i22AXMcsw=; b=kTTma63SCKOJunD4IQwIQ6p+ZH
	FnJZYSrRPL1eghLHN2x3AYRnCZ5k0kg3fBeo4g1ilQIOc7utneWgkR9zvaBUbR/5TugGVcHE6NQz9
	m/kSL9NVvXl9dt9q7jZeRiFSse12IltSZgh67+Fdbahp9VXjYqqzCMI2/WnhEtCsWgSB75Mm6o+4H
	C2VuPvgiN7DLDMh1/Y8rUxtT7jbM2NHakUZIR3y5KFYzp6OC5DwA4/ydyGl/M5Fz5Eu9buoKicxyt
	Bzy+iOLA1KL3m820wm7PNbcD742C4Jvq9m751dTh3MHoq+ae7lRFH73/S6fDAvDHimrAspaP4BAOg
	B3RA7FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7Db-00Bvhe-1n;
	Thu, 07 Dec 2023 05:46:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7DY-00BvgY-22
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 05:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701927995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxiqDGFIicHFEtEIHtNQNblDDB+Ip0Yoq6i22AXMcsw=;
	b=SLuQWrUgyvznvnSsbkmDGJEAMTHJGdRD6P5Tu/fcmw2TYwK04ohpYLhOvA8AUbR4fOL4KD
	RQc591Iydqny1qTuF+byr8aVZKj5bJEvP6nfWoyKvTp1EPmtalH0zM5/MqZZBkfQTDZHD3
	+A0DdEe2bHZ4PUejhxaOysjmXjSVODQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-qwQrL_GcO1mDpJhlc18WTg-1; Thu, 07 Dec 2023 00:46:32 -0500
X-MC-Unique: qwQrL_GcO1mDpJhlc18WTg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2865681dcb4so576426a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 21:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927991; x=1702532791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxiqDGFIicHFEtEIHtNQNblDDB+Ip0Yoq6i22AXMcsw=;
        b=V7phGqG8/zeXyYM7hLCurZiQtSCQF0Q9jdBVvdj91jAxs6MGLwSUvkOELEyoVUO/Q6
         FFtOe/AK02L0/FJA9erM/18K27QK910gLP4p3GnRXUk22YuDyQhPprlIxLiByEYNqV2w
         NM2JPp9lEiWlKeq3jeZNUInNffrSdewUBjpBULEVom9y7hjTneT1zhof771R5mdDhbCV
         iXeCs6xhl+vS/dJz7E+cLVWZWf9lStl3yta76od4MunTw7llx8BiQ76OvUYR2d78HapY
         0O4FRe9WNI2GEmf6BjH5ci7i/o9+n+x5OXh1rDW5QZlNy9JW98gaW6ipb3J9S7yjeEB/
         XjXg==
X-Gm-Message-State: AOJu0YxgaNZH7qKXA84O+8sp2n0/ajNomPvumcNBpgqoUkN68tHnV63o
	oYSeEHJ715oXdjitqTm+VcyvTvrE41BpEPn8yB4/yR5okXmAjJJJbo4EQTEVqTutbzuBeO9rVzg
	Pi2uqo38rB79Ax6DG6/ZcFc76l4Snskg4MXPVzP0dfie1pPuh
X-Received: by 2002:a17:90b:310b:b0:286:bff2:c41b with SMTP id gc11-20020a17090b310b00b00286bff2c41bmr1876719pjb.23.1701927991075;
        Wed, 06 Dec 2023 21:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUfgjoIKpasl0QD67eKC09rD6Vvob1+V2GPMTPFb8/kThT/w3JyyDRtZYtlMl19xjCR/LXa/IPCZwYXFZnNus=
X-Received: by 2002:a17:90b:310b:b0:286:bff2:c41b with SMTP id
 gc11-20020a17090b310b00b00286bff2c41bmr1876711pjb.23.1701927990817; Wed, 06
 Dec 2023 21:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20231205113444.63015-1-linyunsheng@huawei.com> <20231205113444.63015-6-linyunsheng@huawei.com>
In-Reply-To: <20231205113444.63015-6-linyunsheng@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 7 Dec 2023 13:46:19 +0800
Message-ID: <CACGkMEsiDbZcCAKDxK7hQ=pqWM-GHG2UaKRGM264ozqKVwZRPg@mail.gmail.com>
Subject: Re: [PATCH net-next 5/6] net: introduce page_frag_cache_drain()
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>, 
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, linux-mm@kvack.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_214636_738433_47C401FC 
X-CRM114-Status: UNSURE (   8.25  )
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

On Tue, Dec 5, 2023 at 7:35=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> When draining a page_frag_cache, most user are doing
> the similar steps, so introduce an API to avoid code
> duplication.
>
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> ---

For vhost part:

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


