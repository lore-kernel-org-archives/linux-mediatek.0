Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FB7C021A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izx9olkj/og783bsPzUi8osgMgxwmY/GXmYfAw+ZG+s=; b=jyVyNiQc2jU46jwzC1o1Y3kyy0
	f3cs5PTtkqW2KL18inzmHCttG5IUetVh8lKAd+U2ROY6PfnHZZ84eUfbQ/Uumq18NnV9Hc8UJDjZ2
	QEkWumunzFsFQndPmcHnJ0BCm6oZrgHGu+6bGhnXHDUW9DiuN5piZzJZFYNeE2zQRBxT99t3ETjiR
	qE0iNWbfLuOvBjsjNIhfExh97kxQFvw86WCbF+GWf8KyCwp6Ym2TwEjO/vxOH1ehjfkbM/5HqBFja
	nLSkbJFwGKq0uGr+n/T6IA8N2D71YSAKQeKMkoI1CgP1hOxqrQDlLIki7XnON4SA/dV6fH+hVdj7M
	7X7fPyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidYv-0000000C83T-0k45;
	Thu, 13 Feb 2025 18:03:45 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticsX-0000000Bz5i-20Kc
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Feb 2025 17:19:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yv24D6jyszlgTxf;
	Thu, 13 Feb 2025 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1739467188; x=1742059189; bh=izx9olkj/og783bsPzUi8osg
	MgxwmY/GXmYfAw+ZG+s=; b=nPZJIv8gAlsGA8QQ5RZJeFaWsmwS69BZPzdZkK93
	T5GVf/lPW7P+BSTVPA2dAEXrbQOXwmBRGnM8CB4rM4j79iKi3by0MhhcgPb/oNX2
	DWm/1TFu5tfcwCJTaPNz4udON0vlVYk7AtnUaL26CkusrWu/UniSY3UVbcZMNIUu
	7cuCMKv6S0NmP2L6Ci2M4XPI2dr8eSwe5r7O2QM6ssoezbRhTRk7bNxkE/mFFslj
	sGvacvVftlwE0c79tWyST7ef6+jj9ZbHOZWtHPJScbRSqLqoYmXd7SJF46Keltbz
	MAZG9OCphMgaM+lthFy0t1h/TVyk6cMMHgndRK0PkQ1XcQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kQsvQ0A_wL77; Thu, 13 Feb 2025 17:19:48 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yv23z25qdzlgTwj;
	Thu, 13 Feb 2025 17:19:42 +0000 (UTC)
Message-ID: <16f26ea9-69d6-4f2f-9adc-c576c288a2f5@acm.org>
Date: Thu, 13 Feb 2025 09:19:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: add hba parameter to trace events
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, sutoshd@codeaurora.org
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250213113707.955255-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250213113707.955255-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_091957_581377_3BD504D8 
X-CRM114-Status: UNSURE (   7.47  )
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

On 2/13/25 3:35 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufs_trace.h b/drivers/ufs/core/ufs_trace.h
> index 84deca2b841d..2f79982846b6 100644
> --- a/drivers/ufs/core/ufs_trace.h
> +++ b/drivers/ufs/core/ufs_trace.h
> @@ -83,16 +83,18 @@ UFS_CMD_TRACE_TSF_TYPES
>   
>   TRACE_EVENT(ufshcd_clk_gating,
>   
> -	TP_PROTO(const char *dev_name, int state),
> +	TP_PROTO(struct ufs_hba *hba, int state),
>   
> -	TP_ARGS(dev_name, state),
> +	TP_ARGS(hba, state),
>   
>   	TP_STRUCT__entry(
> -		__string(dev_name, dev_name)
> +		__field(struct ufs_hba *, hba)
> +		__string(dev_name, dev_name(hba->dev))
>   		__field(int, state)
>   	),

Please reduce the size of the tracing entries by removing dev_name from 
TP_STRUCT__entry() and by replacing 'dev_name' with 'dev_name(hba->dev)'
in the TP_printk() calls.

Thanks,

Bart.

