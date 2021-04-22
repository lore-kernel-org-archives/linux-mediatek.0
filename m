Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CC6C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:19:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2BE613FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2BE613FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ftjTF2NCQNWXnii97R/PGrAfTjqhsy/wlZdGI/AZxk=; b=mAqCwklrLEwpbMplSFkTBjhgT
	luKsz3TkC6eQ0bOnW2wFH3UYcX6gwwo2rnZMrUw4KgBbgGOrLeTCK3IddfWFIzCgWzY9GGWEP38zj
	ILI1RHTLOHBsAfU63Ei/d2VoNUi0+VM6Ap4+8TinZGb02OycTR2ViOXXTjKFzWB/MwOPATufXPEk7
	F9H9MknQAk8WBcI5FjngypfYqBK2qeagxI5wHuvEj270RvFvXzU/6BlthoRcjcmvuUQuze6EPRZdh
	kF0DOzsVXsfoE/TAdgeSoUt5KqiU6HL8W+e7fn+HpMUEFsYNMNys6ad/v1QZ4Swl2PA/MyYxeExmm
	zT4m5x50g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZYIu-00Gfvg-O8; Thu, 22 Apr 2021 12:19:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYIg-00Gfus-9O; Thu, 22 Apr 2021 12:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UrYnyGTCCxyN2/jKEP5GreCc5IAqvJnszjWMM5BM604=; b=YtjYMJwdZW+ylt0b/jxO+SLAhx
 DHoUwolKZlMUSJRcYCTyt0NpcB8mtm+wzQd/XExjvKy6gkqHLZo0/659WZy36yZe/MOQ4v7B+kG6T
 k1RpMA0tfP/tmj9ukQZqIhXDhciBEYzis9KOm3SxLSltJAHeDcyCBhAQL/fca/eocgYQiKmsQhIA8
 dm/FOUs9CbF/xfMTOrAXp/yzVWqf4UBkWEv4aDExDHZLia/Tu5pQHXCj+nMZBexcMaZNmo+xXDQlI
 cPUWzGcgt2N4iszCX2Zl4OsSyPH+OhlpByL5k9x/oXLntJwux82FtZnw3BQGaemR2NM1G4TDfFgKy
 WXRa2OiQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYId-00DfHJ-N8; Thu, 22 Apr 2021 12:19:17 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lZYIM-000Uj3-4U; Thu, 22 Apr 2021 14:18:58 +0200
Date: Thu, 22 Apr 2021 14:18:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 05/14] net: ethernet: mtk_eth_soc: reduce MDIO
 bus access latency
Message-ID: <YIFpsjiqhqEeVXNd@lunn.ch>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_051915_775951_CB563D22 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 21, 2021 at 09:09:05PM -0700, Ilya Lipnitskiy wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> usleep_range often ends up sleeping much longer than the 10-20us provided
> as a range here. This causes significant latency in mdio bus acceses,

I found the same with the FEC driver, and make the same change.

> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [Ilya: use readx_poll_timeout_atomic instead of cond_resched]
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>


Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
