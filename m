Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B12C369A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1kiSZOLYIHWw6RdQQCnXcIDoAV7JJ0NqfT+DCBxsTw=; b=REKGhXvpSRyrbqNc0fjPy5go95
	AJjj4S2bPp1S6W0aNLnuhRtbLC3x58GOl2EFrvTb0MTkNOj+oJ9D/uK4wX1yE/2WIQKUhKGc//+uj
	Ry1NmDWQBuvFrkxscYBfhKWPub4g7AxcJRZZgIQ7wkZ6r3PNvK6sTUCvcV9H5WVgQiJBsJYQxnq9q
	Kroj+HwjWIj4U2ZiA1xd4KbYgpesul85z8h+7q6DsHSlrneueSeVx39Zx9DUd3Cm/2OfuRqliYHoc
	SGhxo0oxO0uF7RxUsCPXYpH492+wmhDIOlwp67n+R768JT+AEjZaHJ44/nf1t3SjmtKHEvhTFSXhy
	ttHs3k+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rut-0000000Aev2-2MBm;
	Thu, 10 Apr 2025 13:26:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rtK-0000000Aed6-3wD1
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Apr 2025 13:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FD16A4A883;
	Thu, 10 Apr 2025 13:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A75C4CEDD;
	Thu, 10 Apr 2025 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291465;
	bh=fsAH6LIiImPAPbyKKk7XSOO9VefF0AOCuyKv4uSZq84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgcHGlsxHhvm9Z/hP7OrpMcByLEtQRFdUPmJYKIgXZE1WFVTxUxUI3JVIAfK8Ct1S
	 7+eLhDaKGgdxXy5odn/jRF47jtWcHV5jHKmFypoI2H6jVkNntUXlF+Bk2/GqaSQcO5
	 GzhMskBxc0ii8v71srJgGg7NRD1W1WqpgTeIqeMXZvETm6QYcqL50Bi5Df0I1UuYkG
	 UcI7TCGrdQ1tMqLlaYe06N3ZCk+qaTzPzr2SEWfaYaDNk+j+vmxiGiFm0mIseYu7Ha
	 wxzQufLlhlm6REoYg/O8S3PdkeNl/g8GU747RhZdY02hOJLRVS8rldzzioUpqFq7vs
	 AWlfdPvjEsXBA==
Date: Thu, 10 Apr 2025 08:24:24 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Message-ID: <20250410132424.GA3707300-robh@kernel.org>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_062427_043997_F5762DD7 
X-CRM114-Status: UNSURE (   7.42  )
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

Applied since there's a user already applied.

Rob


