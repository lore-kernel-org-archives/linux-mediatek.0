Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzLs4P3EhgD6XgZW51byCj5OtMvAMvlcfe6W/76K9yY=; b=dJXBOqbH9FFvFO
	of+OB6bgztCBrZVApq6pHdxi/N3VHLfXCESxJtJePeAkADARSwSvJ94MS0y5KiOLPItl+XILeW36j
	lYdnxw6EsLttlDZeqjKJ3GtZJwRhPNAM6P7vOiK/eYBb+bxf8SGiUEnAl5xQ84LhEaQOFiSSVb9XG
	4dFPbUWHkGnZgDknUrdzvKuNkILC2nrftunC0bHurCTBM+4gOyLkjcUd2BfMDtLSWxwIQ6ryd1Io+
	pFuFeYDRw/z+vWFNXAL5a6yqyJIr9Sxzo/5XKGovNZQLh9J6MtmLQF9z5Hyn1lzf0pSr9fpqOnpKF
	21kJiiWxYz0Vc50sGtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdP4-005RyF-ND; Tue, 08 Mar 2022 17:13:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRd6k-005LqF-UH; Tue, 08 Mar 2022 16:54:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 606D2617AF;
 Tue,  8 Mar 2022 16:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A05C340F5;
 Tue,  8 Mar 2022 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646758485;
 bh=FqT/k0ezpryEVl36D+32pDONBPt0VUNdNcp3WkQR3nQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tw25013fPzc3WxXHW6wFGg3QQ3Ld9r8jLs7L0lHM/Psv7IZlhYi85AWjdPKfAX8R2
 AmSlyQ8Qe3fGS7Tl10zfGtPfLI1z6o/xGGHLmLCfi4dFBjxq/2O0mxxJ2jVv78duP7
 XfXcQ+K2ESQipW/Hzbx27k7zP/I3TBddcjacRzXgCnML/UmIQnNjbIGgQilmRbNcw5
 ZzABB3NtFW1DreWHlzCo/E6IkdfKEzJhRePTmxzkSTonqBiIrp+WDXjec4S36IE97I
 shJqQ/zO8EI28rTnNO0/fE9M6IVsO+HTRs5uQWyvQxMWGLiftyMTXcQQEfp0DyZL+8
 qyJy1ZcjNJF3A==
From: Arnd Bergmann <arnd@kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.18
Date: Tue,  8 Mar 2022 17:54:01 +0100
Message-Id: <164675831433.4164581.4439793823341816815.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
References: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_085447_083900_7895376E 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:38:55 +0100, Matthias Brugger wrote:
> Please have a look on the SoC driver updates for v5.18.
> As you can see, we get quite some support for SoC devices based on mt8186.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 16e769e2ae1fd6c32e657046b2ca9da7a7728257

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
