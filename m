Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280A8CCD199
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trkNRBj5Jg9tq6k/FywQKGAvLZ9HzEqrgeq1wjUUjrE=; b=0+C4f77qdc5UbXBjVKGv0/COh4
	7dNrquH3zLC592FnsBrjfA1nSvDkkWC+mRzGvB2CJjqbn77F+wH8rctp66b/kIxanw30P8187l23k
	5N3AtdqXzJGb/iXZ4G4wyuotaK4tHuSjXy3lalQrLKT7IQTX256mWFcbIVB5ZH560X/abjrvMrMPM
	IORVbGzql8sfNzCD5qLMkSctP9/zWmkcxatoBAVZLn72uXjtfbKyYRz2CvEuh2IQ46B+bTz9REVOC
	t5j/JzFvQen6cFWKTKQoMSzAK0S+Or7vQHObJKsMabhjUfon25dxQlFvLCCPuupDREbpS+gHzWt2x
	iKkzKWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QOq-00000005JiT-1aAq;
	Thu, 16 Oct 2025 16:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QOn-00000005Jhd-0ePI;
	Thu, 16 Oct 2025 16:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DF906403D;
	Thu, 16 Oct 2025 16:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BD5C4CEF1;
	Thu, 16 Oct 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630416;
	bh=NuqUOPCKexSPVN6pyx9qmVQ4zuprW6Q0ZQJ3dbKvATs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1OZNxhAC/VFy5c2v7Clp9XcpcWIZEQoDmeu8dfrVkzFV81Ty+TppXZ7CBIMZt6Oq
	 yCpaRt4YuBqED+M9qz7KOHUM3GdjmowtScYZWMePVmuNGzbyb1BS3Z1cmyNfrbWt50
	 mfEMqlKqaI6Ovopzjf6FngMC9/jwJyrSXDsEgOhEZnaMdRkliP+2S0BPnmSlFX9QMH
	 bByZBmnkIrkpZ6M9zAEOpzPxFHf6PwYexqX/tN/PfYeQoCgqON5r2/HPeBID30HghQ
	 VCKVdLtDaOUQS8BJFOdpDSX/o8jfvRK5oMYoklNCSyIWFZdZ8sRfupt8h42ITDpGVZ
	 67TV4890pnI/w==
Date: Thu, 16 Oct 2025 17:00:11 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 11/13] net: airoha: Refactor src port
 configuration in airhoha_set_gdm2_loopback
Message-ID: <aPEWiwy_ebWLDnNa@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-11-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-11-ea6e7e9acbdb@kernel.org>
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

On Thu, Oct 16, 2025 at 12:28:25PM +0200, Lorenzo Bianconi wrote:
> AN7583 chipset relies on different definitions for source-port
> identifier used for hw offloading. In order to support hw offloading
> in AN7583 controller, refactor src port configuration in
> airhoha_set_gdm2_loopback routine and introduce get_src_port_id
> callback.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


