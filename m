Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D78C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:34:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60374613F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60374613F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+g1XK5eAGw3DLMgNsUFQliQaYCcyWiChLoQb2kUr9Yk=; b=MmfUP0YBw0KkPTPEUD/TkmwoD
	uhLuuScHwr7NC8UKhFLiODhWx+Zfx7SzB5nnBxymP/tePIk2UIwC8hGhiS1qbOQprZYmHseFR4f1k
	xufQHR4c0kdq5Uka9szDkTk4NpYC+wtvIoKq9bZb7yfXlp+SgvCmHiCBEzsMjHL1KhgohQvAV31Hy
	S/Vgs9qGLx/2ykHlKYs3qStYVUI+IxFjFt+S14jSCVY++xunH2anFOBW7GF2JSvw8fHE2zFgPvaCy
	trR3xEPMy57Dfu7a0cwWAc4rZmJ+5icJGnDro7CbW0uQ6ACtFpAwABRctxjEnEM+7Yb+YHBTdHyCO
	Sccfdx0xQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZYWn-00GiGu-Bf; Thu, 22 Apr 2021 12:33:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYWj-00GiGE-8J; Thu, 22 Apr 2021 12:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=B7Q4T6dJAsdsQ+Ix5yA7JOmBt+U9csvMzUwRnH4jDQU=; b=GRNExImYYyDJC04vqu1na1gpyA
 wdUkb6SOBlKfgU7MASd4tEt0MwwyRpWFLb6RMFytotfv0/1cjEALjXU94xckVyLj8vD3cDCeZ6xkg
 0s0Gn8AXv5fMzTvBJFLvWRpvqA0NV9yKEc66tqs8TXS0LO3q7CFqelybLAd8OpnWZX1j/5S934tIT
 XL2HMM/TS58L7KZjm1x+bfO7gV0UZGBl9p2b3at09Mb8Mjnb36egK6cFjUUqEPg5tIxK+F9Y7ARzx
 EdWCQLbTp2btC0ioAnyKtwQ6+FV9zFwrddAFA2F7rjfm+n/mOtJ6mLFT4A0IRjeeqNmMyHKfvygWT
 6v8yokHw==;
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYWg-00DgD6-Ko; Thu, 22 Apr 2021 12:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B7Q4T6dJAsdsQ+Ix5yA7JOmBt+U9csvMzUwRnH4jDQU=; b=og3af5XO5faTW0xLx1tDv9FdVv
 7pDXIJug5QDv2LZlIJDJU2Yn3RvRtsrsMqcA61T8C+Ra849DZN3EAJurepVm7qpPRR5EcMB/HxIMf
 6J+2uOyl3Bys4hgd1nldqZg9u64987ep5WQmqZlhP28vlNodwXutRz10l3RuNQTDZnSo=;
Received: from p4ff13bc6.dip0.t-ipconnect.de ([79.241.59.198] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lZYWS-0004UX-1s; Thu, 22 Apr 2021 14:33:32 +0200
Subject: Re: [PATCH net-next 05/14] net: ethernet: mtk_eth_soc: reduce MDIO
 bus access latency
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <d96206db-96e2-1eb7-6b19-47c9596ccfea@nbd.name>
Date: Thu, 22 Apr 2021 14:33:31 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_053346_872380_97213EF5 
X-CRM114-Status: GOOD (  11.28  )
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


On 2021-04-22 06:09, Ilya Lipnitskiy wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> usleep_range often ends up sleeping much longer than the 10-20us provided
> as a range here. This causes significant latency in mdio bus acceses,
> which easily adds multiple seconds to the boot time on MT7621 when polling
> DSA slave ports.
> 
> Use udelay via readx_poll_timeout_atomic, since the MDIO access does not
> take much time
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [Ilya: use readx_poll_timeout_atomic instead of cond_resched]
I still prefer the cond_resched() variant. On a fully loaded system, I'd
prefer to let the MDIO access take longer instead of wasting cycles on
udelay.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
