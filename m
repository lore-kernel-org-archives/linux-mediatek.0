Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C858FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD9TuOVK/RsIOyoGJ4bbDI6mCdsGtnGFWw/FzzS5oYo=; b=OR/zWnGMi2VzbqH0pvDs3evr/a
	zaGUIkU9CPxWJQUMo5yQS+sHochHsNfJHqJJuXPKLTPPXLC7KR6+M7SDoImcdZYZx2itlFbnJ+fGW
	1wp1pVJ1Wbth9ZaICCAGwUK0Hni4IhpEnJ7Nqm/UuPwhExwAlAHnoNIe4rRNQzJ1zxHYeQqKwawCF
	T+/re0Ofxt+nA898MO4WpuaecztQ3CBx1Ee4XRFlJLi8Pd/W4OoOMjFXDpQmFOah1GB4GPnEEQJCM
	kldg3q8IMFJOUFFghMBdXtoAbHhOy+b5UKJwFVUu4vBAZdIgtLsV20O3vUAqm4vdOvqGSLWxZiYm7
	qsbbKxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGQm-00Afnk-Ea; Thu, 24 Nov 2022 17:54:36 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGQX-00Affz-IR; Thu, 24 Nov 2022 17:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669312461; x=1700848461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sXnKN/YXOdlrt4gQi4aLdKbmQKzlc0Sj2MoBA1aMjMg=;
  b=XgHmkOrU0BvGUO7yvdQH+OlN3koG8DXmLqWeDFQT+dWu6RKykFwpiGAL
   iLjsuQJjRbYxxcQJvFFGnIPRNFJf6dV/Y+6qg0n4PM4PwP5IMExjhrF1u
   qihua1+a2femigS1Gpi4G8Wjz/458p44QDM3eyJfQGeP3kYRsD2SZj24/
   f4TH5ZIMV8CaRR62PUlqIlXj7Yo2tUTynQ7xvqEbdL8eLiOrBm9W9xGpa
   HFuE98ajwUIczjTDcT+Wt+zwVF98MuJHTFZ5xlGF+Cz28jdOvBUa9C9+w
   n9Go36VFjYMbHG3gl5XPc9ny+O+/LZ5oicplHhq/wD9AcnV4cxGqflvVC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="294049570"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="294049570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 09:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="767146960"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="767146960"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga004.jf.intel.com with ESMTP; 24 Nov 2022 09:54:15 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AOHsDbM003592;
	Thu, 24 Nov 2022 17:54:13 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, netdev@vger.kernel.org,
        John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] net: ethernet: mtk_eth_soc: work around issue with sending small fragments
Date: Thu, 24 Nov 2022 18:54:10 +0100
Message-Id: <20221124175410.5684-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123095754.36821-3-nbd@nbd.name>
References: <20221123095754.36821-1-nbd@nbd.name> <20221123095754.36821-3-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_095421_675585_AE4FD94C 
X-CRM114-Status: GOOD (  16.20  )
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

From: Felix Fietkau <nbd@nbd.name>
Date: Wed, 23 Nov 2022 10:57:52 +0100

> When frames are sent with very small fragments, the DMA engine appears to
> lock up and transmit attempts time out. Fix this by detecting the presence
> of small fragments and use skb_gso_segment + skb_linearize to deal with
> them

Nit: all of your commit messages don't have a trailing dot (.), not
sure if it's important, but my eye is missing it definitely :D

skb_gso_segment() and skb_linearize() are slow as hell. I think you
can do it differently. I guess only the first (head) and the last
frag can be so small, right?

So, if a frag from shinfo->frags is less than 16, get a new frag of
the minimum acceptable size via netdev_alloc_frag(), copy the data
to it and pad the rest with zeroes. Then increase skb->len and
skb->data_len, skb_frag_unref() the current, "invalid" frag and
replace the pointer to the new frag. I didn't miss anything I
believe... Zero padding the tail is usual thing for NICs. skb frag
substitution is less common, but should be legit.

If skb_headlen() is less than 16, try doing pskb_may_pull() +
__skb_pull() at first. The argument would be `16 - headlen`. If
pskb_may_pull() returns false, then yeah, you have no choice other
than segmenting and linearizing ._.

> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 36 +++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)

[...]

>  	if (unlikely(atomic_read(&ring->free_count) <= ring->thresh))
>  		netif_tx_stop_all_queues(dev);
> -- 
> 2.38.1

Thanks,
Olek

