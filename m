Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BED2CA9ED0
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 04:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFZBc3iUssUxaU+HCA1S6aw+ff8GeyJdg9OYN92Mce0=; b=xDjCHkm2v25t5ZrHhAn7Xp1Ndn
	ob1rVjZZSgZCQksyTFpSL4/UjXyoh3MulVfDds583pL6fGir2VSVC5C/US2gJdvIz8qKcsfkMkMdC
	WergUrDTQTjP0mZxsPh0VI6Rke4Gv8nExenS4GpCn1e6xEtnLrgBvPZgbCB5bUWtctfd0xInQF5Mc
	+0iFnRU9dLpL4LqGSV8pYw6bnwPXH87y68fXiITA+JbOYZs/IK6/A04mopv7XBS7FWiqP3RYo0EnI
	T5mQt40R1HqMOrmcstuRjNimRcvYz3mIrGDnbppNIiQeA+WJf1HeCUn+UK1k5GexL7FLCYoBugMh6
	MBP7bYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTxr-0000000BxP7-43sq;
	Tue, 13 Oct 2026 04:18:11 +0000
Received: from out-76.mta1.migadu.com ([2001:41d0:203:375::4c] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTxn-0000000BxO7-1Dsz
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 04:18:10 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=D2/0lUVxr1EU7IvTNII6oaXLpTOYspl0xBukRl/a6dk=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791865084; v=1; x=1792469884;
 b=GO8njEdWWQ5pkqdg+LJ5pJr5dF9EIsVJZTU7UqpUOYVsvuWmmrm1YgEwvihJLXcTHyp1KfAu
 jppkkTaPLmybGeRiJqFBriDLtIevvqzeIAHLFEq6KzXCr3Yd5ZjVQPeDKB5YRwd6n/FceU4G6pw
 6UhLGJOPL1JRfzdxGtBlTCZxzreYvVWHhwn7hhm+5ejuZfYjczhV3g2z7PzHkOtannuyqX7BLB4
 P4BCx+uERGFQUHbhePTZuPcDcSfX3+peQJuaKCMS3Pg45tlZacz/m7nEXmcmbDvcjAIW8lSD8AW
 Drk+teZMJa7CdOia1hdw12AjyfllLGDz3oF5oKechFiTA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cafda22c2f51ead9;
	Tue, 13 Oct 2026 04:18:04 +0000
X-Mizu-Trace-ID: cafda22c2f51ead9
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Eason Lai <eason.lai@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kun.wu@mediatek.com,
	deren.wu@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>,
	quan.zhou@mediatek.com,
	Ryder Lee <ryder.lee@mediatek.com>,
	leon.yen@mediatek.com,
	litien.chang@mediatek.com,
	jb.tsai@mediatek.com,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: Re: [PATCH] SER: mt7925: race condition in mt7925e_mac_reset allows compromised WiFi firmware to trigger host sk_buff use-after-free
Date: Mon, 12 Oct 2026 21:18:01 -0700
Message-ID: <20261013041801.268294-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012032657.58631-1-eason.lai@mediatek.com>
References: <20261012032657.58631-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_211809_241458_01178827 
X-CRM114-Status: UNSURE (   6.69  )
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

On Mon, 12 Oct 2026 11:26:57 +0800, Eason Lai wrote:
> -	mt792xe_mcu_drv_pmctrl(dev);
> +	__mt792xe_mcu_drv_pmctrl(dev);
> +	clear_bit(MT76_STATE_PM, &mphy->state);

Eason,

A heads-up, since this one is on me: my d12a54be2604 in mt76 changed
the line this patch replaces, so it won't apply there or on
wireless-next as is. That commit makes the reset return early if the
driver can't take ownership back. If you want to keep that, it would
look something like:

	err = __mt792xe_mcu_drv_pmctrl(dev);
	if (err)
		return err;

	clear_bit(MT76_STATE_PM, &mphy->state);

Devin

