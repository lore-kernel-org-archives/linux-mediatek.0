Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A99CE8D58
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5ZgASznFyGQS43/FLFjObXYg+ZQyRaf+h2bx2S+tAQ=; b=HZ2w2YKbBszxkanVPwUsVdSvz0
	c6gcTTZfozHuNgTm+nA2JiRqH1SW46wjyPPup2zEzf32JXTuZJOQrJwouRcuSX6VK4naGIySSovtM
	HJccbpDyyceArTrIQZ/TmeNYTW6kpXnM4IqaWxLFDNfw+L1FfgstfTMola849zAyXml9Af59ZT3Nx
	ZuQcqVDgFPz81380IXqUOw9zgAbwf+j0DXFpd4sOEom202F5Oqm6ww6L0WEtKpHwiNGHuY+8FhaC2
	BOZtSb4pa8d8Agg9FBtgWPY99XB/DzWskrYpsB58lb5G8US/GsxsWgVzEWy5cGN8/1r4JdsyYqg41
	I0UU3kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBp2-00000009gNV-2P3Q;
	Thu, 19 Sep 2024 07:43:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBnt-00000009gBR-3bfL;
	Thu, 19 Sep 2024 07:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5A46A43B1E;
	Thu, 19 Sep 2024 07:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D27C4CEC4;
	Thu, 19 Sep 2024 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726731736;
	bh=b5ZgASznFyGQS43/FLFjObXYg+ZQyRaf+h2bx2S+tAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQ26g37b/hSaaj0YbAzmvbwIAsHHYOzDukUC3EzdiNpg8ILwY/9EplYvkpIRAqjgH
	 CH5/4ymS1Y83kn6SnQl7mZxK2S0iw+CQ3wsjZ3mF/Wa4PZvvbkhLOdjCF1l2a1TD/U
	 +Hou9TwujPjTgeT6f30nOqJ/78NndGnWY4bjiRfug0gAcJWBPMFaVUI7VQAcotEiBG
	 qLCqPOaztAoQENVR6axIzbgWIb1Zscc9KNjg1XES8tJq8+foNdi5R5ziWr+bajl8g5
	 lq1NpNSQ+r6rYbbhhdevioOutcz8LOpP5C+l20EzhrHlElkOwDJ4xtBHDK9IqWF0hX
	 5fVe5RL90GvNA==
Date: Thu, 19 Sep 2024 08:42:10 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
Message-ID: <20240919074210.GE1044577@kernel.org>
References: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004217_980888_B29F060A 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, Sep 18, 2024 at 04:37:30PM +0200, Lorenzo Bianconi wrote:
> Align PSE memory configuration to vendor SDK. In particular, increase
> initial value of PSE reserved memory in airoha_fe_pse_ports_init()
> routine by the value used for the second Packet Processor Engine (PPE2)
> and do not overwrite the default value.
> Moreover, store the initial value for PSE reserved memory in orig_val
> before running airoha_fe_set_pse_queue_rsv_pages() in
> airoha_fe_set_pse_oq_rsv routine.

Hi Lorenzo,

This patch seems to be addressing two issues, perhaps it would be best
to split it into two patches?

And as a fix (or fixes) I think it would be best to describe the
problem, typically a user-visible bug, that is being addressed.

> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

