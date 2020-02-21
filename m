Return-Path: <SRS0=GSZf=4J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7531C35647
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 10:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EF124656
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 10:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZAjVIiCB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u3AJW8nL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EF124656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8njiF1SAqMxmiR7wTVIypUj7j5/F747903adg5XIW70=; b=ZAjVIiCBocYg08
	5JnVWSxNu+tOF2BdpXSaEShbOAweND7MrWNscNd8jZSLypKf4AlCkZf0hc/VtrD7IL5oAIZx9kn8n
	MPh/M3+95Tbvh+SHpie/6Qtvqgcg29PTNvtVVzKLKRLmkvQWJEZVaM6gKJKMd9DEwv7xZ7ZuH01QJ
	ursKjqnNX73Gmjd7D59oEA/L4GjEP+LghAOBf90CP1bfeCKqgXOKr8iOGFaLqg0qMj2O1K/AO30rr
	t7HW/iOMzHHQrjgXVWiUhzNgI3e3DYSvona1TYIm2cdQfhPG+fuNFqgCuGiJxfi6L4G8wptrB/TcO
	aE+8xjrDrQUbtsCGIdfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j55cu-0003lF-8L; Fri, 21 Feb 2020 10:33:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j55cj-0003c4-EB; Fri, 21 Feb 2020 10:33:34 +0000
X-UUID: b25c21c3736e4ecf9c580e5eb5460010-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9GF943aZdupXgIlWbr1tM9dp52aP/OtDRXFu16nBKsU=; 
 b=u3AJW8nLcjG4YYRvG+aYOWurkYxWQrMb9Q6bFv2Edoq+9llIMsJn3ZjZP1011vNZw8o8HfizgaiksK29NQHvWSrBXZmQSCiaGDUxvmDf4rt8TseCiGDJ/AwhFqr4hx7pBArZk9p0VLI8Mue2K47ZgRYPcIjcWiACtcBsR/g1h+Q=;
X-UUID: b25c21c3736e4ecf9c580e5eb5460010-20200221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1675544727; Fri, 21 Feb 2020 02:33:31 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 02:23:58 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 18:22:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 21 Feb 2020 18:22:44 +0800
Message-ID: <1582280608.19053.27.camel@mtkswgap22>
Subject: Re: [PATCH v7 0/7] Add basic SoC support for mt6765
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 21 Feb 2020 18:23:28 +0800
In-Reply-To: <158213769281.184098.14491216159423631295@swboyd.mtv.corp.google.com>
References: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
 <158155109134.184098.10100489231587620578@swboyd.mtv.corp.google.com>
 <bf5e1a64-1aaa-e1e0-00bf-c0e750dd27ed@gmail.com>
 <1581999138.19053.21.camel@mtkswgap22>
 <2c6728a5-7789-4ca2-a173-67df57fe5f1e@gmail.com>
 <158213769281.184098.14491216159423631295@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FDD232F52A5E189BADF5D5BF6B5B255DDCAC9D3340344A6748231A437ADA98A62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_023333_485220_CEBABCB3 
X-CRM114-Status: GOOD (  17.95  )
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
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>, Fabien
 Parent <fparent@baylibre.com>, Mars Cheng <mars.cheng@mediatek.com>, Will
 Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Ryder Lee <Ryder.Lee@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Evan Green <evgreen@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Sean Wang <Sean.Wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Matthias Brugger and Stephen Boyd wrote:
> Quoting Matthias Brugger (2020-02-18 08:45:42)
> > 
> > On 18/02/2020 05:12, Macpaul Lin wrote:
> > > On Sat, 2020-02-15 at 02:47 +0100, Matthias Brugger wrote:
> > > 
> > > Hi Stephen,
> > > 
> > >> Hi Stephen,
> > >>
> > >> On 13/02/2020 00:44, Stephen Boyd wrote:
> > >>> Quoting Macpaul Lin (2020-02-07 01:20:43)
> > >>>> This patch adds basic SoC support for Mediatek's new 8-core SoC,
> > >>>> MT6765, which is mainly for smartphone application.
> > >>>
> > >>> Clock patches look OK to me. Can you resend them without the defconfig
> > >>> and dts patches and address Matthias' question?
> > >>>
> > >>
> > >> I'm not sure if I understand you. Do you prefer to have just the clock parts
> > >> send as an independent version so that you can easier apply the patches to your
> > >> tree?
> > >>
> > >> Patch 2, 5, 6 and 7 should go through my tree.
> > >> So do you want a series with patches 1, 3 and 4?
> > >>
> > >> Regards,
> > >> Matthias
> > > 
> > > Yup, I've got a little bit confused, too.
> > > Should I separate and resend these patches into 2 patch sets?
> > > The 1st patch set includes #1, #3, and #4?
> > > And the other includes #2, #5, #6, and #7?
> > > 
> > 
> > Yes please do so. I think that's what Stephen referred to.
> > 
> 
> If those are the ones that aren't dts or defconfig patches sounds good
> to me.

Here comes the spilt patch sets.
1. [New] Add basic clock support for mt6765.
  https://patchwork.kernel.org/cover/11395997/
2. [PATCH v8] Add basic SoC support for mt6765
  https://patchwork.kernel.org/patch/11396019/
  But it's a little bit strange I cannot find patch v8's cover-letter
  in patchwork. Only records which patches has been taken from v7.
  If resend cover-letter is required please let me know.

Regards,
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
