Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DF4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 12:22:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE7B64E2E
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 12:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE7B64E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CGs/coXqnMgkSGQi9W9sPHXPkAqAPKPNz7lY8jpthS8=; b=KgyCN2f78g0FWRIxTGdPXon3f
	NPObFcfRRHqPFAYW8qyu468YjEPmscI7wB9W3OijB5G5+wQOnOnRJErIeC416uVc2sESsKwqN+Ftw
	dkLSqPLAILIwH+Y2KtOAl8uzdBHvCWh8DCEWFwmF3Jqt4VUdGuEVGAgGd7y3TK8n/lss/luKVHcIK
	GT8xoWu6El/jrgDnpa4c5xvNP/vNzxI78hNg5WImjB9JCjB6zymmQVY9xJKVApJeoCSnXtHoStt2C
	cdD7SgWgIj7fdvMzw8sJRgqgZ5FmOOWxwZcfstYg67xegLGa0ryHMnhOTuBR/XBaN1Bp9eJbjMvTa
	HumJBgeLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhZ9-0003WB-SZ; Mon, 01 Mar 2021 12:22:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhZ6-0003VT-2B; Mon, 01 Mar 2021 12:22:21 +0000
X-UUID: 839a514604584b05a42d838ac9175e83-20210301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gs/svU8lhJHXw6APVwlc6cCBq2DNAv6aE+F+Aj/pGlQ=; 
 b=JdHO5bevxhGPTCgkH57o2TT1mzqvC3ogHkIr2jTrAHQ0wCMoZs8UxhbVbve1JVfX4q0Pd5axby01PIasKMWbbLWYIdwfcQLKDDxxLs8mCbDRvemb6NM48CjaX+LNnlFGZ4PLIcfOQFHx7cJzrWRJJw0UiaMVfRgJnUshd0LDA6M=;
X-UUID: 839a514604584b05a42d838ac9175e83-20210301
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1734213976; Mon, 01 Mar 2021 04:22:15 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Mar 2021 04:22:14 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Mar 2021 20:22:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Mar 2021 20:22:01 +0800
Message-ID: <1614601321.16737.5.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Date: Mon, 1 Mar 2021 20:22:01 +0800
In-Reply-To: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7A2577D5E8F4CF0FD35F7C75FCE434CDC2524106DFD176D68BD41856E5BE214F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_072220_319547_1C874ADB 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
On Wed, 2021-02-03 at 18:35 +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
> 
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---

Can it merge into 5.12? or do I need to resend the patch?

Thanks,
	Qii
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
