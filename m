Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D6606A32E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f72HiZ4P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ijmVvBpG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=; b=f72HiZ4PFaAmkEggxbfQdsWyN4
	6nYs4XQFpnIdI7zsSyqu7ndqjv6pbT+61gxaVm5AsuCZ77PIR0MrjZUZvZ1VCD8KaZgrhQznS76ur
	+2sa4TQwWuWBR3DmAljPJx3r92+nPbPQKNMwnNLqrZ+ZSrgXYyEet1p7BbjKcsnV8M/5FEYIVrVLS
	7v1XnwtJR2fltSMpsBsfjs0QuDoUv3aZw007B/F+OtBlgCOhL9ehxjlwz6rfaAI1Pv+Qc3pTNh6SB
	UA3YSmuxE8j8TdlW9DaqlNOoA+RvStvM1xb88PeH4GagSFQJfhovfJ4v8djiuUfDAE3dlIJIci5h1
	V/hBS1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXmm-0000000CBGJ-07UB;
	Wed, 21 Oct 2026 14:59:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXmj-0000000CBF6-0Kc2
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 14:59:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso718280e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594758; x=1793199558; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=;
        b=ijmVvBpGtk72lpki++f5XRUGr2fJU0s4pUlT3PACt94gIBEQ1XEaJjEy6WCuWmERJH
         xEXJ4gjPfB3OD07OlDh5VMWc1R+zzbXHWoNmrCqVI8ZRpL6ZszPs0atit8DY5b5STCzE
         tBcsZ/tAsNbt5ldCoH+HVrNTa6enpzJbXTTZLk43Kvtu8hd/v1mALjDQUSonB2XJ+ooP
         DH1QAqUaiEfbMIrbh2o7VgtMdUj5cAF7eHWKTond98dnQo86Bb4ENcmRqeiGhuwi2qNo
         4hWKR07n2eXZADWviXuTxCbFK4hPQ8cBihBxFOJHbRNM8NqsIQBlAU4hdUq5t9OPMe2l
         NzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594758; x=1793199558;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=;
        b=DBR8sSX6hpJEeg1pSm0XLXobeEOv/g0rd8R3nTnOecbkSd63B2XAedlmNd52cqMOJe
         qyKIjlQjGwrbh/6JANfe361wZSbUVsXG2u6WjUTv1RIki4lDIjXWGiC+NOx2u39//6eP
         2WcN6Cn7DiA7ySQfr9yUFl2z1Eqd9dMAv6jSu893aMOHJiW6yavIT36oB4rPEEdY3Z6s
         H5dAwFYwsuXH86ew/kkDEMPvkqTPFwNQrZnCfF6aWv7NMh0xqXnSwXFDX7jJpxQzzvyK
         RLWes2cDSqkw++dhih7YFS7KFM1f5xajr9CUBvG8RqhkGmLg6JhKd7GwKUfO3BZwTbhR
         yUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPk5Sg/elAt+Xlgdh4W2rC+cVxpISjpAMuTSIcaFasSOwYnqwmTDvO4wn+3uisNyCtdcnB/4WUjN5QJEGfcg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKxRk5xKJRJSBdz2/ypq6fYqoNNvS9NYqbrq6JU1Pd0k3KazAhV
	H4VrzQ7a0fe8fTrB55fnpGClxrir/WnubkhIGSIqRN+rLdobony2yLV1
X-Gm-Gg: AYBFou0rASTeLeg+k6XzZFw3hRcGc6PvO5f+tP3snr4cFYuO6jtBkpo8+7Gp/CRoR4b
	lRvpe2lv74+eP840COyffwMHJiFcnMOUo5mk7l6Tr9ANQA3GJ79bhZyMe7KNzrv7d1YyLobVAtz
	o7s/FM2VkGNc8rOOZtmAW4RuL5Nx78Vz/GzYvf5bo3TnSmtBCzO/Voqrad5ifVxLXe/JZPVywev
	ZYsqCYr0Vcq9qfG8OEPwQGZqDRWrTcSV8DSEUJYk2GdXYkhow/x7yVfv2KyjlyfQW69BS/oQeoS
	nvCLnT5kBNpkX1YU5VCmXcZ/I1bGuqf/oz7yIg2OWbX1DNOKa9M+hUo01RfbNw3Bz/OphXFvNHr
	Rjye5erSQoQ9meqWpjXTEOdc1jSuA/Q3e2vzjxctDjUeBPn08p1U8AilWiPXKcpiQonp9yLQQm9
	t/nxiqmsbeBNS6Mh9vhQ+W/XE8KI2X8KTD7Uh6HFA2ovLlc6RnUH8Aq9phDoe0LeQ5RiwNXgbna
	iXFsX3BqEFyPyaYe+DmwbeVlBdBVs+RLwspDCnXVai3JjUrhapCJ9tB0iD2YBniLqDOgm6Eiflf
	SfrlWjgl+zm7INGU
X-Received: by 2002:a05:6512:65c9:10b0:5bf:a34f:b94d with SMTP id 2adb3069b0e04-5bfa34fb967mr478168e87.9.1792594758106;
        Wed, 21 Oct 2026 07:59:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.249.168.112])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4b90999sm128327e87.68.2026.10.21.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:59:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: dma: run threaded NAPI kthreads with
 SCHED_FIFO low priority
In-Reply-To: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
References: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
Date: Wed, 21 Oct 2026 17:25:53 +0300
Message-ID: <179259275334.35963.15413466304986880275@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_075921_140577_272F82A5 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adding netdev to Cc, as suggested on the GitHub mirror of this patch [1],
since it touches the scheduling policy of threaded NAPI kthreads.

For context on why this is done in the driver rather than left to the
admin (chrt / sysfs): mt76 already does exactly this for its other
rx/status and tx workers (sched_set_fifo_low() for the usb and sdio
workers and for the tx worker), so the dma napi kthreads were the only
mt76 rx path left at SCHED_OTHER. A userspace chrt also has to race
the creation of the napi threads at boot and module reload.

Numbers from the setup in the commit message (MT7621 + MT7612E as 5 GHz
client, 3 runs x 5 min each, ~200-280 Mbit/s rx with userspace load):

  stock:                  ~500 full-ring events / 5 min, watchdog
                          resets and MCU timeouts, occasional hard hang
  this patch:             0 resets in 3 runs, rx 276-288 Mbit/s
  stock + chrt -f 1:      0 resets in 3 runs, rx 249-273 Mbit/s
  napi_threaded=0:        0 resets
  rx ring 1024 (stock):   800-1300 full-ring events / run, more resets

A similar restart pattern is reported on single-core MT7620 at much
lower rates [2], which fits CPU contention rather than throughput as the
trigger.

[1] https://github.com/openwrt/mt76/pull/1164
[2] https://github.com/openwrt/mt76/issues/457

Thanks,
Fil


