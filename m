Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597F7CCD193
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ9BMNCNIgPFMKv2iCDXGEKSQENvrU6KucQliZ+WS0A=; b=Zsmm6b1N5KUrs7ovvHhkDtiUl5
	INvn39Yhf938GGuRYfGMIYKeSbd8hrfkqZT8iQI/MInx7LS5oNdhBcOSPj4dGW9NjdfSW0c7EGmut
	ipFgMn7a0eUv3ekJIpkzbejJOcnoXFcGzZyXJ4fkPmMU9vnbGfRoqs1p4Gn0JcRK68w5AZHFCgml4
	7g8CdOKqYdkWBruoOT5uqGH4KG9QKFfmwwSVmd0LIefJOi+NnT7uQSSa6ISPgR2yt6Y/hpr6ttXVu
	BABlpJW6ngnMDKprpJEQI1yS1V+beU3VFpBXSaZAVNEI+SuT2wsOMFnneX3n0NhXf6TzInNgpHmv6
	jwX6Ph2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApWc-0000000DhU7-0Cwk;
	Mon, 20 Oct 2025 13:02:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApWa-0000000DhT8-1qVA;
	Mon, 20 Oct 2025 13:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3EF261F03;
	Mon, 20 Oct 2025 13:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7463C4CEF9;
	Mon, 20 Oct 2025 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760965327;
	bh=T7/5yyd4a3f6JPR4Kstl0R7lDf618KW3dNP2+81u6wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCsP/78dKKLmRC9UoH1YTLe6PLvbBT5HrzgNxXHmceOjyFIhE1s0TYBOjQN9+jqWv
	 bYZHyeuQ1zUBwauELTqndxc6itRrzl2Td3JEIu9JzzjNArdScnyJ6iEO6t/w4oS0i5
	 FEzl52vXkPXscqI5Rwh4jDNX5eaONWUCTAgxP84HKnaP5RpDDqTVDmDxRqUePCjApi
	 bQWOuMXbWiksylMiASJB7uvjyH7Q7adFAmf7p3o7TT+SuXngajeYLHC/an81e9G1bH
	 4alHdESnJObtqpbY9PEDw2MGjO6iG4G9hMXe09jyMwpraCS9e4sHN+W4aMJrzy5bAf
	 0UwkKveQJTbWg==
Date: Mon, 20 Oct 2025 14:02:03 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove code duplication in
 airoha_regs.h
Message-ID: <aPYyy-aoTX3-Zbon@horms.kernel.org>
References: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
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

On Sat, Oct 18, 2025 at 11:21:47AM +0200, Lorenzo Bianconi wrote:
> This patch does not introduce any logical change, it just removes
> duplicated code in airoha_regs.h.
> Fix naming conventions in airoha_regs.h.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


