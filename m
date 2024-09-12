Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD2EED60A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXsu4PAktlF7QNREiEYhQw1grZQbrqdQctWBzeutNA4=; b=ocwYpCtXbDUI0vQYuWN/gj5gXs
	yIobRfPL9ukDwVyt1pmmqbGB4cA4EmToq9zYIq3ugleaDSqhRzHCF5Ds1zwzplgHdHJbbZA4jcj/g
	gIYisvBk+vynGTVc738qotofE5O9wfUZrOfwcNmoQhUsbzRZfITmCWyyJQgDRxPmEPaod2QeJBMyc
	P99rgPadTZTYHFwkFFUUlsHMQCBusE2Rvy+Xj1QH65XQMv3YKt9XRRr+AILVpOQcUUbozGGImc3xX
	2W0Zu2AnpyUt/JEAdZ2hXG5qmmt4avxhtnqSkbwDIwMnN4/eoLf4Vy0zNNBcishXvkcqxs6W9n6ha
	vzhLxrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokga-0000000DKJM-0c16;
	Thu, 12 Sep 2024 14:20:40 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokgW-0000000DKJ4-0551
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 14:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EXsu4PAktlF7QNREiEYhQw1grZQbrqdQctWBzeutNA4=;
	b=VYWQ48i5fum90GyYmj8go1aV8Jln7JFMMTjW4Ys09QmrPAfzqfqCsKnSd2RRL3
	QbiYAesCYNxtnm9DsNHYYLk8nHkxcK+WnTdne3MaHS3AifBgSpLb1B32zYqYDpy9
	C0MZO+pUEYdXu4/joUdSW1CyKkSD7N30Y3jzyTOHF1Wn0=
Received: from localhost (unknown [58.243.42.99])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3n1We+OJmVEdRBA--.13630S2;
	Thu, 12 Sep 2024 22:20:14 +0800 (CST)
Date: Thu, 12 Sep 2024 22:20:13 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: mingyen.hsieh@mediatek.com, nbd@nbd.name, deren.wu@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Re: Is this a out-of-bounds issue?
Message-ID: <ZuL4naNUi9LgFcfM@thinkpad.>
References: <66e2ec22.050a0220.37047b.174cSMTPIN_ADDED_BROKEN@mx.google.com>
 <ZuLt4mJIKXldo9LH@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuLt4mJIKXldo9LH@lore-desk>
X-CM-TRANSID: _____wD3n1We+OJmVEdRBA--.13630S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaj2NDUUUU
X-Originating-IP: [58.243.42.99]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQVYamXAo3-RrgAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_072036_511120_B4BFFC53 
X-CRM114-Status: UNSURE (   6.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Hi,
> 
> I think this is already fixed here:
> https://patchwork.kernel.org/project/linux-wireless/patch/84bf5dd2-2fe3-4410-a7af-ae841e41082a@stanley.mountain/
> 
> Regards,
> Lornzo

Thanks!

-- 
Best,
Qianqiang Liu


