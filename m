Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3B5C34033
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 04:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9631420801
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 04:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZT3VpwLn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="meGckE/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9631420801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDS/UI3Ucpy2REj7AzfGDFao1+vXCiW6sIkl2OlTDq4=; b=ZT3VpwLn1N1EwC
	u8pIUh9mJxrMRC0cLnSaTSCkEW/gxo+D7TdJ5wzQAhAmQuShY/ZlQiafz6Kl0QMTyqj6wNlysSIr8
	t1/nD5Nj5HK0PX1Yjq7vYIAATXo09WCVdm3kUl/URpb4UGVr1KNmAymVtlkt5vApij4AlI+FZpmpI
	sloYpKXsE1GJPsEi/7nwYfIGsSzQppMOp7JDT1L/+gTBb/N1X/CyfQRW+goJBBKJ2cmr38TryU9Jj
	OSN2/DhdiPVhLAPujRoOjxXMrl787OzhJvrnNCpLL7SpTyM7UaAsqkyP+BNrLqV781a3QHs22bTCC
	8hxZcUei11ERtBdCoGdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3uP3-0005aw-OG; Tue, 18 Feb 2020 04:22:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3uOz-0005aO-2v; Tue, 18 Feb 2020 04:22:31 +0000
X-UUID: a763f1c528ff4016a936ce9ef81dc152-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sC1dH8d6p1Sb7KU8Fpm99duFBOtY/J9QQu2NqxSwvKI=; 
 b=meGckE/RlG4C4gn9SvGq8p7btegtkWaCNAgOrHGz5uXE/hPuHn/nEmO/H6Kv4baV/2NN3DNL1UaM1l9a7y41uXPsT1YJYIBBgT6EWqymZ870u0XJJDg60VTd137oQo11g/9CSPeQ+bxQKfpnEI4WlITaUr09aIK66rqrIoYuvD8=;
X-UUID: a763f1c528ff4016a936ce9ef81dc152-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 931175499; Mon, 17 Feb 2020 20:22:22 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 20:13:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 12:09:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 12:11:50 +0800
Message-ID: <1581999138.19053.21.camel@mtkswgap22>
Subject: Re: [PATCH v7 0/7] Add basic SoC support for mt6765
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Date: Tue, 18 Feb 2020 12:12:18 +0800
In-Reply-To: <bf5e1a64-1aaa-e1e0-00bf-c0e750dd27ed@gmail.com>
References: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
 <158155109134.184098.10100489231587620578@swboyd.mtv.corp.google.com>
 <bf5e1a64-1aaa-e1e0-00bf-c0e750dd27ed@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84BB3C13CA23C8AB9C9ED080959C0C3F21F3FB9B8B07A59D24DCEF47D5C4BF1C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_202229_137742_D297BD93 
X-CRM114-Status: GOOD (  13.62  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Michael
 Turquette <mturquette@baylibre.com>, Loda
 Chou <loda.chou@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Ryder Lee <Ryder.Lee@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Evan
 Green <evgreen@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, devicetree@vger.kernel.org, Joerg
 Roedel <jroedel@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Sean Wang <Sean.Wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 CC Hwang <cc.hwang@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-02-15 at 02:47 +0100, Matthias Brugger wrote:

Hi Stephen,

> Hi Stephen,
> 
> On 13/02/2020 00:44, Stephen Boyd wrote:
> > Quoting Macpaul Lin (2020-02-07 01:20:43)
> >> This patch adds basic SoC support for Mediatek's new 8-core SoC,
> >> MT6765, which is mainly for smartphone application.
> > 
> > Clock patches look OK to me. Can you resend them without the defconfig
> > and dts patches and address Matthias' question?
> > 
> 
> I'm not sure if I understand you. Do you prefer to have just the clock parts
> send as an independent version so that you can easier apply the patches to your
> tree?
> 
> Patch 2, 5, 6 and 7 should go through my tree.
> So do you want a series with patches 1, 3 and 4?
> 
> Regards,
> Matthias

Yup, I've got a little bit confused, too.
Should I separate and resend these patches into 2 patch sets?
The 1st patch set includes #1, #3, and #4?
And the other includes #2, #5, #6, and #7?

Regards,
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
