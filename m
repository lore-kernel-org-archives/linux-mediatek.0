Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D523C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c3lGkk848qg45bvzNscuaEnjvJA70A1Bv3J5coXNqg=; b=V5Gomzl0oAF+rs
	63MANglgY5nEJAl2MOLf7Fbo2TRnWe0ReQnbRMjNSqaF1K4JsEORt73b1HjgbqW+BpgZ04ErPh2jM
	tBXY5faG9thOlv/c80veafzX1mUVKOuqUE8Lvs4qXZOsrQJIGLGDImUxrjT0JjLosL6qh24P2AHaE
	5dXxbVsmSpps5QblmYWjOWoVzu9mEwaZKIYEGXyrHoJkCsI3Nk1kQoS7GsVSOntu+LfEU4UtUqPjS
	vNmWqP1jiZGF/qaf5yyvnLq9Guhv/G2o+TxL1tVr/bG+/5DpcMs57wqVx1ozNer9/m56HRKTmngpv
	hLuQjgE0ezEqeNoatNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKNF-002tUo-00; Mon, 06 Jun 2022 21:34:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKN3-002tQf-Cs; Mon, 06 Jun 2022 21:34:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A65CB81BD1;
	Mon,  6 Jun 2022 21:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5056FC385A9;
	Mon,  6 Jun 2022 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654551282;
	bh=6JG6+yF2lDW6S0rq7jlRN1qWjalNKDxNI2CfJMOqPQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RC8u6hgZ5f6YAmIaYM7jKvP4DiP2SdddwFAbl0XBw2wUxmqLhMqsGSGVWGrt/t360
	 pPLH9+AowGysob5cAoW/+jQTv8H1J9kbRn+P4+jyUb7C0RnfL7sQYezoQIVfb0/LYn
	 S6hvhJDejJ1eb1uXDQoV36ZTfXtA2klfdCIUmOkA5ahzZfXbWIhF9yTxgcVA5Nq9lX
	 mAw5XlFPxfAymxDj1DJLbO3mch6hOhN54zg5CmkMm/jQKf6MRw73vnJZpecMwAS6UY
	 RVDROK1XFI9DADHmo3HtxxDFvCBsKCNAXYczbm3mN8V9ZQaySK0Nq05vmV28coE89O
	 u3/2CDUYA5f+Q==
Date: Mon, 6 Jun 2022 14:34:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chen Lin <chen45464546@163.com>
Cc: nbd@nbd.name, alexander.duyck@gmail.com, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
Message-ID: <20220606143437.25397f08@kernel.org>
In-Reply-To: <1654398757-2937-1-git-send-email-chen45464546@163.com>
References: <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
	<1654398757-2937-1-git-send-email-chen45464546@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_143445_651634_F315976D 
X-CRM114-Status: UNSURE (   7.01  )
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

On Sun,  5 Jun 2022 11:12:37 +0800 Chen Lin wrote:
> +			new_data = (void *)__get_free_pages(GFP_ATOMIC |
> +			  __GFP_COMP | __GFP_NOWARN,
> +			  get_order(mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH)));

Please make this a helper which takes the gfp flags.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
