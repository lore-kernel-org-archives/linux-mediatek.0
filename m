Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB05C4BA06
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B54D2082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xf6tGuYL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tnz5CLGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B54D2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hJNUEtmn1MB43eu9pvYUaFJ8SHp+UA/DbUqvH5ZPrk=; b=Xf6tGuYLeQMLO9
	SZkURXjX7E+W+8EE0O72H9R3QtoZlqXXjGJAe8c8WRJXLDUvvmKrPvTgZjZhHkBX1f9rKl9kmDnfL
	YzTZpl+itvRmGGK3o6MPpKftMb3armu1uW7veID3caYcr6j3Icx8/ktH5/vsVA7RpryFSnD9hpj7N
	A4Z8Zk1DCww9FziMxODvnHjOd+enMGgAD9OOpq4cfdAvPF5XSfyEX1r7a+d4M2wf2gRWTt9ogEqE/
	jLBuF5SAcQHgwzO8mPnLktjAynQde+zkYmypndCc73kzYE6UpsnW+8LywTabhrFg4oDk4PBJMQkZw
	Gq1k0+2/RbHQOO7bFq4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6lgR-0001Np-P5; Wed, 26 Feb 2020 01:40:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6lgP-0001NH-Fe; Wed, 26 Feb 2020 01:40:19 +0000
X-UUID: a5d5fdb540344155b66ca7f32d22b0ea-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QnRmFmzK3QiGsyx/wln05rmuo5QWWRZM/E9WOlCyH1w=; 
 b=tnz5CLGQO8+9JnX2NcIXJCQ3ueoUvYbl5ftp63xkrs5Bcf8kPoGWhq348JVrZaQhs7izOTbhOZTFYNSQWzesWQCAVyxoRbVkxLBH2eH4UmmZqjkCr8OXVzqMF1mSCYylSOMncO8edY9b/Ss1cFMxi3VvP0p2r3Ie3koSCQ4IA+k=;
X-UUID: a5d5fdb540344155b66ca7f32d22b0ea-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 792229200; Tue, 25 Feb 2020 17:40:15 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 17:40:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 09:39:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 09:37:55 +0800
Message-ID: <1582681211.16944.2.camel@mtksdaap41>
Subject: Re: [PATCH v8 2/7] dt-bindings: display: mediatek: update dpi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 26 Feb 2020 09:40:11 +0800
In-Reply-To: <20200225171052.GA6002@bogus>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
 <20200225094057.120144-3-jitao.shi@mediatek.com>
 <20200225171052.GA6002@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_174017_686924_4BCF8D5A 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-02-25 at 11:10 -0600, Rob Herring wrote:
> On Tue, 25 Feb 2020 17:40:52 +0800, Jitao Shi wrote:
> > Add descriptions about supported chips, including MT2701 & MT8173 &
> > mt8183
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

I think this version is the same as v3 [1] which has been reviewed by
Rob, so I applied this patch i mediatek-drm-next-5.7 [2], thanks.

[1] https://patchwork.kernel.org/patch/10901971/
[2]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.7

Regards,
CK
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
