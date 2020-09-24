Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136A9C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 14:15:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3A621D91
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 14:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbiynG7A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E17bSWnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3A621D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5AjRuBdX6DsnZzLBcOz7fg4P9qbH1cctAm65G1j7R0k=; b=CbiynG7A44Ph10oRABWN3mSIV
	b49F++LVWdwN5CgzJu9wKrazJL6cWY4rDl5NtSjrBFMH5mGVU1KLVb+ukNKbuBmb7gKFM5sPsLcS4
	zVucw6SVmd3nac1RpSCqJzL13ltfS8x8SGalN1hre2N21mi5lSO+0bfT61B7vEQV7kAvfROkJmHun
	xIxTJnID7G3Ffyw3iMNnEGYn4SW017UcBRby+HrLzXDcue+vSD/WZk2KsaN1mk0Us52a/2ltlULv7
	onW3nPYYljpJIBUMhgG6g4H4dUdgEjLKhgApXZBIAvJqcO352Q77TqxsuKT4Ao3wF1w0iMwKIiOVc
	xQSJXWcOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLS1t-0003TB-SK; Thu, 24 Sep 2020 14:15:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLS1p-0003S8-Ui; Thu, 24 Sep 2020 14:15:24 +0000
X-UUID: 8b9549d922d34729afd0145909cc4566-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3gDT2fSDKlN+/xLxFu5tIv5oC9wVXrVAOCd+NyaKVj0=; 
 b=E17bSWndZCM03aK+gvO72kKz8/wL/wftTH7/l+wx0vh7Q7PUylP62BoJaq2zwoT4JeCEOj7EbtHks0QYNs19pnM9E+1qeHP9RityhyjjuLcjRisuwTJSH6BdHWDQqf+FnApCIwOUoIFkkGTzCFWbOQMtJvZA8pbrfLUI19OTOXE=;
X-UUID: 8b9549d922d34729afd0145909cc4566-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1955240399; Thu, 24 Sep 2020 06:15:16 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 07:15:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 22:15:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 22:15:11 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Date: Thu, 24 Sep 2020 22:15:14 +0800
Message-ID: <20200924141514.23930-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200916133324.6280-1-phil.chang@mediatek.com>
References: <20200916133324.6280-1-phil.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_101522_680605_2E5F5BA2 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Alix Wu <alix.wu@mediatek.com>, YJ Chiang <yj.chiang@mediatek.com>,
 Phil Chang <phil.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Actually, In a embedded system with 3GB memory, the memory bus width is not the same among the 3GB.
(The first 2GB is 48-bit wide, and the latter 1GB is 16-bit wide.)
For memory throughput reason of hardware IPs, we need allocate memory from the first 2GB for
the hardware IPs. And that is why we setup the first 2GB as DMA_ZONE, and use GFP_DMA to allocate
memory from the range.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
