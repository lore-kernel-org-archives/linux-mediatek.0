Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE09EC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9E60FC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F9E60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNUtA6NXEPP7moAtPnqC+mYXt915ltRYK27tLH4quqc=; b=slBFPp4gmJPpRE
	hkPq3xWgPu1c7J7RubYzXPPxrGCy78D35WPuBUk1i89u5i1bgdtuGodib3L1bIIXbdUHlHyunM+JS
	j+iVzjjbv5w91u7Sbp4gRYwzBaQx7EefVK36sMBqcJ7kc/7MwrQJ0DfINQReEKTuRCq7bplce/WpW
	mWRn7b+D7U7BzatNREh+N6IlIqO/qUAqYkP7eMgTmdjnrzpGa3HNq4M7Kp4mdsZS6Y+JSUo1C1IQ4
	6muTbZz2taua/92dj66Tf4TUlkyPtoucoSpJLqUXuf2v+bRwHuniKK0EatLB6qUAKEHFJo9a+qtUO
	Nqebxv1iYiSzX2OaqTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKwvJ-001Pqr-1n; Tue, 31 Aug 2021 06:07:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKwvE-001Pq6-3B; Tue, 31 Aug 2021 06:07:03 +0000
X-UUID: 5d4ac8d89cb94840b46822736674fa4d-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kKtk8AQex3i9l4tfgwM0zqINIAMrPpVdsHsMQ+zbYOQ=; 
 b=tX9Uf21uR9Nsv0iFjr5uilVaX7IG1pFgC9L1TAITZ18VxeCe28857jhD/wmq+U8727KYW01144edEBrCExmA0fd7agG0Xsr36eYh+rsU5jxBEtO74YP6HkXRFD41EvqjxMmdZuD9azjHAkwzpBhYJevRiJG6DtTKYkWFLQnV2bA=;
X-UUID: 5d4ac8d89cb94840b46822736674fa4d-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 143006371; Mon, 30 Aug 2021 23:06:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 22:57:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 13:57:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 13:57:56 +0800
Message-ID: <1630389476.11251.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6 1/7] i2c: mediatek: fixing the incorrect register offset
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>
CC: <wsa@the-dreams.de>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Tue, 31 Aug 2021 13:57:56 +0800
In-Reply-To: <1630147859-17031-2-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
 <1630147859-17031-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_230700_183014_D93DC60F 
X-CRM114-Status: GOOD (  13.24  )
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

On Sat, 2021-08-28 at 18:50 +0800, Kewei Xu wrote:
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
> the correct value.
> 
> Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Qii Wang <qii.wang@mediatek.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
