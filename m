Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8603C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 689BE60295
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 689BE60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75tdsfTutH8NXZ4clRMVRXF4dr9cdQVimzZynrRweDc=; b=ilGPMTDqnqvk0l
	xRWVp1YidCj10j6Iw8R5yR0lxWOgxc2eJKyPQMjcQdDAsAeN/1JyrZ9mh1LNGx6ldkRK0nulmBB1Y
	QQgcdW8QQ+inmxCTEyz4nkydKa4rZgzOT57w1fFdIDUEEj/gzPWoW71uVm+kgWs5WGjnxEB29Rrbx
	LpTADUeaK4xdnk5mIjRQYUiz7m2Q4GwOv0CK41gyic2NhTgEH18Hqr6mQve6WvgErCmu+c/zYZ2Jz
	UjkRNK00rdRwf6ON6LKCsrcXuHVUagn1/no8zBtrziPUeditxFV2lU4KWnc43/GFepBmR/P38zWr3
	cFISCn6XxaG24AH865bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnPp-000dSO-Gx; Tue, 17 Aug 2021 00:57:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnPS-000dC2-N3; Tue, 17 Aug 2021 00:57:00 +0000
X-UUID: 0e1a85a790ee4b588aa231ae1121f13b-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8Se+dA6bWDSCT1uz7OrMcwbFzv7R0Gbma0mJSh3g/IE=; 
 b=IreyQIm+HEdAUkdKeuVFSS3S8PPo7aKvgcFk4dE5ezLF24ACJKXIjjP5SPqXceX+95rp6EW2dvjD3iJDKh6brWwsKj29RP+npN4e+7UEznMJD1bWQzfstrEClrbOxKe27epjzjO6Uu6pNjjW7LfiFUD+ahT2TzWBpY1j3GsFvc0=;
X-UUID: 0e1a85a790ee4b588aa231ae1121f13b-20210816
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 209459583; Mon, 16 Aug 2021 17:56:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 17:56:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 08:56:46 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 08:56:46 +0800
Message-ID: <326b8ef66a70b526d11b0e2fad4f94b22241e9c1.camel@mediatek.com>
Subject: Re: [PATCH 08/22] clk: mediatek: Add MT8195 ccusys clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 17 Aug 2021 08:56:46 +0800
In-Reply-To: <CAGXv+5ETXT-pxuP1NFEUrV+m3RR25zD9RZmDjHxVOLOy7gGj8w@mail.gmail.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-9-chun-jie.chen@mediatek.com>
 <CAGXv+5ETXT-pxuP1NFEUrV+m3RR25zD9RZmDjHxVOLOy7gGj8w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175656_205541_70FCDC00 
X-CRM114-Status: GOOD (  11.50  )
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

On Tue, 2021-07-06 at 17:00 +0800, Chen-Yu Tsai wrote:
> On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > Add MT8195 ccusys clock provider
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Also, I noticed that Mediatek drivers don't support the reset
> controls found
> in these clock controllers. Are there plans to add support for them?

At present, we have no plan to support reset control in clock
controllers because no request from sub system, but we have reset
controller in MT8195 from TOPRGU [1].

[1] 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=521219

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
