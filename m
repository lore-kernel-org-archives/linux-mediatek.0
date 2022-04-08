Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT+4kSEVrieRV+MKEWve4iWKdiIrW3iIC7EGsLE+zWo=; b=WxFheBhwzB8YLH
	dlSUPluV0Ym1SqaGRSCjL3uv2COtX2G7EofpYBhlxSLhphXIVy38KjeIl7skh/jddRu7eNnn0QY7i
	FxpuGK9bRfYXB6kUxwX1SUGikMZJkZXDYQ/PAc8H/jl6JxooSzrVei+5kcjLZ/MTH8TquNSr+LCWj
	W99ngBykIbWHc7Ql4g9lcUh+rvP7f2HGMPjn1kkWUzSJYirAhknZlSDc5TNWKcMFnhY5RqCR1Bbfn
	s1a795GcXwm2obvY5+Lj9zdR31iB3iud5WYKlPr2s3ZQrWPILJ5XDZFwLc6X6/CYeDNj8es6Ay3S1
	Zf/CyU9WTg7wloxza4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncsh4-000loz-Ke; Fri, 08 Apr 2022 17:46:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncsgl-000lgH-8f; Fri, 08 Apr 2022 17:46:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FE20621CE;
 Fri,  8 Apr 2022 17:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D4BC385A1;
 Fri,  8 Apr 2022 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649439985;
 bh=xuHSGWL0ExxjYNY7fixDPW1rR4sQ6XywWk6geBbHN54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JV5kzjp2U6Wh3Am4UY0dPfIfEvAGaM7AMGvxCCe2tvOllb+KuBkfAxMfNTW2vJbUA
 eNXqDL7/2aMZFXVD2eGOQlMNXrS8F1dgnP01O6vzyCMIbcJeWQEFD3+KjwY5qkiBxi
 UGpeEck8Ps/GXxTIXnHbOJlrBnREmXeB5IUDsCoKv5I9/L9XE6r3FnVKvCxf8YYvvS
 tPKu1bw6LCRkobFI+jO/j3B1t760h82grzzathl77YYNwNbP9iRpAo+KZ7I8r/3lsg
 Ncp/utHbHRi9vJ9kwzpKje8pnPDuZvr09ZD6OM9cJMHu/7zWB/XVcmv+XYpUEZ4zT4
 cxnN5Z4+NmUmg==
Date: Fri, 8 Apr 2022 23:16:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 LAK <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
Message-ID: <YlB07XRDWPHF7VaI@matsya>
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tM3EiZkNSCG+CtrOnfGBc5WSaac__FBsRn72zrsjQ2ew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8tM3EiZkNSCG+CtrOnfGBc5WSaac__FBsRn72zrsjQ2ew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_104627_380425_B47DA3B3 
X-CRM114-Status: GOOD (  13.31  )
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

On 07-04-22, 03:52, Lad, Prabhakar wrote:
> Hi Vinod,
> 
> On Mon, Apr 4, 2022 at 4:56 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Hi All,
> >
> > This patch series aims to drop using platform_get_resource() for IRQ types
> > in preparation for removal of static setup of IRQ resource from DT core
> > code.
> >
> Fyi.. the OF core changes have landed into -next [0].
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220406&id=a1a2b7125e1079cfcc13a116aa3af3df2f9e002b

Is this series dependent on this?

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
