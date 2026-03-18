Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D91077617
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebwoX899bJ3/ex4ykPxG3lBEQEBrM4+wRsWvTjTwu5M=; b=kYezUJ9/WDLswcecimv2zWCppq
	obJyADbp+CDLhxXQOwnRRAl0/adnjwqUPRDt/HjjiKeYLLrbt3r/7sXpCn8e/12mheb3+LvoBp0mz
	TS6E2A+YwsCKIm1iBL/eEhDGAlZwPg/QZtNGJ35SHsQH6B4u4fVFTOENp+no73XN4wmW0iVTJ9OH9
	jD6mrYWdJBqdJFtGZNEZxwpSK6pDTG7RXT9A1ylZSyjuvSLHkJ5ur272+HHsFTenujSo1MyQXbcrS
	V4qz/qdR2VSGSqVijVoCp/Iba0Lzld0/b8QZIsJedrQXqZMvU4n8xdlqQS//Ghu945odWG7HATfo+
	IeMjsU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xf8-00000009JN1-410x;
	Wed, 18 Mar 2026 20:38:42 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xf6-00000009JMh-1p7P
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 20:38:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fbgdr0L0ZzlfvpK;
	Wed, 18 Mar 2026 20:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773866308; x=1776458309; bh=ebwoX899bJ3/ex4ykPxG3lBE
	QEBrM4+wRsWvTjTwu5M=; b=q4HQRJ/u+U7QpQQLtsSuVwHRxpJh96vDHeu97jSS
	eR8ih9rBrAUTfzVd7owZKflZ8n9G0UQHsMiiuZOsvS0kb9mVbviw+8DUtl+MZr0B
	CiiO/YlhiU843CBxvHoGK0X9Mfu1lZfUWWQk9ql6IKPJWROPcKHtoQ/9J5oVAGMj
	+SIafgRxf8qIci5zDYSJumdqwLvx9s1KrSiuJXy85VdGBZyzsNVzRIkvK1UP7RfS
	i8HLACzpoQCBxlmms+n+eBC0RPU+3OKDmTe1QFa/s6BBS6Dv9GErBU1sYekhH6q0
	/6WABozyqX14qlEe8bGJGwOIU6WizZA4NucDfDdA3nO7WQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Qqv9L-rhe8XI; Wed, 18 Mar 2026 20:38:28 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fbgdP5gRHzlfvpG;
	Wed, 18 Mar 2026 20:38:17 +0000 (UTC)
Message-ID: <606f995b-642e-41e3-8c3b-a9f02ef425e7@acm.org>
Date: Wed, 18 Mar 2026 13:38:16 -0700
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
 <df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
 <1b9db59c-f736-4c59-b37a-15a60cfa4f3e@samsung.com>
 <364d15bf-8d11-46af-bbc6-b4ae45618bf5@acm.org>
 <c9b421aa-baa7-4609-b665-226f894f5114@samsung.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c9b421aa-baa7-4609-b665-226f894f5114@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_133840_647552_81FCD9B2 
X-CRM114-Status: UNSURE (   9.41  )
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

On 3/18/26 12:32 PM, Marek Szyprowski wrote:
> I must have mixed something while calculating offsets for addr2line. I
> checked again and I found that there is already a script doing that.
> I've recompiled kernel with -Os (assuming that this way less code will
> be inlined) and this is the result:
> 
> [ ... ]
> 
> # ./scripts/faddr2line vmlinux "ufshcd_sl_intr+0x50/0x598"
> ufshcd_sl_intr+0x50/0x598:
> ufshcd_uic_cmd_compl at drivers/ufs/core/ufshcd.c:5570
> (inlined by) ufshcd_sl_intr at drivers/ufs/core/ufshcd.c:7144

Thanks! So it's the guard(spinlock_irqsave)(hba->host->host_lock)
statement. Not sure why it triggers an "invalid wait context" complaint.
Is CONFIG_PREEMPT_RT perhaps enabled in your kernel configuration?

Thanks,

Bart.

