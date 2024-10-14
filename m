Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BBACFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pP4cwODVrUJxStDD1aPTkia8pJQFbGwMJs/19PntgIo=; b=Yrwr6xMqto55AmPMWUQRqyqF4S
	5vCJjYFCUKJ+jK6hRTfGD41uaMisXmw/9tCAXO8YhFRSUqEy9VrWHA41DrmIuD0QxqLthfNR5LgM/
	sMBSobhQ3ObgD0A09zNyd6H2Giirzlzsz6sx5u2CHMS24ZHfG9TzZMfiIAZ4VArsj7Rti9XDxY9MO
	4W/DUv0pyverN5Dzwpc+NvQlPcbd7S2poxb4gSZQxODJdisKmfou93DxP0fdBW5lpfnELJr+dZONy
	QMdoYdxACQUE5qXDIKNcpKIGMz17Q7ws3KyiC2E0t0bMFEDPwWFLH7Wg+LZ9WcZpA1SYUYtUIcdoc
	cRQF1J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Gr1-00000004NfW-2w0N;
	Mon, 14 Oct 2024 08:55:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GnZ-00000004MK8-1mVE;
	Mon, 14 Oct 2024 08:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52488A416FC;
	Mon, 14 Oct 2024 08:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3705C4CEC3;
	Mon, 14 Oct 2024 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728895887;
	bh=HlYKvFyTI+h9yfs5jdeGzQdG/BYt6ViKVZgJ3ftC7yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWo5zf1RYDeR5/6QMU2aPVhosbME/qwKL2vNGtLRlYt0TWyhY9OO2Yj8/BkJGPRtB
	 va+roREyhtt6b6wVu2BtBZrfh9JDZlrP3py/H+QW0wtsEYpO7UpLNILZQkqtt/aw5i
	 zy0uV5CPQbd/3/lTW2O0808zKtA2iSSUYlZ91KXb4NcMC20exHBUlmu/Ubcuq+03+M
	 JThqHyjqMfd3gdv4pMQQ70MlmdINVIYYqEH2c3++6deAuIzupc9+Z0bFrF/5mZ0sLz
	 CLhPgGbn478N8Jb8nSiM14ZlQirTcvDY6/4Ai4WG0xbTH645eaBltR5JtgCgAG6K7T
	 lsRhCFNSFA2rg==
Date: Mon, 14 Oct 2024 09:51:22 +0100
From: Simon Horman <horms@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC v1 net-next] net: ethernet: mtk_ppe_offload: Allow
 QinQ
Message-ID: <20241014085122.GN77519@kernel.org>
References: <20241013185056.4077-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013185056.4077-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_015129_593695_9B9EDCCC 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 13, 2024 at 08:50:56PM +0200, Eric Woudstra wrote:
> mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
> double vlan tagging, but mtk_flow_offload_replace() in
> mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
> combination with pppoe and dsa tags.
> 
> This patch adds QinQ support to mtk_flow_offload_replace().
> 
> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
> of PPPoE and Q-in-Q is not allowed.
> 
> As I do not have any documentation of the ppe hardware, I do not
> know if there is any other reason to not implement Q-in-Q in
> mtk_flow_offload_replace().
> 
> Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>

Hi Eric,

I see that this patch supports up to two VLANs, both with EtherType 0x8100.
And assuming that is supported by the hardware, that seems fine to me.

But I winder if you know if this hardware supports other VLAN EtherTypes,
such as  0x88a8 which is described in 802.1ad?

...

