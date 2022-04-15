Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+m5PdUeRqQKUDfBWlDWwSWdiX8PCyAh7LVg6eB31yvs=; b=sUdNP9NfEEASBq
	Iq8DDIi6maXlhDNCa6VpwerdsPJsYpWVq+RAES7ciVV21axsouoIlBrgL26M/lsvCYY8cgQIpS0Ky
	r6nN/g4jBN/mPtBbOepqNpvbee9jq/v5C4/8+i9vU37TuVKxtdKIXpcyoAPi4Phps7Zgkuh3tiZfF
	lr1o+MV/wj4ADRvJj93aaU/IyrQJFOEn0mxuCXpq0kuPL6PextEMLt635XjlDeg2Mke4QZyyM7O4l
	i7qOX/zpbBZQFNGp/5XpOczL5IF6oo3H2NiTxJivrZ1+wBaavDiWNvfbvDS/Nwq9vxSWP2Hu9Sdy7
	8R05pbKCXiGq8Wz06G3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJvx-009mOs-0i; Fri, 15 Apr 2022 11:16:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJvs-009mNi-NT
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 11:16:12 +0000
X-UUID: 044a055c0b144edfb0a6297b0bad0c52-20220415
X-UUID: 044a055c0b144edfb0a6297b0bad0c52-20220415
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 824122600; Fri, 15 Apr 2022 04:16:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 04:16:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 19:15:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 19:15:47 +0800
Message-ID: <9188cd3d7463cb8fc65c741bd07de817d0e60f6f.camel@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7915: add debugfs knob for RF registers
 read/write
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Date: Fri, 15 Apr 2022 19:15:47 +0800
In-Reply-To: <c8662170-bf59-06df-a78c-8fb24303f274@nbd.name>
References: <20220415061444.30720-1-shayne.chen@mediatek.com>
 <c8662170-bf59-06df-a78c-8fb24303f274@nbd.name>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_041608_794325_BF3969D3 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, 2022-04-15 at 10:26 +0200, Felix Fietkau wrote:
> On 15.04.22 08:14, Shayne Chen wrote:
> > Add RF registers read/write support for debugging RF issues, which
> > should be processed by mcu commands.
> > 
> > Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> 
> What's the required width of rf_sel and rf_ofs? Would both fit
> together 
> in a single u32? If so, you could just use the generic regidx
> debugfs 
> file for both and simply add a rf_regval debugfs file.
> 
> - Felix

Hi Felix,

FW use the WF sel (antenna 0-3) and offset to locate rf registers.
I'll send an update patch to merge them in the generic regidx with
wf sel [31:28] and offset [27:0].

Thanks,
Shayne


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
