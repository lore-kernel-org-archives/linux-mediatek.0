Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD032CDB470
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=; b=KmevTrFWQ6Fta9sy/9UCqcqcth
	9kkr/SkOZ4pNXt8og6kSxFdQMuAYfGRWO2flgypKv5ZpLHlDiA8ru91qSAGtlHodOGHqBoa2YIU0O
	lI/QqJAcfy89Kwvco/H2k5LqNitN2J6KK7qXeCYgyWKYPZWSBCWK2U7k/1B3rDNJLE/hLhuQh6Fbq
	m2E/lXSyWe4lfZEfXty23EZB1MK8hi/pNOvcFHhNYuM3khk7cBcfYfOaDz3U8u/rJ3voWvh26TGQT
	UWakiiKTAEqbjss/bpg5962BkXrG+R53TAgyhx39q4EhGqdYK4ETMF5acBNnvJtMcSdbwfWMC4VeL
	RAyNDlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcG10-000000079sH-2947;
	Wed, 24 Jun 2026 05:19:10 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcG0w-000000079rN-3UrU
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 05:19:08 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8422f395a4aso469940b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782278345; x=1782883145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=;
        b=PWGh2cD7qeI6DXQBEBBoPqsAn6+UIDCbL2F7QOpPDoax6Ure6W6sc9tgPE6r9JKWIz
         77pzhrhwGAj/bLTT1FND+yInwZWjPQvTbbxapaDBhU5OvN2RBpD2QUChzjpLj44RO8Xn
         ZSMle1p2F2b/5+TsAtgcnq7W5eKDMj1tA1Bmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782278345; x=1782883145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=;
        b=Y0M5crRuzcG5reT2Isl7I7O8fExhKcU6RaZNCvWTLsovCa+JpHkY8utoPIfQNEtQW5
         mAN/R1K5YNJ5qyokOwbq59aegWqg0Qo8VeRLgnmBVQ9XSbZCRPBurhMsjun9tt1+vwuI
         5CJSePiiU4Pz/dnb33+Y/KnmHm8NHlyH39Qng43BNLLz2CdxdzwWZ3Qs/cUz0Emthl2o
         iW4pSzVA1CI80rqnHtjjOJcinCLwgz7pwbAbhiKoKY5nvTHU4gavSg4ThV4Qa1AYMLKW
         rrQ4v8oeHBU0ioZ5TZtkT5y0WNveMP+3yqLP5FhJiCTx31aqHMI2evYopdSZwTF7VF6j
         +xlA==
X-Forwarded-Encrypted: i=1; AFNElJ/o0aXvrRjCFaE/C0I2WXwHloOdxzsARfErPVvFL+6UfseqanrV/VSmi4jQyGk6+yRodelNinLsz5Rb4G3Z+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2tIdXTuUaxMGEVQCxeKb3tuGyTgd3+Qe1pqYKTozgnuzfWL3c
	o81qreoBfz2plRxFdyu87bvIIxS+jX29TnOrU8gAL4DkZxoQABCycBl+QTSzZhUeeg==
X-Gm-Gg: AfdE7cmhn4eeAy0lzmslXAlc+AxVpi2aDDQ12tcRRGZ8GNcuyEbZz4H3FjWcLhFgE5J
	xDE3RbMCmGTvTlf9t8vPrHvEOkoQIbg1do7yEQChqpoW8/Ks83Qw3atWAjB9wWTY+fse1lu1Lfn
	YvctEwyyGCrhezutr1xqHwa5fMewfl7Qv6tgThDVXQ1dU6ls3Oa/Z03upQ2llAAhDMJeIINf1X5
	TGTPYENtwP6BQ4CySMAS+wCKNTkeBqI1oSzN8bNZNBRzld95mApnUYWLcz3LRZLmzJPbkC2e3R3
	5bwPQiBlT5vl84uHIjcGBETxtc242vyqxfSllcKUUcPXXPQTSN7ojaFPFW2MgE1AwX2OQahbJ6Z
	kN3x8XlVnlCocdAHy/PDR9fxF34kq+0Rml4gnRQeyT1DfWwknQ9xkK8JOeTxGk9FIXwn/SZS1z5
	HROoxNcREr5B4Pm4dybCIj5wjlubLt/wPAvNiFcWMmlBVz1dTtx8nT
X-Received: by 2002:a05:6a00:859d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-84591a1946amr5158854b3a.0.1782278345062;
        Tue, 23 Jun 2026 22:19:05 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4127bd0sm894643b3a.53.2026.06.23.22.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:19:04 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:19:00 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Message-ID: <ajtoXTaBEMSyGADX@google.com>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618031338.1011410-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_221906_905122_4283E414 
X-CRM114-Status: UNSURE (   8.99  )
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

On (26/06/18 12:13), Sergey Senozhatsky wrote:
> This fixes several teardown issues:
> 
>      INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>      __cancel_work_timer+0x3f4/0x460
>      cancel_work_sync+0x1c/0x2c
>      btmtksdio_flush+0x2c/0x40
>      hci_dev_open_sync+0x10c4/0x2190
>      [..]
> 
> close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
> In addition btmtksdio_txrx_work() re-enables interrupts regardless of
> close/flush being executed on another CPU.
> 
> v3 -> v4:
> - fix commit message linter warnings/errors (tabs, subject line over 80
>   chars).
> 
> Sergey Senozhatsky (2):
>   Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
>   Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope

Do the patches look good enough to pick up?

