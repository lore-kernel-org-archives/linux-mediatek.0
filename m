Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47673C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ih/5AZ7VH4p7skGfYkFy1TDMephGSqfFTBm8ZbhGsk=; b=x2N68Jv7FE0w/wDWRZbpnuDAzU
	HeeOKqdcPtsBY8KwqNW5wam3/09L3F99FhG2jeNyz/MrBhlunUxEChH86VVEgDBix1TOQX7Ah0Le+
	AKHsu9uIv2ng8PHZTcNWL4zA4KuMqzfEFc0OQuMmWCLRVBrivHJusJnmlrfpZdf6MtL9NgJ3xPvel
	7UygOyJ0uB1tvDY9Kn9HCmPKQVJbvQv0kp2EwSB270wAfdWhv3munwRTNVgYj/4WSoKRhbewuBEKl
	FbShJ+eshrF8HztxjVBt95JfJq6eXeUwgqO/I/Ul6o9g5TfjjiI7HwtouP9mpC1sFHeEAvV4VaRVv
	60Pb5nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IYH-00EZtn-Fg; Wed, 30 Nov 2022 08:34:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IY2-00EZhz-1z; Wed, 30 Nov 2022 08:34:31 +0000
X-UUID: 658d0a44816948968c7f727d287f55f3-20221130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1ih/5AZ7VH4p7skGfYkFy1TDMephGSqfFTBm8ZbhGsk=;
	b=FcII+bSoo/NSaB5tOGDmAEsu7MGK95o6KlK8dPvz3utWjM39luFj66v5AwcXxcYbBXDUzJ4or5BA7khTg4kYXgfTcSdSCD8hq3Wu1ZNo/KtbHQ4kdUl14790zpL6nAd9B/GeZQuGKjInwYHTiLY2xQX88A5m1+BeWJ3c2POv8Yk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d9a7efeb-360b-4b99-849b-821be70a9838,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:6794216c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 658d0a44816948968c7f727d287f55f3-20221130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1351694469; Wed, 30 Nov 2022 01:34:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 30 Nov 2022 16:23:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 30 Nov 2022 16:23:06 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: <rostedt@goodmis.org>
CC: <andrew.yang@mediatek.com>, <casper.li@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<mhiramat@kernel.org>
Subject: Re: [PATCH v2] mm/writeback: fix dereferencing NULL mapping->host
Date: Wed, 30 Nov 2022 16:23:03 +0800
Message-ID: <20221130082303.30859-2-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221130082303.30859-1-andrew.yang@mediatek.com>
References: <20221129095620.4c1a8056@gandalf.local.home>
 <20221130082303.30859-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003430_143644_4AEF4D7E 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, 2022-11-29 at 09:56 -0500, Steven Rostedt wrote:
> On Tue, 29 Nov 2022 11:32:59 +0800
> Andrew Yang <andrew.yang@mediatek.com> wrote:
> 
> > From: "andrew.yang" <andrew.yang@mediatek.com>
> > 
> > Check before dereferencing mapping->host
> > 
> > Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> > ---
> >  include/trace/events/writeback.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/trace/events/writeback.h
> > b/include/trace/events/writeback.h
> > index 86b2a82da546..56f6e114d3ed 100644
> > --- a/include/trace/events/writeback.h
> > +++ b/include/trace/events/writeback.h
> > @@ -68,7 +68,7 @@ DECLARE_EVENT_CLASS(writeback_folio_template,
> >  		strscpy_pad(__entry->name,
> >  			    bdi_dev_name(mapping ?
> > inode_to_bdi(mapping->host) :
> >  					 NULL), 32);
> > -		__entry->ino = mapping ? mapping->host->i_ino : 0;
> > +		__entry->ino = mapping && mapping->host ? mapping-
> > >host->i_ino : 0;
> 
> I hate remembering precedence. Can we add parenthesis around this to
> be
> clear?
> 
> 		__entry->ino = (mapping && mapping->host) ? mapping-
> >host->i_ino : 0;
> 
> Thanks,
> 
> -- Steve
> 
> 
> >  		__entry->index = folio->index;
> >  	),
> >  
> 
> 
Sure, that's a good suggestion

