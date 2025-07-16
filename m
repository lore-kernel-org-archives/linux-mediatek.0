Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C85C83F22
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4GE33CgQ2bpHUiDwA1SuAmtuBpcGtsm8Gn0Quu2O7I=; b=mtq/UUZqRMp+HM/dPanRx5aycG
	p8Tb/9qoOKKIihoiP0nH7my9JxzReZ8z3cixD2XurBy7FwzqjKDwxrMdqr9KbOfQGdhgGIH/4xhrh
	3IBbG1qLGaXNAjSVF4zdhxgf2uX/xlPLAlQW2ho1dhc+RGW98xsETzMExf3ekFweB02E2KV8J5hRt
	gzwhMbrkDI0gwmsGDwUlIFA5rbbGVWHgKlszS9hsd/BurwwhcK6wmOM8kT7ipJlpQGZGuA2tIv0BE
	hN+uVlZU50QmboLhCtnOvA/8i0CTx+ug72xw1eN7Iyu2441WR89o3awnuqgsE0q6SoX6oDeNTGz6K
	GD8q/RPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc446-000000083yu-035S;
	Wed, 16 Jul 2025 15:29:02 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3yA-000000082fO-1dre
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 15:22:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bj0DY3kjLzm0jw2;
	Wed, 16 Jul 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752679370; x=1755271371; bh=C4GE33CgQ2bpHUiDwA1SuAmt
	uBpcGtsm8Gn0Quu2O7I=; b=gu0eO/SMvTj/F9ny2RwtZDCEJFqikqhe1HM3WNl5
	uVmfxt3sK0842mHnxqpXuCZ0F4ndOyiSBtpqS4MG0s4ifi8LWAlgDuZhmvcw33xS
	cocDQ+d/kpKiY7lK4O2PP7Z6dANpD2FaAPQFZERwl5BtUjnASRntzG5Giu3Mf0C+
	sjPwUPjIURBwqpBtXsJL4+NuCkcJEBB2P4XlhBhPO9WpnpyOenz2MS54x93LwJKX
	Z/I3KsPjpeVTO2zTAKYrEroVa2aoRc2HANGaJYcjvuYiwZCKpE4J5uHpSEQmWD/A
	IQkfCB8RxtKxtZXv7W/d/VqJzePt670b6m2ow0PntQpIFw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4EmoW36kRg-e; Wed, 16 Jul 2025 15:22:50 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bj0DD30bCzm174m;
	Wed, 16 Jul 2025 15:22:35 +0000 (UTC)
Message-ID: <9aafec2c-199a-4373-bdb1-6031f574af6d@acm.org>
Date: Wed, 16 Jul 2025 08:22:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] ufs: host: mediatek: Add DDR_EN setting
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250716062830.3712487-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082254_510101_48292C23 
X-CRM114-Status: GOOD (  10.45  )
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

On 7/15/25 11:25 PM, peter.wang@mediatek.com wrote:
> On MT6989 and later platforms, control of DDR_EN has been switched from
> SPM to EMI. To prevent abnormal access to DRAM, it is necessary to wait
> for 'ddren_ack' or assert 'ddren_urgent' after sending 'ddren_req'.
> 
> This patch introduces the DDR_EN configuration in the UFS initialization
> flow, utilizing the assertion of 'ddren_urgent' to maintain performance.

What is SPM? What is EMI? What is DDR_EN? Please expand these acronyms.

> +/* UFS MTK ip version value */
> +enum {
> +	/* UFS 3.1 */
> +	IP_VER_MT6878    = 0x10420200,
> +
> +	/* UFS 4.0 */
> +	IP_VER_MT6897    = 0x10440000,
> +	IP_VER_MT6989    = 0x10450000,
> +
> +	IP_VER_NONE      = 0xFFFFFFFF
> +};

How can MediaTek IP versions be related to the UFS standard? Should
"UFS" perhaps be changed into "UFSHCI" in the above comments?

Thanks,

Bart.

