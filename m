Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79B4C36017
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZhP2bhihjy1UcViuC1meHYYR5gkj1FDswpoums2k94=; b=MCpCzFsT7qmFGulTYVMSXJXggC
	gA83WTNi+r/+/N0ADRs5lufBapv8q5ZpvJ98kwuk+PLdylayLVRUFilaMeB2/YGl8d0Ul6i/ZJfqn
	o+NyDX14X644Qrs7nwd1mCwhX/0f+ipnYmZRHMkp16Y18OT/0vGWBIN0k/ANmOmtD62QlX0B0s2gu
	X4D8sDrONkekfz7F7Ktd4CsCV5zG94MZbFfbu6Ia+PehYI6XLz2ucFDeBCjm68F438VtNYhP9GBu2
	Y87LuXPblpT5zsoyPjc2NrRGf9aWttf4fv+3I6H4OYIJF/h0mWd3uKvGbP3Vq/njPgLeHm0aLZGBw
	3uz6K73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz98N-0000000H9M0-2kX3;
	Mon, 31 Mar 2025 07:00:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz98K-0000000H9Ld-3m9P
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 07:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A97C5C5677;
	Mon, 31 Mar 2025 06:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B5EC4CEE3;
	Mon, 31 Mar 2025 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404431;
	bh=lqdUoYLMGq1XxPIIR92iaihAlvsbsEW+dCwoaJlT6Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt+aet+BtMYPfw7P4TJiXyryenyyf2bC8TMGmVnacwrfINrpAtmF5pbk4/xxI3ltn
	 Pc3TUNtyIQrlHRytKp/UeBmhP3vUnBExGF+aJ3oQWEgOBLEahwbpOlaRZYC8eAbTE1
	 BRmBiBueXxYSGnLR5Fst4uSa/POS62toKac1LtXNPw4UZczqAsLZ0JI2TIaNR5c/GT
	 zWJajYp1eTkO5jzUyq8wVnLyAKS8FxvTHZl3j8WTZtMNiUe+YBktbgAkt/HeSRbBK1
	 2/rQmjZHUrEYkWy7GAp8NBnMzeu3g1tF07rEkVN+FMSMrfXiXNehZS0r8YguYroU4k
	 K7+az8Chbjyjw==
Date: Mon, 31 Mar 2025 09:00:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Message-ID: <20250331-spiritual-beige-lion-b82c82@krzk-bin>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000032_983699_39F92DD9 
X-CRM114-Status: UNSURE (   7.37  )
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

On Sun, Mar 30, 2025 at 05:02:57PM +0000, Caleb James DeLisle wrote:
> Add the "econet" vendor prefix for SoC maker
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


