Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97010775E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjGYqWhafNt4JL8pxv2BfMAtvUGx8XCJbBr9eCwrEnI=; b=QCzQ8mqSza66ZHmTcd9Prdh42m
	7TPVzrvbf97caB/6XQCz6nSt97QlMLj03/ddtVfX2JQwR3KXLH96wfydYUAtLS6gvSiUo06Glsf+p
	AYNCd9mWBo3kXe+bvAbtvNkPXU7JYzn+noo4cdu/OrQ4l666jiAQriZJ/La08BHFt2h+eBhQP7a5J
	9jcZQXUijhszTFE8vpY+RK8m94W37BqCgfGmNc0d1KhpSGabRTmkBMrkEJCjQhRBOemzpVSqvbEhz
	LydTOISNWuq6F/7cPvKwvQ2QL1gb8Qsi3iCGYn45MNM/fZ32z5nE+Qhionv2s3i9T3JZnfryhBzAm
	L5V5LB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uSh-000000092Oc-2szs;
	Wed, 18 Mar 2026 17:13:39 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uSb-000000092O1-2Gbo
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 17:13:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260318171328euoutp014ebdddf3ab1474f0a20ca21cbe924b76~d-tKnbRXw1589515895euoutp01P
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 17:13:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260318171328euoutp014ebdddf3ab1474f0a20ca21cbe924b76~d-tKnbRXw1589515895euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773854008;
	bh=DjGYqWhafNt4JL8pxv2BfMAtvUGx8XCJbBr9eCwrEnI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bKQTU1Ks7emLIsRoGhuEND/byBWbdF0OLkx0GtFongtUPq8ro0mjPjll4bxgFgUFe
	 vsiBKd3Z2CNBrNLDbr8fRVqL6pMkjnfl0Hz+D5Bit2nEOV+tZBWCxxBIOPtDcNgL3U
	 xdbvNdSUJljiTlFZUGgjOzlrSdNjfOTPP/kNR/Ak=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260318171328eucas1p13f8bd42ec036e724893ac8d2492380da~d-tKJxfGz2951829518eucas1p1h;
	Wed, 18 Mar 2026 17:13:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260318171326eusmtip19d9c14ed6d24b0fbcafe8e935194384f~d-tIxnPBK2725627256eusmtip1S;
	Wed, 18 Mar 2026 17:13:26 +0000 (GMT)
Message-ID: <1b9db59c-f736-4c59-b37a-15a60cfa4f3e@samsung.com>
Date: Wed, 18 Mar 2026 18:13:26 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: Bart Van Assche <bvanassche@acm.org>, peter.wang@mediatek.com,
	linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
	avri.altman@sandisk.com, alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
	chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
	eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260318171328eucas1p13f8bd42ec036e724893ac8d2492380da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
X-EPHeader: CA
X-CMS-RootMailID: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
	<CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
	<1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
	<df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_101334_515148_88C4D2B2 
X-CRM114-Status: GOOD (  15.60  )
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

On 18.03.2026 16:50, Bart Van Assche wrote:
> On 3/17/26 10:11 AM, Marek Szyprowski wrote:
>> This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs:
>> core: Avoid IRQ thread wakeup during active UIC command"). In my tests I
>> found that it causes the following regression on QCom RB5 board
>> (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):
>>
>> =============================
>> [ BUG: Invalid wait context ]
>> 7.0.0-rc4-next-20260316 #16535 Not tainted
>> -----------------------------
>> swapper/0/0 is trying to lock:
>> ffff000089f58048 (shost->host_lock){....}-{3:3}, at:
>
> This line is a mystery to me. Are there perhaps any local changes in
> your kernel tree on top of linux-next? I haven't been able to find the
> text "shost->host_lock" in the UIC completion path.

I don't have any local changes, code is at commit 6475cfb81fc4. After 
looking at the code this 'shost' indeed looks a bit mysterious, but 
maybe it got that name after some inlining or code optimization.

> Instead, this is
> what I found:
>
>     guard(spinlock_irqsave)(hba->host->host_lock);
>
>> ufshcd_sl_intr+0x3c0/0x6b4
>
> Can you please help with translating this information into a line
> number? Tools like addr2line, llvm-addr2line or llvm-objdump -d -l -S
> can be used to perform such a conversion.

ufshcd_clk_scaling_allow() in drivers/ufs/core/ufshcd.c:6492 (code 
checkout at git commit 6475cfb81fc4)


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


