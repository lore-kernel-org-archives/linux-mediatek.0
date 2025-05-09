Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE95C3ABBC
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTTvMUk6mjdxRIBg6IGzB6CZACy3mVbN3OsARKoGjBc=; b=n3g/ShWcvuVY2uTyh8J3FM8Bdq
	aw6E0zAfRO21syG2hVY5134uJfD+MFP0YDalXMfHzfw1kdrvqRINGpiNOavhFclfrAdLd8R4hckjx
	H9OoB0Q+5qauVHJWHfvtzb5ClrJboA7JNhpDSmzozSDfxEfiAY6g8tconlsDOMFmBTN7RWWF0Cniq
	cVhCMDBvbeLHIg1py27Y4KivAzPej0t+2Bf3VU2mTcvGXTtB4LtFyKxuAi/l6lYBmYUvHfI0dQaxr
	Jq1C/uyccW3Wu5UJYkaGFCwHiTc/296Y2hr3TvRIZbuCPGxIMHNHLM0HUu2yBIUlzDijkssE6cGCJ
	qiTbQxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRNJ-00000004Q44-1vPz;
	Fri, 09 May 2025 17:19:05 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPL5-00000004232-18vY
	for linux-mediatek@lists.infradead.org;
	Fri, 09 May 2025 15:08:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZvC7H1R2Tzlv760;
	Fri,  9 May 2025 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746803303; x=1749395304; bh=nTTvMUk6mjdxRIBg6IGzB6CZ
	ACy3mVbN3OsARKoGjBc=; b=Q+SyY3ZjbucG/evkbgE9G/scOdYQDjRidyJGDOX6
	uituz5P3IGa8XDhWv8HIqoE0dcCocwczs4FNhN2CNYoPn/nRWRMe/QzdXmBANib7
	ugkNYeM7BZJFGK+peWNMrugtaMd8lfwl0rAFkf5NXOchHTi4/aw71q/1GYtlEVNp
	BUUNzDRoU9YvqX/Biafg+ZhAHOTkiITizrqq3DbQNevHEna02liL/+M7v3lwE+WR
	wPzBnsC7EOQ7l3tLOjCMLgRZDJCJUBJg6M1h/p5zWc3yAvm1rUn7vRP3k0fEYjM9
	dzxCi8Oe1CaUS7mPuFfAUAkytDLxrwp4DwDuwx80cvqcmQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id atU53Y_nnf9C; Fri,  9 May 2025 15:08:23 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZvC6p5BMQzlvj04;
	Fri,  9 May 2025 15:08:01 +0000 (UTC)
Message-ID: <946d62cd-b1a1-4ddb-8411-2060362f7d33@acm.org>
Date: Fri, 9 May 2025 08:07:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: support updating device command timeout
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250509071029.446697-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250509071029.446697-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_080839_402256_A557E52C 
X-CRM114-Status: GOOD (  11.48  )
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

On 5/9/25 12:08 AM, peter.wang@mediatek.com wrote:
> Some UFS device commands may timeout due to being blocked
> by regular SCSI write commands. Therefore, the timeout
> needs to be extended to 30 seconds, matching the SCSI write
> command timeout.

Does this happen with all UFS devices or only with some UFS devices? Is
this behavior perhaps a firmware bug? Processing of device commands
shouldn't be postponed until SCSI command processing has finished.

> +enum {
> +	QUERY_REQ_TIMEOUT_DEFAULT = 1500,
> +	QUERY_REQ_TIMEOUT_MAX     = 30000
> +};

[ ... ]

> +static int dev_cmd_timeout_set(const char *val, const struct kernel_param *kp)
> +{
> +	return param_set_uint_minmax(val, kp, QUERY_REQ_TIMEOUT_DEFAULT,
> +				     QUERY_REQ_TIMEOUT_MAX);
> +}

This change makes it impossible to reduce the device command timeout
below 1.5 seconds. I think that setting lower values can be useful for
error injection purposes.

Thanks,

Bart.

