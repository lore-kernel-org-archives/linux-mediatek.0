Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA8C433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 16:22:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC37461A21
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 16:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC37461A21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=umZDVJyP5jIgMAUEhsfKLYPAP6ttrH8L+iJ+C8v+bJg=; b=QvUylFfsvHAQaBpPJ447NrtaR
	J8xTe+mMP8fdRUJB44EV6qfMa8mQ1ooSyn25QJaHCpB+mgT4B8aDxCpTzTRwoBkWblpzYzh4MRZhh
	gzPXkd7Y6ZM5yPs2Mar02R76PwGcICI8qoTuTXb7V0YDecGxAwGfsc+G/g68vH8paq7cOK0hNvdd1
	LwBRD2HC2EMKp699ifzzqTUC7mefoi/OspuVS5bqJiymDnVHB57eLgzDp2+Ynite+OnNiw7QPbRIv
	5EqDwzh5KPkrH5eaFY5XkR3/9MeC6ThuhY1FQ+M5qNOUTUKHpQEdFAobK7O0slrqAzEZAKZvY0onu
	lJ6vWz3zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPSkQ-001ozP-Rl; Thu, 25 Mar 2021 16:22:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPSkK-001oyd-MO; Thu, 25 Mar 2021 16:22:12 +0000
X-UUID: a2df9106521f4c65ab49c471dd1896cd-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8P/l40w2DDuxeb0GWOsILCXU7GxDd7kR0fGCrMK9XI0=; 
 b=KPbg5hWdBpt6e8NeFnDktGofTAyJTJAuanyvAYvagrBrnmSuNSPqP3f22KICnOyBkz9iyqTFUwWnU5zq0b6rtgrqDQoXnPrhpsuKq1WXKV+WbDPL9sZ8hK7j8UNOQd+bmH/epVvbXRZnpayUXUY4ctXURyAjqjBV+A+0gwTaJn0=;
X-UUID: a2df9106521f4c65ab49c471dd1896cd-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458860329; Thu, 25 Mar 2021 08:21:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 09:21:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 00:21:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 00:21:52 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <maz@kernel.org>, <tglx@linutronix.de>,
 <yj.chiang@mediatek.com>
Subject: 
Date: Fri, 26 Mar 2021 00:21:51 +0800
Message-ID: <20210325162151.19863-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210315131848.31840-1-mark-pk.tsai@mediatek.com>
References: <20210315131848.31840-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_162209_282900_79211E93 
X-CRM114-Status: UNSURE (   7.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v4] irqchip/irq-mst: Support polarity configuration
Date: Mon, 15 Mar 2021 21:18:48 +0800

> Support irq polarity configuration and save and restore the config
> when system suspend and resume.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Hi,

Could anyone please help to review this patch?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
