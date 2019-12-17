Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDDEC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 21:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAD321775
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 21:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKqkZNTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAD321775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHuIOfPm1WUteIdTBSv7XVxue5fpu7fS/1S7Hza3Zcg=; b=XKqkZNTBXxwNkD
	vp7ShYpq/ceGZhG3lfTNpG0NBoXi7pY6f1jUkpIbFyJahtBdq+aojxSmp7g6UFDPC0ajxAgv1sowR
	JtHPdjAKJPWjLomxBT2KXVKl2oUZCb8ouc3pJI/DMfKImnnkaGLuzvuwN5flbYyg8GHd7Vq/q8Bi5
	l3JK9a9JuyyWyXALc5ghkkG2iB51xYx5BZKipkPm6DcABy1QRUJVyziB/FaEmkiqAM+dWPxIdAuQl
	nJJ3176BHenpsMXhChCQ89TDEOczirwRARmag2y5t9/LW5qg4k49Xk+c716gs735W2hL66hB+VSqG
	wUmPrpGnWMBwyc6t094g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihKiN-0006aN-Jc; Tue, 17 Dec 2019 21:49:11 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihKiE-0006T8-85; Tue, 17 Dec 2019 21:49:05 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 42C0114649686;
 Tue, 17 Dec 2019 13:48:56 -0800 (PST)
Date: Tue, 17 Dec 2019 13:48:55 -0800 (PST)
Message-Id: <20191217.134855.76154724010022162.davem@davemloft.net>
To: biao.huang@mediatek.com
Subject: Re: [v2, PATCH 0/2] net-next: stmmac: dwmac-mediatek: add more
 support for RMII
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191216053958.26130-1-biao.huang@mediatek.com>
References: <20191216053958.26130-1-biao.huang@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 17 Dec 2019 13:48:56 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_134902_288815_8E02D5F7 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, 16 Dec 2019 13:39:56 +0800

> changes in v2:
>  PATCH 1/2 net-next: stmmac: mediatek: add more support for RMII
>         As Andrew's comments, add the "rmii_internal" clock to the list of clocks.
> 
>  PATCH 2/2 net-next: dt-binding: dwmac-mediatek: add more description for RMII
>         document the "rmii_internal" clock in dt-bindings
>         rewrite the sample dts in dt-bindings.
> 
> v1:
> This series is for support RMII when MT2712 SoC provides the reference clock.

Series applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
