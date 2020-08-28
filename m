Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9D6C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 02:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E175C20786
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 02:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6u0unhX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XbL1ETzx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E175C20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JVx20n9vElNiIrOecCPDq0PU6bRWTKcisZYTWmnyD5w=; b=D6u0unhX1HzCWtMUibPENo03s
	/DgnXGctNnAoCOsweTmUIh9wgzfk4mEusCSW580vrrElv0gDOzZGy+6p+H7e2JyP3cKiO10V9ULpz
	SBPQymx947CID5ChYgBCWljCYv5s3cGrZJFV1adNINA5j8Sx4JazymfQ09lMdQpHLRkzC60t4/8yp
	DFJ+lYW8rUX89L6JrkYkSonBAhovl8/iEtb5XPNCV2Vu1XArycygNXOloRq3PctjIxiX8xx9Q08IA
	Jb770D85PYVKcLZfSAAQYx3rP5Wf08dkOO+hjpV/VihE9j7ZDQlZ6gweF6RE9g1tSd5lGeWUiblSN
	wjnANhRjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBU3k-0001QH-Gm; Fri, 28 Aug 2020 02:24:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBU3i-0001Pa-BK; Fri, 28 Aug 2020 02:24:07 +0000
X-UUID: 6c58e12a23fc4aac859b8272780c0eab-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8zZiHLm4/AXz1qOVzkvhLK1XMcwwYt53KrQz1ufHVMk=; 
 b=XbL1ETzxK0c8Q2fg9Dsctrv/aENBChAYkaBWHaQFN22yFzHBRX8k3cAndJ/5Fe+fKsmnQhc6LPRSnn4c3jciBBjsy5Jwntgu+IEymmIJSy42DBpGECLcSIjsXZU1g5KC7R3Gb2IAilHscEd8Gk5EeAPArPJzlAQ9L6yWiRR5eTc=;
X-UUID: 6c58e12a23fc4aac859b8272780c0eab-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 178085130; Thu, 27 Aug 2020 18:23:57 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 19:23:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 10:23:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Aug 2020 10:23:53 +0800
Message-ID: <1598581434.5835.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
From: CK Hu <ck.hu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 10:23:54 +0800
In-Reply-To: <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
 <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_222406_520363_72ED5419 
X-CRM114-Status: GOOD (  15.90  )
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
 Hongzhou Yang <hongzhou.yang@mediatek.com>, seiya.wang@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, hui.liu@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 huang eddie <eddie.huang@mediatek.com>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>, srv_heupstream@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 sin_jieyang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Linus:

On Thu, 2020-08-27 at 10:52 +0200, Linus Walleij wrote:
> On Mon, Aug 17, 2020 at 2:18 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> 
> > This series includes 3 patches:
> > 1.add pinctrl file on mt8192.
> > 2.add pinctrl binding document on mt8192.
> > 3.add pinctrl driver on MT8192.
> 
> Patches applied for v5.10!

I does not see these patches in your tree [1], have you applied them? I
would like to pick these patches from your tree.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/

Regards,
CK

> Thanks!
> Linus Walleij
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
