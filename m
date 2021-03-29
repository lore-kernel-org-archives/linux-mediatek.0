Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75789C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:25:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017426196E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017426196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k52viQiMxDfaq4phpiDYUQ5PP/VAEKG1jc5fqHQ4vbo=; b=EAMt04TZJqZ/q1DH+UGAGMvmt
	N+Qvkq5l5MIsvv1LYooUlvI/vEPqbehMkWipfOVpBrlLvd51VjCP6zkpWTnLhKYhhxr+WNdEJueGk
	aFueQlQ4K8JLaK3adK/eIpzq80G4O72ULIIxUcS28tnNEbOyg92lETIh5H1M77G30LVYItRF6LNK3
	nx3Hk/TNL5BXzDc1aU8xusz22DSyLrd5BGuPkV3T2Gs5oMuMhzN5FlLpOyDUeLIiph82kbTxncoyT
	TEOZMkda3NFZAZ/Pvd2s5sVh2eeXoDFBfao2if1Xf1t182lOsFp0zsBPwoq5XjggmFn1IT4GsCK5+
	IdO2KuAUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxTs-001EiR-5Z; Mon, 29 Mar 2021 19:23:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqP7-000cxR-Hc; Mon, 29 Mar 2021 11:50:00 +0000
X-UUID: 173cebd702f84786a95e5b27884dda02-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=700zl6YmFxv75lk34/wx0WtvqnKIf4i7bpRRlFphdnI=; 
 b=TqUa33TjE3urGGdWoCOEuNnEvrrcjReyk6PzOVFew+0ZZdKkCPA+HayTB50iZ+OzYMZW6sJHEYEFdD2vZsQjNq6PTcfenN2ctj3CrT4rL8DBSNYACtIiFdcRaYdMrJGdOc+q2y7mrjZ98hrR1gvwGd5ihXhYN1LH58evBHCCXBw=;
X-UUID: 173cebd702f84786a95e5b27884dda02-20210329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2009733271; Mon, 29 Mar 2021 03:49:50 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:49:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Mar 2021 19:49:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:49:45 +0800
Message-ID: <1617018585.10316.9.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <sean.wang@kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, devicetree
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Mon, 29 Mar 2021 19:49:45 +0800
In-Reply-To: <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AABB6345A8775AA73C4B49EF96DF27E08E9473E30D95DB3D672079749D6477F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_124958_128920_F8A7F29F 
X-CRM114-Status: GOOD (  13.42  )
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

On Mon, 2021-03-29 at 14:35 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 2:32 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > This series includes 6 patches:
> > 1.add pinctrl file on mt8195.
> > 2.add pinctrl binding document on mt8195.
> > 3.add pinctrl device node on mt8195.
> > 4.add pinctrl driver on MT8195.
> > 5.add pinctrl drive for I2C related pins on MT8195.
> > 6.add pinctrl rsel setting on MT8195.
> 
> Patch series w/o version is de facto v1.
> Dropping to v0 seems not right.
> You missed changelog.
> 
> So, send v2 properly.
> 
> Material to study:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 

Hi Andy,

There is not any change between v0 and v1. so we send "Resend v0" as v2
in this time.Is it also properly? and we send the version which is v3 in
next time. 

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
