Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2128C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7E920C56
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7E920C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bsZuEjrv3ZPy3pyC9yIndq9clwC31XEdvSP2RZvpZKM=; b=K5DMA+l3b0iAW1hC8boUM3NPh
	JeaGqAimX3u4IhkJ1xJiODQM6HbhO4H439wnI3/2r+ofNAa/Rzqp3k9bBzFxgBih0qnkmHVAo7bPr
	b1A3IcX0vku4NFxiMfEip9rsfTJPfc1b6u4vQva+T/1iMj1LbwyQFOxWtE3fRUntCJdXPw6cDKTSI
	jmPI71g7LjcKjzdAtBoBWgKP6yL4hI60i3B01bpveblCVjNxUWKqQL5P5295yNR9HulHbvC8GT93U
	pGgxQIeV6tpsN8yZ5mt9/63TVOT9wM+wkGmkts8UrnrGgV9H5yKGcOmRis86J39OygyNHvxOlwdHA
	GvsiXKj3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkjXV-0000bv-UI; Thu, 03 Dec 2020 08:00:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkjXR-0000bL-T9; Thu, 03 Dec 2020 08:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606982428;
 bh=kfkeqlUyVw+jzcR1Ql+3AOPoXyKIsKn01IamWujdAxU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fQyEyZNCVfkjZB4e1P7kbx7ajItzPCuSfTaPhLCtWdNQLYRlA5Qkzo/Xiw66AHgmN
 mPMFvHzOZvkP3DhUBuKhcQzdNMh/KuLSwgFP0bj3uvgoGADNCAym1H9KhYXrCwaAm/
 RM08NSCFLrVcqVLUR8h4lsbaWolJ2t1hO+4FpM1qEeLm+73r8iHY0pfmUc1MojMiKY
 1iw5T66eIH1rOSbnQ2xprt0SLJUtpgfEmyNZIISpOi8nw7ejWcoIEVRRVGzj3DHIWJ
 PK2zPY4+lmgMxWJnHMukojYbxRzY78KeSsJSKHqEBTzwqwnzTP0CQNTQ5U7vXBAce1
 DED9IKrblwSuQ==
MIME-Version: 1.0
In-Reply-To: <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 1/3] spmi: Add driver shutdown support
From: Stephen Boyd <sboyd@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 03 Dec 2020 00:00:26 -0800
Message-ID: <160698242613.3428466.7587415157083415046@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_030030_041285_689930A9 
X-CRM114-Status: UNSURE (   6.17  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hsin-Hsiung Wang (2020-10-20 02:56:48)
> Add new shutdown() method.  Use it in the standard driver model style.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---

Applied to spmi-next. The line endings are all confused still though.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
