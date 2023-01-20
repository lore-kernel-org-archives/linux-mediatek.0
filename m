Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1170FC46467
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 03:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lIUwszs20vP8ZqwnhMcV/6lWMoLi/u8ghdqcD9n4/M=; b=EslWeriFfJkshX7kBGarGv+/QL
	CMDCLonkwNcMVt9Ty2X/xVj4s8WnDHkYYwBpHv6LKct12CdszYCSe0F44LuPEL4lA3kDLlVEARd4P
	8GcIIW5ABGleTsGqvxvjOvTBK2fIALboCXXnOvB48oiDlZGq/1g+HEouEGiF25+X4gC/q7dlE9QsK
	Jt8+WJhf1rYmX6AqHORBfJItx1zS2OwHZwuU3o8ffZieOiZ/Y5eE/pCx4+GMUFyig3R1YS/nHSfcM
	C6hdvuXolfpNlilzCmEfBK0ATA1SDjcH5Baec94Tlm6KKxen43UyMpdzl7HoUbval1l7G2VRr8f2h
	WT5LCqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIiS1-008Gzo-E7; Fri, 20 Jan 2023 03:52:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIiRy-008GyX-IB
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 03:52:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7E459CE12AF;
	Fri, 20 Jan 2023 03:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F006C433D2;
	Fri, 20 Jan 2023 03:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674186732;
	bh=MC1ENP+CPVPn+1arFstG4AqmfHtgPeKoFZHEIfXNfBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fd6a2F+2dwaIRbyZ2hydGSBCCfBkRYByrCSBY4+EWztnRHHwawx5KTdS9x2PwHL3/
	 NRymhnOUZeo95z8cq8S0FnVhQhBr/AOX5rS0GGcDrmcob7gwLmumYWLXwzLcoiyPS1
	 7tNQfDLyCtoro9Heom9UiKuU4fLKcKi+7/UtUhGCgGxOuL1P/hn+3nSDutccPvkSnZ
	 tcgvgwTvANSMbUjYJfr/v1mXLwJ8CS8oxBaadiXrTU/yH1nLumjzd4fC8HUryzERBQ
	 KQ5TfbnuVnrLLwll/BFT7+61sjIp1StTV8o4CG5co/UmYGgFF1it6BJhPIKrghBKf/
	 CBqQl39GhMSqQ==
Date: Thu, 19 Jan 2023 19:52:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yanchao Yang <yanchao.yang@mediatek.com>
Cc: Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
 <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev ML <netdev@vger.kernel.org>, kernel
 ML <linux-kernel@vger.kernel.org>, Intel experts <linuxwwan@intel.com>,
 Chetan <m.chetan.kumar@intel.com>, MTK ML
 <linux-mediatek@lists.infradead.org>, Liang Lu <liang.lu@mediatek.com>,
 Haijun Liu <haijun.liu@mediatek.com>, Hua Yang <hua.yang@mediatek.com>,
 Ting Wang <ting.wang@mediatek.com>, Felix Chen <felix.chen@mediatek.com>,
 Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong <min.dong@mediatek.com>,
 Aiden Wang <aiden.wang@mediatek.com>, Guohao Zhang
 <guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, Lambert
 Wang <lambert.wang@mediatek.com>, Mingchuang Qiao
 <mingchuang.qiao@mediatek.com>, Xiayu Zhang <xiayu.zhang@mediatek.com>,
 Haozhe Chang <haozhe.chang@mediatek.com>
Subject: Re: [PATCH net-next v2 08/12] net: wwan: tmi: Add data plane
 transaction layer
Message-ID: <20230119195210.03537a93@kernel.org>
In-Reply-To: <20230118113859.175836-9-yanchao.yang@mediatek.com>
References: <20230118113859.175836-1-yanchao.yang@mediatek.com>
	<20230118113859.175836-9-yanchao.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_195222_836935_E7E304B9 
X-CRM114-Status: UNSURE (   7.30  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Jan 2023 19:38:55 +0800 Yanchao Yang wrote:
>  drivers/net/wwan/mediatek/mtk_dpmaif.c     | 4005 ++++++++++++++++++++

clang detects out-of-bound memcpy/strcpy or such somewhere in this file.
Please fix that.

Please try to make the series smaller than 17,770 :/
Strip stuff down to minimal working version.
I don't think anyone can review 17kLoC in one sitting :/

