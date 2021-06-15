Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95796C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59015611C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59015611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ke7k8N/4IuN2AVfolQd8rmAfYZ95Zqa0oCUnb8tLbY=; b=Ela7vb6vcXvldX
	o+CFfONosQhebh+FU7h4bwX7K79MTiLGE+H7S4yuDKhC05lBeZc8A2lrubx8SeBPmM7Jd+xxm1NoO
	DIDi3dAAydkgMAQIN06YEBJi48KdSoWBnsyHqQyYlH8hvcNWj3Mue9i3YC/0RYML+FrjNfIiQvw/l
	hL1FwYHnp9fvh1LPI9EKosabczAg8YwNS7slWMD4WQw5daFEnWNvA770UeyIMul+DD41WIIQvjW6O
	ZtNGknMD5mKC/1FS/R3Pk2p7JCe3n/k2lhaf8kEjnExwWGN+A06OvInhfETslDtvauVaOgNGe9W3h
	wtMOTLuqPnrqa9+c5gPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFqf-002rPw-25; Tue, 15 Jun 2021 20:39:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBzd-001NsB-5g; Tue, 15 Jun 2021 16:32:50 +0000
X-UUID: bda75922819a4fc6929879228ec273f3-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IGMG9Yg0tfrgmzjxENrtPS4VIzFXkSQD8zRsmAZCtxw=; 
 b=fZhC6+muVcrh30d8zs5B4fVEGHSSJc/8yFY9WW6fZGEY/ZGbplFRTrI44Xhy2Ag508voyPgo2NMF+bBeBjXonN0G4V23HP9n1rmVoYuDGr1uISUxmpug14SxRLhnz1w9vj//l5xJORA+8SMpxpjbAWqwJl+vNpfJ6yOFRbjvfXI=;
X-UUID: bda75922819a4fc6929879228ec273f3-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 825891433; Tue, 15 Jun 2021 09:32:48 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 09:32:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 00:32:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 00:32:45 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <peterz@infradead.org>,
 <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] recordmcount: Correct st_shndx handling
Date: Wed, 16 Jun 2021 00:32:45 +0800
Message-ID: <20210615163245.26164-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210615114229.3b1f2c5f@oasis.local.home>
References: <20210615114229.3b1f2c5f@oasis.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_093249_264348_DED3AC0D 
X-CRM114-Status: GOOD (  14.11  )
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

> On Tue, 15 Jun 2021 14:47:20 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> > 
> > This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> > 
> > Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> 
> Please explain the two signed-off-by's above. If you are just tweaking
> Peter's original patch, please add at the start:
> 
> From: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> And then just above your signed off by, add what you changed:
> 
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> [ Changed something ]
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> 
> But state what you changed.
> 
> Thanks!
> 
> -- Steve

Sorry for messing up.
I've fixed it in v3.

Thanks for your comment.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
