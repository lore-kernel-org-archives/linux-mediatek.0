Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2718C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 05:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4t4J1I6plMtzP/pwpUL9qfWmV69TVV4WH5cx7bFktSg=; b=qGzRMBIoew1Y72
	EIgWTvWYPu4ke0zf8S6OVfdMKjNGurOwVH8GT7jm0lxxW64CSS3F4jiX/hesr7HfGqDZ7hXp2IJrG
	88HLvYmYTFMtsm32u2hCrPUBvmDsMttCCctjOAW2F58CGqCTKMZT5s/IGCbE2ZhPIe1vQG5pSsgqo
	OtW4aW+9Ewf3OzUfc0Boq2CYfVMXCg0PovFDaKjYM2y8S0FMnOsrctyi216q8+WKA84N1GM1qJ3B7
	3hA/cLoYkeaDIGAUz3+eZO5iJHFLBLik7rOzj3sNh7Tu2ZnAC1ZsLYSZZGBcL7SWmIQFIhyhR8H0v
	yk80jzWoR6K2mtWLpwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCabO-00ABg7-MT; Wed, 26 Jan 2022 05:12:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCabM-00ABfk-AF; Wed, 26 Jan 2022 05:12:13 +0000
X-UUID: 729fcda7112243b3a5c5855528bb2e22-20220125
X-UUID: 729fcda7112243b3a5c5855528bb2e22-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1319615597; Tue, 25 Jan 2022 22:12:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 21:12:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 13:11:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 13:11:55 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <david.laight@aculab.com>
CC: <kiran.kumar1.s@intel.com>, <lakshmi.sowjanya.d@intel.com>,
 <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>
Subject: RE: [PATCH] pinctrl: fix a discarded-qualifiers build error
Date: Wed, 26 Jan 2022 13:11:55 +0800
Message-ID: <20220126051155.25808-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <693a71e17b364afd987f2d2178b7e5cb@AcuMS.aculab.com>
References: <693a71e17b364afd987f2d2178b7e5cb@AcuMS.aculab.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_211212_385300_DEB54D7B 
X-CRM114-Status: UNSURE (   8.78  )
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

Hi, 

> You should change the type of 'grp' not add a cast.
> The compiler can warn about casts removing 'const' as well.
> 
> 	David

Thanks for the comment,
I just found that this issue has been fixed [1]


Miles

[1] https://lore.kernel.org/lkml/DM6PR11MB3660804C821D7CA7329B6CAFC45F9@DM6PR11MB3660.namprd11.prod.outlook.com/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
