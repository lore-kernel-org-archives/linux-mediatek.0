Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADEFC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 00:06:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37741207E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 00:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KU4hbzh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37741207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xa93qhytoM+nbfJM79xwB1QoT6pyBAx4OWlkPRmams4=; b=KU4hbzh0hMDAdtnDFGmJZ4ClU
	dyq1wpYq+dIyVY+peYWLgQ8FLsuUEkkoXkmTbfhMSSmsVZS12NgVmMu/2MowFy+jdkvCmI6uvnudB
	Xkz4yUI4oOkowezYVkrUX+aezAbNXCiKBDBnB7SS7KcPWQ2TBwRPdLOhk3UjeJ0k6C2vTCpTKX/pF
	dzqPB6Eoatcyr2S5Tx5V2DmHjllOwBHksxR+qJahZ2ZbwaUo0UFXjq127WC3nUGXFguQLwMb3xJ+R
	iqvkgdqheomj7K0OZUXOnekm1UXsS2xOuuurXALQD9OSEgt0ts23ufkTJobPMMSlbgRkvcJ9XMrkh
	42+sZx31w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Zbb-0001LG-QF; Wed, 29 Jul 2020 00:05:59 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ZbZ-0001KQ-Rb
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 00:05:58 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E07E4128D304D;
 Tue, 28 Jul 2020 16:49:02 -0700 (PDT)
Date: Tue, 28 Jul 2020 17:05:47 -0700 (PDT)
Message-Id: <20200728.170547.454266815690646224.davem@davemloft.net>
To: dwmw2@infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: Always call
 mtk_gmac0_rgmii_adjust() for mt7623
From: David Miller <davem@davemloft.net>
In-Reply-To: <52f10e30f62b8521fd83525a03ecff94b72d509b.camel@infradead.org>
References: <trinity-fb0cdf15-dfcf-4d60-9144-87d8fbfad5ba-1586179542451@3c-app-gmx-bap62>
 <52f10e30f62b8521fd83525a03ecff94b72d509b.camel@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 28 Jul 2020 16:49:03 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_200558_127923_2D7118EA 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: andrew@lunn.ch, frank-w@public-files.de, f.fainelli@gmail.com,
 steven.liu@mediatek.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, Landen.Chao@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, Mark-MC.Lee@mediatek.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 23 Jul 2020 20:07:10 +0100

> From: Ren=E9 van Dorst <opensource@vdorst.com>
> =

> Modify mtk_gmac0_rgmii_adjust() so it can always be called.
> mtk_gmac0_rgmii_adjust() sets-up the TRGMII clocks.
> =

> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-By: David Woodhouse <dwmw2@infradead.org>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

Applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
