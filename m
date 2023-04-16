Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FAEC77B76
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCZjhm4Hbh1Xe4YSlI4A2hA8xi0IlyPYCkMgUVWDgKg=; b=nkWHP1QSaq5pB1
	3TJQ+l4WFoLdJWXudcjsTDlH4DP5o2yy0n1ws7jiZ+1G0QHWRiq50HTrk77GaeVETXB8ItuYJqf87
	K1kW97r6nTtIpALlE6SZNtB2UtdT35VoRsCBE0oKdasCKUHaX4ELmCsOE1Wq5BbsSyB5WCRcw3gk3
	n5OPHbj25owsyeP/NamocL1e/gvK/aoGEAxPh7wb5QCtSmU8EPZ1tn6bNRMsTkKmJNAflmO3ouIvF
	AdBUzmE2bNOKVzB+HNJrf2KnNHVx3fy3ea2hdcOVnd4SbNBQkv6sjlxGfyA79X0+uLXboPsT8auXb
	wrh/vLaNRUO1eDPgP2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnz4W-00DTTQ-01;
	Sun, 16 Apr 2023 09:53:24 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnz4S-00DTSd-11;
	Sun, 16 Apr 2023 09:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681638761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E0swol1jw29yr7sbkD56kf0SXwk+LNzYdYTwvIMMhagyxm0z6vxHQZoLvxwjAjISMrIEc7XWnhviPfJy7EZOZ3lVAowfmmjdTC27FwHtQFGqQGLUkCQXXFQK84B5Nl8iAQOvy0gU1MgfZa+pogwdHLx6GaZXpUjoxH18kREFcQk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681638761; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GCZjhm4Hbh1Xe4YSlI4A2hA8xi0IlyPYCkMgUVWDgKg=; 
	b=abx6MaJDAXNiOU77CW+9MuEOVWOjcOjjS5/G6GwxWQN161hmmK0YoEgZpSc8mASh5p3ken7rBFBGz9OYGYGnl+yUldoERi+r+S+/oW/eFtkSu7rvFbcMCcpTw7hBdZ7wicNTcIU0TvEYTDFtZh8vR1dzxHA2s03v+cTnkH9l3rA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681638761;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GCZjhm4Hbh1Xe4YSlI4A2hA8xi0IlyPYCkMgUVWDgKg=;
	b=GMZ9Mi9oXvS+IUd1T5GR+csOJt5VeL93w9TXXeG4IGa1BF0s/Jb9eHL/irN5fYOY
	a3+qZQeGd89KFxbYrY74lLcGEAzxrwGy8A5tauSRwex33XtR2UunlWHUupWsz1zTMEu
	pEFdBN9lTQ5L9q2MJoxBbmKFMGgd45zDVXG4t+1E=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681638759506996.2741470788767; Sun, 16 Apr 2023 02:52:39 -0700 (PDT)
Message-ID: <c657f6a2-74fa-2cc1-92cf-18f25464b1e1@arinc9.com>
Date: Sun, 16 Apr 2023 12:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC/RFT v1] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, Felix Fietkau <nbd@nbd.name>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Daniel Golle <daniel@makrotopia.org>
References: <20230416091038.54479-1-linux@fw-web.de>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230416091038.54479-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_025320_432198_776AA208 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16.04.2023 12:10, Frank Wunderlich wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Through testing I found out that hardware vlan rx offload support seems to
> have some hardware issues. At least when using multiple MACs and when receiving
> tagged packets on the secondary MAC, the hardware can sometimes start to emit
> wrong tags on the first MAC as well.
> 
> In order to avoid such issues, drop the feature configuration and use the
> offload feature only for DSA hardware untagging on MT7621/MT7622 devices which
> only use one MAC.

MT7621 devices most certainly use both MACs.

> 
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> used felix Patch as base and ported up to 6.3-rc6 which seems to get lost
> and the original bug is not handled again.
> 
> it reverts changes from vladimirs patch
> 
> 1a3245fe0cf8 net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for switch port 0

Do I understand correctly that this is considered being reverted because 
the feature it fixes is being removed?

Arınç

