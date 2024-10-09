Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091ACEDD93
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hruurSJN2mfdVKlGiR8ubpSb5LXCuHjrR1Kc6bk2YA0=; b=MayI/dOBSQQftKYrgcldJ9sm3D
	Nx26t9Ueo+DQEgCmmI0u8zSYVDOt1XTlJ5fUplxY0oDYiCThbSOKfQfHagmkz5FjFZTOzb3b3g3I0
	GIkmbWsl0L4Wg12LgmhMbNvvJBvq23w0gwbdGurmQ9wmUJDVLrxSKbBoc4eD4dAvDqsQ4N2StZMGx
	RA/NVsw+VGLfAFRzkTA/GGSsWKlnc445wHLJPWL0AqX1o2npYT3on1MBohC8wtT63m8vk5jrdKEYN
	VlxB2bin/ndNlwf8fTbfi8mIxRSzKbjaaVAwqgsol+4PCddJvK6/yI+UKdJtK0NerNvcNGSI+L3hT
	BFIjDiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWlM-00000009PYW-09kO;
	Wed, 09 Oct 2024 13:30:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWjy-00000009PBs-2Q0E;
	Wed, 09 Oct 2024 13:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93A625C5ED2;
	Wed,  9 Oct 2024 13:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8EDC4CECD;
	Wed,  9 Oct 2024 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480513;
	bh=zuTNloecuz4Aml5QxqPlnKQzhdF4g8PBn34VarakOWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYrVwBK+gJ/X6Y/1CRmIB97c2pMua2YcJnRmouRexAroAbxHIvEeNRA2mha7vlehh
	 +dZqQ3dko55SAn3imPf8QjIG4lW1Qbdwb7h4VFU3c+2w93o+3pn6OW6+r/r38W6fQk
	 X0X1YWQ4L3iUU33eBesbRP00EXyUy21ZgfQsofnLbW0l0v9fCNzGIqNTRxc05RTXKn
	 5yamYhFWxXmnNaHjvv9eAbum29sAP0oXOtdrDyBnVRa2mL37r+FeKsSzRs18Fk7YqT
	 sxq3/Wza7f59OWtls0iXtWTr13KwxUV00u83ytMz4Jqen1lnJu6tMrLvbpAt8TwbJ/
	 2s7WSaJ+XimUA==
Date: Wed, 9 Oct 2024 14:28:28 +0100
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
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v2] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
Message-ID: <20241009132828.GZ99782@kernel.org>
References: <20241009-airoha-fixes-v2-1-18af63ec19bf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-airoha-fixes-v2-1-18af63ec19bf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_062834_681628_5D80E86E 
X-CRM114-Status: GOOD (  10.07  )
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

On Wed, Oct 09, 2024 at 12:21:47AM +0200, Lorenzo Bianconi wrote:
> Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus in not
> introducing any user visible problem since, even if we are setting
> EGRESS_RATE_METER_EN_MASK bit in REG_EGRESS_RATE_METER_CFG register,
> egress QoS metering is not supported yet since we are missing some other
> hw configurations (e.g token bucket rate, token bucket size).
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
> for EN7581 SoC")
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - improve commit log
> - Link to v1: https://lore.kernel.org/r/20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>


