Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44694C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 01:41:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9CD613B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 01:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC9CD613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vcOpuffv1LJ3T/Yee9edooKEhFHajlTEC2/tuKHZcug=; b=CIlJ2lwrRUF/HAcVBD44LIIBI
	lMlzilDsuHt8mX5qPA4gC0gWPHIMKPHlGi6qi51C9RSIgz53M3AhNja2yC9O77kF8BW9esZrltnkd
	9BPPJYzl3fL1DtOx21OwPqsmwVsWWM2P4btsYXwkS5OfI5nhbkcD5tr90xzmhzX4a9BRYCmm3MRAY
	Sqv41vAjfajWU2I82/xNuOiE3jZ7loYLiGJr1n/bQXpsFbt0YJzEyMyn7sK0LXbqLPtNxR1ZWz+ii
	5M9PYVSFSAo9XTMzFMuFd73JWJe08nbjmwggr+KTHwpzDfUgov7aRDwvoC77vms75yQ1Mh79jVZZA
	jmQ3Kh4ig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZOLV-00FYaE-Qp; Thu, 22 Apr 2021 01:41:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZOLT-00FYZv-E3; Thu, 22 Apr 2021 01:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=MaLMoD+Cx4c9RF+MQbi2VA+TR/HgeiidMjRq17YSzZA=; b=Tlzb9+7X9gy0qtTCPDBC4McfuQ
 emkBv7ELJje3kFunNEcln5Ay4mqUbtuMaxP39M2Ln63m36S0SjSJ3YVJDOO46efPmcxtaRAuJFQ/Q
 DdRJKgPgxeOIXAjFo4PACmOmeaVHgj3lS07CQhH6JKU+w116uqckCaEqP5gu6uNjOmLeqpgyZ+2kt
 e03n90jW1SCxEz1Rx6sHgpi0sMwNXE6vITsJFwcQWccrGHHA5Kz0iZ9X0hGs+7EeDaMT9SOs1SDkp
 O1Exuu2THBEXQbcj+RZ/nbZ7Hnjr+98NyLMMZBynMLpGTH9qUFcuEHFbHeVAloK9QO7MRmMZhoymR
 bPn8DoGQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZOLP-00DJVf-Ll; Thu, 22 Apr 2021 01:41:29 +0000
X-UUID: 8334ace45ed24288b5339c0ddd509b48-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MaLMoD+Cx4c9RF+MQbi2VA+TR/HgeiidMjRq17YSzZA=; 
 b=kZEVYdDs8Qhv/q5mg4gK8nlswaAJk0caV4eWjDY24sDFmzwyWBhDLVxWn2De1oyoFmPHubHJraG0x44s/F96la2lPNw3dR+CzthLReUIJdMsqq2kQkN3vEUMTnG5xht8jvqSBFXjrPCnbhAMFbELsQ3HaxmiB2NC85zS1D0kf+k=;
X-UUID: 8334ace45ed24288b5339c0ddd509b48-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2091168179; Wed, 21 Apr 2021 18:41:24 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 18:37:43 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Apr 2021 09:37:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 09:37:39 +0800
Message-ID: <1619055459.27999.0.camel@mhfsdcap03>
Subject: Re: [PATCH v4 0/4] Mediatek pinctrl patch on mt8195
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, huang eddie
 <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>, Biao Huang
 <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "Sean
 Wang" <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Thu, 22 Apr 2021 09:37:39 +0800
In-Reply-To: <CACRpkdYtjG3LbcMiHmODggWRecSWGSm34vpEtti9x9SKdV9_BA@mail.gmail.com>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <CACRpkdYtjG3LbcMiHmODggWRecSWGSm34vpEtti9x9SKdV9_BA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 220BC1F69A6A5C846F04675CAF54A160A39F6A0D1C6092D1B2837A258212E0462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_184127_731883_FCCD4244 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, 2021-04-22 at 01:51 +0200, Linus Walleij wrote:
> On Tue, Apr 13, 2021 at 7:57 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> 
> > This series includes 4 patches:
> > 1.add pinctrl file and inding document on mt8195.
> > 2.add pinctrl driver on MT8195.
> > 3.add pinctrl drive for I2C related pins on MT8195.
> > 4.add pinctrl rsel setting on MT8195.
> >
> > Changes in patch v4:
> 
> Patches 1, 2 & 3 applied!
> 
> Now you only need to resend patch 4.
> 
> Yours,
> Linus Walleij

==>Thanks for your comment. we will send only patch 4 in next version.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
