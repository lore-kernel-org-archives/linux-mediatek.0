Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz2YLqvlMhCE3RQdFbTAtGjCy8aLSqDYw4ggmV/jAiU=; b=lLVLd75AwIBAdY
	NAayRDMdq8P5VK8clteYNUWvbVaM96F3dzdRLzaDYyfUuAFlAySKcquHb8AZRF3QUju9CFeNq/YX4
	EVw7ZnnJxYMVjv3T97YIRsy6EbiL92NmKS6r2aK6mbuTWyxMkGKbpGHXwom2hr+RlNpbrNmWXeSwN
	MA66MashwKw1sHJJpK/K2xBrFo3pTuwcNZ6oqVpx16QwWj0Mv6zRffMO9wpF+0WkFsUni10HZMm4R
	y5UU9mWnvY/7bPUioOAxcex59sfQHIJAZ4JtXJo0grc57C3k+Y90OjY48LaR2AWdmHV01kc8UEUfD
	RTT25ukJMSq63MImgDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGuIG-008upg-N0; Mon, 07 Feb 2022 03:02:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGuHu-008ukd-Vb; Mon, 07 Feb 2022 03:02:00 +0000
X-UUID: e4dde8606f2a497490926a4b5e42408e-20220206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TnMAlTimM0jAbM1XcpF5UrT1fZaPOHuz0wnTlzGs0/s=; 
 b=M6EUc8pfT5UNreflSx+w1oXvNz4tcdglOaTYGriM5hgI0WZax3gkzMDIPmrGwrtqC+cjZM6TfH8k+VbR7Wqpa7bEmcNjhjuQCEIKOz43yrURDos+AN8L3JmgOLoTQETXJVc7Y7aUNLGfgMUZQH7rNhb9r6YxxHMlItFa2EaPc+E=;
X-UUID: e4dde8606f2a497490926a4b5e42408e-20220206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1890063801; Sun, 06 Feb 2022 20:01:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 18:53:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Feb 2022 10:53:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Feb 2022 10:53:33 +0800
Message-ID: <9b43f53bfe6d69c840c697a8b414eb19588826ea.camel@mediatek.com>
Subject: Re: [v2 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
From: Kewei Xu <kewei.xu@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <ryan-jh.yu@mediatek.com>
Date: Mon, 7 Feb 2022 10:53:33 +0800
In-Reply-To: <YfRkP7Wf7lzarVrf@shikoro>
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
 <20220125110413.18988-2-kewei.xu@mediatek.com> <YfRkP7Wf7lzarVrf@shikoro>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_190159_040700_4C938CC4 
X-CRM114-Status: UNSURE (   9.43  )
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

On Fri, 2022-01-28 at 22:46 +0100, Wolfram Sang wrote:
> On Tue, Jan 25, 2022 at 07:04:12PM +0800, Kewei Xu wrote:
> > Add a DT binding documentation for the MT8186 soc.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> 
> Applied to for-next, thanks! But you forgot to add the ack from Rob
> which he gave when you sent v1.
> 
Hi,

I'm sorry for my mistake and thank you very much for your reminder. I
will pay attention to this problem next time.

Thanks
Kewei.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
