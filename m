Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7A5103E19D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObCIHIt+y1waPC5OHqwhFDJKk36uZG6g9VeggOOMmyo=; b=WYB/+syaN2yK+qf6OAc3T9g4l3
	Cd87PdXBo80cbwcqATVgHzVJVW6x4wjmjWptx3nBXwkpat8Upe5LWm6ngPnr6Etlm6+bbqdbmIB6F
	aZfT7fk0iffJnTqQmJhoDNN9m9Q2y7vML9/+oZF7D4iOMiySNuGJhMHDYcapsuPa9FGkVs6cM+77e
	6ecoMsFsn+igmZvejlZBejVbqagbPbXqi14UWve+SFRVpODe7smzhDjcFhbikgC00oRO/4D6a3hD+
	7cSmMdf1QjHnQZZLEBTU155nr9GqD+8+uRhAF7+fHb2LOuIUiKafrC2WITFsGPTmkPBYVk88je8sW
	Wt5niqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tAr-00000008lVh-2VV3;
	Wed, 18 Mar 2026 15:51:09 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tAn-00000008lMN-4ACk
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 15:51:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fbYFz2D2bz1XLyhK;
	Wed, 18 Mar 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773849043; x=1776441044; bh=ObCIHIt+y1waPC5OHqwhFDJK
	k36uZG6g9VeggOOMmyo=; b=phtHDDPAlPO0w3tQCoex29e6eplm/NbfToZxFsg9
	qhAHTYduf98uq70MgDTUKP6aSu5ncicptLKzbPoyoASRTXVZ5b2VIPbnx+mxMPwK
	gU4/GSVk6W9GiaxDKKkRfh7LpIGhohot2fTgRqsddT5ZtdWmuyYyCCAMcKli36KV
	RJyyRawKojCcPbgd5TPoK45DvTQ6ZRzBIOKs3KGEgfr0NRiWQnYqp/gvNK5ZS0Gq
	axy+SiVQt4s0b5ZxEGGIZJM2oht6Ti3jHia3YUXvQ5TkIyGRrI9xb3+nht7m3zJv
	MPSBZJjtvSIES/v+haYEFxemqtlTUw50uY9Ihm+rUCfSKQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gpOWt2FBNAJu; Wed, 18 Mar 2026 15:50:43 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fbYFM4VsXz1XM6Ht;
	Wed, 18 Mar 2026 15:50:30 +0000 (UTC)
Message-ID: <df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
Date: Wed, 18 Mar 2026 08:50:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: Marek Szyprowski <m.szyprowski@samsung.com>, peter.wang@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@sandisk.com, alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
 <CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
 <1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_085106_113411_CD9A8CF7 
X-CRM114-Status: GOOD (  10.21  )
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

On 3/17/26 10:11 AM, Marek Szyprowski wrote:
> This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs:
> core: Avoid IRQ thread wakeup during active UIC command"). In my tests I
> found that it causes the following regression on QCom RB5 board
> (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):
> 
> =============================
> [ BUG: Invalid wait context ]
> 7.0.0-rc4-next-20260316 #16535 Not tainted
> -----------------------------
> swapper/0/0 is trying to lock:
> ffff000089f58048 (shost->host_lock){....}-{3:3}, at:

This line is a mystery to me. Are there perhaps any local changes in
your kernel tree on top of linux-next? I haven't been able to find the
text "shost->host_lock" in the UIC completion path. Instead, this is
what I found:

	guard(spinlock_irqsave)(hba->host->host_lock);

> ufshcd_sl_intr+0x3c0/0x6b4

Can you please help with translating this information into a line
number? Tools like addr2line, llvm-addr2line or llvm-objdump -d -l -S
can be used to perform such a conversion.

Thanks,

Bart.

