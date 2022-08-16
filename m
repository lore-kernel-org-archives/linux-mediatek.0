Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454F7C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 02:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD5G5vRYVeJTazLCvxqkE8EG2fzJX8GMm55+IwwZtjk=; b=zv3pHz2R28UAgFrIo4QQjckrsJ
	kaX+/+74qjil/aMUG/ZuxSJKLYpyX3En+Kyde4HGUH7TOvMr8dnKFV3KqIRSIBof9mNfgt4HSfFvz
	ZWeGGIfLEHkB3DSlr5+IkDvg8j1DLvTWTRENYaDV3QJ7EUAETvv5xcRbC0t8x8DJqlzIRi/NN9n+O
	h+W1+ZHXoSBdCC08a4xfUKC6sut1xxLIz8OX2Ls6TO8IpJynfq8c5Rm6iPx1FFuiKFD6ppYHMvAib
	t9qkHu7QswxRfqAs04vkMe4B1ixGmHd2Z/JViSKwAU0XYS/OB7HnqGwN8m7eTnap5GHodF39pNv4i
	aLLXTpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNm5g-0090Zw-8b; Tue, 16 Aug 2022 02:14:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNm5d-0090WY-3E
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 02:13:58 +0000
X-UUID: 78f17805dbc04891b66084ef099384fd-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eD5G5vRYVeJTazLCvxqkE8EG2fzJX8GMm55+IwwZtjk=;
	b=WyF2llk3+edmEQ+6bmqY4N/UmVzyfb2qwg9ISMB6mGZt54sEcqQDU+vT4jiFBld0qvz8PnHaeqEZKrwzHkcvgElwSHar0yHK8CJNIb85A+qjZilpiS/PYuvEUBUWW9PFNVhxYn65H3VRvWvkxZb9QqbuPrWYrcRma3xNkJzk434=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:5163a561-607a-4801-8fa6-8e4519dd4576,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:e690e8ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 78f17805dbc04891b66084ef099384fd-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 308460129; Mon, 15 Aug 2022 19:13:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 09:43:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 09:43:15 +0800
Message-ID: <ca48295d59f23b68ef48b303e8d3e065ac95378e.camel@mediatek.com>
Subject: Re: [PULL linux-firmware] mediatek mt8186 SOF firmware v0.2.0
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
CC: <linux-firmware@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<chunxu.li@mediatek.com>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 16 Aug 2022 09:43:16 +0800
In-Reply-To: <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
	 <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_191357_339182_A97E26BA 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, 2022-08-15 at 09:01 -0400, Josh Boyer wrote:
> On Mon, Aug 15, 2022 at 5:13 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> > 
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek firmware for MT8186 SOF.
> > 
> > Please let me know if there are any problems.
> > 
> > Best regards,
> > TingHan
> > 
> > ---
> > 
> > The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:
> > 
> >   Merge branch 'main' of 
> > https://urldefense.com/v3/__https://github.com/suraj714/BT-Upstream__;!!CTRNKA9wMg0ARbw!1yTVOC7UDhMs-zna3kGo4Pq4k6mbowX_CHWQLh_iIdpK3fQ2bZEwZd0e2XNzAwQPNFc$
> >   (2022-08-10 07:58:34 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   
> > https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!1yTVOC7UDhMs-zna3kGo4Pq4k6mbowX_CHWQLh_iIdpK3fQ2bZEwZd0e2XNzSAFZtnA$
> >   mt8186-sof-20220815
> > 
> > for you to fetch changes up to 12ca0753342651fa2ab640deffde5e51b0dd9868:
> > 
> >   mediatek: Add new mt8186 SOF firmware (2022-08-15 16:43:11 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (1):
> >       mediatek: Add new mt8186 SOF firmware
> > 
> >  WHENCE                                              |  21 +++++++++++++++++++++
> 
> Pulled and pushed out.
> 
> I noticed several of the Mediatek entries in WHENCE all put the
> license information in the WHENCE file, but LICENCE.mediatek also
> exists with the same terms.  Can we clean up WHENCE and just have all
> the entries reference that file?
> 
> josh

No problem. I hadn't noticed that file before.
I'll send another pull request to clean it.

Best regards,
TingHan


