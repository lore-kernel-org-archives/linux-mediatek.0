Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLtnJXx6M4haUdmi86w6QqevTK44QpcnHRXpjyULjLg=; b=iRGbNbVKgZwz/9WkXcAXRtMrex
	4Ijo9z1XErAKfJUdbJdWzmBQJeu37xHqE97R0+QKY9X6pjlr/lSakyyFzi9ibiXuoJdzKOg6OZ/ja
	hxMuewZuLvrKQpI8TmSa/Z4xDVITFtesRkDXCcYidQI7N1NEKdLWjEGkxqvXOwhUSKgg19ejrp3l9
	HQeAZ2ubyHS3dUPoBw4IJnFe9p1m7Pm6lT3ZS+bjr14DyCW2awzsGQDA+Uruzb4l2XtRBsjme9oZq
	cX0MUfADoefPsiTuxLUoUhN4GjwIS01OPlUS6N3tt3W2yQVv5oahjLvEnSYdb2PhB8BJ9wyXMvCin
	0jt20+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9E2-00EXsc-0g;
	Tue, 28 Mar 2023 13:18:58 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9Dy-00EXpt-2f;
	Tue, 28 Mar 2023 13:18:56 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ADE4B243E72;
	Tue, 28 Mar 2023 15:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1680009530;
	bh=DLtnJXx6M4haUdmi86w6QqevTK44QpcnHRXpjyULjLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2/LVvTDcJoy5hFvrgO7kUZ86PI5STEdCre33Tk1y1CtjX4K9ERu9dqm08D28uw/N0
	 rWnKYxFxbAO2EWfzNToaV9c6vtIf6NGyk8O9sm3zLbo8KCpbLDRoDGSHs7J/x4G7ts
	 5d5VWwUWg+jgAnnBOv4CMsedAs7FNJ4UIycClbgoqQLL3dhwG737khgCWk2k/DTSHv
	 XW+lDt6soYXS6EvQjXIpdPjnnNBfwgnd3Tpe59KD3ag7e4XrO/KVazUQZDSpG83NjV
	 8Qm7LA1jPU1wtrA2s7RxdiFOBkQH8/qraafre1AQNO/yEM1MHGLRLXpnY3E3OhmQYQ
	 D4uhTSvDPD2xg==
Date: Tue, 28 Mar 2023 15:18:49 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Chengci Xu =?utf-8?B?KOiuuOaJv+i1kCk=?= <Chengci.Xu@mediatek.com>,
	YF Wang =?utf-8?B?KOeOi+S6kemjnik=?= <YF.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v2] iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
Message-ID: <ZCLpOWK90pnNNYxj@8bytes.org>
References: <20230316064251.7346-1-yong.wu@mediatek.com>
 <ZBsRlgJIaQieIbzU@8bytes.org>
 <5555473c3f3a49656d8e62479aa2c0b9d6d8d7e1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5555473c3f3a49656d8e62479aa2c0b9d6d8d7e1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_061855_111366_04878A0C 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 23, 2023 at 11:32:38AM +0000, Yong Wu (吴勇) wrote:
> Thanks very much for the applying. I'm sorry I had a typo in this
> version. Is it possible to use v3 instead?

Done. Thanks for the heads-up.

