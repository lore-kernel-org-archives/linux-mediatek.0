Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485F1C4332E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 01:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16020206F8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 01:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hd21lb8C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fCIOZ+bW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16020206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJDmaf68VkVCAaSD4jQlSPcLXwh+AuEduCB+56lv9p8=; b=hd21lb8CCQy4ec
	/s496K2bOVmlEAT1mNgMMOpni5AJM1zT3T91L7ln9mqRlp/L7Io5qj1ZGx++vagcPOvnOYlsCuYH9
	XKcGhnG3PWD1szwV8Bisu4ZI0hSv2lGqb51jnANjwFM+FC+ICeviE3rJfeOBhcG6hic5oYZQnBZsI
	hBE5mrYaq2hty7XGZ5j7VUIfAEJLDVZSu57iFdSbPEEBe0fZVt6N2AmSM+XTOrmRe46R5zcj3o5CO
	0UCY4ONQf2By+jAC7EtDdjBVPCBlc8hDETCDekJ2FJ9EhqCb6xaQon+TkNIMjB4b4FZBxLZMt5ZDF
	l/hXfiH2S4EDn6D+3mNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGBdY-0002nv-C6; Mon, 23 Mar 2020 01:12:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGBdT-0002mt-BO; Mon, 23 Mar 2020 01:12:14 +0000
X-UUID: e84cfff42ba54b33b7932408f16c0e21-20200322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ej7b2xhDVPxexbXWATZXTqKZRMpmRwD04pT0SWLn2fk=; 
 b=fCIOZ+bWNom8QOBcauvYjY7vyph+pCXA1q4bc1Wd1qWLAI/bcnraokHPUBldFY3u+D6NQCQ03BpaRBQiPrVEKxahMNEXn5IkfZ/PTze118rifakZLoiCRwrbNui7FP+7D70UYRuEDzKEJguwIvNTLDrhy2/2kTB8PT035c/RRz4=;
X-UUID: e84cfff42ba54b33b7932408f16c0e21-20200322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 476863208; Sun, 22 Mar 2020 17:12:04 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Mar 2020 18:12:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 09:11:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 23 Mar 2020 09:09:43 +0800
Message-ID: <1584925915.16928.1.camel@mtkswgap22>
Subject: Re: [PATCH v5 02/13] mailbox: cmdq: variablize address shift in
 platform
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 23 Mar 2020 09:11:55 +0800
In-Reply-To: <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_181211_400201_CEE2B511 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jassi,


On Thu, 2020-03-19 at 20:05 -0500, Jassi Brar wrote:
> On Sun, Mar 8, 2020 at 5:53 AM Dennis YC Hsieh
> <dennis-yc.hsieh@mediatek.com> wrote:
> >
> > Some gce hardware shift pc and end address in register to support
> > large dram addressing.
> > Implement gce address shift when write or read pc and end register.
> > And add shift bit in platform definition.
> >
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
> >
> Please segregate this patch, and any other if, into mailbox and
> platform specific patchsets. Ideally soc/client specific changes later
> on top of mailbox/provider changes.
> 
> Thanks

Thanks for your comment. I'll separate mailbox and soc code.


Regards,
Dennis

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
