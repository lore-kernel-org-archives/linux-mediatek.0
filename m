Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC1606A325
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4zLX0a4o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ejm1WQUf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvE6rq5sOnP8SXR/s3Rz5NZJQ0oCtKnvfp4hDVDsKYE=; b=4zLX0a4o3VX1Tm
	9QnDTlBvxO2REKJECKzueukOmxoHj5ffnJMpBWQHLMOPe2O8busFYHFgpfzsbQck336rlDVL1Xzts
	LN000Xnv+V3obI680LtDSBJkvBbtcLkPDX8zgQqjixMFo+hGR+o4AQSQZI3W81f4J953v5euiHnbG
	kF7P51iXmA89yLqF89RInpTMQRuG4MBcNbjmM44XL6EljyAe2ZImsRVl8vR2yJMl9UNYp6dIuRl1b
	JClMLB7jB4pJhk+mAEI88MHMdHOhKADcfvPjMSZRUkAIynxponN9LHA7P2vvBMcsWW7tBkW6rlktS
	uHf9wy9/0XS04Z8hcSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnZL-0000000AMWQ-18tN;
	Wed, 18 Nov 2026 21:51:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnZJ-0000000AMWD-0prP;
	Wed, 18 Nov 2026 21:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7895E63F23;
	Wed, 18 Nov 2026 21:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F291F000C4;
	Wed, 18 Nov 2026 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795038712;
	bh=rvE6rq5sOnP8SXR/s3Rz5NZJQ0oCtKnvfp4hDVDsKYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ejm1WQUfifQ88eirtG6eRgm1/oeom0Xu4GnaKZOojLY7DlwCPXjr29Y0/9qdAc4Lw
	 952wAsTzKJIRa8N9fnOQ024wy3lYPHLuRvf/zmJIXfCuxubCnXkG0dCc7Vh6u4+ifC
	 4s8bGNeSUT5q1GCheWyUxW2Gmj2zQx1+SVKGvXCY07TT5tuVoh9VwrV/dEcRcnFt1+
	 qOvjVQb1zEfusu7ZoSYlX9yMFK9uyJsVt8W5sB7NB8a9cANZW5Nivg9tpN2SNWgGx7
	 DvaekMK6iUV0c3p2RkHxk2VG84k1ELw9ZUqisLsC56eP60J3UjbV/AIUijfIo5oN2a
	 9vgF8rNP6/nsA==
Date: Wed, 18 Nov 2026 21:51:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roman
 Vivchar <rva333@protonmail.com>, Luca Leonardo Scorcia
 <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <20261118215144.301c2467@jic23-hlaptop>
In-Reply-To: <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
	<89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
	<60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
	<4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 11:35:20 -0600
Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> Hi Angelo,
> 
> On 11/17/26 5:02 AM, AngeloGioacchino Del Regno wrote:
> > I reiterate - I couldn't pick the series because, of course, that one 
> > depends
> > on the binding being merged, otherwise the header won't be there and 
> > the build
> > fails.
> >
> > So I can't pick the DTS until the next cycle (granted that this series 
> > lands).
> >
> > Cheers,
> > Angelo   
> 
> Thanks for the reviews, and for picking the binding and keypad patches.
> 
> The AUXADC series has already landed. Jonathan applied it to iio togreg 
> on 11-02 (the binding with the header is 8f809aa84698), and it's in 
> next-20261116, so it will be in 7.5-rc1 along with your tree.
> 
> The board only uses the header once, for MT6397_AUXADC_BAT_TEMP (1). If 
> it helps, I can send a v3 of the board patch that uses the plain channel 
> number and drops the include - it builds on your v7.4-next/dts64, with 
> only the binding warnings you mentioned until the trees meet. I would 
> then switch it to the macro after 7.5-rc1.
> 
> Just let me know if that sounds reasonable :)
That's indeed a common solution to cases where a binding header
is involved. So I'd do this - then chase with a patch next cycle
to use the define.

J
> 
> Best Regards,
> Ryan Brue
> 


