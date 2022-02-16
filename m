Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB77C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcUz/kuIohKipF/2NWXbPl8bVLXh3TiVlc8C/Dfec8U=; b=wSqARh23Fw9Qpn
	+huFd8Rc5VjxgcjVMJXR/oUllgZ4atDeXWF2oydDCa63yEWG2LIwf5gXQ3v7CrcE5CtYxQaQSqYLw
	vSiKvf+LBYo636+Qq2BeuwvyxjFR8OOUW7+5sXEQT3E1eu3W5rovYeWGZtvXJIeXKBEKyv0Ef/Jr2
	mIKm+XQoHHPPT/s2AMKcwwt4AJKbkzCGfhSa5Z97xAQKvyw3+/qfdd14dDk6i8QkKQ7o5JLJLTHkA
	ALRtlWpKfA10QVsovh7FVW83rqsqbUS6pc7vB/ty8Feurj1pyJ1RFFa+bqhHPFNh81Y/MlUHJrsgA
	jIbR/mjcpknLEJoou/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFUk-0064vT-Kq; Wed, 16 Feb 2022 08:17:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFUg-0064sx-HE; Wed, 16 Feb 2022 08:17:00 +0000
X-UUID: 127ac125509a4d82b359d320dd902ab9-20220216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XPBHhhKpgpi60tGA5UdUvJWBlQ/HZPl1juQ4Le6+UL4=; 
 b=ND7aoK1NZFBL2ccWCqrfPFri808seb6fQCwA8aKU3Epph2ml4wAOs3QBe4R6duudfopU7tiqap1RmQFyq2GodxP+Yp0hyvz5hYt2szJJCi0eU41eCW9qsYkBPiNrEiQv+rx369fnseDvXGdR9FJuPyee5274h5mPWiC7tIKyYqk=;
X-UUID: 127ac125509a4d82b359d320dd902ab9-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074070465; Wed, 16 Feb 2022 01:16:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 00:11:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Feb 2022 16:11:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 16:11:42 +0800
Message-ID: <75a08f8d97e112f6c584f7b62934aa178eca8bc4.camel@mediatek.com>
Subject: Re: [PATCH v4 08/35] iommu/mediatek: Use kmalloc for protect buffer
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Will
 Deacon" <will@kernel.org>
Date: Wed, 16 Feb 2022 16:11:42 +0800
In-Reply-To: <CAAFQd5Cqg2xPwtzcom_EZ1tw1tOBsND_i1YAQCO4kF=+eWePBQ@mail.gmail.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-9-yong.wu@mediatek.com>
 <ca47becf-adc9-f11e-5e59-03f203920344@collabora.com>
 <d9637b40196873f392ac9cebfe369106a6f0eee7.camel@mediatek.com>
 <CAAFQd5Cqg2xPwtzcom_EZ1tw1tOBsND_i1YAQCO4kF=+eWePBQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_001658_609289_BA73C6FC 
X-CRM114-Status: GOOD (  32.09  )
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

On Wed, 2022-02-16 at 14:59 +0900, Tomasz Figa wrote:
> On Wed, Feb 16, 2022 at 2:55 PM Yong Wu <yong.wu@mediatek.com> wrote:
> > 
> > On Thu, 2022-01-27 at 12:08 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 25/01/22 09:56, Yong Wu ha scritto:
> > > > No need zero for the protect buffer that is only accessed by
> > > > the
> > > > IOMMU HW
> > > > translation fault happened.
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > 
> > > I would rather keep this a devm_kzalloc instead... the cost is
> > > very
> > > minimal and
> > > this will be handy when new hardware will be introduced, as it
> > > may
> > > require a bigger
> > > buffer: in that case, "older" platforms will use only part of it
> > > and
> > > we may get
> > > garbage data at the end.
> > 
> > Currently this is to avoid zero 512 bytes for all the platforms.
> > 
> > Sorry, I don't understand why it is unnecessary when the new
> > hardware
> > requires a bigger buffer. If the buffer becomes bigger, then
> > clearing
> > it to 0 need more cost. then this patch is more helpful?
> > 
> > The content in this buffer is garbage, we won't care about or
> > analyse
> > it.
> 
> I think we should zero it for security reasons regardless of any
> other
> aspects. With this patch it's leaking kernel data to the hardware.
> 
> At the same time, we're talking here about something executed just 1
> time when the driver probes. I don't think the cost would really
> matter.

OK. I will remove this patch in next version.

Thanks.

> 
> Best regards,
> Tomasz
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
