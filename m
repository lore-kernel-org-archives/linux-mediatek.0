Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYAfuhMFowl80A+FoU68P1FBCIE5egKBiixHPc4kRSE=; b=V9A9kTBGm0dVuh
	FaAcNWvI1zpWi72X7lDKZyTySus542c9FhGtv+9347Cvp9DzLP54jVb8Y+qtC/+Kfhk8w7gB/MwMP
	3Ckd07oEY0QajgNRP+YyWhWmak7cROqmu0+jXz2SDv6mBWyoyS8QoGQbfJO0ro7wfJiEWgQKR3pot
	k4cXxhR+5bgXEW9q/PetmISKF9AoQk9n0diH0hUqSUcS4wk/6iqtARtqyFy7dg2l5kOAxNc1qwEqs
	pP+TSVp4maDveI+9c4p43uPuwey+ed0mpTShBztp5ozdwkpNdRCM6Kg1MeCYUX9Y1/hFUEK6yJ0uP
	vZ2Xs6VnZuCQgNGN7h0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nocxh-004zN8-AS; Wed, 11 May 2022 03:24:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nocxd-004zMA-VN; Wed, 11 May 2022 03:24:27 +0000
X-UUID: 277d5bcd1671413dbaa834a09df584e7-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1f381b0c-e639-43c8-bf70-f159933bd314, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:dc9d5bb3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 277d5bcd1671413dbaa834a09df584e7-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 767947614; Tue, 10 May 2022 20:24:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 20:23:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 11:23:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 11:23:13 +0800
Message-ID: <17a0d8c02d18f99e6f29d65c17baf0281673ca07.camel@mediatek.com>
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Jiabing Wan <wanjiabing@vivo.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Jia-Wei Chang" <jia-wei.chang@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 11 May 2022 11:23:12 +0800
In-Reply-To: <20220511031122.kkotwq7co2vx5zqp@vireshk-i7>
References: <20220510090531.12438-1-wanjiabing@vivo.com>
 <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
 <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
 <20220510092822.j3z6bydurg7x5bu4@vireshk-i7>
 <0181c505dd94c599b270f159ca93442a4afe1760.camel@mediatek.com>
 <20220511031122.kkotwq7co2vx5zqp@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_202426_076867_45B9516D 
X-CRM114-Status: GOOD (  15.23  )
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

On Wed, 2022-05-11 at 08:41 +0530, Viresh Kumar wrote:
> On 10-05-22, 19:23, Rex-BC Chen wrote:
> > I am not sure what's the problem.
> > But I subscribed the linux-arm-kernel mailing list and linux-
> > mediatek.
> > 
> > As for LKML, do you mean subscribe "List: linux-kernel;" in [1]?
> 
> Yes, this is one of the most useful email lists and mostly gets cc'd
> anyway, you
> can disable mail delivery if you don't want to get emails.
> 
> I asked because I couldn't find your email in 
> https://lore.kernel.org/lkml, but
> its fine either way.
> 

Hello Viresh,

thanks for your suggestion.
I will try to subscribe this.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
