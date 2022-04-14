Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CBCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qieo+xw+Pbxt8SvKpULo59FCt36niU0qYOn7lp3Pe/w=; b=KSbAcyqGi+j7sG
	b/un9H6UFep9cODoJF72Sk/ULtLBUgbNDdP/ws0VqnZWNk/xspVLJYYRXGQJH/Lpcv8hZTBBzWwoz
	c8nMIbPcro5/h6QBcOuq4PNS7xdspu2xYpnN+3sKWlav/Vfvh3HligMZIwRb7gjReHhCL8nqGSxhW
	5s8oF4R/9UvQqf+sCjAUp6Nf3bPvrJWLm+Oo/Sx2KvRcYgrvZgFw1WB78MDVdziLpwTXdwxg+wqFO
	ooCqjnzyBYmjsolsT3dn1McCpek8BeaY792H5dlSLGWafYhIaVzRdmpokJhqHlD5RRY3bJcn9lkiQ
	KQBWStxiT6LrZacrGG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuzW-004aLo-Cn; Thu, 14 Apr 2022 08:38:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuzL-004aJL-AI; Thu, 14 Apr 2022 08:38:04 +0000
X-UUID: a3d69ae142204939a7fb7e8898c0395b-20220414
X-UUID: a3d69ae142204939a7fb7e8898c0395b-20220414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1619968506; Thu, 14 Apr 2022 01:38:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 01:37:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Apr 2022 16:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 16:37:58 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <perex@perex.cz>,
 <rdunlap@infradead.org>, <tiwai@suse.com>
Subject: Re: [PATCH -next] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Date: Thu, 14 Apr 2022 16:37:58 +0800
Message-ID: <20220414083758.32396-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <s5hzgko3wh5.wl-tiwai@suse.de>
References: <s5hzgko3wh5.wl-tiwai@suse.de>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_013803_413380_065A3024 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi Takashi,

> This must be a side-effect of the recent fix 9dd7c46346ca
> ("sound/oss/dmasound: fix build when drivers are mixed =y/=m").
> Adding Randy to Cc.
> 
> IMO, a less uglier way would be to add __maybe_unused to that
> function.  But it's a matter of taste.

thanks, I will use __maybe_unused and the fix tag in v2.

Thanks,
Miles

> 
> 
> thanks,
> 
> Takashi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
