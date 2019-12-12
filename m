Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F73BC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 09:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203E6206DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 09:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HSSMA7v+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jq1MoFnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203E6206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axG/SmeFrIuEbPkZMT/Los5y7So+NGvpjrSMgSCwymc=; b=HSSMA7v+vH1l+6
	DEfenKZHcjALyX1OiPgTHxwZ6zNnJHzRG7GMJ4RYTF0QH/7mU2PGXvzIs5cXQp7nAGCpDfLS5Uxj8
	RfGnjQxaBF0saix3COBGjXJBu+xA4XVFPWY4cg3NygUfAnr0pNrGJHTEysmgpNSpi2UF6F9iN4RgK
	fLr4joEVSwbW3dmcAfseWs0iUxeTu3AZuJoKqqz9ETVVy/HsZD1BwCpVR5UUnGQHeLiKx4INSbnEL
	5JgVTwnlygYawE1FVGgMIwiXrOpmYpU+g3vwwwteI/ihxzRcOTfB/uppTHx0ZwLSrtx3UG3o+mWMh
	/3RV0WYicXdxM0orgXsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifLEe-0000PS-6Q; Thu, 12 Dec 2019 09:58:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifLEP-0000BA-FU; Thu, 12 Dec 2019 09:58:02 +0000
X-UUID: 0002e869d2b64c58a74eb2c293629ba9-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jjUFyhr70q5Qwl+cMOFBMZpPatFW/kw0aENfH71RXPE=; 
 b=jq1MoFnXSMWZvmV0J7XARns1yvG2bHjCQbtyK65p/f/bLDgB/PvOdmWrmEMcXF5rTX9bvglZotXQa5HwIpiqnc+QdQsXWCsRVFfcnnM/cVX6QsHaS1Lq6YfkMfQSvyrBVim5vxfXraDAoabZFjvpD1fe5Qm152QqcUSnzzDZzuQ=;
X-UUID: 0002e869d2b64c58a74eb2c293629ba9-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 392406774; Thu, 12 Dec 2019 01:57:52 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 01:48:06 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 17:47:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 17:47:46 +0800
Message-ID: <1576144069.16442.3.camel@mtksdaap41>
Subject: Re: [PATCH v17 0/6] support gce on mt8183 platform
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
Date: Thu, 12 Dec 2019 17:47:49 +0800
In-Reply-To: <cb5cd58e-dc62-ae30-9ddd-7c2b95fde3e3@gmail.com>
References: <20191121015410.18852-1-bibby.hsieh@mediatek.com>
 <CANMq1KCTJQL+GFqo8HYM8cEpzXJmebJ=9ju4CzHLwyuQfbZEAA@mail.gmail.com>
 <cb5cd58e-dc62-ae30-9ddd-7c2b95fde3e3@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_015801_548544_22128ADC 
X-CRM114-Status: GOOD (  15.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, CK HU <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-12 at 08:49 +0100, Matthias Brugger wrote:
> 
> On 11/12/2019 23:09, Nicolas Boichat wrote:
> > Hi Matthias,
> > 
> > Quick question, any reason you picked only patches 2+3+6 from this
> > series, and not the 3 others?
> > 
> 
> The quick answer, time :)
> The longer one:
> 1/6 went already in through fixes for v5.4
> 4/6 it touches mailbox code, so we will need a acked-by from Jassi

Hi, Jassi,

Sorry for the mailing losing.
Could you help me to review [PATCH 4/6 soc: mediatek: cmdq: add polling
function] if you are free?

Bibby

> 5/6 time, I want to have a better look onto this to see if that makes sense (I
> slightly remember some old comment I had on this)
> 
> Regards,
> Matthias
> 
> > Thanks.
> > 
> > On Wed, Nov 20, 2019 at 5:54 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> >>
> >> Changes since v16:
> >>  - naming the poll mask enable bit
> >>  - add a patch to fiup the input order of write api
> >>
> >> Changes since v15:
> >>  - rebase onto 5.4-rc1
> >>  - rollback the v14 change
> >>  - add a patch to fixup the combination of return value
> >>
> >> Changes since v14:
> >>  - change input argument as pointer in append_commend()
> >>
> >> Changes since v13:
> >>  - separate poll function as poll w/ & w/o mask function
> >>  - directly pass inst into append_command function instead
> >>    of returns a pointer
> >>  - fixup coding style
> >>  - rebase onto 5.3-rc1
> >>
> >> [... snip ...]
> >>
> >> Bibby Hsieh (6):
> >>   soc: mediatek: cmdq: fixup wrong input order of write api
> >>   soc: mediatek: cmdq: remove OR opertaion from err return
> >>   soc: mediatek: cmdq: define the instruction struct
> >>   soc: mediatek: cmdq: add polling function
> >>   soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
> >>   arm64: dts: add gce node for mt8183
> >>
> >>  arch/arm64/boot/dts/mediatek/mt8183.dtsi |  10 ++
> >>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 147 +++++++++++++++++++----
> >>  include/linux/mailbox/mtk-cmdq-mailbox.h |  11 ++
> >>  include/linux/soc/mediatek/mtk-cmdq.h    |  53 ++++++++
> >>  4 files changed, 195 insertions(+), 26 deletions(-)
> >>
> >> --
> >> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
