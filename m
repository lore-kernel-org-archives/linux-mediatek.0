Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D0EE0AC4
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Feb 2026 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKqjonDTKpzXAxqGS1N01cJVhFCgih20KfCZFq93Q6Q=; b=PxFy5MszDrPI8QlqYE5beYMuVo
	ygCDILba+Xp59/bG0cSIfr5aoReYp3FZ/vh6gUCS2sX11d81gYPs4g/wGXiO6RshKy5VnaTaOrG3Q
	tFgwIqr9MUe1UehmFsFHivSfJ/Etq1YRgY8YpBfOMZ2dY3FhoarfnAdrYiioCGCJX9fw0dgxhXidO
	7Sz6uetTJt9iDgY0fkcbYPFvZHuwk5rIewaaXa9nskwSjQg7AeYPKsUFUDS754GDmafCiHRkVD1OV
	GAuSSq3xGknpX+4ZlYvTfQM9ZjoyrV5OqgF6dyLP46KPflh+PRKJZ6ApRSkAkpARxQPGDV3CivWG9
	7gZVb9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofuP-0000000CMQI-0JQC;
	Sat, 07 Feb 2026 10:51:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofuM-0000000CMPn-2V8F;
	Sat, 07 Feb 2026 10:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4D6842A5E;
	Sat,  7 Feb 2026 10:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1835BC116D0;
	Sat,  7 Feb 2026 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461481;
	bh=7COmJBYpWmIF+5G8iwqi9ALnilsYuZL0dPcrXEBiApI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMdpeVeG2KfNHqGHHL3EZdIsvT6oUuqLWyD/NGEud31NGYw43m8gl0v2l00aasrQW
	 dNluG2PF6XlhU04zbLO+cX2Zq60WYPUP0lFvs+XC9zES5KwdUf8JAMA6GDY1SPXoeR
	 X34w4ceosX7mkJRZ9SisEZvxUJlg5z9CwfCKaXRlEnOGiN3mSMlGrpB11pvudbbedB
	 qGE3CkYzQJrDPKxwos3fUa4eUnlo95WsZANikd5Bnk6SPQkMOKy+xHhNm1V5gUR3kB
	 r3EGcmmMWbHw3LJVph5pTWNqqpTALgW+xsTXbV5dNOOQ7pK2/3Vve9KPbpLmF5hJSq
	 lG7uo1P6H2eLQ==
Date: Sat, 7 Feb 2026 11:51:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Message-ID: <20260207-tricky-strange-swan-6f11b0@quoll>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_025122_682842_4B58E337 
X-CRM114-Status: GOOD (  12.36  )
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

On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
> Document the Mediatek mt8516-syscfg.

Which is what? What is syscfg block?

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index e57add2bacd3..a67699f1faee 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -91,6 +91,7 @@ select:
>            - mediatek,mt8135-pctl-b-syscfg
>            - mediatek,mt8173-pctl-a-syscfg
>            - mediatek,mt8365-syscfg
> +          - mediatek,mt8516-syscfg

Why aren't you placing it with all others mediatek,mt8516 syscons?

Why this is so generically called "syscfg", completely not looking like
a real name from datasheet unlike the others in this device.

You have entire commit msg to explain that.

Best regards,
Krzysztof


