Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40437D374A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB8njBibpZ3lwGtVHnrEKzBezBNJgOxEHLa51kCWRZ4=; b=JGSkTore/fYGmElLSuM4xgJ6tp
	/6Wxz47uprrLXyFWWXwRoI65iON1plHILtM+c3/c9aBol5mEqKH+2B1tT9yk7gx+k4c3+5tqvNThb
	daFWfdPUVZoszB34xoUlppTKIxHH+bKHJBDo6MnDUoVo4ucrXgKIsn7YWV5hYB51I5Dmu3ufXI5Ht
	0ODLJpifs7R8QXz8nbu+rl+mU1TH0/oAgb5poj5q7+E2Mr9+Dw4nSfR8zxjwZU7Tvx/3feclL5YEC
	VI8HWncs5VypxsRf1vANndeOderQ45FmLAchjlvjsspDs6T/bFI4IacPGWs5gbmX53D0jWpM+Nv/N
	NMh0pJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RND-0000000F5tw-0i22;
	Thu, 17 Oct 2024 14:21:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RLh-0000000F5Z6-48lK;
	Thu, 17 Oct 2024 14:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF4BE5C6182;
	Thu, 17 Oct 2024 14:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76257C4CEC3;
	Thu, 17 Oct 2024 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729174772;
	bh=p0VbdqFw+VU/YB9F9Gyq2f6BVDYOkQQx/Mgf98yLLLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5VcP6cyyo3J3Q6b7zSA5iANPRAySjwUWUJh0w2WwdvsoY1GB6AUUoRLcZWQOHja9
	 yKd6ceZr1dh2XG5EBNbzvhsBc941SPI9a+z6666/UBIDqCl5N+4ftPAgYzOJJAaY6x
	 RgOov1vDDuW6Ti3NaBQRYjUVwKWYGt3kYnqHhT9jTE4o5EvcozCORqaTcqmHByt8Li
	 ZdVabxGF+DHB5P1Ae8EQsF+zK04Ws1Ob0jKKHQJs+g3Z5XFgtYQaXRnKEQ4rvetVU+
	 eimeW1m+AsdsU3Glkr7oXsg1gyiET51ZpPsG9ov5E3bZbqbqF8EcJVcHI9Zg9/SAM5
	 t8RBjk8R0y+8Q==
Date: Thu, 17 Oct 2024 15:19:27 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mediatek-ge-soc: Fix coding
 style
Message-ID: <20241017141927.GP1697@kernel.org>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
 <20241017032213.22256-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017032213.22256-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_071934_089430_8DBA0592 
X-CRM114-Status: UNSURE (   8.75  )
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

On Thu, Oct 17, 2024 at 11:22:11AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch fixes spelling errors, re-arrange vars with
> reverse Xmas tree and remove unnecessary parens in
> mediatek-ge-soc.c.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Simon Horman <horms@kernel.org>


