Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62714606A330
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f3dV9o6V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYklXe4m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jUC4xU7GLR0lUXcG/Ph02CbwZeP2anHiOEbdvE2QjrA=; b=f3dV9o6VZY8LRJmrxi+ZFux+C2
	2SlQ/pLU6A1jGYM+Xi75hAo7+ovc0NOcTeB3oiky+9MLC1KAtKR6wHeTeOwD3ZFDkBjWAI+yux3Jh
	knKfrVO7PLfDH7i1Oqo7ncaj6AvUZnyYxG3DpOP4XS5gLT0jYd50Tt9b9Sj3OXCbGbs2ze2qhp5YJ
	MExbAUgV+i+O5L4AdTz2c33jtFLJKO2db0R0pfXMeZ76K4uDpIaZrh/gmi0CQWAG/3axZcdx2qjek
	HGXGMkqQtzApVG88MraQcf8IejF4VGmUSultm++kGK6d6Y5VFSowvQZBwvuI4nStNgqal/OH8ZMXC
	aZFO2OKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPGn-00000000miR-3iYu;
	Mon, 09 Nov 2026 13:18:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPGj-00000000mga-2yjW;
	Mon, 09 Nov 2026 13:18:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3018645910;
	Mon,  9 Nov 2026 13:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF181F00902;
	Mon,  9 Nov 2026 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230321;
	bh=jUC4xU7GLR0lUXcG/Ph02CbwZeP2anHiOEbdvE2QjrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYklXe4mVOfsiajj3ZoFaH+Sk9ouDYm+pIn3jGwOoeCGkbzMmapayrKEU/jak9aXb
	 uWbEMYARQkUurWIWglMagalspD48xDoTs5n1fdUHdThPwtg8Fd14y446Ylvlj91AUq
	 bAmZILJ3BZpZzyyXAoNwK2jtf3ZBx31aQqG5ItqXKfKkn9MZKFN8420C/HXlmMMDsp
	 QgMLslwwkTcQ6tNOW0eMMRJREp6NodtCEhld+0HzGwgdKqhsxhsh7co9B1EELmsvvM
	 SllX1yAAStNBNauGO7PGwgv+FyFHWkXTfqsWd7v3A6KYCp9HnsyPKSsANMETpJqr3Z
	 JbGF0iMzGpQtQ==
Date: Mon, 9 Nov 2026 14:18:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Message-ID: <20261109-nonchalant-stereotyped-goose-1bf3ac@quoll>
References: <20261105143647.2727937-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105143647.2727937-1-robh@kernel.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 08:36:47AM -0600, Rob Herring (Arm) wrote:
> Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
> to DT schema") dropped support for MT6765, but missed removing the
> include.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/power/mt6765-power.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 include/dt-bindings/power/mt6765-power.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


