Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FBFCF34AD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68oBchVazUqGqyY2Z8eJZWRwz66HAh5TXgTFi/d1SVc=; b=NCAuuAtj/szL5pUofKElo+5rTW
	7t5MFEnZqy418ZPHY70LBuEjYa3n6f1RI63jOcDemDaILagYuie5iEypgbaJV2DAJlTok8Y9it8xL
	q1pjRCdDLcxmhirZiAdASfphoNqrFCcBWpZv1irNtQ1B7vgxtTFPDgclPoRO7as8NF4De0FZmnaJs
	ZhPtmCG3+3tYLg1B3GPvqys5X9cNtHHwfTrWQgsUAz04G3sGfxHIK0GsE9wUBRfEMV1JEIONJWjeA
	7DkD3qBuyoZ0vs/W3pcqQz0eWw6dn+jF2V0TzPh093jG4by/NapipivGQiIvmWKTnc6fsOeZzX70T
	SpDtLuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swLyz-00000009DRY-222o;
	Thu, 03 Oct 2024 13:35:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swLwo-00000009Csx-0wTw;
	Thu, 03 Oct 2024 13:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D0305C5CAF;
	Thu,  3 Oct 2024 13:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D074C4CEE5;
	Thu,  3 Oct 2024 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727962369;
	bh=FnTp2W0cXmJ0iD9IERZ29oSVrpqc6zM9mw1FTTcKnwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5PajwNivVsaK4hPcBjgxnYoz2Su3NkG0BVUIIo5oFoqQVirm4mDHmhRJDjM3A/d8
	 E/erglJCzMN8kUkgOp4x/eJhj8M3hlPMxjEPmA25/Tgrem1cIU/RK3og5lVieO0yDd
	 Ht0lPelTWAXNoiLuutajTvrZhXTWtaTPkOu2joMZJ1MqG8wZkwXjwNL6hyQDkD5FL8
	 63vEjf4ep358pkmxnE7RcNjsQmhLYmdDrz8iyaaz9kTa68M8zEyruSf0ey8mIw+ZGb
	 g0yzObkSrMB7Th/7N94VulbIpnOzgznYYcXH2WAOe2Kd/AYPZyQkFIi2qx+xgijF/z
	 LSVY8897Go6Dw==
Date: Thu, 3 Oct 2024 14:32:43 +0100
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
	upstream@airoha.com
Subject: Re: [PATCH net-next v2 2/2] net: airoha: fix PSE memory
 configuration in airoha_fe_pse_ports_init()
Message-ID: <20241003133243.GN1310185@kernel.org>
References: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
 <20241001-airoha-eth-pse-fix-v2-2-9a56cdffd074@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-airoha-eth-pse-fix-v2-2-9a56cdffd074@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_063250_328899_EAFFF8D9 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, Oct 01, 2024 at 12:10:25PM +0200, Lorenzo Bianconi wrote:
> Align PSE memory configuration to vendor SDK. In particular, increase
> initial value of PSE reserved memory in airoha_fe_pse_ports_init()
> routine by the value used for the second Packet Processor Engine (PPE2)
> and do not overwrite the default value.
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
> for EN7581 SoC")
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


