Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC7CC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 07:09:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA6C2087D
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 07:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QkTNy/Kx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rYA9GFWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA6C2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U797UvkNNQ3qqv92wAswx5p4ezel4DXMA8//sUcKx/A=; b=QkTNy/KxWpuKxxUZnAWIgHqOd
	aJ7Po9jTgp3mJNuj7JGjH1IUSCSuHMdbVwCh9cTOSM5c4ZZxFE8eAyK0qbZc+n6umtlbGPqj46fQs
	u9npEer0L7sL9E7Sh7HyTR48NBiPcc9qoRK1ipflhZuhwph6T/7Q+nPZVbaSy53mCo31gubr+Dqn6
	HRWp/jmX4bObYYkHHTiWfzvX1sxOS1cGtQH/vtoj9f18wJSW+1XBQ+zPdqQc9fN6qPe18j+ltD1Pk
	WJrldnT+gId4urcGRHy8eCQxBzqC+D2jXRlgF9Nv8pAhTMYUnuHaeOeqLU7KDLphA9qJC2tCRLi4e
	dRqxxVsSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMtJ-0006Gc-Pp; Wed, 02 Sep 2020 07:09:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMtH-0006G6-N1; Wed, 02 Sep 2020 07:09:08 +0000
X-UUID: 5648a778efbf477e873202868516d940-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hTLcyNYyBPWJYX2Mc3Z8w8kIsOdBU9WJXUAKmauSMIk=; 
 b=rYA9GFWeBpUrANWsPKg5hciadlHGfWgnVuiexqjjlFIJxgDFMiwrr41/YSNdasHZMKacInal3/WJTPKDYoHDN+w3IQcHKAAhSoyYrsgbfxC4ubXdkF6+lLOPdVAmvI6J5Wc9SahuE9LDTcxkZr4ITG9M7mUU27xuQ5vklgXQk3M=;
X-UUID: 5648a778efbf477e873202868516d940-20200901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 41979789; Tue, 01 Sep 2020 23:09:04 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:59:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:59:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Sep 2020 14:59:00 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
Date: Wed, 2 Sep 2020 14:59:00 +0800
Message-ID: <20200902065900.2804-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ec3dd6b7664d647b2dc27926539eadda@kernel.org>
References: <ec3dd6b7664d647b2dc27926539eadda@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_030907_957918_A2DCE040 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Marc Zyngier <maz@kernel.org>

>On 2020-08-20 13:36, Daniel Palmer wrote:
>> Hi Mark-PK, Marc
>> 
>> I'm not sure this will be the final version but I'm going to try to
>> integrate this with my current MStar/SigmaStar tree over the weekend
>> and then I guess I can give this a tested-by?
>
>That'd be good.
>
>> Assuming this version or the next is acceptable can I just follow up
>> with a small patch to add the instances I need in my dtsi or should I
>> wait until it's merged before doing that?
>
>No need to wait, although the platform-specific details should go
>via the arm-soc tree.
>
>I'm not going to review the new version before next week anyway
>(I'm making a point in reviewing any given series at most once
>a week).
>
>         M.
>-- 
>Jazz is not dead. It just smells funny...

I've post the patch v3[1] and the driver is same as v2.
The difference is that I add the test-by label by Daniel and add
an entry in MAINTAINERS for mst-intc.

Please review it and let me know if you have any suggestions.
Thanks.

[1] https://lore.kernel.org/lkml/20200902063344.1852-2-mark-pk.tsai@mediatek.com/
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
