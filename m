Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A3C021A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2025 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoN3YQWZuS7gLH6YxFu9pp95THUbAVtpkTvz38GaATY=; b=aPT7xl8npQhGcZ9FNQBA0qZGM7
	5INGgMhlOlXroO2HKh60ZVsaOQDhsLxcsPZZeNqy8VoRZR+CaOFPR8+nCBEX0BRrEm1SeiFl+uCMV
	5tJCn9GLRhTh4Mg+YsL9uw/xiZCcG7jIuE6FtMsG6oBYM/LM4ji95LDpBzjDAiIPRYYLnMS+ocRAM
	odL+B3EIeIktSR6HoEWHmlb2bK4T+vConJe29/JFHYBNvT+3QYSZg/zJYbo6Ipq3+Gy6EpUm5eVj9
	CRIAGYgeu2PAzXLlKONFPnz76MqQTGMfuksdl19MAPm9QEA8MXyZO6k6o9PRyx/l1qEVwvwXEvJlh
	B1jkvSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHv7-00000008YmN-0Iei;
	Wed, 12 Feb 2025 18:57:13 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHv4-00000008YhP-3PRv
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Feb 2025 18:57:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YtSGr3K9RzlgTxf;
	Wed, 12 Feb 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1739386619; x=1741978620; bh=ZoN3YQWZuS7gLH6YxFu9pp95
	THUbAVtpkTvz38GaATY=; b=4fQKToov+7bwrlUC3Yjn57OE6wdkw/xyGLaZht05
	Vts8DefGP0zIq/wI7s7QqT3Z0kcJcvJSI+LPNmYNzv3EOwmrhk8ydBvdVR9FlkR3
	MFyFp4FTVTfRSgtxQ47IvIQgQXCaAYYvzsDDroDiHi6A3MJyulQ+MgvJFb5NodUv
	PIbu9PIH7R2yh85PBL7MHY2d5mUVwtaP9Gbtu6NkkIbgDI+ibparZq1ZsTJy36Kl
	L49kqD3IRA8CZMd9/VhGjdue02XsUgs1z+A2g6hjTyKyqiFuzhiEVe5LdCTK1yuO
	WWUKk1z1dZ4xyixQ1iw/AuGyHjDuMfDZbVqggc7Qwj24HQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id dePFMeHZ9OkH; Wed, 12 Feb 2025 18:56:59 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YtSGZ2ZGzzlgTwc;
	Wed, 12 Feb 2025 18:56:53 +0000 (UTC)
Message-ID: <2fed801d-9cba-40cc-b50e-7ec9de041f1a@acm.org>
Date: Wed, 12 Feb 2025 10:56:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: add hba parameter to trace events
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, subhashj@codeaurora.org, sutoshd@codeaurora.org
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250212101723.716477-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250212101723.716477-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_105710_866707_D9C52937 
X-CRM114-Status: UNSURE (   8.92  )
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

On 2/12/25 2:14 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufs_trace.h b/drivers/ufs/core/ufs_trace.h
> index 84deca2b841d..e175020a2fcc 100644
> --- a/drivers/ufs/core/ufs_trace.h
> +++ b/drivers/ufs/core/ufs_trace.h
> @@ -83,17 +83,19 @@ UFS_CMD_TRACE_TSF_TYPES
>   
>   TRACE_EVENT(ufshcd_clk_gating,
>   
> -	TP_PROTO(const char *dev_name, int state),
> +	TP_PROTO(const char *dev_name, struct ufs_hba *hba, int state),
>   
> -	TP_ARGS(dev_name, state),
> +	TP_ARGS(dev_name, hba, state),
>   
>   	TP_STRUCT__entry(
>   		__string(dev_name, dev_name)
> +		__field(struct ufs_hba *, hba)
>   		__field(int, state)
>   	),
>   
>   	TP_fast_assign(
>   		__assign_str(dev_name);
> +		__entry->hba = hba;
>   		__entry->state = state;
>   	),

Why to include the HBA pointer in tracing events if this pointer is not
used in any TP_printk() call?

dev_name == dev_name(hba->dev) so the dev_name argument should be left
out from all tracing events that now have a HBA pointer as argument.

Thanks,

Bart.

