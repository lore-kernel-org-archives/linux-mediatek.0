Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BB8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:32:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA7964E74
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA7964E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BE4aFNPOJbMZSNvlg/pgWS4hVUbkTxKVtLSzltGSC1I=; b=e1cSPCi9P6LjjP1mZYwe3OYYr
	XCyVaVV7rF8j1/knfDYFHvaCly7jB3svg1Q9PAX6fFhcK2uDTRZSNRv2FAF5/Z/Su5tZfvdmJvB1p
	pZelPuoinSrypjw60dRGu04SB+xS51JRY+Ctdmv6Bl2S+jtoF0utsxEX62W2fIwBiheSPt9mEMLA0
	B010zNJ3BMVY9h1s77GgwMAKLQxeVvHqtWcRgAorBhqcymXu1K+blpsL3e0VrZmbIfMqV3+chFvZo
	y15+zD6kNxdIDX5Pvs5kbVUJoM2jJ2J8wkUwRfZVw7t2UvqcZEx2iHbUXKIec7QXjOvFUPv4xGVuM
	OQ/A4CTrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUQ0-005cIH-A7; Wed, 03 Mar 2021 16:32:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSps-005E3o-3y; Wed, 03 Mar 2021 14:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+KmZjACaUPJ6kiY989vScCjdnmLXWqOFz5WCke8mN6k=; b=Go6LJjw6WjCNtAmDC1+zQI+HUU
 GKLjS3SLxmwlK7SULyRa78nPd2rb7sm8fmhLdcURUIlS27FTbFSFUf2MR+p6C2tnn8hgEU16swKyV
 wjX81414ExDamTJqAm6AHHeFjVtft9au/9IID+igcnIhRVjppzMujTUaEnCOuhYLNJT6e6WZ5CcUv
 oRe6+ytuAadiiKlR5mP8zgXh8Kx9Aou5o1a+9N9ilfoWZd9fLfRo+GdV9dlGlHpd8uFYcX/CdcXeA
 nhpMnQNEfeIZKAKu4cCKiCCZppDJ39jq/YFN4f5unLkMlQv1p7IGt78J/kn8kAWiCmTCx2ArsyN0g
 V4t3PUfg==;
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHN8i-001t7b-IU; Wed, 03 Mar 2021 08:45:53 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lHN87-0000Ec-Hg; Wed, 03 Mar 2021 19:45:16 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 03 Mar 2021 19:45:15 +1100
Date: Wed, 3 Mar 2021 19:45:15 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Vic Wu <vic.wu@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mediatek - remove obsolete documentation
Message-ID: <20210303084515.GA8036@gondor.apana.org.au>
References: <20210303080923.16761-1-vic.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303080923.16761-1-vic.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_084553_205413_EBCF9A94 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 03, 2021 at 04:09:23PM +0800, Vic Wu wrote:
> The crypto mediatek driver has been replaced by the inside-secure driver now.
> Remove DT bindings documentation and update crypto engine nodes to the mt7623.dtsi files.
> 
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/crypto/mediatek-crypto.txt       | 25 -------------------
>  arch/arm/boot/dts/mt7623.dtsi                 |  8 +++---
>  2 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt

Shouldn't this go through Matthias Brugger <matthias.bgg@gmail.com>?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
