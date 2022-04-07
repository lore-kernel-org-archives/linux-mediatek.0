Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD9EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 02:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXWqKGbEbyhcpwwgrwQ+9VABYt+7EAU0gTVRA66u/Lo=; b=eUyyDJVV7zYpyo
	wVv0rhmQeTU+LeR0YDuCmC3QzhJnArI6Caj0srRbx/v1tQ7TsD0fYFuh66f/LJLM6GzfOmAhfCQWC
	kwOjSWL3Ft9FKRp469zsxJW/QV3laeFRsmZvt++FIqUZaKF9rsdr7Gp9234S6Vyb2wbBzR7+hsStg
	Hde42IyD6UoADN7nznwovwb6WELAlJKH1e1OUnXw1nXaoj6u93c0+joxmhLQ51IRAGq19RS68f+LE
	VqD4edMeB7KxNjk1o61azzj3kc3/In2ZHhBX/aH291QbG1r0PXS0eAw1c2xAX7naiYBUOSvNoJwtM
	qi7xLsz026WwyIG/rGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncHsj-008rlo-7G; Thu, 07 Apr 2022 02:28:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncHsg-008rke-Ei; Thu, 07 Apr 2022 02:28:19 +0000
X-UUID: 05d9b721435349299a93df3cd8a32483-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ck1NdUZ1Nj6cajAZRoLKqxSkQKA85jLealUTms4TFAQ=; 
 b=m9YWy5WaauOV+A66Dl7G9CQxr+So3exdIyoVr1ONN31sSqK3jl/JmItUDmkvwgAlLPUDmHwepW4H3ioEpr5QTMULi763eAIFvlzI4BytLig8pwGe7H1xKF65jIpvUrvfrSdXB1tgNyUUqkRWq+G/VDl4//wzwOVf+7vQWzUszkU=;
X-UUID: 05d9b721435349299a93df3cd8a32483-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1298086764; Wed, 06 Apr 2022 19:28:14 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 19:27:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 10:27:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 10:27:47 +0800
Message-ID: <5ba2e990b15e0d4d4a2b4a52c773b8494b70d1c5.camel@mediatek.com>
Subject: Re: [PATCH v5 0/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wei-Shun Chang
 <weishunc@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Date: Thu, 7 Apr 2022 10:27:47 +0800
In-Reply-To: <CAJKOXPfWH-XSogkWVy0Q5LcHSk9SXinR7AA_Odo-oTc32y1Ykg@mail.gmail.com>
References: <20220326022728.2969-1-jianjun.wang@mediatek.com>
 <06c9f2f8236f8dab6b27da9db0332b4ca45a1039.camel@mediatek.com>
 <CAJKOXPfWH-XSogkWVy0Q5LcHSk9SXinR7AA_Odo-oTc32y1Ykg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_192818_700431_2839A8CE 
X-CRM114-Status: GOOD (  11.96  )
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

On Wed, 2022-04-06 at 17:38 +0200, Krzysztof Kozlowski wrote:
> On Wed, 6 Apr 2022 at 07:47, Jianjun Wang <jianjun.wang@mediatek.com>
> wrote:
> > 
> > Hello Maintainers,
> > 
> > Is there anything I can do to get these patches merged?
> 
> Patience. :) You posted a patch during the merge window which
> finished
> three days ago, so basically one can assume you ping folks after
> three
> days. Three days is too fast for pinging. :(

Oh, right, thanks for the reminder.

Thanks.
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
