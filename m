Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F5CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=; b=v7PwVs/Val2HhfpKWq5yN+RCoi
	hNPjKKNLFXizkqlnJrh/ftYKzKKXudUi99PTZY5we7yhs5J7z2bLgoFfAQ1BW/4WyHtd1WdIKFCDq
	inbztp6S8WzViSiHKoh3Ce7hhz17jrHUbr+I68NHp+CEpzLPF6N6pcZJHIICqNbBuKI6SELrFpD4k
	AoHU63Xb6IND2VWV412EEP81oIeT2BGZLY2fo2kR/aAw6jYlp1AvaT/+UfjPnXmCoVWsGtHEbwGRR
	Rno0wXBinTV6jHSxobrdryr6nuN/yN1eRvkFPD4RysBtyrhrn7m4OUdEV0lAs29ok2aew1RJknDIg
	HSVS7sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEf1-000000077wJ-36eo;
	Wed, 10 Jun 2026 08:51:43 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEey-000000077vH-2lgX
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:51:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so4412810a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781081499; x=1781686299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=;
        b=FOuc64jSKAddwownFH1MZWGbqyHJfj/+HZArNTv3PxFYfYtOlnLcyDPID4IiBrHBMs
         QlNgt/SBKGLgXK9sCmdHH7hBl1aq2oLoat1P7XPXxUmLK1wmtUo8aJCgiZ3zORHARUdc
         BWPTIyaO/MrIE7LXu42CSrvqMNpmTRirteViw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081499; x=1781686299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=;
        b=dwv7gv09FoSEhN3RpGMN7+96Yp8sv6XRSwCy15/bYBMK3V9ZDEawidQfm0+SG3nmcu
         CoIwfBjtywjHLPG40QJ4LwiEDWCrdQDT2m4Td/cIZAtiuW6/ln9I0Q+0NeHz5r1dOyz9
         Pr22xLWlA+1H23fGclI7TnoB5vkyz1ICItc2Ot64vYojRqalxrhwhJL0ToR18RALSB8O
         LpzrbyaAbkIYP+IuSSLO9oImVYIJr4L+m46pcZtbeXcTpZ727ZZA22BLBlrFOG3T7Rr/
         OHt7Wwq5ld0UdSQ/eQfoTghDYTS/Ywki/vsqwkGLgW/KM6RdSPFr9rEINnUOq5SBop1P
         qgvA==
X-Forwarded-Encrypted: i=1; AFNElJ+MqVWTzrFSXFUdPzS9MGlMOS3YisJRBxUKm42RXctZaDjqFO9V/zsJ+9FIDuaE4z9Rzhcc/RruY+GK6Hq7PA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7O3M32xFM/0PjzBAEMWouDmaLcLpNB3lw8P0sSCOjA4wdplaq
	p7SMOJ2XEhbx4gMiroaeZ986FUN3A/nyZ/zqUTT/vg/3l5793lXtFgI1YrGdBjWZtQ==
X-Gm-Gg: Acq92OHfZ4O3XbFird5EihEZ6Tff3nv/3ukV8ZNuEEkdjcSt9tTbIznl0CBMLqETXsM
	TDoJIuifZdCKOKOr0jEHNM/VUClG5237WwhI+bTzM+7XrqFXgMA+d94cUvryDg8A5kI0MbAhV8r
	TLSDyqqFTWblDIrpOgOkbvbIgPZlNlVcCtRL/qFOun4D3uG2Lss5sTUq0EMXOqh2ArgknH8mul4
	icviBCnUy2j9aUpM16+mmwoxqd2n9QMKcJeLcaZcxS3ycjorBfbBeS1l4qVs1QyrlurNhvHxwbo
	b80b3aYpiNHWAVdo6QiQWXFtP8NulF8VXykSqFTYyZ5zlfnHVVIXZXVHX2/CVVMQRaEyduM2G/W
	6hZQHhnxl24YshvoR2T8ThE20qMkMLHLTmUdkIxNIftz049dhtg89Mu1iuGjc8DZrYON3Nw5pKe
	YGbs+vdmuOSySV9/XDt3YHJ3dRApcWG+laF+REYupcdhl8Vi1TWtJ4t//E/vbsgHUVV3LYff9y1
	w==
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr24837129a91.3.1781081499588;
        Wed, 10 Jun 2026 01:51:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8717:e062:7cab:4cbf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a285a1sm21900817a91.9.2026.06.10.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:39 -0700 (PDT)
Date: Wed, 10 Jun 2026 17:51:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in
 btmtksdio_txrx_work()
Message-ID: <aiklN2uHqmJNemws@google.com>
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609121329.1262170-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015140_696904_872C06E4 
X-CRM114-Status: GOOD (  12.40  )
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

On (26/06/09 21:10), Sergey Senozhatsky wrote:
> Every once in a while we see a hung btmtksdio_flush() task:
> 
>  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>  __cancel_work_timer+0x3f4/0x460
>  cancel_work_sync+0x1c/0x2c
>  btmtksdio_flush+0x2c/0x40
>  hci_dev_open_sync+0x10c4/0x2190
>  [..]
> 
> It all boils down to incorrect time_is_before_jiffies() usage in
> btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> to be terminated if running for longer than 5*HZ.  However the
> timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> timeout has occurred.  Using OR with time_is_before_jiffies(txrx_timeout)
> means that:
> - before the 5-second timeout: the condition is `int_status || false`,
>   so it loops as long as there are pending interrupts.
> - after the 5-second timeout: the condition becomes `int_status || true`,
>   which is always true.
> 
> When the loop becomes infinite btmtksdio_txrx_work() loop never
> terminates and never releases the SDIO host.
> 
> Fix loop termination condition to actually enforce a 5*HZ timeout.

Please hold off this patch, this change alone might not be enough.
Let us look closer into it, we'll come back you.

