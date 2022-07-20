Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937CEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 00:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDVR5F9bcDk6Yt9ph9TEa1siZ6T/G9BdzDrfqK8WYuQ=; b=uhfi9ArJALaRVumvgc2QGGWKis
	P+1c6N9/bYEqFCInE5SLCXuEC0l0oGcz41ol94uIQi1RnocVLmjJfpwwXY8pm1cbai6ewkQE2UsK3
	JjefhF8om/VUot294nkyGQMJwB8i0M/0i7laGcyh9Xs2TaJnmarqHveIvXV2n6+RllyVugTkipFze
	DNAn4v1r09hOosKiuAVeEoiIeYNVGCftyrigCovdAN6jaRyhK5lN6srf5WlHdJ5I+qFBbTAYRePdr
	t5qDnlv4gVEre6t4azAgIXBDXcbx4xSWFS6piL7e7U4vM8c9JQk/H4LlAHNAI3e8W8uPEMyQzB9R8
	44Ck3w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDxlc-00F5NE-5T; Wed, 20 Jul 2022 00:40:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDxla-00F5Kz-6T
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 00:40:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24F25616DB;
	Wed, 20 Jul 2022 00:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A833C341C6;
	Wed, 20 Jul 2022 00:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658277639;
	bh=xRO8Cerl/DsoZ7VXIDoqk7KPdb3xy0m5ieKJhE+IzbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L+AK2xxcxjO/IGBmuodb0J7D+3BB6rkaFmyBySN7f1XaTq3HiVwSmpHfxd2Kds0Fi
	 F9xzxaF1UGYG6MzR3Jq1x9ObDZgDAT/J8qlRVnTmzf+V4fLf4wqN8quSKijJKZSE4V
	 uWrK8PYbAB9KCZKnOXscoj9kkaYEXOp91AYfeuhdjM5QjJOZldbA1Mjkwdd7HUXr5t
	 k/qXH/UQImPMDHNCRE0XyX2Ad07YInhyQDSIbz9yeoeNLKerKCftOLg0IMDhtTlBVA
	 OTmOhZ123APoI6hJ8jkXXvx5sNKvtW1o1jwcNNADjgXRn8SozHeOnqxnvX9i2P0v6p
	 YofbBXt7r63kg==
Date: Tue, 19 Jul 2022 17:40:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, pablo@netfilter.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Ryder.Lee@mediatek.com,
 Evelyn.Tsai@mediatek.com
Subject: Re: [PATCH net-next] net: ethernet: mtk-ppe: fix traffic offload
 with bridged wlan
Message-ID: <20220719174038.7ee25c6d@kernel.org>
In-Reply-To: <7fa3ce7e77fb579515e0a7c5a7dee60fc5999e2b.1658168627.git.lorenzo@kernel.org>
References: <7fa3ce7e77fb579515e0a7c5a7dee60fc5999e2b.1658168627.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_174042_325690_0E56AA9B 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, 18 Jul 2022 20:36:39 +0200 Lorenzo Bianconi wrote:
> A typical flow offload scenario for OpenWrt users is routed traffic
> received by the wan interface that is redirected to a wlan device
> belonging to the lan bridge. Current implementation fails to
> fill wdma offload info in mtk_flow_get_wdma_info() since odev device is
> the local bridge. Fix the issue running dev_fill_forward_path routine in
> mtk_flow_get_wdma_info in order to identify the wlan device.

AFAIU this will conflict with 53eb9b04560c ("net: ethernet: mtk_ppe:
fix possible NULL pointer dereference in mtk_flow_get_wdma_info")? 
We merge net -> net-next every Thu, please wait for that to happen 
and then repost. Conflicting patches are extra work for Stephen and
for me.

