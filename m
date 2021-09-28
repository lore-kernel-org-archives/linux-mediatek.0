Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C455EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 07:54:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A2E61159
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 07:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84A2E61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+rjuAvRALvCu3epC7gSUUmb9GFoqHr5AFIfNv1bESY=; b=mvggcWDHB32eBu
	eUjmazL79z8uo87LUcvIJbdwOb/GYNLaH9lp7bKvV3KAC3C5j3TmLQTbPGvvpqNoPC7yU2CDcjUsI
	zYLC0sTHN1YtNboZXMkrpyaFxR8zfqPDfyQZUS67JxqDDFaQJbrcGTbzL13TT2wejIIhkgYH4jKbb
	udSI6pxRgyeRTnyy+tkfmx7C11NiHSWZRZlwyWh3nKXFKXQsjVVYSWcwlCaLIot1Tp6zKqdbx4Wj0
	dvOatQ5e9OxJESptS210H/bdaUVbwwAyLCyK+wmu5GBP9/uoT7D9nM+zwS/hAZPMzWBslcMft0ni5
	+6+lZ03bY9Qei0B41ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7w6-0066VT-CZ; Tue, 28 Sep 2021 07:53:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV7w3-0066Sc-GG; Tue, 28 Sep 2021 07:53:56 +0000
X-UUID: 15f3bcfcaf3d4a029a21a5afb4617e4a-20210928
X-UUID: 15f3bcfcaf3d4a029a21a5afb4617e4a-20210928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 824325213; Tue, 28 Sep 2021 00:53:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 00:43:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Sep 2021 15:43:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 15:43:49 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <stable@vger.kernel.org>
Subject: backport commit ("31096c3e8b11 net: stmmac: don't attach interface
 until resume finishes") to linux-5.4-stable
Date: Tue, 28 Sep 2021 15:43:49 +0800
Message-ID: <20210928074349.24622-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210927104500.1505-1-macpaul.lin@mediatek.com>
References: <20210927104500.1505-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_005355_573780_35FE214E 
X-CRM114-Status: UNSURE (   6.70  )
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

Hi reviewers,

I suggest to backport 
commit "31096c3e8b11 net: stmmac: don't attach interface until resume finishes"
to linux-5.4 stable tree.

This patch fix resume issue by deferring netif_device_attach().

However, the patch cannot be cherry-pick directly on to stable-5.4.
A slightly change to the origin patch is required.
I'd like to provide the modification to stable-5.4 if it is needed.

commit: 31096c3e8b1163c6e966bf4d1f36d8b699008f84
subject: net: stmmac: don't attach interface until resume finishes
kernel version to apply to: Linux-5.4

Sorry for that I've send a wrong commit hash which is in my working tree
previously.

Thanks.
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
