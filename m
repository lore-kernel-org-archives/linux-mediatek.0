Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0f+Qyr8pRIkGv0mZB7PxSxXvprHwy3MU3awoyatBYU=; b=mvmN4Kbhp/ju9F
	xKEJ38taZPbawNPC6uGKPlBTqS0zZqDSnMcxZxJ/fUmTklA2zIx+jA2gMftVtwtbG6nOE9YJL4wD5
	OgVkwzQhc9h4yI68n9jdEDI8DgudNa5KBZq7rPEF2wqbQY50RpLfM4UY7LpGRXLKrcLPU/Ehysnis
	M3WPpoD5cqI3y2pABrKBn8DxhSVGKEg0I/AeUYaRsCirgjhW5Csk4ITCvR+ueaVxvWoaNLbCA6tcA
	XNRFDyq2QoYznT8MfdpbhNLyCAik+KnNbJ7msj8DTcVDIRCY60OJDOUcxzM9tabVUiDQKLs1YN0hl
	CXuBcfSNwqYI+P1HpkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMn3A-00DGN3-AC; Wed, 23 Feb 2022 08:31:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMn36-00DGLg-1v; Wed, 23 Feb 2022 08:31:03 +0000
X-UUID: 57081ced5c2f44b6afe1c371465fa416-20220223
X-UUID: 57081ced5c2f44b6afe1c371465fa416-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1589368451; Wed, 23 Feb 2022 01:30:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 00:28:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 16:28:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 16:28:15 +0800
Message-ID: <0e528e1649d49a04ae28590309307789563c6105.camel@mediatek.com>
Subject: Re: [PATCH 1/4] mfd: Add support for the MediaTek MT6366 PMIC
From: Johnson Wang <johnson.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
CC: <robh+dt@kernel.org>, <broonie@kernel.org>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 23 Feb 2022 16:28:15 +0800
In-Reply-To: <Ygpbl/pxEVAug6jl@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-2-johnson.wang@mediatek.com>
 <Ygpbl/pxEVAug6jl@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_003100_131617_A34277B5 
X-CRM114-Status: GOOD (  19.52  )
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

On Mon, 2022-02-14 at 13:39 +0000, Lee Jones wrote:
> On Thu, 06 Jan 2022, Johnson Wang wrote:
> 
> > This adds support for the MediaTek MT6366 PMIC. This is a
> > multifunction device with the following sub modules:
> > 
> > - Regulator
> > - RTC
> > - Codec
> > - Interrupt
> > 
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6366 MFD is a child device of the pwrap.
> > 
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >  drivers/mfd/mt6358-irq.c             | 1 +
> >  include/linux/mfd/mt6358/registers.h | 7 +++++++
> >  include/linux/mfd/mt6397/core.h      | 1 +
> >  3 files changed, 9 insertions(+)
> 
> Applied, thanks.
> 

Hi Lee,

Thank you for your review and response.

However, it seems that my patches are not applied yet.
Is it possible to merge my patches into mainline?

If you have any concern, please let me know.

Thanks.

BRs,
Johnson Wang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
