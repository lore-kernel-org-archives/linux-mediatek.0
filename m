Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8417CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzXdEbAZvdcjl7GHoIg2QEV7fEXYa2beOYMm8hIqXSo=; b=XwW+F+wlmBYuaMQxN2PAF1Y2dP
	IjeuQEvtf2I0cmV8oclnf6udQ+KutS1weaCTYKHORhPNtwSEimzAS5/aStfiMQSAVDG+aHdUiUNRC
	aAccXj74kkUxnPPAnwORmS/WawN2NLLwA99gv/loourXs8xn1hy48Ux4JusKTpRrns/E4wfoolOEQ
	EJ3yybj0uFNdEQm9tagh2hqeTRKjEPN8xDWPUqtcnq1Um/t8+ZtqGlEW2SlO79F6fl7sFPKTKQz3U
	ROpOVPJvnyBUa/hr76uFbUThnYeabtIPe8P6VbIwfEqUKoSzEkLKGIXPBGhHTpexcOMBZEuu20nge
	3GW3dGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15Lv-0000000EA6i-2kHU;
	Tue, 23 Sep 2025 15:54:51 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15Ls-0000000EA51-2A01
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 15:54:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cWPgV59P4zm0ytX;
	Tue, 23 Sep 2025 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758642883; x=1761234884; bh=hzXdEbAZvdcjl7GHoIg2QEV7
	fEXYa2beOYMm8hIqXSo=; b=N30chI8ksn2Z0xxLDe9QCltfcCP0lPWZhN6vONPy
	NRKHd6+mXZz6ix1N10I/K+hmilSVbRsGxoBOPVC6W5EAfGsYySYnXJ3Jds0HhuKX
	zLwpe8VPWvVdQ984Ue8Mvlq/WK3CNF6/uh3MrfwAR8fgwlRrv5cuomKNutzGn+i9
	5T1KHwRGzEm7PF5rSqYRv7KLcL5rDdRmY2R84TGW47jjT2V4KVcbB1Czbstr3Qlo
	3eEKpZZo4B9cJgufDH90QTLeBjU75ap4Rj4R4pw+lp33xuOX+ynzIqacSbU2cbaT
	FeGPT8Hiqkqofrrsfd1u2GvcPaDCU8bmVMWfFXj+v96kBQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ikHvNY3E9x2o; Tue, 23 Sep 2025 15:54:43 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cWPgB2Q3fzm0ytP;
	Tue, 23 Sep 2025 15:54:29 +0000 (UTC)
Message-ID: <c9f1ce41-b81d-490e-b919-a6105ed34ff0@acm.org>
Date: Tue, 23 Sep 2025 08:54:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Change MCQ interrupt enable flow
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250923090855.2522149-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250923090855.2522149-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_085448_644089_675B230A 
X-CRM114-Status: UNSURE (   7.63  )
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

On 9/23/25 2:08 AM, peter.wang@mediatek.com wrote:
> -static void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
> +void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
>   {
>   	u32 old_val = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>   	u32 new_val = old_val | intrs;
> @@ -377,6 +372,7 @@ static void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
>   	if (new_val != old_val)
>   		ufshcd_writel(hba, new_val, REG_INTERRUPT_ENABLE);
>   }
> +EXPORT_SYMBOL_GPL(ufshcd_enable_intr);

Please do not export ufshcd_enable_intr() - this function should not be
called from outside the UFS driver core.

Thanks,

Bart.

