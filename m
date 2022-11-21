Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3ABC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPkUXYdhTXp/twlLkOa0pghS5JKvrvNK6Ti0CbvA2hY=; b=zAPMpWFNVRL5GQiBGzQyENN+Zp
	x9A/g55SWtrZCFet3uJaDXb9PsBfOUoNfmR30MoCwK6a8Ym+NoodhDChWKb9VYHkMETfvS6/2v8dy
	Z9tv7SIloYY5005NU5Gj0JFbVLfFE7qJZT1j7JiXOTbtSeW+TXeSmXrnnkGsKTBfenUUJaHoPAvOm
	WOhqOQObBfho81Gu4evuy90urU6o9rwXvEJyohfoAQWjI9CJ914JZtok9KMA5oTFfClkMX6obCCXO
	lzmrKWCCDHB/MOMFU7U+hbFF/c0NTlHh3MQXuFdowpuACKpQG9UTkw5sne2hzisQYieRcoFnEQHN7
	faRQZpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxDEL-00HWb6-36; Mon, 21 Nov 2022 20:17:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxDEI-00HWZp-Mq
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 20:17:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 514DDB81233;
	Mon, 21 Nov 2022 20:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAD8C433C1;
	Mon, 21 Nov 2022 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669061840;
	bh=r6WtE3P9Qeyg+2BlmAae9fNTgZ8N6P6ZGJW3768qQBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DfgdJSuqNkhzfig0xpFj+tn++NyNk+7xC0lS03ehtPH9/YNHDjtpEAWloQcRie1t2
	 A3IxObpe0yNar09QU79C3e0SGbROkj353A98iwcsXMmki/kAFqrm3UJdyL9U3uCbr/
	 ll8304IqSLkjgDAGGmD4fjVw+GQyEjlrE1WwDU7ObI2rxT0FvfJDagSmXiT4xMBw7B
	 4vWwzwc03CXAlEXH0oxExF4HmDw7pjilX/Z+qkoEMBPC3gxA1mmnvbQdyDN2zWz1lU
	 eqMoTpLM3DWWareaN9TRn9HlfOiU2xHbLkgxgES6wK82Iy408wYY2howsKKhXH6uTC
	 XvBNckhA6Yemg==
Date: Mon, 21 Nov 2022 12:17:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, lorenzo.bianconi@redhat.com,
 sujuan.chen@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/5] net: ethernet: mtk_wed: add reset to
 tx_ring_setup callback
Message-ID: <20221121121718.4cc2afe5@kernel.org>
In-Reply-To: <9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
References: <cover.1669020847.git.lorenzo@kernel.org>
	<9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_121722_914472_034EB4F6 
X-CRM114-Status: UNSURE (   7.38  )
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

On Mon, 21 Nov 2022 09:59:25 +0100 Lorenzo Bianconi wrote:
> +#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) \
> +	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs, _reset)

FWIW I find the "op macros" quite painful when trying to read a driver
I'm not familiar with. stmmac does this, too. Just letting you know,
it is what it is.

