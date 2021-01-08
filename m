Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17D9C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 06:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3785F2339E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 06:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3785F2339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sOCrAt1MxmR+kDmMN7pBPbzvQK69j3n0T7EMYenQAzU=; b=2mJ3rFLJ/htOl8nIrcfGqUUlT
	NkguiWxFdifPi41HsDvlb08/2fXT7XCyCu+4sSK7d+z8314pcsH2wekaLsRVMkZ0u7ZKySlpgbE73
	8Ju01GHus47lJ2PacbB2U4J+zu7hrzZfNldrnJDFX8v9VSz78XnG4GK+hCbmFsmOQ/QfH9OkCZViG
	cmcRSE/p4VH3INDgir8iVJ2XJnTuXwz93KxFDzUlbfOHO4cV06ZhXN7vPYhvkogG/H9oExTOkBIOJ
	JEtY8GT9njUHZMt1jHTfYG+Zlg51u1TsF/xIpedoA/Xv4RGVF3Hi42R4PrwOPrOBPvwAyybAC8thf
	Tostfl4eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxlLs-0008VF-FH; Fri, 08 Jan 2021 06:34:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxlLn-0008UM-G6; Fri, 08 Jan 2021 06:34:20 +0000
X-UUID: c87ea4d3800a440e9c2e836de1af12f3-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FMnLCnisKI4QJNM0w1sFZfQNsdLpDgJ5G65JySoATkI=; 
 b=avgFOjM+8Pn4d4n+HGLQNPqZ1SruwxX743zjH1KUFgtC82Pmz9rOjTZXmuvbmJDgJ3TTwxeNbkrXN46r4kz8+6zVjNWfCLu9yNN3AvBonq5kmC5XBkahAMUsih3fqQ6DXZJ9Hcdr8v5xT6fsHyzurwblAVugVhAvluT4PqCSnLk=;
X-UUID: c87ea4d3800a440e9c2e836de1af12f3-20210107
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 748958017; Thu, 07 Jan 2021 22:34:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 22:34:13 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Jan 2021 14:34:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jan 2021 14:34:08 +0800
Message-ID: <1610087648.24856.41.camel@mhfsdcap03>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 8 Jan 2021 14:34:08 +0800
In-Reply-To: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84426B80790F79195531223CD2A53D05FA1963BDE08E9CE47C2D172FE34682F02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_013419_748926_772DF3F4 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-29 at 14:24 +0800, Ikjoon Jang wrote:
> xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> to handle its own sw bandwidth managements and stores bandwidth data
> into internal table every time add_endpoint() is called,
> so when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
If failed to add an endpoint, will cause failure of its interface
config, then the other endpoints in the same interface will be dropped
later? you mean some endpoints in an interface may fail but without
affecting its function?

> 
> This patch adds two more hooks from check_bandwidth() and
> reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> from reset_bandwidth().
> 
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
