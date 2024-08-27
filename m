Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58552C5473B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/zE4MH8MBPQdqBJOSv2ZbjBaJHehVZWIi7B/Klxpak=; b=xSzLiJSWRLZb8Mq3RQc7diXfJH
	LRu7R6B+aRLaVlxv+HiEOL9wLC5HhddqXfwdw3o44EfiMARXwi8qHyWQ06901uclW1yjzx5x9eSbx
	FbXTCvr1nbkH1Fsn7a8Wq6OG1V9cbA19kbbo5re5bDIwpxT4nF9F0g7WUbcn2eBXRdvPCbPE5Oa0Z
	r0tlnP3uShkKYhYqnjNaUN6ka9eUjIc1JOcjsRhr0sFS8Fv3rKGEsvPdD9SrC+e9rRCKXh4Z0H+UZ
	VunHUWWzpaikaofX/5+xTym7vpw8wqyMYXsbjooxFyCAZmZeABMcYA9lTWkd2gPApH5A2lPySUdOB
	IDxqJbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siybA-0000000BzAz-3JUG;
	Tue, 27 Aug 2024 15:59:12 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siyXY-0000000ByNj-2N6K
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Aug 2024 15:55:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WtXFC57zhzlgVnY;
	Tue, 27 Aug 2024 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724774121; x=1727366122; bh=z/zE4MH8MBPQdqBJOSv2ZbjB
	aJHehVZWIi7B/Klxpak=; b=DeXcA7kcD6cvQ1snzCipgyJ55Ws3L6MghCCGcp6o
	dcTQtvA8rWFf1uc1J7YMde9Cq+BaMILbm50JMFD0SCIPjoHdGMfiPAjD0hNc2eSh
	FV75BB7x4PtEeMwzDEooKzN7i4Qwe2ZxetQIt/NT7soMwwomA3p/YSVpn2j9CdGI
	tZqByQaoJDx5rQxtzj394rlynKF6+2XrCfsNzQsZeqEW0Y4H3fBe0JoMhopxNTyY
	XC+6WIQPiLeEZWmzdqbbWCO9ksUbL4GR8X6OfczF2WskOcz8/lajo+bV9eiqju3X
	35DpNX8oOzZg6lcYf4/U5PfD/UxeAhyz8pwO9urqDMQWkA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LWJVzysLiIuy; Tue, 27 Aug 2024 15:55:21 +0000 (UTC)
Received: from [172.16.58.82] (modemcable170.180-37-24.static.videotron.ca [24.37.180.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WtXF012mXzlgVnW;
	Tue, 27 Aug 2024 15:55:15 +0000 (UTC)
Message-ID: <6bf76097-bcd7-4021-936f-9ea3d6e2f4b0@acm.org>
Date: Tue, 27 Aug 2024 11:55:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ufs: core: force reset after mcq abort all
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240826034509.17677-1-peter.wang@mediatek.com>
 <20240826034509.17677-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240826034509.17677-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_085528_651635_BC99C0ED 
X-CRM114-Status: GOOD (  11.25  )
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

On 8/25/24 8:45 PM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> In mcq mode gerneal case, cq (head/tail) pointer is same as

Please capitalize "MCQ" and please fix the spelling of "general".

> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 4bcd4e5b62bd..d9ef8f0279da 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6519,6 +6519,8 @@ static bool ufshcd_abort_all(struct ufs_hba *hba)
>   	/* Complete the requests that are cleared by s/w */
>   	ufshcd_complete_requests(hba, false);
>   
> +	if (is_mcq_enabled(hba))
> +		return true;
>   	return ret != 0;
>   }

Please add a comment above the new if-test that explains why that code
is present otherwise it will be hard to understand why that statement
has been introduced.

Thanks,

Bart.


