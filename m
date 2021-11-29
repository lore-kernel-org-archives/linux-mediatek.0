Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB11C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 01:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFwZSIA16wbJ+yh0/h2O52vADi9h4xLRb6slfUlUMUo=; b=H2ak498EeXecSa
	3svl33hdaeeAwOUfAFBUZid3VP54j25c90rg2PFyTfOSbOYpqlwApEYplGKUOlFNv8Y71NJcr9Ari
	EkOVBTd5m82DCENd2Z8TeVEqJnHBvCOsTx6Qdt0tEWS0LNmWPzX9jnBtuR1apBIiQ1ZCLROF+n7bt
	fAdcvGRt1R+HenItTBD1K6sIuqjpwCkCdmERyqZddZnvQ5O1Mq+9bDEonggw6C+9tbnULm9BowLkV
	v6mXRF5v150Tv3jyav8fYD0V5dySr2FXQA50vZwH6dx3kFRWYl+2mOKexDp1wYaw5bdcj6TBHKhgL
	7DIFGBx42rjiX6qemomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrVkh-00H4r9-V7; Mon, 29 Nov 2021 01:46:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrVke-00H4pa-Rz; Mon, 29 Nov 2021 01:46:42 +0000
X-UUID: 4b5ed4e2eb60405fad2c1b46ad87d564-20211128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UuTnIeAjwYA5dUirlDhuBq9UUSsnxYbAfHAqvOTbTpA=; 
 b=I2oQAZ1pNpftqI/YHBXqWOkrXkxevQHfZJhpddfyAdJblNPZeDpdpNMlPRCty2Emh0cDDmUqF1ssdkMyFsIq+COoV6+1ozT4bHPW4WIsdvsI8mZZzm/tr9JcCGYzgzyTmSslAs2c9BpR1oSYrUix9hJbJwNlyq76A3tClloL6bE=;
X-UUID: 4b5ed4e2eb60405fad2c1b46ad87d564-20211128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 262615396; Sun, 28 Nov 2021 18:46:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 17:46:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 09:46:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 09:46:30 +0800
Message-ID: <833463899b37856804b45521adf1b335368f8286.camel@mediatek.com>
Subject: Re: [PATCH v3 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Mon, 29 Nov 2021 09:46:30 +0800
In-Reply-To: <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
 <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
 <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_174640_936125_E81E02D5 
X-CRM114-Status: GOOD (  20.62  )
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

Dear Rob,
	Thanks for your comments~

On Sun, 2021-11-28 at 17:57 -0600, Rob Herring wrote:
> On Thu, Nov 18, 2021 at 11:09:55AM +0800, Biao Huang wrote:
> > Dear Matthias,
> > 	Agree, converting and changes should be seperated.
> > 
> > 	There are some changes in the driver, but mediatek-dwmac.txt
> > 	
> > is not updated for a long time, and is not accurate enough.
> > 
> > 	So this patch is more like a new yaml replace the old txt,
> > 	than a word-to-word converting.
> > 
> > 	
> > Anyway, only 3 little changes compare to old mediate-dwmac.txt, 	
> > others
> > almost keep the same:
> > 	1. compatible " const: snps,dwmac-4.20"
> > 	2. delete "snps,reset-active-low;" in example, since driver
> > remove this property long ago.
> > 	3. add "snps,reset-delays-us = <0 10000 10000>;" in example, 
> > 
> > 	Should I split this patch? 
> > 	If yes, I'll split in next send.
> > 	Thanks.
> 
> It's fine with one patch, but describe the changes in the commit msg.
> 
> Rob
> 
OK, I'll add the changes in the commit message in next send.
Thanks~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
