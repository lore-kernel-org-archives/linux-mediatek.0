Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A535C3271E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2RooQsdyisGBlzqbeOLqTi+HuxdjKBsH+GNi9Ka0GU=; b=am/gkq/zIjMEre5XIUqR+hj1Hf
	wjwevY1GGA78Snjhbi8mTqX5LcIwZln7OFFm4YN2qdVjMyoX8R3KqhjGpXErV36Tqpexg/uGg+OCT
	fXvTkRfvw5zlqLIbEdwolygtUJkKrWdVOsblX96jDj6tTV+znFWb+59jFZ2fUrjQ2rJukpw7x1ZqY
	NyNtn7B+JRi0ndB9cSJo5rmK3zEHwk8+XQPSsUYdgj1YJWE/FrdWCJvby7Kfqrq5aLV/kEQ9M1h7c
	c8yaugs/HXMnTNSCFSN+IhAwTM9UXkp04ZzqU/vanny6/Qi8SXKjyDzn6Ej7K6ok/JxVLghvttQ6V
	XLRfW05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmNl-0000000GUh8-2f12;
	Fri, 05 Jul 2024 17:06:01 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmNh-0000000GUej-2QWG;
	Fri, 05 Jul 2024 17:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720199145; x=1720803945; i=markus.elfring@web.de;
	bh=u2RooQsdyisGBlzqbeOLqTi+HuxdjKBsH+GNi9Ka0GU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YoHVPQsoBN3B/qcTdZFHrZgvbtHbAGusVseeGnXZtkTw8KYzrLYEVIdzI7ZXUaxp
	 FiAPrRuV6K0p9VD7re9PAW7fdSdSpSgjQTMvtsGqMIhb6Ng3dyj8iTTatJ3PCOywI
	 XYpRyhfL1QndX8DQ6c5kRTEFrW/Gh9cPsiB/hE7C2vob2soo9eaq5oDVrH1/9Qnrl
	 2jS4YFSJkwh0TLx6Sd18RMC7v8N/942AtfkzC3tDICS2GOMy5rPiEO0gKrOc6oSa7
	 0RhMP4eVBPV2v2ZXQK+DW0n8DOVWTehAiTRXASgaH3vxDfNpLlcFEehm7Q1xE9/Qr
	 hwe9MPiGycmrqtrmig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7elj-1sTNHY1lML-00EUla; Fri, 05
 Jul 2024 19:05:45 +0200
Message-ID: <8f3765db-842d-4568-9ac5-1bd9cab9e952@web.de>
Date: Fri, 5 Jul 2024 19:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boy Wu <boy.wu@mediatek.com>, cgroups@vger.kernel.org,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Burkov <boris@bur.io>, =?UTF-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?=
 <Iverlin.Wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20240705075544.11315-1-boy.wu@mediatek.com>
Subject: Re: [PATCH] blk-cgroup: add spin_lock for u64_stats_update
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705075544.11315-1-boy.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ayo5EbRwEqmDRRhHjbrfG+GdJmG5xslZvjTVpGIYlCSYDs2UzI0
 7tLAgu/BT63IofbURgzLmEiBsCmRrwDzc7tjNThfuJ4yKgonQDUpXhAZyX75iNzoeBqB18r
 z24cVHK/zq5pC7HvnePynvxIwShUhjh7nulYiHE40cvYMBBLJd4TBgYfO4OjLpXojO7db0L
 JAK+TppIqxNJ5E2OqwiLA==
UI-OutboundReport: notjunk:1;M01:P0:q8o9wnhjwg8=;fuUncGxrazjlzlVcIbRUWBGnGZV
 RroQTojOMj6YFd+0bsebNN68Dt2bjb7X/lNW1QETrdDyJlYI3jibXd+EvwRhxvI3hX4kSppgI
 URytC5GEnf5cPQKEtT5cxJ+Z9Zalz7eqwIJ5YM8g7NIbSm54VFpT9h1T+r0N70cQu07yzfOC/
 +jzL/dmlOFVXKB5yjJfhJVcwNSsRbRhJF2qdP3qVK703xlLBsLZL+NKgYrsom6fpaeW3Z8Otm
 ysJ/n0jsF1savRAnCYYmrasdeOLBty8ZjP0rXoVU7H7nBBGX8mkw5qlwgFEd+cINjgeyF90Mi
 dWak2869vcFk8CTs9eKcmci9tr4OindQoL9wQMnL7ZJARO7ES8gJEApVypfJqeCD61QQD1nbz
 P8IKTYwRjYTa8kuK+bjEDjal9pp0OAtU8PC5O0+294PHON+Z9N8/yCaE2wWi2xOs/InE8Eclf
 SUDqby7e11ILnu7rrbmWKZc2FMSAcdO+zW5vS28X6eAgqoAJBtdKvDGRuBaqqV0PMGsCTPvb6
 l/tAuFVWWUhxpwBwQJ1kXVNNsju+exec+oYkmO8SKzzVfhNdYZQxCbpwaGRTPmSDiETeZ/X5Q
 fb+M8KiBzpUFSwElStP0ca9CU0lRYZVx2chkSWxE5SdA0LK2y6vJIfqeC4TO510AvlE26gRxG
 SEO4HKWrt602m/16cjY7HuQHacolS9uMikW4lQSNZP/CjV9OIx03NrkDwErc956jxMMGPnkyz
 PIdLoScwDf/KFhFXJfCZS+NjdPgXNACWkNS256Izw7ojF42fN53wq3phhjjY2GjVG36y+uvNt
 69FIquVHwEABPeex/qoHnhsSpwNZ6yL1FaWF1JqM7mL/I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_100557_937908_35EDC2BC 
X-CRM114-Status: UNSURE (   9.14  )
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

> In 32bit SMP systems, if the system is stressed on the sys node
> by processes, it may cause blkcg_fill_root_iostats to have a concurrent
> problem on the seqlock in u64_stats_update, which will cause a deadlock
> on u64_stats_fetch_begin in blkcg_print_one_stat.

Would you like to mark any references to functions with parentheses?


> To prevent this problem, add spin_locks.

Another wording suggestion:
  Thus use an additional spin lock.


How do you think about to use a summary phrase like =E2=80=9CAdd a spin lo=
ck for stats update
in blkcg_fill_root_iostats()=E2=80=9D?


=E2=80=A6
> +++ b/block/blk-cgroup.c
> @@ -1134,9 +1134,15 @@ static void blkcg_fill_root_iostats(void)
>  				cpu_dkstats->sectors[STAT_DISCARD] << 9;
>  		}
>
> +#if BITS_PER_LONG =3D=3D 32
> +		spin_lock_irq(&blkg->q->queue_lock);
> +#endif
>  		flags =3D u64_stats_update_begin_irqsave(&blkg->iostat.sync);
>  		blkg_iostat_set(&blkg->iostat.cur, &tmp);
>  		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
> +#if BITS_PER_LONG =3D=3D 32
> +		spin_unlock_irq(&blkg->q->queue_lock);
> +#endif
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irq)(&blkg->q->queue_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/spinlock.h=
#L567

Regards,
Markus

