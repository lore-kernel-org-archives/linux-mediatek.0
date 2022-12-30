Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 04:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g8g+IzZtBNUXnqyLQQPEIazo1hu0AH1YtK0C1eLVqk=; b=ZgiQ52hsoEyVgy
	BbJXLbE8kHjQqu3A/pFYEO7Fy1r8Y+519L/cKnGL0lxdurZ10cFEs0WEm5loRCyhSLuo7fchr0KwE
	7p1E43Hkl0SRx3sXsaTc19O4i9bktF6Wfk6iIcFxASpgWdshtIIqiK9rFl534kTnejS2cDLrIBFwg
	ZfQL3NMc2H0cIgiaYIM2Cmg3e7WFGhL7ZlCbyOcKaHyghnRGIYJ44PV2Vn2oV9t5hRnnxv+LsjF9U
	CToUMPabWlEOfufhNMg6UTkWVIOs1EZa4oIOrv7fhuquZq09mHXlhTLc+oP2IX3MgAmpTCRBwB+lY
	MYgnn4ugYZlqV3j/EFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB6he-005Hgw-5k; Fri, 30 Dec 2022 04:09:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB6gE-005H5m-UU; Fri, 30 Dec 2022 04:07:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21F3261909;
	Fri, 30 Dec 2022 04:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F9BC433EF;
	Fri, 30 Dec 2022 04:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672373257;
	bh=oHSUVgzZFT5eD1K23WLe22CTg2guTdfkql7F7NFCmps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aFdywRFiKVgawGQ5CEwjudYuMZlqN89LeoHR7omeKkB+lWgIb8Kqn9jRUP4By/Toj
	 Qlic3m0dk84suoQjPPUubx2zMUp/E6imGDr4nda7lQrzBOWU46zJK85nFJtFLlDEC0
	 pfAzCTnioWunpQbOBmODJDWuD5z9SYc9cDQo2dBNshigN9Pwmurj3+h3PPY+4YsYTk
	 B8sTM5yKQ+P73Vx310dmZVcBSGcni3dW4BiSRbu9Br9ajzr8ULzV1hqudddrXfFMKL
	 pTeGdM4J2qUOMgdcONIxsWnYzqQKdfL0ToxRiEwbXtxAJ9TrGoVm93i2yU0ZBWV9OZ
	 8/UF2AKfZ93Yg==
Date: Thu, 29 Dec 2022 20:07:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net v2 4/5] net: ethernet: mtk_eth_soc: drop generic
 vlan rx offload, only use DSA untagging
Message-ID: <20221229200736.008f5ad1@kernel.org>
In-Reply-To: <20221227140807.48413-4-nbd@nbd.name>
References: <20221227140807.48413-1-nbd@nbd.name>
	<20221227140807.48413-4-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_200739_094999_797ECC82 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Dec 2022 15:08:06 +0100 Felix Fietkau wrote:
> Through testing I found out that hardware vlan rx offload support seems to
> have some hardware issues. At least when using multiple MACs and when receiving
> tagged packets on the secondary MAC, the hardware can sometimes start to emit
> wrong tags on the first MAC as well.
> 
> In order to avoid such issues, drop the feature configuration and use the
> offload feature only for DSA hardware untagging on MT7621/MT7622 devices which
> only use one MAC.

Does not apply cleanly, could you rebase and repost?

