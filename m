Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F6DCAC597
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=to7t8pxAzeROLpmJIHcDUV0b8IiZYPu9MdlR3yTFEEY=; b=zm0/qpXaIojXl71m+JWwrK5kP/
	tzgDlx5t/tFvZHnR/Y3QjKEiMZIjaTfhFQYsQeCuqeTITr9EoUzKfe05Shg9eHRkPyTR1pb4FnIbZ
	No9NmD8TefKYdbnbBW4i86coVXKsF8n4jlCSM+Ek5gCo1TkyouizXj2ubCEQTYdkwIZ1sA6/D3krx
	THivAtJyotk+NCtdI5/EpXEW1HuApagVlMDDyqQfIisZ7wA0XKPbT3SOTkgP8M66nPj7HovhJZW9O
	M15+btoh/Q7pG6/swCLdTbTOzIPStvhmlBKDODLuUBo+F/aBgHgE+9Go0NbZrr1T1MiUyDd30xhGc
	wvCGEYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKIq-00000000zSR-40Jp;
	Thu, 18 Sep 2025 19:28:24 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKIp-00000000zRy-0RrF
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 19:28:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSQfF5hZczltP0V;
	Thu, 18 Sep 2025 19:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758223698; x=1760815699; bh=to7t8pxAzeROLpmJIHcDUV0b
	8IiZYPu9MdlR3yTFEEY=; b=RxQ7sbFBuhiYQqS4qCCXqSLljtifSIsQPdZATkYn
	8eVR6TSpfunIS5o2Fg+yNVLpUn5xhBkpjPEen9WH+yec6dCW3dNmfiRxvti+iqdn
	HuhArA6/gHtGsYccotFW7FhDz8bmmrexXv+2jriWVNzodmR+JgGb+zztowN0ixj2
	ozaJ2oDgPmu2YWLVty+vkd45lTsARcpVYO4oi6bVK7VR9RCIYbwwkyD7CCCyT9S1
	JIGCiM2jHhyLrrNwVrID2fkaOVCP3ukFCI/zRgl2CvFzAXINwpBuPW2e+YBvZqJK
	AiX4nj2TP7Yp20Xl6E7qp+v0tU0QuXHr7+ATnyWTQVwcLg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DHCMMoKn-ojq; Thu, 18 Sep 2025 19:28:18 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSQdz0wq3zlrnQ8;
	Thu, 18 Sep 2025 19:28:06 +0000 (UTC)
Message-ID: <ff2243ed-3f7d-4746-80cc-b8f3f1b9e8b7@acm.org>
Date: Thu, 18 Sep 2025 12:28:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/10] ufs: host: mediatek: Adjust sync length for
 FASTAUTO mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-6-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-6-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_122823_244100_ADC1C3E9 
X-CRM114-Status: UNSURE (   7.17  )
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

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> @@ -160,7 +163,9 @@
>   #define PA_PACPFRAMECOUNT	0x15C0
>   #define PA_PACPERRORCOUNT	0x15C1
>   #define PA_PHYTESTCONTROL	0x15C2
> -#define PA_TXHSADAPTTYPE       0x15D4
> +#define PA_TXHSG4SYNCLENGTH	0x15D0
> +#define PA_TXHSADAPTTYPE	0x15D4
> +#define PA_TXHSG5SYNCLENGTH	0x15D6
>   
>   /* Adpat type for PA_TXHSADAPTTYPE attribute */
>   #define PA_REFRESH_ADAPT       0x00

The "#define PA_TXHSADAPTTYPE	0x15D4" line shouldn't have been
changed. It seems like this patch changes the whitespace before the
"0x"?

Thanks,

Bart.

