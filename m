Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzYxd+fnj7CzwJA/f3SkQAMP+KKR2xEXwpV/mzn7yyc=; b=3WFqUpsOOSSpGm
	ioYjzmp6TE1jbU3vMW/Yl0UkPagXyMSThj9bVK6TCUjpCiqQqq8mAOyVRaBKbhDhj86x3h9ZtnjOW
	19Jwn2c70Aw6+APc7QvszfaGI+XCTPC3wOu082da+CiOOqXXUUZ0GZt1rtaS2rQVDEfwGyP5Gd6U+
	M46lQwd6IMrto8j3zEvcSHAyg8eTBkZNI9gxgbQbM4HUL3nHFz7+bqp42mGkXtlCNzKHudsmVuTaf
	gXW0thEGu9YM48h+Z9N+TQALK+ap76hiWRp1APF9hOc6apfMnZZL2uDGib7p5uHw4CGwnXK2kbyX8
	suZQiOIli4/srLF5bSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrilK-008KfO-GQ; Thu, 19 May 2022 16:12:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrilI-008KeV-Dx
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 16:12:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 761DAB825C1;
 Thu, 19 May 2022 16:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A769C385AA;
 Thu, 19 May 2022 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652976746;
 bh=PLx3iUUZ7laxx5o2O5313UEeec1L4dfiFRAgBbsJ7ig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZP8oZmEet8O8mjGO0MyRU3bVx4+QfoncrK2vEoIRmghpw3nzt4F04TJNhsxpcjFwW
 f0eZhvofHUTgRFCOLat9M+vlg1vjqVx1RwpZizfO0jodO7C2S0NCP4u79XNqd/CXr1
 u70yvkF4xyQnp8lwiUXYGA+nAUtoO6xC168qme2XspynnCQ9fjiW2mY5asrSGR8czl
 j0VfgpR3wYFfr8kldMyji0p6qQgliU+xDKy/nbYCysRgZaJGd9rU0gGSwDdosOi0Vj
 iCx4M83llWXmeYiLcOsv417GH7nYqmlxmu9nOK+yH34VOZb3z8CY53EE2Aso7jQJoB
 Dp6h0GRwcgBsQ==
Date: Thu, 19 May 2022 09:12:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <20220519091224.4409b54d@kernel.org>
In-Reply-To: <YoX3AMlBFfDcl69o@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
 <20220517184122.522ed708@kernel.org> <YoTA+5gLC4zhoQ0F@lore-desk>
 <20220518084431.66aa1737@kernel.org> <YoX3AMlBFfDcl69o@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_091228_686916_61B1A1DF 
X-CRM114-Status: GOOD (  14.59  )
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

On Thu, 19 May 2022 09:51:28 +0200 Lorenzo Bianconi wrote:
> > I don't think there's a best known practice, you'll have to exercise
> > your judgment. Taking a look at a random example of MTK_PDMA_INT_STATUS.
> > Looks like that one is already assigned to eth->tx_int_status_reg.
> > Maybe that can be generalized? Personally I'd forgo the macros
> > completely and just use eth->soc->register_name in the code.  
> 
> I personally think the code is easier to read if we use macros in this case.
> Let's consider MTK_LRO_CTRL_DW1_CFG(), it depends on the particular soc based
> on the register map and even on the ring index. I guess the best trade-off we
> can get is to explicitly pass eth to the macros as parameter when needed.

Yeah, do you, I was just sharing what my knee jerk direction would be.
You know the code better.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
