Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A7606A332
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SnGnn70d;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLZbEpUR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bB115A0rMOTqlvXkN/AIzQNgK8qZfXA7IorSb9CX7io=; b=SnGnn70dgghmWdlez6VNS0iLWq
	I0jvN0I6WAnJ38rTL6OnRxlCFoJG5+GVw0RS13pOIwRXqGcgNIFFrBytMapZ+W+k8BgrM/GFTCUz3
	aXuAeY24dAIGsPqvzWodKhA/BZrSDINYqlLk3TMJX9nz2h/pWK1hliqXepSda2GBjnqqb8IiTYC82
	vHFc9FsPzv2zAWW3lLlX/fEFCzkF6Ht2lzl9YPv6HnToaqK7VnCGu0GqxP9skfDLyafUEICxYmMtG
	ddBA5NXLMWhg+qUp7RVTvsubvVwiSv0/P1laQc8XmmZXeJvqlvNcH2AKhHtjx5EEuB8yirVrLILOL
	PUMoiHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyQK-00000009GLz-1DQd;
	Thu, 05 Nov 2026 14:26:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyQI-00000009GLm-495r;
	Thu, 05 Nov 2026 14:26:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84AED41A2D;
	Thu,  5 Nov 2026 14:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141081F000C1;
	Thu,  5 Nov 2026 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888798;
	bh=bB115A0rMOTqlvXkN/AIzQNgK8qZfXA7IorSb9CX7io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kLZbEpUR7tlo+ZWC3OftlZigeROV+G/S2MWiAUwnAhPdaCJM4iLo5A1awAhxavhsK
	 ODjt8ZKDP88satnWbUD6GyJ4WG7eLo0fcKsRBdewiQXCYKDQoZBgmWtygUXii0VkeL
	 ShvkzBiNtiL8sf6hl04MO5SbTW7/GJVdVyI1b/pui/+wRkbFAza9ODH+jrtyPohyka
	 dbCoChO6ac7g5lWxqnMOdWvoT2FaIXl2YzLeZYbMMwkKpAJW7TTjS4qMR9oAGRctuP
	 EXSy3J89Bl1d90+lV7gUPTfQ2Zb65/zQZiFuc8RLOnMhxIu49FPToTDTH59SakH3pB
	 t2ru7Bf2Hxzuw==
Date: Thu, 5 Nov 2026 14:26:34 +0000
From: Simon Horman <horms@kernel.org>
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: ethernet: mtk_eth_soc: add 9K jumbo
 frame
Message-ID: <20261105142634.GT865646@horms.kernel.org>
References: <patch-4f863a941889f0bceca1c082f2d79624@loljews.com>
 <patch-f1b04513b0fe3fb0a35ac744799fb0f3@loljews.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <patch-f1b04513b0fe3fb0a35ac744799fb0f3@loljews.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:48:45AM +0200, Sandeep Haemoon wrote:
> The driver caps max_mtu at 2030 bytes and programs the MAC max-rx field
> for at most 2048-byte frames, so MTU > 2K is rejected and 9K jumbo
> frames are not usable on the 10G XGMII MACs.
> 
> Add a MTK_NETSYS_RX_9K capability for MT7988 and:
> - advertise 9K max_mtu on XGMII MACs, derived from the DT phy_mode at
>   probe time so DSA can raise the conduit MTU before the netdev is
>   opened;
> - program XMAC_RX_CFG2 on the XGMII MACs;
> - derive the shared RX buffer length from the largest MTU and size the
>   RX rings from it;
> - program the PDMA RX SDL max frame so the DMA engine accepts jumbo
>   frames;
> - reject a runtime MTU change that would need a different ring buffer
>   size while DMA is running; the rings are sized at the next open.
> 
> This is a forward-port of the MediaTek downstream jumbo series:
> Mason Chang's "change default rx buffer length", "add 9k jumbo frame
> support" and "add dynamic rx buffer adjustment support" (MediaTek
> OpenWrt feed 999-eth-30/31/33, carried in
> frank-w/BPI-Router-Linux 92bfdbdd4de1/b4c6cb1d5532/ca4c976dce22),
> plus Frank Wunderlich's "try to fix crash the right way"
> (a3207a383794).
> 
> Link: https://github.com/frank-w/BPI-Router-Linux/commit/b4c6cb1d5532
> Link: https://github.com/mediatek/mtk-openwrt-feeds
> Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>

Reviewed-by: Simon Horman <horms@kernel.org>


