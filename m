Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B57C54E5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rshhIT88lYCQaT2AaqxMgxvuc8UtBhvJ7c1YhTWtuqQ=; b=UXxegNtA17xm0/47n9Mv5EgCMd
	l/xrmWpm1EpRQX7McpQlGKbimtcXZjLvgUrKWN1g9SmEsp7Fz51+vWdS6ebHFAPhSQ2sKEAKwSPTP
	nqcrajhwebQAfPOKEdnbLDi4c4hF1aS0+rrrgYCw77JtleHtvJxiK8HGUCpgbLhLrYBVKOSHqbR+L
	xBruJASTjSEONEUfjMDBO/4RuIrJUc9adObAQquzW5TQ+gr01hfTJmjnVlama2L1QXNLuNjmvwCJt
	geFaRhECix7YCbcRdwd1Yq0ejsKRxwQ7FKo2uOUi9obtFFstG72MKuQ81Qn+384cjDSo2yksy/Tbq
	FU2D5bNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxPe-0000000GR2w-0Noo;
	Fri, 15 Mar 2024 02:35:14 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxPb-0000000GR2U-00os
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 02:35:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4TwpHy0LX5z6Cnk9M;
	Fri, 15 Mar 2024 02:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1710470104; x=1713062105; bh=rshhIT88lYCQaT2AaqxMgxvu
	c8UtBhvJ7c1YhTWtuqQ=; b=pjncP0/7dJ+yqcHs/T7XzvyEOiUmR+SCCpLIlBdm
	ZChZgR887gJLLEXA1QPR8G2lkIyXEZbkOqcyZixfr7Xobjdj7BdIK8l+QhMU4uvT
	z/uHV4EC3Jhfs3Ru6ixV5LRw40z6m2PVf9NnFq2spHUeHg1zjf0ucSWNs6YFmvIM
	GD3lLj+g303WMqqqLVc/bYNbnfZgPvWMYJU9kmjz9Mc2SKhuevOh2SpCiU/aeJAk
	R+Vr8Va0qflnFWZlCoJ/T368EzhQpCej+Mw49NApBJuXCNEzAXuYMYN3v2/3yaO4
	wCoFp3wOzU9xf/58BzY+KGzBDRB1RDZ72nYawt6BBz0aNQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4k8wI546dGYX; Fri, 15 Mar 2024 02:35:04 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4TwpHk4hG5z6Cnk9J;
	Fri, 15 Mar 2024 02:34:58 +0000 (UTC)
Message-ID: <abe611aa-0732-442d-ba36-9540fd7c1396@acm.org>
Date: Thu, 14 Mar 2024 19:34:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] ufs: host: mediatek: tx skew fix
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240308070241.9163-1-peter.wang@mediatek.com>
 <20240308070241.9163-3-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240308070241.9163-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_193511_087620_2A2CF737 
X-CRM114-Status: UNSURE (   5.83  )
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

On 3/7/24 23:02, peter.wang@mediatek.com wrote:
> +static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
> +{
> +	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> +
> +	return !!(host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
> +}

Same comment here - please leave out the !!

Thanks,

Bart.


