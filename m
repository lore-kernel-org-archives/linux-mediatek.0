Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE779C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E4961AE3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E4961AE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1FVSyfXUnObjGZKGSaljT0xpT2lz25SPx603/QpKSY=; b=LlnCtyErushLoV
	OuhT03uVIRViN5O3KF8hoy4BdSN37fASazNc63ml4t2HS4PfIAZQ4vbwPmoPMRTEin4wtk4VzWJlI
	5IcvxAMWlId4hjEFEpqrYOarBRpyzVDO2S0lAzjjjcXjH8aC74jOgeekdKswEanT+SPrprGnTjFmk
	YaVmlM9O3BNiK+JEl/EZv/14napD061kwoaz9AByA69xs00U/Tvp+zav3AAotj/dvJGMyy23nT/vc
	57s5J9LDm5+ydhHd8s37pU6z897IPDxz1+ublYT9p+bWOKIeaxlr7Z9Z/iSpQkbyAmWTT4dkyzeJd
	rWyA+zR0N4CqCNqWVdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvRm-0017sJ-KQ; Tue, 16 Nov 2021 10:12:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvRR-0017la-8v; Tue, 16 Nov 2021 10:11:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E57A26187F;
 Tue, 16 Nov 2021 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637057512;
 bh=PfADZY/p3JqYuaRUK9dg8fuh6I4K/kUrlJWAr+qv9Aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzoIyIpbNKLj45yhnUIxQT2nm1rj7G63vFjn/W1rcuCXPXR91ceS3WOOdM2blZVe5
 EeQ2+WUsSad0OOiNb7h43HaxImiPfbDX1soAaTueFchYf4N2dQ6xz5Gp6G8qatxVrY
 KMSPYlMQnwLQ698UZx9Ju9Ggd/3fM7yMHsJHaotWUu931jsyxYIeQTFV9L9Cf1BEL8
 xvOF/tSk2ske5ompc4AqcP7k70MmAreeKGYiY9t2Er6ZbLtZlJgExFINM//M4EcrbM
 l/I1pJy7aXzY8QhIDbN6vhZnmz4NgyqVMSAcGuJlgzKFN2KZ/BWlqBNCgaf0W4BPBw
 9+f+BdqmT+txQ==
Date: Tue, 16 Nov 2021 10:11:47 +0000
From: Will Deacon <will@kernel.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com,
 james.hsu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mark.rutland@arm.com
Subject: Re: [PATCH] arm64: update compiler option for PAC
Message-ID: <20211116101147.GB9851@willie-the-truck>
References: <20211115031810.29701-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115031810.29701-1-Kuan-Ying.Lee@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_021153_362231_AC6132F9 
X-CRM114-Status: GOOD (  19.36  )
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

On Mon, Nov 15, 2021 at 11:18:08AM +0800, Kuan-Ying Lee wrote:
> We pass -mbranch-protection=pac-ret+leaf to support PAC
> when we use GCC 9 or later.
> 
> Before GCC 9, we pass -msign-return-address=all to support
> PAC.
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>  Documentation/arm64/pointer-authentication.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arm64/pointer-authentication.rst
> index f127666ea3a8..055d08b0d42d 100644
> --- a/Documentation/arm64/pointer-authentication.rst
> +++ b/Documentation/arm64/pointer-authentication.rst
> @@ -54,8 +54,10 @@ virtual address size configured by the kernel. For example, with a
>  virtual address size of 48, the PAC is 7 bits wide.
>  
>  Recent versions of GCC can compile code with APIAKey-based return
> -address protection when passed the -msign-return-address option. This
> -uses instructions in the HINT space (unless -march=armv8.3-a or higher
> +address protection when passed compiler option as following.
> +Pass -msign-return-address when we use GCC 7, 8.
> +Pass -mbranch-protection when we use GCC 9 or later.
> +This uses instructions in the HINT space (unless -march=armv8.3-a or higher
>  is also passed), and such code can run on systems without the pointer
>  authentication extension.

I think I'd be more inclined to delete this paragraph altogether. It doesn't
really document anything to do with the kernel, and trying to document the
behaviour of "recent" versions of GCC is futile.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
