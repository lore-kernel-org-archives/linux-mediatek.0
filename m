Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA554C36017
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NBuxqjmPGDHgoxqbjEm5D0trvUfPdCZnfRG9ZRHL4Y=; b=4DF7NAs5Q7TOTQshYA4QVHpulk
	soDklMamXAJukVjExWmXxABlVIVNNtkXFu1uIoKrwhOiBb1Yzd40FolyqiVfXSa70TH7D1QGF8Yc2
	wjX/ldP1G77D8VYRLnPYNtVcCXUtZbe/CTd2VqDKRQwO157XZp0MDqR37PHPs2afunUPAvZsowSfm
	5O69hzWDRiJSHWUocvPCqiSGzKSINBJzATiWxKqN6S3obMrfIqMQOPGQ178QAsjSj5Gr7JgSrto+8
	nmlV8Gjbz+SfErEQlypA7ktMmNZ6QnRrd9Ai4MxcTSJT1ZUnQbC5Kv3iqn+EWk3/nhiHwVX+U5+6O
	tScrjzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9AF-0000000H9fq-3cqx;
	Mon, 31 Mar 2025 07:02:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz99P-0000000H9Ul-2W03
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 07:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E53A61120;
	Mon, 31 Mar 2025 07:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0758C4CEE3;
	Mon, 31 Mar 2025 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404498;
	bh=I2xjJSKsxTPdXtdeGhLco5ny4M3RowmsAlXNHfIxfeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3lmq/XxMTBDfoD/eUS4Ng0hYx0E4hWnv44mT+wz3WMqq/X1oEgNhUwkLR7vAQGJ7
	 HOIzVIgosJr2vEJIUGda+zgTkAXNZwKzniTbAZgHRjuMTyIqvICXXZjoduwkZsPNOJ
	 vT9jLGAlidzhRd8H8hZL1FG90KmhbRCvGiAYZdBeWRQSss8vTCf6WLSmd9UynxkjsF
	 tqx+cftnM78UzJCOB2QOxEABNp3y6bxThx1eXPDoEx+WR571IObaBw/hBqi0JyVWPJ
	 p74xGgdlh1I+p4v4EQbLX16RF9eyCBiBY8OCHkWE2LyhfTKLAwrIsPrNtLWe+icV5S
	 9n4+9xvGGBZTA==
Date: Mon, 31 Mar 2025 09:01:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT"
 CPU Timer
Message-ID: <20250331-realistic-powerful-elk-6e2ddd@krzk-bin>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-5-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-5-cjd@cjdns.fr>
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

On Sun, Mar 30, 2025 at 05:03:00PM +0000, Caleb James DeLisle wrote:
> Add device tree bindings for the so-called high-precision timer (HPT)
> in the EcoNet EN751221 SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> HPT is a name commonly used in vendor and 3rd party out-of-tree sources.
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


