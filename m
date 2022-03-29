Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 02:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6O7F/PuZTQwFP/SskufgFOkEAdFsE2Qi8OtbFVNMWUA=; b=RHEQkFtkawX95o
	sxJrruSe5ntCqHGmnmQzhFkBZgLRmWoSGIRwwTN6ARJCg+OV15H9BkRfVZgHykSv1lCp51LgqV88o
	rxfQwWZPkeVXvBUGJY1+6QgFe5l5LWk7tlOLSQCB9o+UfV3JGuBe4YQiZ6T8l5VsSXCPD+0c/73ry
	WXfA9gY6CGz+gD5qlMoW02+i6Ba3YJZQ476nlPo9UaNw0DGG93ZSkrgEm615wdXpwljYctNry1kfS
	ABlWR7A9upMVXJQYkEEnmXR748+qUkhSiImrtz3DfGjtt/ejutixrFr8s/eVVH4XnnhotOQ5JrIYV
	IkQlFgK8WDkq1MgcPfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ228-00Amj4-G8; Tue, 29 Mar 2022 02:56:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ21w-00AmiF-Cd; Tue, 29 Mar 2022 02:56:25 +0000
X-UUID: 6e5a3f59c95247f6a4200d82a0e1da86-20220328
X-UUID: 6e5a3f59c95247f6a4200d82a0e1da86-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1035893924; Mon, 28 Mar 2022 19:56:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 19:46:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 29 Mar 2022 10:46:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Mar 2022 10:46:14 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <xiaobing.shi@mediatek.com>
CC: <bjorn.andersson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH] remoteproc: avoid array index out of bounds in debugfs
 file
Date: Tue, 29 Mar 2022 10:46:14 +0800
Message-ID: <20220329024614.9783-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220328123413.18169-1-xiaobing.shi@mediatek.com>
References: <20220328123413.18169-1-xiaobing.shi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_195624_449253_FCAAB174 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Xiaobing,

> There is a negative offset of an on-stack array that causes an out of
> bounds issue when someone called with a zero 'count' argument to
> syswrite().
> 
> 	buf[count - 1]
> 
> We should add an extra check in rproc_coredump_write() to prevent the
> access.
> 
> Signed-off-by: Xiaobing shi <xiaobing.shi@mediatek.com>

Thanks for the patch.
However, Alistair has fixed this issue:
https://lore.kernel.org/all/20220119232139.1125908-1-adelva@google.com/

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
