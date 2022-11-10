Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFC5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biIlgnOa19EuvR79yaxqUqFjHhCMWtwXXgdFbZ/hUco=; b=HjjvmkJxgCqR96qMmp6PHvXJTd
	jGmxnoNA4RAiu4K4CpCgaHlynwFbRvMC5R1lGXr+KJAp0XNYd76rorpdA9ZhH4Oq0bbKBYWTpFutz
	YXDLBqvReSf1uLh/0aU5Q+Gr6DKAnwi4TfE1jeMXfntPXw+FUdvCHpy7oTxTlIjtgSpB5ypdL1zi+
	0jL+0dqpIxmhnZ4gHQrAXqVQXGvgoN0DUIL8PFiHEE2INKbRxLAOt/j8tpGLixRYok+p5E7g2rHj9
	MdmSNBOEZoj+eoYkq70lAgNqa330d/+FRggfAtpSgxedDP6q7yk+W5+DCZK97eEORD4Ir0G3wWdlE
	8eFZYNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot0Bu-0039Q4-5C; Thu, 10 Nov 2022 05:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot0Br-0039PJ-Mx
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 05:33:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B782E61D70;
	Thu, 10 Nov 2022 05:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BF1C433C1;
	Thu, 10 Nov 2022 05:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668058404;
	bh=3hgeLAwk4esWTSqgIqITFPv1E5o+nyLyDn8nF6HntFg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=J3vyFZcGmUSmoPWg4MkblFRaowrBTOzFakon/JqxJNc9bJNnJEtzb3ECSLPAKE9GG
	 vjIQP4LOLr2bkl7H9THJ4r0nujREzedt5zUtAiBxF72y56XOuTnZcc1e/11J3iuQLL
	 7he6aGjR3eCQkpXAHoqtgIcACPgCcNFqrCzSvVwCRrSZRKJ7XG0xJ6EFTgsl1fiYp9
	 kaY2SNbH97tdC7WIONUifYIS9Oly+7WT57ShdG8HzU1PLPR9tfPekngVy0W8LVdQr4
	 m//kDz1UfVuAtoPqkDHmuoC5ipeU2nmTllseYiLEplWxYeZ6NqSyPFX/ndkRUF3f/e
	 vMfT99DxG3u8A==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  netdev@vger.kernel.org,  nbd@nbd.name,  john@phrozen.org,  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  davem@davemloft.net,  edumazet@google.com,  pabeni@redhat.com,  matthias.bgg@gmail.com,  linux-mediatek@lists.infradead.org,  Bo.Jiao@mediatek.com,  sujuan.chen@mediatek.com,  ryder.Lee@mediatek.com,  evelyn.tsai@mediatek.com,  devicetree@vger.kernel.org,  robh+dt@kernel.org,  daniel@makrotopia.org,  krzysztof.kozlowski+dt@linaro.org,  angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
References: <cover.1667687249.git.lorenzo@kernel.org>
	<Y2vBTBUw47sshA+E@localhost.localdomain>
	<20221109110538.431355ba@kernel.org>
Date: Thu, 10 Nov 2022 07:33:18 +0200
In-Reply-To: <20221109110538.431355ba@kernel.org> (Jakub Kicinski's message of
	"Wed, 9 Nov 2022 11:05:38 -0800")
Message-ID: <874jv7tlup.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_213327_805566_925F1058 
X-CRM114-Status: GOOD (  11.82  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 9 Nov 2022 16:03:40 +0100 Lorenzo Bianconi wrote:
>> I noticed today the series state is 'Awaiting Upstream'. I am wondering if
>> this series is expected to go through a different tree, e.g. wireless one
>> (adding Kalle in cc). In this particular case the series changes only
>> the mtk ethernet driver and mt76 is built since we modify a common include (but
>> there are no changes in mt76). My personal opinion is this series is suited to
>> go through net-next tree but I would be fine even if it goes through Kalle's
>> one. Any opinions?
>
> Works either way, we'll see what Kalle says.

I would prefer if you can take these to net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

