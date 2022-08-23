Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ACDC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nch+IXHIDBrWVkXtWbywK+c3Bny+KWw7qcMu+C2LRF0=; b=vQdYr5aN1+60B/PeJz62SQ414J
	5sTwkDd67Tg8tPzQKt/UdCZCXDEZUTvSevgyRzkzBqqIKy88t4sILn4FVNdLvqDb2A8+q9vrDEB1i
	vhKwphz8G1F0cYTxAqjFqcyI0njIp2rTkmNHoUj86pe400uSPPP8osDB7G5bQVr3L2bG91wGYC/Ha
	ifUQgjVlWMYIzODAr/ccPUkZ93IKmfybB/IbxPNKSRUw3MQHVslCH9cDWYVk//C+PA9yKXLIDRqnx
	QBUkB0BXBkZE2s5Y/vY0iK4ChIWW5bOU/QAc4iYyVtt5uN5u2wYxtrT4br6oZc5UUqpNeUH1nUyK/
	n+jZjkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRbm-005Ai4-FA; Tue, 23 Aug 2022 10:58:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRbj-005AfR-MX
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661252286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nch+IXHIDBrWVkXtWbywK+c3Bny+KWw7qcMu+C2LRF0=;
	b=Gq9DGZAmePVEsNJIo0hO6P2JL2ptO17gb3c5NaOG9FNE0xbpZrMKcBWa5LHkmw1hltbcmk
	IWMqHAkVffFlBhplcsP0gX/pXtlHTjy8uw11ivKawYsmpQQuxHXUTTJ8ylDVdbSqrlFTaY
	Z8WGdexMMXQ5hMBR/ZCS82LvLj6j/Y4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-9ZdGbRs_PhK1Som6Yrczyg-1; Tue, 23 Aug 2022 06:58:05 -0400
X-MC-Unique: 9ZdGbRs_PhK1Som6Yrczyg-1
Received: by mail-wm1-f72.google.com with SMTP id h133-20020a1c218b000000b003a5fa79008bso3512811wmh.5
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=Nch+IXHIDBrWVkXtWbywK+c3Bny+KWw7qcMu+C2LRF0=;
        b=jysUM+nRbmwObOq+Pw2kGaKMBaxQN2dvT7EcvMK2AneSYzag4vc4HACuaXrDr3vvEg
         FmRAIQ0WM2/4UXi/XLbbqcJLJ+Hh69poo6AyNrFbz4lRFoN8uIPXaZ0f40XXO3K/dIb6
         X+uB50Q7ZiRszXKImkIDN4AsqzU6Pi2WLZJYt4axb9nzTmGuRtwVUqeUlHlWsGjQkYhc
         xUVCCbdciBF3hnPoobISC0RjOu0wvljJChI1xtZld2TZ162/+zJ8i0ZMddwCASfF5p1D
         lJzf9D3I6Enh6zZLUllr/6kvnDA2aOYNnh61Igk0ohYLF4v3alL0dCGrf+tksQRwXepg
         50tw==
X-Gm-Message-State: ACgBeo0l+M6cqrRyn3p+vRJCAxpah0kPnq1t7FesvYUlQJO9GkkNtLZv
	Mj6YpedoHw89MzZ66TcHZcTnxaRsFPk/TicpT6MeenoXgSYlY1A9zUR0tcN6+YXwcjtZKf1UQVI
	SBIJJhNzEY/cL9iUCYvljciadAu/+OkQf
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id bi17-20020a05600c3d9100b003a54132b6a0mr1691419wmb.126.1661252284494;
        Tue, 23 Aug 2022 03:58:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bDQBAoacU9DIFFDvh3Vtxv7kMelU00DA0jkotOluxkAmKaIuNvBHrTwg5CLgfPziqdhVLQA==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id bi17-20020a05600c3d9100b003a54132b6a0mr1691414wmb.126.1661252284292;
        Tue, 23 Aug 2022 03:58:04 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-176.dyn.eolo.it. [146.241.97.176])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c191200b003a5c1e916c8sm2680414wmq.1.2022.08.23.03.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 03:58:03 -0700 (PDT)
Message-ID: <110a99aba78eb62daa5653104e5ef4e53dc92c74.camel@redhat.com>
Subject: Re: [PATCH 1/2] net: mt7531: only do PLL once after the reset
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Couzens <lynxis@fe80.eu>, Sean Wang <sean.wang@mediatek.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Tue, 23 Aug 2022 12:58:02 +0200
In-Reply-To: <20220820213707.46138-1-lynxis@fe80.eu>
References: <20220820213707.46138-1-lynxis@fe80.eu>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_035807_844228_0B613C99 
X-CRM114-Status: GOOD (  10.28  )
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

On Sat, 2022-08-20 at 23:37 +0200, Alexander Couzens wrote:
> Move the PLL init of the switch out of the pad configuration of the port
> 6 (usally cpu port).
> 
> Fix a unidirectional 100 mbit limitation on 1 gbit or 2.5 gbit links for
> outbound traffic on port 5 or port 6.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

This (and the next patch) looks like a fix suitable for -net. Could you
please re-post, targeting the appropriate tree and more importantly
including a 'Fixes' tag in the commit message of each patch?

Thanks!

Paolo


