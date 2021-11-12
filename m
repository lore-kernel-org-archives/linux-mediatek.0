Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A67C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4FD61247
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C4FD61247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KLdUNLHZFzN5IuWoeqW6ufapcIcaoVaAXh1dnoO3Do=; b=rAFXgkHSA8y2t2
	QsK/5Nb7WwrERMu3yPScScbObXtQzeCA2vrC4DEA5COjZEO9jwUEjksj6T0H9xNCROIj+upI0Ni5m
	nhqHPD3Slc43qvlfEUSdYp945H08icDu3t3odkyaACYusYG4JmrbiOsgjCy369bR85qEvuDOTiYdV
	/P4WGBso7UNUgZLzLcFd5aGSLEPYwr6oAey4A5E6bO7OAYi5pnWRYfjDy7n9CypRFhQGUicpAJnID
	YEi0kvJrZKOX2nS7SxIJdsZIx+0ySKSbeEWVfwMNnS96Xm5Z0F+fv6z55YxqcS0z4ZEYkGTmVuqnr
	EG9fMLWsMXtNK0xN5zvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlLCG-0099nN-IW; Fri, 12 Nov 2021 01:17:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlLCC-0099lz-Sf; Fri, 12 Nov 2021 01:17:39 +0000
X-UUID: 1b9fe78fb28d4f94ad3b84df48a495d4-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=J89u8ajOE7RnIe0Hf+cMtrKrCMlq2XyJUXaOQVwayHQ=; 
 b=L3B38oRthqNSBzsV/ntQFDtKu8+u2+Usm+oFm+a8yw8z4Dg4QCEZS4nA02StJMQVK3bKby7dmZBOV+QCInQEm02ONMg+jaRgQ7DcHLdjyJatXuxycBJ965eCd2Eb1qYvdPRbPhIbwlaNlWUcNT2BzB8jv8F1bPBuhGU90RLPyjo=;
X-UUID: 1b9fe78fb28d4f94ad3b84df48a495d4-20211111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2014806752; Thu, 11 Nov 2021 18:17:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 17:17:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 09:17:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 09:17:28 +0800
Message-ID: <36653ae5c1e1babe314eabf070f3220a603d55c7.camel@mediatek.com>
Subject: Re: [PATCH v2] memory: mtk-smi: Fix a null dereference for the ostd
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Fri, 12 Nov 2021 09:17:28 +0800
In-Reply-To: <1d72bac8-eb79-6f34-79ca-4c5c38d6d2bf@collabora.com>
References: <20211108082429.15080-1-yong.wu@mediatek.com>
 <1d72bac8-eb79-6f34-79ca-4c5c38d6d2bf@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_171738_366390_1957CCE2 
X-CRM114-Status: GOOD (  24.91  )
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

Hi AngeloGioacchino,

Thanks very much for your help review.

On Thu, 2021-11-11 at 14:41 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/11/21 09:24, Yong Wu ha scritto:
> > We add the ostd setting for mt8195. It introduces a KE for the
> > previous SoC which doesn't have ostd setting. This is the log:
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 0000000000000080
> > ...
> > pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> > lr : mtk_smi_larb_resume+0x54/0x98
> > ...
> > Call trace:
> >   mtk_smi_larb_config_port_gen2_general+0x64/0x130
> >   pm_generic_runtime_resume+0x2c/0x48
> >   __genpd_runtime_resume+0x30/0xa8
> >   genpd_runtime_resume+0x94/0x2c8
> >   __rpm_callback+0x44/0x150
> >   rpm_callback+0x6c/0x78
> >   rpm_resume+0x310/0x558
> >   __pm_runtime_resume+0x3c/0x88
> > 
> > In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> > if "larb->larb_gen->ostd" is null, the "larbostd" is the
> > offset(e.g.
> > 0x80 above), it's also a valid value, then accessing "larbostd[i]"
> > in the
> > "for" loop will cause the KE above. To avoid this issue, initialize
> > "larbostd" to NULL when the SoC doesn't have ostd setting.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > change note: Reword the commit message to show why it KE. and
> > update the
> > solution via initializing "larbostd" is NULL explicitly in the non-
> > ostd
> > case.
> > ---
> >   drivers/memory/mtk-smi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> This commit needs a Fixes tag. Please add the proper one.

This should fix this one:

fe6dd2a4017d ("memory: mtk-smi: mt8195: Add initial setting for smi-
larb")

But the commit id comes from linux-next. I'm not sure if the sha-id
will be changed again when enter mainline. so I didn't add it.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
