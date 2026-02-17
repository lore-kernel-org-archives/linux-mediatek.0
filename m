Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08CE8385B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HreOD/EKgSPjLZcSd/OwdVVaDw488JmOJnYKR6xh8pM=; b=bY/RQkDMbAu2Fi1ORnIOT3S0V/
	U5jhh/LkDD92mLv4V0SDyB0Jmyt1Oy0C0ELLoINv6GrLIv9EX8kSGeIad78zB/AOX+R5dzgwJRW8Q
	hzzim83R1i8X0cT4BqzHrTGBYxfoqk4Nnzjr5cJu+hjKlU5r1oyalYHdRMdiTrXyXq+GZ7ENdZEI2
	bAQ1iYkBx9UWSiyV82cS3gDbd89ojqbSdh0NzDAkUXVamKOpSkir/yfG26qFBKhlgOXW2bjPpi5y+
	CG4aCCfdvXkdPCi/E3rC1b2EHA4ihmUgsx1x9iUejB8mwMmz7+fMl12BxB373PhgPPX78kab4cXZ5
	0tAXFT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFpL-00000007n2k-2pKQ;
	Tue, 17 Feb 2026 07:48:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFpH-00000007n27-0juR
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 07:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 148244447B;
	Tue, 17 Feb 2026 07:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEDEC19424;
	Tue, 17 Feb 2026 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314532;
	bh=SYQPZwM9BPeO0KCiELHpwM0G8Xx03g90P7N90VDHreA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jitJvq7pLsXhnmdDqHUyEM7sK2Jg0iUAzBw/vJkaxkg0iCjwlmOX0RsZSlNYIjsDV
	 sxbcLsrxM77NprVI0X+yKTrAY3c6rSaNOE++FBgKRgjzYkoWxgn3gxIytBdbzdI+qg
	 Hag5er9O2VqGWKdWGvqLLBb0As5dJFa/TH3SqkZP3AaJAXaLnMBciXJ9bAcZrzVdtu
	 bHkLYlXO/xrHXgH9M3r1gJ93PCyt9l6zTjyoT/Aao+g5w2gqinjHxJV3WWwt1iO+Vl
	 tC5gY6QpJSy/cFFC5QOzPgP9gZeLaDqW3OZOmaj7iXhUO5vn+eizlJgsHjLgRZwmlk
	 Wdf4WaGbxECdw==
Date: Tue, 17 Feb 2026 08:48:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: net: wireless: mt76: add more PCI
 devices
Message-ID: <20260217-lavender-dove-from-tartarus-fca40c@quoll>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1771205424.git.ryder.lee@mediatek.com>
 <5022737c82052132702004ab0fdc073f5cf6df69.1771205424.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5022737c82052132702004ab0fdc073f5cf6df69.1771205424.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_234855_233607_D60E332B 
X-CRM114-Status: UNSURE (   7.47  )
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

On Mon, Feb 16, 2026 at 08:01:15AM -0800, Ryder Lee wrote:
> This adds support for mt7915/mt7916/mt7990/mt7992/mt7996 PCI devices.

No, it does not add any support. I asked you to provide rationale why
this is needed.

Also, read submitting patches finally - it is not "This adds...".


> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> v7: add missing dts mailing list and maintainers

No, you still did not bother to Cc maintainers. I gave you detailed
instruction which you just ignored.

Best regards,
Krzysztof


