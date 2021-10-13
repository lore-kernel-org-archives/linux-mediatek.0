Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D54AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 01:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1E2608FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 01:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D1E2608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I6h9cOkN4x2Om1s4CpGRZy6MCicy7h1qzZgAhRmSFE=; b=w8y+IHW0SnT7m3
	7qWbiBggz8F8M0P5tcHuPMUT+LuvISrjAplYIwXnoQ60MClUnyv6Er80K/V7ze5XwH32ElWKZGthK
	45xxjL0vfqd+zEm7QDfpoQYwxe4Hztqoy6qqilsIkmH9KxPzHCZyjWL+20hZa2k9dYmi/6nvsKvJx
	iJ3TAWe25RUqb1JlIcwyM8G8Pwaeeqyuheq+QOuFBApil41Wpb5h26/20QRNxG5cz+t2fVFTQSdGY
	uhcgF8YZ6/Nq4VsvAT0C/ZVJQ/OzOQgCuU3vbgrpEdjE0RouAseTBcEcJmAy/G8PJNeCaLbLMzKzE
	dxSAx7/7Jbm3i5yBLDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSlC-00EWGM-Op; Wed, 13 Oct 2021 01:08:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSl8-00EWFC-Ol; Wed, 13 Oct 2021 01:08:45 +0000
X-UUID: 66ac7d82999e4c0c855cedfdf69ed519-20211012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wo5UR62GlfUL19duHdY33pqBzIfdVlywwUiTsVrdB9Y=; 
 b=ntE7ZJg7bHqFtCQ0l2P9nW5f9dlxp5mkubMVgd83ZgZSY3rr9HPT/tQrAzXXsXT35DD82yQ2rTAiB1DgBMSkJb8EXUNEa8vN+llUbBwMvFN1t6TWr/hP3acYgG0ISE3me9Vo6s8ppxszXo2veQYUZeylFv74ukXwL1eM7D/MQmY=;
X-UUID: 66ac7d82999e4c0c855cedfdf69ed519-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2093057027; Tue, 12 Oct 2021 18:08:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 18:08:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 09:08:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 09:08:20 +0800
Message-ID: <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
Subject: Re: [PATCH v7, 00/15] Support multi hardware decode using
 of_platform_populate
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Oct 2021 09:08:24 +0800
In-Reply-To: <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_180842_840936_20E8B181 
X-CRM114-Status: GOOD (  19.99  )
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

Hi Andrzej,


On Tue, 2021-10-12 at 16:27 +0200, Andrzej Pietrasiewicz wrote:
> Hi Yunfei Dong,
> 
> W dniu 11.10.2021 o 09:02, Yunfei Dong pisze:
> > This series adds support for multi hardware decode into mtk-vcodec, 
> > by first
> > adding use of_platform_populate to manage each hardware
> > information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal
> > with core
> > hardware message, at the same time, add msg queue for different
> > hardware
> > share messages. Lastly, the architecture of different specs are not
> > the same,
> > using specs type to separate them.
> > 
> > This series has been tested with both MT8183 and MT8173. Decoding
> > was working
> > for both chips.
> > 
> > Patches 1~3 rewrite get register bases and power on/off interface.
> > 
> > Patch 4 add to support multi hardware.
> > 
> > Patch 5 separate video encoder and decoder document
> > 
> > Patches 6-15 add interfaces to support core hardware.
> 
> Which tree does the series apply to?

I don't understand your mean clearly. Media tree?

You can get the patches from this link:

https://patchwork.linuxtv.org/project/linux-media/cover/20211011070247.792-1-yunfei.dong@mediatek.com/

Thanks,
Yunfei Dong
> 
> Regards,
> 
> Andrzej
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
