Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19BC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pc/Sfa/uvyYzyrCdTxcbvx9K9W/z6iYPxxsGml4BfXQ=; b=AZUmhPlclMUiORPk48WuxRRIIu
	QQI5z8Sj9thZVfi6Z+YwI8BakmXCTC8dLabFaLH5ucNY9klyNwZ40JaiynwT5lLjdea9Ym4T3BEYc
	YIPNjZ0wJL8CoIpB1wL0tJBSusgk2ZL0xj+df0h/TvDe7Vm00Xy0yJ8oVCQ/CL7t3yHE4mN1a5R37
	qZFyueEhKZ7OZFl+s0PIVA232YZEhBA7bQsZ7lh9sU6DnNXez6kSv2XU4qAHFJpGL/GZj0y3hyAVH
	yA7v8Iab9QrR3XCwp9GgDUqP5J5X9Lki9qETIGmbvtnL5OX27YyZUJphoROLqypbZrU0LUl/inS15
	ppvJs1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T4u-001ekx-1d;
	Fri, 26 May 2023 08:45:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T4q-001ejn-38;
	Fri, 26 May 2023 08:45:38 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D0B496606E83;
	Fri, 26 May 2023 09:45:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685090735;
	bh=jIYCjGbXEyWJJEvEqZFXDnEttlE1pdHBfo4pRBrBZ44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ddK5/GN9kRklJI2XLwlNE6peqrD4tc8nVY5l2UQ41DrEC44HDa+qWEkoxqNMbJLgF
	 FxYJM7znsKalwM09C/EjgdvjYdnhB1Lu9mCrvmvIGYAFPv8ePMm7llLDEdaoCXLydp
	 RjLGCxvZsLX1d0k71oNsBQTyxypn+8p34mTrNs0vYFyKym+1MNGLwMze01bxEUJCBe
	 DAJhb3Z/vPGM06ZQ+3/Zbh13CswcOPkgdbgv8u+pz1jHAm7/jLzZkBGyku+DKAbXUg
	 iCnTdzx5QI/RURMXHwOoUJtVsKPA+eVlXBz2RxePNN6DYdYcBENtP49hZXOHAeH+nd
	 0fwUTB3RJT0sQ==
Message-ID: <23366389-1be5-92ef-7728-ce639d46a0b0@collabora.com>
Date: Fri, 26 May 2023 10:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] notifier: Initialize new struct srcu_usage field
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <20230526073539.339203-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230526073539.339203-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_014537_140987_32CAB1B0 
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

Il 26/05/23 09:35, Chen-Yu Tsai ha scritto:
> In commit 95433f726301 ("srcu: Begin offloading srcu_struct fields to
> srcu_update"), a new struct srcu_usage field was added, but was not
> properly initialized. This led to a "spinlock bad magic" BUG when
> the SRCU notifier was ever used. This was observed in the MediaTek
> CCI devfreq driver on next-20230525. Trimmed stack trace as follows:
> 
>      BUG: spinlock bad magic on CPU#4, swapper/0/1
>       lock: 0xffffff80ff529ac0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
>      Call trace:
>       spin_bug+0xa4/0xe8
>       do_raw_spin_lock+0xec/0x120
>       _raw_spin_lock_irqsave+0x78/0xb8
>       synchronize_srcu+0x3c/0x168
>       srcu_notifier_chain_unregister+0x5c/0xa0
>       cpufreq_unregister_notifier+0x94/0xe0
>       devfreq_passive_event_handler+0x7c/0x3e0
>       devfreq_remove_device+0x48/0xe8
> 
> Add __SRCU_USAGE_INIT() to SRCU_NOTIFIER_INIT() so that srcu_usage gets
> initialized properly.
> 
> Fixes: 95433f726301 ("srcu: Begin offloading srcu_struct fields to srcu_update")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


