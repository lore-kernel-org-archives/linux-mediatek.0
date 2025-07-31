Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0EAC87FCC
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlM0dB8yb47JDk4czdoq1u0oRL4Jkv/Jn+2f+Y6ruiI=; b=bRn9zn6cg1eHZjA89tZ5PKHLeY
	ojBJ6/REMWTWyBX3VdFbzCpjq6DbEEWq9k0KuiBWzi0Y+BjmBVp9KYUotao87ogun/mfv5WEqEZJI
	oqIViZXpltTP0f1vSQyMQRooAX9fDs789WJ4Yy9EzrFP2Mw/NTjdGxFXYOTPW54KvUK7TOzkJj1I1
	ZetF3/cUYxbPMR7MYElydUWhgFLinb5ngS13J9b5Lmsj+E6L9pF2RhnqYVuJpGfbM9u+kx0hcGpZM
	DR4K8Actoi2+Lg4zdPNvBtXk21IseAn/+2nGBsWT0bJUJtZ9AJ6/wRnIYY5YjP9ao/SwefTLoCGiI
	W6DA56tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhV0n-00000003w9v-1435;
	Thu, 31 Jul 2025 15:16:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUeQ-00000003tHz-3Qob;
	Thu, 31 Jul 2025 14:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hlM0dB8yb47JDk4czdoq1u0oRL4Jkv/Jn+2f+Y6ruiI=; b=Bzp5E1cU/nr0wPC2eMkkv5w8Sp
	pgz5XPolNMm5xooZ2YagM0JIlWVkbxXJ6bdY1xu3FN22RZH53VozQ4nB0kCxj9tjZvpRdfN05eVE/
	j/crKIMf+C0ifBYL56xkO7phRQpy7FvfeHoXcfLP215J8zi4GDZJhqkEEnaJkLLn/Gww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uhUeH-003NdM-BO; Thu, 31 Jul 2025 16:52:49 +0200
Date: Thu, 31 Jul 2025 16:52:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: npu: Add missing MODULE_FIRMWARE macros
Message-ID: <1ef51e54-9ad1-4e98-aaba-63d493e22959@lunn.ch>
References: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_075258_852697_D42199E7 
X-CRM114-Status: UNSURE (   6.30  )
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

On Thu, Jul 31, 2025 at 12:25:21PM +0200, Lorenzo Bianconi wrote:
> Introduce missing MODULE_FIRMWARE definitions for firmware autoload.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

If this is for net it needs a Fixes: tag.

    Andrew

---
pw-bot: cr

