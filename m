Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7397AC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1zAq2A8tIjO2hNDIqGfuwyFl2KKWufIdH/9uRMO7aA=; b=AF1qMJ3Fmhj+KPLkufO0bewzQG
	xbPo4VK638ArMtO09htqFfBE9edQSs4SVpuwDnOaOxtdIXCZvtoxvuEd9IWzf9k6A0w3192enVnpE
	MlNeAIk0An+LC7MLfoc6fc74pNa2QpywNPcuXmICNqgGFz4Enu+2SYKQTXVfOu88mBidCnApnn6Mr
	SygHlAD54I568m3TJqsUXEk67GGeJI2TiEQPlVDGGYrDOLEOfrYJP5GlCPF8tv/44+GiRWoYtEjvt
	wdG/fSclZJ7xfpIDsKxuubNEeElPnHTNNVtldZt6e6VAN10PAXQL/h5Re0SQ5h3+RCm1c7GaImbnH
	j8az7AUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVjA-00000005U62-0eOu;
	Thu, 01 Aug 2024 13:20:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVdC-00000005RGs-1dBC
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Aug 2024 13:14:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-368526b1333so1299653f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Aug 2024 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1722518048; x=1723122848; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1zAq2A8tIjO2hNDIqGfuwyFl2KKWufIdH/9uRMO7aA=;
        b=AO0+kmIj+pZKauDzwa76QmKBaswybqZIWBaJyYO1aAfF8v2fYzoF2evoEosiSjJiDV
         y2VtFRdyNXZFEzKV3BlE60qFE354T4mkOYhlIivVoyGtd+4vzytRTOHFQxiFXk0OOS+u
         je43NN8lDUVN4VUQ46NXNidDkGiar4CAvKZTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518048; x=1723122848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1zAq2A8tIjO2hNDIqGfuwyFl2KKWufIdH/9uRMO7aA=;
        b=JX8KtbwlSvpe8whhm0rOrvGOT/XzIr0pOk4tSYFxF7EimU3T4UiAadxhlIiUr6mugk
         Qduy4tAqiInYS5a7Ej9JPyAkrOkUI0FYHkyPJLMSejaZdrORznAi6SrnnGsg5p17Sui/
         +GvS2sDhUiZZLdwkw5cnb8jjqVDs0QVdg6zQR+4wCIGfNwITdpYOcmZ1OUy50+oeditf
         h7nB+qHxCD00lub/rWw9+ca2XZOjVUFnmvcda0n/Eeqmzmk1vPaqjAw6ZHPf+HrNX88m
         PgwXSg0h35ECqHjuepMm+huN39G+o3kMLoV38thkbOY8WvToaPMGNEsrIzF/DiOtalhf
         hsZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNNvgn6+hJWN9JaQ+wZ0WlqDYOGVGojryb/E77Z8NhnAIbOdQ6HDucj6kRlmKkLhXqD0Eqh30PEk1s+1OV9vwFcxrOwQhL7FNwQftfnINhDwNG
X-Gm-Message-State: AOJu0YzNdhH0b4iaWTofCMRvN0DzW0dVezSpYkWLcZT6GAQCbAZ8P4Wb
	7udPMTXxjHF6RZ5bs3MNSBf2DLd2POgnJ64HS7CA9tEVIov0+g6h8qM/7pSpHLk=
X-Google-Smtp-Source: AGHT+IGY6C6HxMfYIEbuN5skOyWJua94QhKtVofdw583XyL2PipegA2/E/h1+XhGjqNYBfKRCf4SUQ==
X-Received: by 2002:a5d:4251:0:b0:367:9048:e952 with SMTP id ffacd0b85a97d-36bb35c63f5mr1373341f8f.18.1722518048015;
        Thu, 01 Aug 2024 06:14:08 -0700 (PDT)
Received: from LQ3V64L9R2 ([80.208.222.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb1dfd6sm56904175e9.42.2024.08.01.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:14:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:14:06 +0100
From: Joe Damato <jdamato@fastly.com>
To: Stefan Roese <sr@denx.de>
Cc: Elad Yifee <eladwf@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <ZquKHioPb6SMpztT@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stefan Roese <sr@denx.de>, Elad Yifee <eladwf@gmail.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <20240729183038.1959-2-eladwf@gmail.com>
 <ZqirVSHTM42983Qr@LQ3V64L9R2>
 <CA+SN3soUmtYfM_qVQ7L1gHMSLYe2bDm=6U9UwFLvj35odT0Feg@mail.gmail.com>
 <17deb48c-6148-4e3d-aa0b-6c840f55302d@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17deb48c-6148-4e3d-aa0b-6c840f55302d@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_061410_562077_814EE3F9 
X-CRM114-Status: GOOD (  30.87  )
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

On Thu, Aug 01, 2024 at 09:09:27AM +0200, Stefan Roese wrote:
> On 7/30/24 20:35, Elad Yifee wrote:
> > On Tue, Jul 30, 2024 at 11:59 AM Joe Damato <jdamato@fastly.com> wrote:
> > > 
> > > Based on the code in mtk_probe, I am guessing that only
> > > MTK_SOC_MT7628 can DMA to unaligned addresses, because for
> > > everything else eth->ip_align would be 0.
> > > 
> > > Is that right?
> > > 
> > > I am asking because the documentation in
> > > Documentation/core-api/unaligned-memory-access.rst refers to the
> > > case you mention, NET_IP_ALIGN = 0, suggesting that this is
> > > intentional for performance reasons on powerpc:
> > > 
> > >    One notable exception here is powerpc which defines NET_IP_ALIGN to
> > >    0 because DMA to unaligned addresses can be very expensive and dwarf
> > >    the cost of unaligned loads.
> > > 
> > > It goes on to explain that some devices cannot DMA to unaligned
> > > addresses and I assume that for your driver that is everything which
> > > is not MTK_SOC_MT7628 ?
> > 
> > I have no explanation for this partial use of 'eth->ip_align', it
> > could be a mistake
> > or maybe I'm missing something.
> > Perhaps Stefan Roese, who wrote this part, has an explanation.
> > (adding Stefan to CC)
> 
> Sorry, I can't answer this w/o digging deeper into this driver and
> SoC again. And I didn't use it for a few years now. It might be a
> mistake.

I asked about it because it was added in v2 of the patch, see the
changelog from the patch:

  - use eth->ip_align instead of NET_IP_ALIGN as it could be 0,
  depending on the platform 

It seemed like from the changelog some one decided adding that made
sense and I was just confirming the reasoning above.

