Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA0EC77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM8NBb2coBJF2GqQ8RcwtfKaTsDoZEMiql19jU2Efmw=; b=pATiMNtUQ4l6FlazQp3ZJxG1XT
	vqvFT6RJYiMhq/BtrzA3J8gdwCgYmFlp6SfD+zXe1mjj9IKvIybUJ7gbRHOwNvgCDW2zv4Hma8Wso
	K7zuhwKsXNUNFbPeRtzXFOPMBAySt4sQDRK7HBl7PdEjwugbP1NAtyE0AVHFCo2K9nM92GxyfpCia
	JvnFT8tZxgIWCLIerX+lhQBsqlOGLgQj7HSyeidM47MBDFzbGiqXRNqXNIyhK8b+96s6/scapivCO
	NYgUjohEOSlSvwydxD64KW/k9DWbln8KJMwUqRwVza8L6XCwWV2eNi0Sqm5fHXQJSZxcfxYFN4UOB
	Aoxf/wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVz9-00CXCx-1Q;
	Fri, 12 May 2023 16:51:15 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVz5-00CXA8-0E;
	Fri, 12 May 2023 16:51:13 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0A01D1C0ABB; Fri, 12 May 2023 18:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1683910264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XM8NBb2coBJF2GqQ8RcwtfKaTsDoZEMiql19jU2Efmw=;
	b=FFVOOe2KbUsF14ijfQM5zGuMlcXbAHuV9ubM3mcFtnsRs9KlzaPRkypol93Ch8an60Do2x
	ttgQ0xh863bm6ta0Z3qhmaj8Hq8Gx3d0CDiduyTB7EAfTNVlOMDWx9o2E76g/fqIbFbzE7
	jCwgbenqj5EI6Fsvi5/1MiksMClco/I=
Date: Fri, 12 May 2023 18:51:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 1/7] docs: geniezone: Introduce GenieZone hypervisor
Message-ID: <ZF5ud9CedwBnWXBN@localhost>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
 <20230428103622.18291-2-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-2-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_095111_274617_DF05C8AF 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi!

> GenieZone is MediaTek proprietary hypervisor solution, and it is running
> in EL2 stand alone as a type-I hypervisor. It is a pure EL2
> implementation which implies it does not rely any specific host VM, and
> this behavior improves GenieZone's security as it limits its interface.

> +++ b/Documentation/virt/geniezone/introduction.rst
> @@ -0,0 +1,34 @@

> +Platform Virtualization
> +=======================
> +We leverages arm64's timer virtualization and gic virtualization for timer and
> +interrupts controller.

'interrupt'.

> +Device Virtualizaton
> +====================
> +We adopts VMM's virtio devices emulations by passing io trap to
> VMM, and virtio

'adopt', 'device emulation'

> +is a well-known and widely used virtual device implementation.
> +

Plus, I'd expect documentation to be more detailed or have pointer
where
to learn more.

BR,							Pavel

-- 

