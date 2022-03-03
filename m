Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 07:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCvx28LaylgiXRFnG8ZpWVteQvjErJoXoKFiGAQGwZs=; b=IGBZ2SOJsap4QB
	cntaZzQPRC79kkZyvTTdt8InfEPF0w6Pa9TJudiUKXQ9Xz75h/dJQLkw9FxMbZz4EjGuKCq0DzDGF
	/4bpzEK2M5HwNFglyU4NE1SICK0028SsJwjYGeNXsBPNEZX0MR2COKhzKV0Xridx/SSuuPqTQWkUJ
	J8OwPjQi9eAeTBuoCwSHLfHK5b9Q3piQADWcP0DKD5oClByBfy0CeuIYLWp2UiWrZQDmZ3m3CITg4
	KRV6lrbDVt+TjpqphB2h7SHHZqvCJ+5zD07Lyasz6Fw/JKUYGp/4KRe4z4UMSgBOomDTNL5fxP/Oh
	qyyh8MK/impD6gu0zVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfjJ-005YI6-4O; Thu, 03 Mar 2022 07:18:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfjG-005YHB-AO; Thu, 03 Mar 2022 07:18:27 +0000
X-UUID: 63ddd621b2424e2fa3fdfb3d94a82737-20220303
X-UUID: 63ddd621b2424e2fa3fdfb3d94a82737-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 388975821; Thu, 03 Mar 2022 00:18:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 23:08:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 15:08:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 15:08:19 +0800
Message-ID: <131c801871de28d3f124cc5b22571bcc83da199e.camel@mediatek.com>
Subject: Re: [PATCH 0/2] Add gce support for mt8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 3 Mar 2022 15:08:19 +0800
In-Reply-To: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
References: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_231826_378369_550388A1 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, 2022-02-23 at 11:01 +0800, Rex-BC Chen wrote:
> Rex-BC Chen (1):
>   dt-bindings: mailbox: add definition for mt8186
> 
> Yongqiang Niu (1):
>   dt-bindings: gce: add gce header file for mt8186
> 
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
>  include/dt-bindings/gce/mt8186-gce.h          | 421
> ++++++++++++++++++
>  2 files changed, 426 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt8186-gce.h
> 
Hello Jassi,

All binding patches are acked by Rob.
Do you have any suggestion for this series?

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
