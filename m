Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44438EE499F
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Aug 2023 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbCv4DtOWUxo3C+NjjxtMv5fEhS0V1227KtJgCKTMuk=; b=vitCN2JTN/KQXr2CgBCa6QxWcM
	hHDlxJTfXDTVCVtTY/so6LQcxZK1Ip3Dz5CDLRMW6DdkNVM+vPPlWFYSJuyJXAeqj4OcUCJuD356y
	O5D1eM0EHr3G516p9chmQiZ5GIHi+6zm8L23puRzlLGjiQAbCo7w9zgknqWrBaRI9rSLRVCQe4tf9
	XfurkP1BtlbZOQCT4CJJAGuJv1NoVRKe3rI52ly6PUEWfb2TjKUoHaZ+5QRkHnreXsYaCXcwzCgHk
	wFwV+2BkJqxYUkJyIUzJAb2AHb/kJBXAsMDBvY5/HvoBEKjbQzYm2RcED70d+pFDpzyXV875is98V
	EJLKNJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXAq7-00AFZ8-2B;
	Sat, 19 Aug 2023 01:33:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXAq4-00AFYi-3C;
	Sat, 19 Aug 2023 01:33:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 095CD61312;
	Sat, 19 Aug 2023 01:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA794C433C8;
	Sat, 19 Aug 2023 01:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692408795;
	bh=eQsDnVRcEoBkIR035KXsBsK1ZgEoecLvJBhlfQqPdvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oo2h163uvr5HkeY9eXN8I13GpuAxwj82iwdkWJRNvXGueeQjJzVI1wg2ww2kootiX
	 BOVZEjnlMwvuagtOGJGXD+ULBRIQfFEwLJPBtTSvvhRmE2lvfkSgfJMGiWTWNUBl2d
	 eTyxlrW/En3wvKguy8EPt/fnSJdJvAT24dS3aYurZN44OggxY2hzJ707984EvwAS9W
	 BFzf8J57P3niIwJ14Kk309Z80y3ivkjKHJT83nrDEmttwQPFzuE1uXjenECTkDwWiX
	 qBtqnSltRcmeOJJKhc4AEcTtN4nZlF/7ash+D3wKJZDjrrLQUnvknu8PrWTyiPErSx
	 WVyc4zzWA3NJQ==
Date: Fri, 18 Aug 2023 18:33:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer on hw
 reset
Message-ID: <20230818183313.52f9b9f3@kernel.org>
In-Reply-To: <6863f378a2a077701c60cea6ae654212e919d624.1692273610.git.daniel@makrotopia.org>
References: <6863f378a2a077701c60cea6ae654212e919d624.1692273610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_183317_120554_312DBB7C 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, 17 Aug 2023 13:01:11 +0100 Daniel Golle wrote:
> Initialize the hw_list will 0s and break out of both functions in case
> a hw_list entry is 0.

Static variables are always initialized to 0, I don't think that part
is need.
-- 
pw-bot: cr

