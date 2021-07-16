Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EC8C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:56:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF40613E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF40613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFr0sZQS0IwEwQ90zr2CG6yWnWqjJ53wVgwO3Lqdj9s=; b=pr04f4DOwU6bMZ
	F+1DgN9NMWa4clKQrGkpXJTbKpHQkpXjN95EwQUZPJVS3+1Os8+kq5fG08MVI4JtuyM3gt6uDJaYb
	kexdOPnSFf91MVKZ1LcmcP1WRg3cphPxMcMr2sXVW5N8zMoEubVCffDSoH7TOnx6aDiVSqBEF+LHW
	mejBqWicXTQ2Xeln/VvVVSSFQMh2OVrDA0u0uD7NEGUESAusfFcFcWzHmWiytilV0+b3zd1jqFj+o
	fimf4/sPbAled/62ic7kOL7L2Aw/BNW5Jthwh64coAXxPD9qhDqbYfsAVkp+SeVpkweo2tlUNI1c2
	A2QGr2OzCqxz1fyfXmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KaE-0040T2-LN; Fri, 16 Jul 2021 09:56:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Ka1-0040Rj-IH; Fri, 16 Jul 2021 09:56:27 +0000
X-UUID: 47737c754f4e43aab72075b38f453006-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=phqCD4LJR0pNpBe3FK03xbs4bsxYpn9hSfS9hoyXs+k=; 
 b=YTvmwYpHJUgH8Gjq3kCIA2uZD3b3ML+6Wwyu2kyXUAXulPxEZWEMPOXTKN2XIMBgFfQxMGfwgiLdE3Lu1hWEB7T5fxkZHjOIgBIi7Is4eVPMA1Y/6kgNr/zWftzXvfUqV4aNhPgV7AAjf4H+qLDRHhCjPj8K13mIfBFKpYLkxYk=;
X-UUID: 47737c754f4e43aab72075b38f453006-20210716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2101136093; Fri, 16 Jul 2021 02:56:22 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 02:54:01 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 16 Jul 2021 17:53:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 17:53:57 +0800
Message-ID: <1626429237.29703.16.camel@mhfsdcap03>
Subject: Re: [PATCH 8/8] i2c: mediatek: modify bus speed calculation formula
From: Kewei Xu <kewei.xu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: <wsa@the-dreams.de>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <ot_daolong.zhu@mediatek.com>
Date: Fri, 16 Jul 2021 17:53:57 +0800
In-Reply-To: <CA+Px+wWNcSkxvsEoUrgBN73+jhq8qjFJodYjQnY1zW2d0a5yRA@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-9-git-send-email-kewei.xu@mediatek.com>
 <CA+Px+wWNcSkxvsEoUrgBN73+jhq8qjFJodYjQnY1zW2d0a5yRA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6F46C422B3AC89BA8EF99B33069B7310E2E578E2D00ADFD2BE96F0D5623221F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_025625_652881_B641E09D 
X-CRM114-Status: GOOD (  16.81  )
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

On Thu, 2021-07-15 at 15:09 +0800, Tzung-Bi Shih wrote:
> On Thu, Jul 15, 2021 at 10:32 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
> > When clock-div is 0 or greater than 1, the bus speed
> > calculated by the old speed calculation formula will be
> > larger than the target speed. So we update the formula.
> The patch sounds like a fix up.  Need a "Fixes" tag.
> 
> >         for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
> >                 clk_src = parent_clk / clk_div;
> > +               i2c->ac_timing.inter_clk_div = clk_div - 1;
> Using the way to pass the parameter "inter_clk_div" to
> mtk_i2c_calculate_speed() looks like a hack.  inter_clk_div is set
> again[1] next to the for loop.
> 
> [1]: https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/i2c/busses/i2c-mt65xx.c#L831
> 
> 
> 
> I have no domain knowledge of what/how the patch fixes.  But if this
> is a standalone fixup patch, suggest separating to an independent
> patch.

Hi Tzung-Bi,

1. This Patch is not for fixing previous commit,it is just for the bad
speed formula.

2. I will fix this problem according to your suggestion in the next
patch.

Thanks
Kewei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
