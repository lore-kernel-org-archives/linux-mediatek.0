Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF8BC32771
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Sep 2022 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G78H38StVPPMLeZbOKBzzauWXBRpvbTrxGdkFQUmFDg=; b=hHrmW3JKs9kqxX9f6cEf57uNFY
	5IQqN/+W4jo6n+OsOTStuuP5JFZOLItHuR0jEeLZyzykzALXzdmK4KeVYNrM3tRyhJBg3i3ktABeU
	wjLKPZ4mhK8E5ED/cXY/m9pHwPSbICo1xrMfUvie69VkRSMoe0jy+W/K1ajQwGE0KAHxWtlW1Sji+
	eafulgVqTAm1MjfjlfP997UF4kIsjAN+mANcYdRBdtjS8cLEUKNJdcPxKHZm8DqkRuBmZU0Me6+07
	fgcZzJbT0mCj3XueUjRHcr3T1X+kYtWu3DQ8h6QWjG6+So431v1x7mvmKgpe7CONOFwaTJah/wM87
	cV4n3fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obyeV-006VEP-Nr; Sat, 24 Sep 2022 06:28:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obyeJ-006VCb-3Y; Sat, 24 Sep 2022 06:28:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2A9FB80064;
	Sat, 24 Sep 2022 06:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E408BC433C1;
	Sat, 24 Sep 2022 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664000901;
	bh=13hcAswE3/w5gxNu2/Ksn2qrnXkSsfzErgmHm7xxrQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGdBa86rzljLx7cjzepoilpeBg3XmKvRNAw28AALpCf6Qk/7FWeV3Nw9qlOBqHThk
	 2Uii+Yu7WhDAoDKeVxYIObjTalaTstgk1Xdv26p8Y7NlSqimtN8paEyOuSbpDNGgpT
	 veWfBuPHzR0m7KhFhjO8dTxVvyPdIRQ+cTFUQ6jQ/NEEV+8x1x83H7HFqst+Fi505/
	 eaE0h824Xm2UaGMHjOXMvdaRTlafhEyvT6qotgokzmvekti0s0EsNUEG1xGbpMSrwJ
	 zloX68w2JN2yOSm5+WQ597Ei+2SrgavhVTxQKmEYKINYo4QxLy0usY145FGO/rYMQn
	 O/q7FzEa+tv6Q==
Date: Sat, 24 Sep 2022 11:58:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
	Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH 00/18] unify register access and macros
Message-ID: <Yy6jgYXSawkaAMxv@matsya>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_232827_312447_04B16249 
X-CRM114-Status: UNSURE (   7.62  )
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

On 20-09-22, 17:00, Chunfeng Yun wrote:
> No need to define new macros to generate bits, mask and bitfield, use
> common ones instead, e.g. BIT, GENMASK and FIELD_PREP etc.
> Due to common register access helpers are defined for MediaTek's phy
> drivers, the similar helpers defined by ufs, hdmi and mipi phy drivers
> can be removed.

Applied, thanks

-- 
~Vinod

