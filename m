Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA889C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9biYfsdlWUFfa2uPahdEjhFynqs7UpMUrewmhcvPcXA=; b=SvXCMsDFMHDu5hheudQ1vlx43h
	vsYDH+L+AixG3sKtQFKby2pX7wRIT74ffdFT4tUst0pR8mPVVlSm017pnwIhS/e/vHrdfQUQ8znE7
	iycazdwtjM+Q4QoWBTXxeM5QTt/Ya9F5O8wUGS9AxSYsURhObiN+K5ppMgxtd+Lr6GSM/PQ42XhtB
	mulJ8EU/HqEkldOESD4QyRTS67alRqlW0nxsMs5IfMBVjbS8AX9JxVO/zBtE5KRbXMQARp6sO/oDa
	1ZRCc7B0Wfj9Dt+gga2IioWbluL/2r98RtiPNUkVXaZJ0eHCsxYV/mOBoDE2kkPb3k05uTtylVsD5
	FqK0eNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxkX-0000000AH81-1n1s;
	Mon, 22 Jul 2024 18:27:05 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxkA-0000000AH2G-25y9
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 18:26:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70d399da0b5so321022b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jul 2024 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1721672801; x=1722277601; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9biYfsdlWUFfa2uPahdEjhFynqs7UpMUrewmhcvPcXA=;
        b=wdcu6p6ps/eKPY8iFRz2srp9MoZkVBRMDv0fSxhIDONEHRoGYHWkCQV8Qeiu21a7vQ
         gZYS1Ip8RXZn/cc7PXYGGJU7NCF0obz7Rta8U3zoY/7gpKwjv8TEBv970llI8FGuL3PY
         Bej6rFl5I28Jfv5yJrI20GA0tCJZ1NShhgjDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721672801; x=1722277601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9biYfsdlWUFfa2uPahdEjhFynqs7UpMUrewmhcvPcXA=;
        b=BiYwiUC+C/4eb6AVj3K1dsyoixX+SHl4yqXqWJ+i4UsfkL3c0eOLmkAElwHAI+4RDT
         sliG7GRFz9ws9Fu3NHTc9PZNyCoEbtXCHfoCC16WEsGErE/tENtWWxjvEsgFOIQ6luqc
         be5wpInNZ5SOP94RqmiU5oC9tcQjx7r6y6eLhHOR0vJ0VWymhkRHI7rU4pQLkVfAjvWL
         IYSjnByc/Zch1q27JM97aifSofzLHeSf13g5rMqlkJiC8v65m9sxzq4d73GkXsWz//qT
         lA2fPS0wqEzhNU5lT9nGpDgWYaAHVNDtFXBUbiKt6YLaNdlsohBLEv8r47pLR6+WrV8b
         m9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUwMCInD5+UydxVK3Mc4rpwILLsMlFU82ZhsbxRmSinZk/5+7OHIlYNDgFQh7mKy87t8OUWsoSShTRckFGXL7Ta4it/19tndEyghuN45kZjNTwQ
X-Gm-Message-State: AOJu0Yxr4yaPAlNtmgQhjJ8zlTG3/Q4YZDpr7M1DuwysIBdZXW5eW6MI
	qjrDOJwsESKisqrmHMQneMGLY4cuA2WgEZTRA7lf8yXxUa7sLqsDrDta+RbsFA8=
X-Google-Smtp-Source: AGHT+IHHHCDBMnxogaNQNY0v9bDW89ARG24TCy7ngJQcYGVhGfiHTIWN+aI+488Iott9h8yr0vfjFA==
X-Received: by 2002:a05:6a20:cfa7:b0:1c3:b239:83e2 with SMTP id adf61e73a8af0-1c4285b767bmr9863586637.12.1721672800827;
        Mon, 22 Jul 2024 11:26:40 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f48f3ffsm57826685ad.285.2024.07.22.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:26:40 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:26:37 -0700
From: Joe Damato <jdamato@fastly.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: daniel@makrotopia.org, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <Zp6kXQkiOOI2IPT2@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Elad Yifee <eladwf@gmail.com>, daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
References: <20240720164621.1983-1-eladwf@gmail.com>
 <Zp6GGzaJXhBcnGkC@LQ3V64L9R2>
 <CA+SN3soUH9dxAkKD8AB64Ay48T=Dj-QFftMoMLZfVGH+Q1mjzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+SN3soUH9dxAkKD8AB64Ay48T=Dj-QFftMoMLZfVGH+Q1mjzA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_112642_673688_7E728113 
X-CRM114-Status: GOOD (  18.78  )
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

On Mon, Jul 22, 2024 at 09:04:06PM +0300, Elad Yifee wrote:
> On Mon, Jul 22, 2024 at 7:17 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > On Sat, Jul 20, 2024 at 07:46:18PM +0300, Elad Yifee wrote:
> > > Utilize kernel prefetch methods for faster cache line access.
> > > This change boosts driver performance,
> > > allowing the CPU to handle about 5% more packets/sec.
> >
> > Nit: It'd be great to see before/after numbers and/or an explanation of
> > how you measured this in the commit message.
> Sure, I'll add iperf3 results in the next version.

Thanks, that'd be helpful!

[...]

> > > @@ -2039,7 +2040,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
> > >               idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
> > >               rxd = ring->dma + idx * eth->soc->rx.desc_size;
> > >               data = ring->data[idx];
> > > -
> > > +             prefetch(rxd);
> >
> > Maybe net_prefetch instead, as mentioned above?
> This is the only case where I think prefetch should be used since it's
> only the descriptor.

I think you are implying that the optimization in the case of
L1_CACHE_BYTES < 128 is unnecessary because because the
mtk_rx_dma_v2 descriptors will be too far (i *
eth->soc->rx.desc_size) apart to get any benefit from prefetching
more data ?

If my understanding is correct, then yes: I agree.

> Thank you for your suggestions

No problem!

