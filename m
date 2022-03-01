Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62360C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TkcI7IBVK/05A7a0wQ+Tklin9WtG63h2LZ6ZvAT1i0=; b=v4tKn/ih2PQMtp
	rHu53AJBxUhqf3q+q3zKdySkf6RJvVj/y/vmA8ZKIierLZs1Q4073tKVsFfecSU1P0aU0AHGvaNdp
	T4ueiWsvS9nsTiLkaIynuEpgNuNlP7A4b5hI1/4Yflk+MTjglOMo9SQgC42QoxsAqFKIW/h5zXJ+a
	pNBzdeh75KRPZexKjtqz012nrdBENKycRZkTPFwOonZZtNnw4kR+FWjJmOOKiZOcFIobYhMDUlQg8
	Se0xspbhGwc1PGI7NAoNl/cjBX/jrFvixkXB2+ul7lwhfiCegQXCdQXcXbAvQuybMQUJ7q3FFmOG2
	hum45VImA4hfWwMLH8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0Vz-00GNnG-8K; Tue, 01 Mar 2022 11:17:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0Ua-00GNRG-6K; Tue, 01 Mar 2022 11:16:35 +0000
X-UUID: 3d09bcdab2414c979b8e5de2460f0021-20220301
X-UUID: 3d09bcdab2414c979b8e5de2460f0021-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2010461423; Tue, 01 Mar 2022 04:15:52 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 03:13:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 19:13:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 19:13:29 +0800
Message-ID: <31507af7c67640fa8161b13a4f279fea1a050f55.camel@mediatek.com>
Subject: Re: [PATCH v2,0/2] Add mmsys reset control for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 1 Mar 2022 19:13:29 +0800
In-Reply-To: <09ce5aab-0cc6-5903-8238-551085abd739@gmail.com>
References: <20220217082626.15728-1-rex-bc.chen@mediatek.com>
 <09ce5aab-0cc6-5903-8238-551085abd739@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_031632_271407_996B1593 
X-CRM114-Status: GOOD (  16.45  )
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

Hello Matthias,

Thanks for accepting my patches, but I didn't see this patch [1]
in v5.17-next/soc.
There will be build error if [1] is not included while [2] is applied.
The sw0_rst_offset is declared in [2].

If I have mistake, please let me know.
Thanks!

[1]:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217082626.15728-2-rex-bc.chen@mediatek.com/

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24

BRs,
Rex
On Tue, 2022-03-01 at 08:35 +0100, Matthias Brugger wrote:
> 
> On 17/02/2022 09:26, Rex-BC Chen wrote:
> > v2:
> > 1. Change variable type from unsigned int to u16.
> > 
> > v1:
> > 1. Add a new variable in mmsys driver data to control different
> > register
> >     offset for different SoCs.
> > 2. Add MT8183 reset register offset.
> > 3. Add mmsys reset control for MT8186.
> > 
> > This series is based on mmsys patch for MT8186 on [1].
> > [1]: 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220216084831.14883-4-rex-bc.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!wp2uW6phbST6ySpYRlb7iwmATAVkkCL1JBau9dCwhXj8KRasrAWnLd1EUT9gLE-oF9Yq$
> >  
> > 
> > Rex-BC Chen (2):
> >    soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data
> >    soc: mediatek: mmsys: add mmsys reset control for MT8186
> > 
> >   drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
> >   drivers/soc/mediatek/mt8186-mmsys.h | 2 ++
> >   drivers/soc/mediatek/mtk-mmsys.c    | 7 +++++--
> >   drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
> >   4 files changed, 10 insertions(+), 4 deletions(-)
> > 
> 
> Series applied, thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
