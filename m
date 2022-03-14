Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD14FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 01:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMKOnnQv1Krr4jn3kCN9OH4KX/OTWU4Xhh1ARdF9juk=; b=eos98aKwrCMmig
	OJ4FiETWSa5eY/JXUfOsGV/IhAOaKreuFSHxTxbKIHgNCnXQobxR+Cc9kngSbuwHqhPRF4RL0Z1qe
	TXSG4UI/FP2V4uelhFMHnXZ04DWpfheSyZdyVeda9vstPvz72IhS4l9TdcYuTBaYD7PYeXKMrMxwq
	2soMuLAFcx/22/259RFCCe/tMuN3yb6iff7bAzMaueP1PmPO8+20zAay89sLTZNs1G28MpX1JU9MI
	5GCfA49dJs6yuRYpv0Lg/kj6xGguUyyh/J4NOEtSUqgdU1QSZVUcNWHFeI/3RE/Ns9CaRq2lunQa5
	Q2i9QsD3ZE74kXcb4ihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTZxL-003ax6-5p; Mon, 14 Mar 2022 01:57:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTZxI-003awN-Ri; Mon, 14 Mar 2022 01:57:06 +0000
X-UUID: 7fa6333e68334be48b749721bde78039-20220313
X-UUID: 7fa6333e68334be48b749721bde78039-20220313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 390357205; Sun, 13 Mar 2022 18:56:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 18:46:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 09:46:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 09:46:47 +0800
Message-ID: <c429d079010051552c3673baafc3b20289043875.camel@mediatek.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: watchdog: Add compatible for
 Mediatek MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, <linux-mediatek@lists.infradead.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, "Kishon Vijay
 Abraham I" <kishon@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Date: Mon, 14 Mar 2022 09:46:47 +0800
In-Reply-To: <Yitv4sRQMuewLcfT@robh.at.kernel.org>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-3-allen-kh.cheng@mediatek.com>
 <Yitv4sRQMuewLcfT@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_185704_931611_4C801E9C 
X-CRM114-Status: GOOD (  12.37  )
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

On Fri, 2022-03-11 at 09:50 -0600, Rob Herring wrote:
> On Fri, 11 Mar 2022 21:07:30 +0800, Allen-KH Cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > This commit adds dt-binding documentation of watchdog for Mediatek
> > MT8186 SoC Platform.
> > 
> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Hello Allen,

I have mentioned I also upstreamed wdt serires for MT8186 which is
inclduing binding patch, and my patch is accepted by Guenter in [1].
Please drop this patch in next version.

Thanks.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=888423f98c8fbf67e8cb2df8099678ff57274911

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
