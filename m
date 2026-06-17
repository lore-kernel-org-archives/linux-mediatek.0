Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C9CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=; b=KcpzQnQ3HlLka8678RVpPBbm0i
	FQVxupAD5Urh9x1Mcz8plnFPEzp6uySuyo0wytJH+k58nkg4706k7k2o70hS0jqgNzPYCu1R3oU1e
	tsg8Ll0J2WdaUpTLsbCI4niW1kk2eFmZ0U7Yb4VS0e16PRirFeTIlGr2IVqkpz1XRz2PfbPDxLN3P
	Nsi8Y6fj2gHZnm5objRy5yXR8Fm9GCxasdZZVCDplZwG/2/xFjIjujtKyN27MaAz0hMT/DCTWLP8F
	bY9IN0BMKBmA9v6EV2pWkpVAth1RYbQ+JhKm/5wVgLlHv2WG5t2w5uZEyqdYQD4YDeLMTfBqryAxV
	EW09Uywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm3C-0000000Guyk-1fou;
	Wed, 17 Jun 2026 08:55:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm3A-0000000Guxn-052L
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 08:55:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6c101aeafso2257605ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781686507; x=1782291307; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=;
        b=lnW/5IxINKywlLOmuaK/oGB5tD/oBWSyBN3QeqyoLPgOfYdKIn3v0uLm6Ic1N7qHtk
         P5yFV6/N3DYKwFi2lD6iHLf6g+Wf69PtCqTOy+LX4lvYENztj7xkrlslOOCySyJf9MZh
         CYQDLEPfgUdmJq5/41EAPJChELRDZfPWboADYdMeCeKV6fVCXBDJKtIkz8Cad7a3euLL
         DpGnLd6kFZdHnxa9qPoejA8gbcmFRIdiZm7w6jcwh9NnEGDkVuiKTcDRTr7EvVj8fjYg
         HnHrHpJMijPz7u+acFSl20HYQk34YUS43D4uPUkssZod1l4FJnR32Jh1a9cL2gJ827zv
         54yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686507; x=1782291307;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=;
        b=gBO7hHAKiX72k7kSSNNDjmJP+K2jd36txacIbJrTtsA+4O71YBOdXezuRkMlyp/5pl
         2+T/KmX9+KFIC7L29sq7a4RAOdAK0DSQ3GHU9oz6PT9KaeqYyA0rTq4epc/h0j1Y+E+/
         q0MDiYAGArWEvbkfCt3NrPrWdurwZzlvh+hS8anFeEis/OSaRw3fxUBA0B77oGqswN9Z
         M3t640AteZFr0EyGGsPOjziMEHNV1eodKyQOiSB/2wkBj/ksNcV0v+68qwdfOGvKAv7C
         PU7lw/QyRLkQL7p05pFFPZWsPg5UwDUDBOu8LDVmm2Pv8P9krRt/sTWCn8uwKPMZRL/b
         WhTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Sp7DGFWCqV/6A0TGnW+zMNfWNhqzRXQl9ouMyr6yPvgbjKQn8Co7+YRlsezf8LDkMB3WfJ4i5DEUJ/K1JgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza6ojOksYeNf6US83IGaLEGNzTZaqIWheMyKa0oW6rUxZrEkYZ
	mIMkTnQ3+slPiUfT+g8feOcfLAhz9EQ0jIXNHYbCXuzwS7uTF9MHJUJF
X-Gm-Gg: AfdE7cklIXGh7hrIZ498yQmh69xnPhiL4eBzCn0birnaTsJICFcBUnw2evE6rtYtQzW
	wmX4Wogu+AnH/4KwWpqSAuZOBETdPX+FCqTblw6Mqx4M6dyfFqUZ1tad6/X/yweS3k6WK/VlAfP
	abyqUkp7A3co29bMc7YuVfE5gCkvLeMxbVM8+aVBH38/oazy6HbQjljc3sV+dp2IcmY5gLb3MMw
	98n7kCkGvBMOQJ6587fPCkYudflfaZWNsBPQYCJKqcNqCzFwiSWdpE0ehcfUhi8iF6PwoNRzZ8W
	kSSmzPojshb85J+LOhqlpFXNW+fwEKDpIN7a+NGGLC98pqBZEb20bQZMyD++1B/FIEsCSglPfHe
	8n5yWyduEXttwMQDmY9DisjoU8kEAsM1PGo4PjmJJtX3Ok4pzIiNPaR5XJu0/4zW7Zzu9a6AR06
	k/9ubze9FX81HOXXbk
X-Received: by 2002:a17:902:f64d:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6bc0e9707mr27907285ad.17.1781686507025;
        Wed, 17 Jun 2026 01:55:07 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm15031735ad.68.2026.06.17.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:55:06 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: lorenzo@kernel.org
Cc: netdev@vger.kernel.org, nbd@nbd.name, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Fix TX scheduler queue mask loop upper bound
Date: Wed, 17 Jun 2026 16:55:01 +0800
Message-ID: <178168650178.2224380.3950331731013129336@gmail.com>
In-Reply-To: <178166704952.2212140.11002626760717132754@gmail.com>
References: <178166704952.2212140.11002626760717132754@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_015508_082651_9E21561D 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Jun 17, 2026, Lorenzo Bianconi wrote:
> Even if the current codebase supports just AIROHA_NUM_QOS_CHANNEL (4), the hw
> exposes 32 hw QoS channels (AIROHA_NUM_TX_RING). Here we are just clearing the
> configuration, so I guess the current implementation is correct.

Hi Lorenzo,

You are right that there is no functional impact, and I agree this
should not go to net. Let me explain the register layout I was worried
about, and you can decide whether it is worth a net-next cleanup or
should just be dropped.

The two macros are:

	REG_QUEUE_CLOSE_CFG(_n)             = 0x00a0 + ((_n) & 0xfc)
	TXQ_DISABLE_CHAN_QUEUE_MASK(_n, _m) = BIT((_m) + (((_n) & 0x3) << 3))

REG_QUEUE_CLOSE_CFG() masks the channel with 0xfc, and the bit macro
folds the channel with & 0x3 (mod 4) shifted by 3. So one 32-bit
register holds 4 channels x 8 queues, 8 queue bits per channel:

	channel 0 -> reg 0x00a0, bits  0..7
	channel 1 -> reg 0x00a0, bits  8..15
	channel 2 -> reg 0x00a0, bits 16..23
	channel 3 -> reg 0x00a0, bits 24..31
	channel 4 -> reg 0x00a4, bits  0..7
	...

In airoha_qdma_set_chan_tx_sched() the loop variable 'i' is passed as
the *queue* argument _m, not as a channel:

	for (i = 0; i < AIROHA_NUM_TX_RING; i++)   // i = 0..31
		airoha_qdma_clear(qdma, REG_QUEUE_CLOSE_CFG(channel),
				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));

Since each channel only has AIROHA_NUM_QOS_QUEUES (8) queues, the correct
logic is to clear the 8 queue bits belonging to 'channel'. With i running
up to 31 the BIT() shift instead walks past those 8 bits and into the bit
ranges of the other channels folded into the same register. For channel 0
the accumulated mask becomes 0xffffffff, i.e. it touches channels 1..3 as
well.

This is harmless today only because REG_QUEUE_CLOSE_CFG is written
exclusively here, via airoha_qdma_clear() (RMW clear), and the register
resets to 0 and is never set anywhere -- so clearing extra bits is a
no-op. Functionally the current code is fine, as you say.

The point is just the loop-bound semantics: 'i' is a per-channel queue
index, so the bound should be AIROHA_NUM_QOS_QUEUES (8), not
AIROHA_NUM_TX_RING (32). The two happen to be related (32 == 4 channels *
8 queues) but mean different things.

Since there is no functional change, feel free to drop this if you would
rather not carry a cosmetic patch. If you think the clarity is worth it I
can resend against net-next without the Fixes tag.

Thanks,
Wayen


