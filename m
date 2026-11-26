Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF83606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpuNk3W8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfJI8IBq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YOi4GzTgYmlG+CkzQlU/MUQSDPryjc1Ii3+0qKzW5Dw=; b=HpuNk3W8nmh1Et
	oULMxH9kkYWOo8p+xA+lzis8IuauaBIc6NRzltTMU+J5R3AOQ1TOUAQ5xwl42sgbtj4sG2015GIQ8
	DXFxpnDhUjQw0Ft94jFs9W/NJq2Etb9JKkkA9AeR8K+dL6l+gBZqQq86oMaRsMPGQPwlYD1310qYD
	P2S6d82QuqDsFJW/iIYGtkl7Krq0JyjH8HJUnYfNLF5hc1uXr9iyJBJdoRUcasO0AXk+qPEzuO/vA
	hvLy951+wp3beBdabC6GDZf0ykXA5ewBrOMamV1uR2DErlAnw6NDf9hvQ80AQw9xbo5PSFo3Ps4Wt
	fQzFs4Ew47Gwn9pZbSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9A-0000000CQjf-0yU0;
	Thu, 26 Nov 2026 08:48:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV98-0000000CQjX-2wpP
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:48:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C356C60CFA;
	Thu, 26 Nov 2026 08:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73781F000C0;
	Thu, 26 Nov 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795682881;
	bh=YOi4GzTgYmlG+CkzQlU/MUQSDPryjc1Ii3+0qKzW5Dw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FfJI8IBqSregsGEd8fZV1aPuGW74z4bW6L/u+WXgbzs24MC3b5ds+5tTwKdDVX06/
	 xVeTiCBVjTULz/y/tP7cSWGEgeZ3qY6tQCieQt4gUznP9ONkiXIw77djTHZpDGpd05
	 TzkNlcHy5RKXX/gDeD+IIy52Liuj+1E3/47sL9a4RQRIuyGCcXaiuHWw44FSTHIOuu
	 MSuNe0MmflhltbEb+33S3iQ7CWSeJyUMzFsVQsrguB7fj5uxXacdIeFuTekoLNsvjX
	 22lWwiTbO6keu2aMChR5gRJwvyQcH8N/TwM7QHHNwlP5hvVcrR2T4aiRWmXxbBsy8W
	 eqkVFmxehCgfw==
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, John Crispin <john@phrozen.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
 zhengping.zhang@airoha.com, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261124094059.3882014-6-john@phrozen.org>
References: <20261124094059.3882014-6-john@phrozen.org>
Subject: Re: (subset) [PATCH v4 5/9] dt-bindings: mfd: syscon: add
 airoha,an7589-iomux
Message-Id: <179568287744.25464.2687461126897937244.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:47:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 10:40:55 +0100, John Crispin wrote:
> The Airoha AN7589 IOMUX block holds the 4 bit mode field of each pin.
> The pin controller reaches it through the airoha,iomux phandle. Add it
> to the syscon compatibles.

Applied, thanks!

[5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
      commit: 635c680b2ea58b3bb75464f464a23eb4bacbb0fd

--
Lee Jones [李琼斯]


