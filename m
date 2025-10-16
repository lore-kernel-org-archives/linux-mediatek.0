Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A8CCD183
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5LrF4XUD3Qrzh57jCUubh/KmdYfbqo+2j4KHBLHHvk=; b=QKp+k32HWfSXrQQDJ5WSUiY0o1
	0QCXVUerWPDFh81/JxJh88VayM6pEWB1nNl7Ba5sSltt+QIGWosY4bBAwwr8a9gmfFVQRaiNV1Iz3
	vRNkfYRfFTGz+tCNVxoWrZXR/ehcU+2vYSIRtfD1gnKezxkiJfQs2Ihbvd2pFCQxh3G1p/hDMBREo
	JroGSOYJeDIMa97fFJWMXAV0s4VaRmBPUpGjK/l9KBF+GQ72VxDGw7k8zlca9tEuuyWXwjP6+1Wko
	oD9SRYvN/qmHltqdP9JDrfxWHKt0nRCIfO+7JiYMzNU6PdgQ5oD3HbhcKu0oaGcxPoeCFKGKnzgUD
	L17XDLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9S3J-00000005cjl-0cmt;
	Thu, 16 Oct 2025 17:46:13 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9S3D-00000005chU-3rpI
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 17:46:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cnb3822qjzm0yNR;
	Thu, 16 Oct 2025 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760636753; x=1763228754; bh=P5LrF4XUD3Qrzh57jCUubh/K
	mdYfbqo+2j4KHBLHHvk=; b=S284tZt/2XiA+I+2hPv7Cp0rDS5JIFtCFIBkVmFD
	F6YGNwGD3PXJjB/evk10Wk693SZlXsdjI1mNflyfz7nWWR5y3/06mOelh1yDUzGd
	rPxha2Ed1vxRxMw/Tys8E9y128XG7bAVfKuD6uH10+dYTuVE5W2pK3SpuWOyciXz
	WDtHR2hvKS2bjE8doR7UxItBUZbL3b6zc++BHMiXJxlIN4OWQsnw/VCQxrIvPNuD
	rm93labAQQQFIQ43QiJ/tUDhOJeWQPkyZY1L4YrT1PwBd+3baZCvj7c4YwVULcpG
	ebbJKR/PgSaAADBpL3xrQzwTx0eZT75CuEmDbUjcft3oRg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8bU9H-wIF0Ao; Thu, 16 Oct 2025 17:45:53 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cnb2r0dSVzm0ytM;
	Thu, 16 Oct 2025 17:45:38 +0000 (UTC)
Message-ID: <5d04501f-4bb8-40ce-a396-010faae38481@acm.org>
Date: Thu, 16 Oct 2025 10:45:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] update CQ entry and dump CQE in MCQ mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
 naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20251016023507.1000664-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251016023507.1000664-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_104608_026054_EBC060BB 
X-CRM114-Status: UNSURE (   6.18  )
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

On 10/15/25 7:32 PM, peter.wang@mediatek.com wrote:
> Update the CQ entry format for UFS 4.1 compatibility and
> add support for logging CQ entries in MCQ mode, enhancing
> debugging capabilities.

For the series:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


