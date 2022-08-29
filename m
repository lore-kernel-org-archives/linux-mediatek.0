Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21825C0502A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxEYn82B/sHqpgo3MNp2dCNDWHB+C6Ht7+1Mdh21l/A=; b=i+L65sD+kLc5CmOCBWBsG83qyr
	pEzIMVlfrEXn5ELg4qqQfYGODuX6yk5a88yR49mMALBkjdIvpwHdXdUdhVoiffdjDU5/9zi+nt1wj
	7LJUbsSSHSxHvfgpNsJEWE87znvP75GTEIGmudIFgjgTKem6N3vKHL5c3Yx6YaVgX2X+brcxhTpkM
	F9T1gIBrGiUianJ3fBR72ydF0+zGSvKIHmMU6agTNNkqKXvGEBU8FyKtfuZU4i3LXdmY+E+D3g6dh
	ZZfWmFx0ZG2Bq5EDRtB1Dq459xwUooIg6oQfk0keu2DNimz6PHa4usbnB2KI/97FWxQoWBK/sz5RJ
	82IzYhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSTnk-003Tve-P2; Mon, 29 Aug 2022 01:42:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSTnX-003TqX-2p; Mon, 29 Aug 2022 01:42:44 +0000
X-UUID: b408a143f1c34516b50654ab4caa937e-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=uxEYn82B/sHqpgo3MNp2dCNDWHB+C6Ht7+1Mdh21l/A=;
	b=VL+zk3SXGQ94ZjEPouFKLyi28uwwn4na2Avh9I6VTMVmz3c5/sPq7nTjxKly2m5Nsy25RcoK9asbY2CN5mdnT3JZqETqzWgwyHYIwoss+ImJ0W2y2EWX3GFxHK6niznxZjRCUkgI5GHYw/s/I18u4uPUgstrkvEuzNxlYKSuu2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:533e648e-b4fc-4bc4-aed7-0c986c79128f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b3eb5a20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b408a143f1c34516b50654ab4caa937e-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 174959520; Sun, 28 Aug 2022 18:39:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 09:38:38 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 09:38:37 +0800
Message-ID: <5675b49942f103f348e8bc4bec4cc2a60d4c4b30.camel@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<rex-bc.chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<jason-jh.lin@mediatek.com>, <yongqiang.niu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Mon, 29 Aug 2022 09:38:47 +0800
In-Reply-To: <20220826132942.k2rnlz5wwi62tity@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
	 <20220823201758.ffbgb5t5odoicgir@notapiano>
	 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
	 <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
	 <20220826132942.k2rnlz5wwi62tity@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_184243_134727_AA799D2F 
X-CRM114-Status: GOOD (  28.30  )
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

On Fri, 2022-08-26 at 09:29 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Aug 26, 2022 at 02:12:00PM +0800, xinlei.lee wrote:
> > On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> > > 
> > > On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > > > On Tue, Aug 23, 2022 at 02:38:22PM +0800, 
> > > > xinlei.lee@mediatek.com
> > > > wrote:
> > > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > > 
> > > > > Add mmsys function to manipulate dpi output format
> > > > > configuration
> > > > > for MT8186.
> > > > > 
> > > > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > > 
> > > 
> > > Patch looks fine, I'll wait for v4 as there is still some
> > > discussion
> > > on the DRM 
> > > part. Please try to fix the threading problem you had in sending
> > > this
> > > series.
> > > 
> > > Thanks,
> > > Matthias
> > 
> > Hi Matthias:
> > 
> > Thanks for your review.
> > 
> > Before I send the next version, do you mean the treading problem
> > you
> > are talking about is the problem I'm discussing in another patch in
> > this series, or something else?
> 
> Hi Xinlei,
> 
> no, the threading problem Matthias is referring to is the fact that
> this version
> of your series had two cover letters (patch 0) and a patch 2 [1],
> while patch 1
> was sent in a different email thread [2]. The whole series (cover
> letter,
> patches 1 and 2), should have been in the same email thread. Also, I
> noticed
> that your cover letter lists the patches with incorrect prefixes
> "FROMLIST".
> 
> So something weird happened when you sent this version of the series.
> It was ok
> in the previous version. So just make sure this is fixed when you
> send the next
> version of the series (after we finish the discussion on patch 2).
> 
> [1] 
> https://lore.kernel.org/linux-mediatek/1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com/
> [2] 
> https://lore.kernel.org/linux-mediatek/1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com/
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for the thoughtful explanation of this, I may know what caused
the two patches not to be in a series. 
I will fix this and revise the "FROMLIST" tag in the cover letter in
the next version.

Best Regards!
Xinlei


