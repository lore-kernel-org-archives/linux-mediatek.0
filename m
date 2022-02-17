Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkYIHrUP/xbDmHdXC78fOjA+5IA/bRNnamuZLm8p7Tg=; b=gSIaJzYDQa1bVe
	IrQflE+X1XR8A9xVaPA0rTj4/Kjy+lqmuh8wd8YnuUToi72jMF5IC942NeF8BjNydV+84TylcwC7E
	Kiyp8sIJW4t6mrfLxB/hayJ2Kku8deIv38n3x7z4+MmOGxOPpx3fggEPCZwYsw29MRFYS5U4yD12P
	cH7FQRJVh1krE8LgGxZE27ODLG3FiB3iJCjJu6r+NSzBshD+40rG6fYFm9p5S3ZgQLASM3j8rIOC0
	l0Yl8sN9EhyopHlQJMJCRNqQPVwzT1DvdzjGz7bZANBQZuMv5RLxm4hIS/DCKH2hH2Pg69UXZU7vX
	Z8pVhLR+w/4eXJw0q/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhRG-00AsYK-N1; Thu, 17 Feb 2022 14:07:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhDa-00AlQP-Hu; Thu, 17 Feb 2022 13:53:12 +0000
X-UUID: 8c90b40de8b24ee7b5b85be89f187357-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rHCBgKqoJXT15e39+0z5HOELDojN0003nX5YAu1LsJw=; 
 b=V3lA5ax/W/i7qJQc7EJ3ZRBAKsnPMuFprg33DvZE4ZWUZIlw/2medcQCAGZro+2IXtEPyWKsWv/NLwc9kxjt+/kXHthOeHFoTh1EmloO5UKHdwXqwt/tYOTfPerN00Il9BP2/RfnIy0W8+fvmqo6vs6SabswZmPNXLAg964kaKU=;
X-UUID: 8c90b40de8b24ee7b5b85be89f187357-20220217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1810447556; Thu, 17 Feb 2022 06:53:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:53:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 21:53:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:53:02 +0800
Message-ID: <4958e2ad25f4940a0c0bbbf23ea027e7bdaf5ac7.camel@mediatek.com>
Subject: Re: [PATCH 10/15] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <zhangqilong3@huawei.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 17 Feb 2022 21:51:57 +0800
In-Reply-To: <YgaK4hiRjEJi9wQ4@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-11-jiaxin.yu@mediatek.com>
 <YgaK4hiRjEJi9wQ4@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055310_643307_7F46F360 
X-CRM114-Status: GOOD (  13.43  )
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

On Fri, 2022-02-11 at 16:12 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:13PM +0800, Jiaxin Yu wrote:
> 
> >  sound/soc/mediatek/Kconfig                    |   44 +
> >  sound/soc/mediatek/Makefile                   |    1 +
> >  sound/soc/mediatek/mt8186/Makefile            |   21 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
> >  sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
> >  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  262 ++
> >  sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  211 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3030
> > +++++++++++++++
> >  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
> >  .../soc/mediatek/mt8186/mt8186-misc-control.c | 1729 +++++++++
> >  sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433
> > +++++++++++++++++
> 
> I know it's already a long series but perhaps the clock and GPIO bits
> could be split out into separate patches?  This one patch is over
> 300K
> which is a bit much in one go, especially when it's not just all big
> tables.

Ok, I see. I've split them out into separate patches in v2 version.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
