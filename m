Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5777C28D13
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 02:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3nooHywkKyg84wSDMeqbnWFzEYEUzOPhPPCJyRH9TQ=; b=uTFDr1MyIreKelXGH8wXwFYQ9N
	v7e7IFWOpPXTO/be9DUMEm9S29b2Aw3AWNP2HzM9mmPXUlpBRXd7JyYd1bc1LPQ66WXVBszI0q0Dg
	CLkVyIvm/bfjdfLzly38e5XvDEoKm/lxHhc0E4Qm8RMeJSG6lvXVSzNATSWxitWAvOUrva8NfTGi3
	hHQZaXdAhhj5nlMyDGKdsddqAuF0Sy078UT9hFJT7SYxATjMT4hfShB38h2zwkRBO5n+bAQeM4glu
	B18eEIVgyxKEY3oaO3zPNHSker40VphX+mHlIlq2h8Ss2o5QqmhwKm0UsRHyGkWrspPtnMiTkup04
	jwepOzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQK30-000wfy-Og; Tue, 23 Aug 2022 02:53:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQK2f-000wJh-Ge; Tue, 23 Aug 2022 02:53:27 +0000
X-UUID: 890fc8a0037b4dc4a6155aa445980566-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=g3nooHywkKyg84wSDMeqbnWFzEYEUzOPhPPCJyRH9TQ=;
	b=O42j0nkGKH8XzkB6CXpksoEkidWE+pQasxKzyJXIeadNpniY4P15D0tXpKX57W5PuhAIUzWfemNDPzthp/3wtkE7ExpaJrTPQfl7Y6HZqJeIW08xIQy+n/0fKEeDNusmEqBxO7ldJo/6HA3Q/bVldEeVy6davAl082l0HUYTPcI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5a56233d-9baf-4193-b6f3-f6f520793f94,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:d3bffc67-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 890fc8a0037b4dc4a6155aa445980566-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1938958526; Mon, 22 Aug 2022 19:43:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 09:53:24 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 09:53:24 +0800
Message-ID: <c29ca6a93fb06608d173659aff40e0f6bfed059f.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Tue, 23 Aug 2022 09:53:37 +0800
In-Reply-To: <20220822132350.tw73ph6nnvti6h5i@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
	 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
	 <20220819185400.aokd53xln6rmc3xk@notapiano>
	 <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
	 <20220822132350.tw73ph6nnvti6h5i@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_195326_011700_F176818F 
X-CRM114-Status: GOOD (  17.04  )
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

On Mon, 2022-08-22 at 09:23 -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Aug 22, 2022 at 08:50:45PM +0800, xinlei.lee wrote:
> [..]
> > Hi Nícolas:
> > 
> > Thanks for your careful review.
> > I will correct it in the next version:
> > 1. Modify key nouns in the description;
> > 2. Modify the label of jitao to Co-developed-by;
> 
> To be clear, you shouldn't change jitao's signed-off-by to a co-
> developed-by,
> but add a co-developed-by. If you check the link I sent earlier [1],
> it should
> be clear that you should have something like
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html*when-to-use-acked-by-cc-and-co-developed-by__;Iw!!CTRNKA9wMg0ARbw!1bj8UrTx32ihWiD-1dbKF8XsXg4tod3zHr90aemam8bnL_4jgcA9oa44UiF9ILFN9A$
>  
> 
> Thanks,
> Nícolas
> 
> > 3. Macro definition address lowercase problem and function naming.
> > 
> > If there are no other questions, I will send out the second edition
> > in
> > the near future.
> > 
> > Best Regards!
> > xinlei
> > 

Hi Nícolas:

Yes, maybe my statement is not very accurate, thank you for your
explanation.

Best Regards!
Xinlei


