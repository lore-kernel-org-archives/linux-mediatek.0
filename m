Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D906CC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 16:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY8F16dOVGVz/HPOHeaPOgh5zFeAeHxadmKlUSBpORM=; b=L7lZPuzasHrsf89h8a8Pr3Nkic
	P164gk7fNOvy5a42WXK8nn0TQPGuaoI+hJSHgEext9msXAZR8Bn+nH26kqBUkibL9bx7OyVRAcTEO
	FcSHdcQocJnqzVHOWRCFd08QxQnY0M17kDnV7hZzGiXqM6KQXXobCgiHVnJGymlyr4TzQ9PBTNJ1Y
	fyuPMY7SV7wImWFx5A4e+giUiTgCdIEt9pt501x54kECfhnySuCohrsHZZYkfSMQ0NtumVyOMeBX5
	dcLTfe4jIoVy5KLdHHNxV3bhesX1yhFYz4RkuxaduE5SMw+l2ulcKti+QvaanM10QgDkF/aDI5qIc
	PxaTbppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrWk-000000031of-3s23;
	Thu, 09 Jul 2026 16:23:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrWk-000000031oE-0hjO;
	Thu, 09 Jul 2026 16:23:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C21E600C3;
	Thu,  9 Jul 2026 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED6B1F000E9;
	Thu,  9 Jul 2026 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783614185;
	bh=xY8F16dOVGVz/HPOHeaPOgh5zFeAeHxadmKlUSBpORM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GX/PFe17eJ6JOxK0t8hkX4Wtk2KqMkbigvXkRxAvvQa7oBFnwfaOYZM9WrZ8AmhoU
	 kZN+TkFYtBBWUthuwN2qBxxtjcW8VGeDyUYDp3p+lgnHE/Jf6U5sAuZPwHazq+YqIA
	 r296KRh9Nk9ac519CtcIUq/AaKjaJuAsmuCQixkSJJh806f6C3sHf8NPsBLx0E9vtg
	 ooCZr2W1q07Z7UJEC+VP4h5XKYx1ilPVVh5KeUcD43m2VAa1Jxxc09g0neLzRrtbgN
	 Az1eATCam5wSD5cbc+TaYI/hCkUuLromifKM2tjMdgvymguc2LPm77B8wMlubbLM88
	 JkdwlSNn2FLLQ==
Date: Thu, 9 Jul 2026 17:23:01 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: add preliminary support to
 configure tx hw QoS queue during flowtable offloading
Message-ID: <20260709162301.GS1364329@horms.kernel.org>
References: <20260703-airoha-hw-qos-queue-stub-v1-1-ef253ffdd093@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-airoha-hw-qos-queue-stub-v1-1-ef253ffdd093@kernel.org>
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

On Fri, Jul 03, 2026 at 01:02:17PM +0200, Lorenzo Bianconi wrote:
> Add the plumbing to program the AIROHA_FOE_QID field in the PPE FOE
> entry with a per-flow priority value during flowtable offload. This
> allows the hardware to steer offloaded flows to a specific QoS queue
> on the egress QDMA block for traffic forwarded between two interfaces
> via hardware acceleration, bypassing the kernel forwarding path.
> The priority parameter is currently always zero because netfilter does
> not yet provide a mechanism to pass the skb priority field to the
> flowtable offload driver. Once that support is added in the netfilter
> subsystem, the driver will be able to extract the priority from the
> flow rule and map it to the appropriate hardware queue.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


