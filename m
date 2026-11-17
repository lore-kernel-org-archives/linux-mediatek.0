Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A294606A338
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HfN8oNY6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IVzG4INh;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MJtNRRFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=; b=HfN8oNY6ACCRd+
	uvOvXl2GZkvN7NHaNO5P80fcZeNk3oHq2V+MzLZIjMBgWAYgvXLrOb6061fRbLK56ew+ZUvpXTgZr
	KDXTSrSOm7rOAyHm2q55duRPGNlBCm28zl5hflgLZ8hzG/MwVVbNzKUYqiTHM7tZiL0q6fndMkix7
	Jr8iC2vgE7oRfRNQwSvoTh9OhK//zG9n0NbwTWEv1ltNnvf9nJqS9VieESPQRDVNZiiKkkzbL+oo4
	w5SU7AtRQdP8y208RKEDIhwPc3mDNaT3xEG1pQVqKxdFOJqmjte2GRvresL5ji3phAgPNlxqG0u1e
	b6YhGb4IQ162V4MbObfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNf-00000005yOp-35bo;
	Tue, 17 Nov 2026 13:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNe-00000005yMq-1Wh6
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Nov 2026 13:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=; b=IVzG4INhIz3hI/zTKr26cof5WK
	RrMQcW9hQyxBZrbFiM93K5Z2WjKlah8UMOu1mYsPnTUXeUOwl1OGKipcIA8LNLen+Fe9I+xVRmnan
	2EFLiteyrM2Eb61B1hOFwAAtcGSmDoDMRNENeuLoIm8rM3i2R5S0NgJt6qIJLl8GhSBZocefZeMos
	oOXrnllXhiLb8F7YijnrJUevJmo70S02p5wgJjuoET1d16u3li4FZqKLT+S03Ihj0vXCw4LcKnvAn
	on2UIbENRJk51EBY+Opnb6P/qsUV6WaVcRIZNs2f8nJZQAt/dW4nNJ7jTt/qWUNy5KkTfEtevfVjT
	07gMA1Kg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNb-0000000F0qI-0Kgf
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B6AB4E41575;
	Tue, 17 Nov 2026 13:37:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC3B95FC81;
	Tue, 17 Nov 2026 13:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8813C11BC0008;
	Tue, 17 Nov 2026 14:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=95IDR58HGwZG11mkyszy3LrlBW4ox835eXVGsWRIs2A=;
	b=MJtNRRFcuFTij/dHGe2SFqarmegUKRHo8XTzH4/Mfvwvu9eBL7QNbBYpTKkLJ+tCexjhOe
	Cz/twhKTJXtovEYcBZlewk+qr6u335s3XClL6Y2Widfi0iHnodn056ihqX2tSTLK9n85AE
	f3/pDeRFXrv00JdTkuAnWzaeTt4x2NDaQVkF6QUGuIxDLfdJlCjdF62lZKyZkhFP/OmDkL
	rOQj0gD4GEqvrKBz6SUW9fN+viNdWYAsLjKx11c1/0h2BwNCb7OglGZTyyrG88W91UWAV6
	blxUl9veO8xg8Bj8ukjcUpW0/w6D+dsn5vnTUwCMsj7bXNTsrVXjvaCnsXcf8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 00/12] mtd: Remove #ifdef guards for PM functions
Message-Id: <179492266246.2237190.12954805423683969784.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_133747_116746_3DB01707 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 10:37:38 +0100, Paul Cercueil wrote:
> This is the v2 of my patchset that updates the MTD core / NAND core as
> well as several drivers to get rid of the #ifdef CONFIG_PM guards.
> 
> Instead, the code that depends on PM or runtime PM will be
> garbage-collected by the compiler automatically if this config option is
> not set.
> 
> [...]

Applied to mtd/next, thanks!

[01/12] mtd: Remove #ifdef guards for PM related functions
        commit: 7fb3ea311f1da6a6ef13ed4b4dab7fe74b82f161
[02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
        commit: ab12847196fdcac7e72e46c5366036c024b0fd8f
[03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
        commit: 2a37924f5c8152c25bb485ca8419317e086a19aa
[04/12] mtd: physmap: Remove #ifdef guards around shutdown callback
        commit: a54ceff6976e239666f8f19ffbbeea50ae5ca3e0
[05/12] mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
        commit: 397d22308379b6445890811a107dc950d4fbec05
[06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
        commit: 5d1883f69df537e6ed34bba098cf49f5595dfeb6
[07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
        commit: 81f7cbdb040e768bed8db543221a214a5df2042e
[08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
        commit: 76ad0034e3013d8a03a79e6820e97e9537b769d8
[09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
        commit: 41e59826fa387b4a151cc97c2907e0d71aa6bd64
[10/12] mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
        commit: ce7455c8b2fd693cadb65078d625c7eac984ea1b
[11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
        commit: 6dbc7c326713261812531134085c7a3d23abf3be
[12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
        commit: dc88e180ed485a7c8c97e06c6f7e0ef896992290

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


