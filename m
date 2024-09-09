Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2253ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/6JJiImqLpaxD0Mp9l9TFHwFJ15FAgxB3/F7i0hVKM=; b=FsoI4oIvnYGv4Ciw+iO/0AcpCg
	9zwd3oWw7jrcT49UjDjqNlBFJA8IWCrNI1eS1U+B0LYOIgpTsdjIxtBK4RKl0RhFu53Ycig/zs9e7
	yXQp2QU+7qJzuatfyjvquenFaOM11trCJ4myZcD4W7ZZXUBfyGx/TF1HyWyCtH9kV3y011f5f5bjM
	jHqDZY+zad/GDE1SQWndpxj7N2mfWZto848VBFYAUy3QcpcxrpIF8KKZOa1W3YO1yqH9au2IljP0W
	BkS4n41hOrzR6h3IS1YKVVEJI6Sp9NSC1QheMx8OO68OQvK6NknlFPK9ULgA7glSrBBmsrv7aIpaF
	axNHnREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncyO-00000001l8M-0lsP;
	Mon, 09 Sep 2024 11:54:24 +0000
Received: from a7-45.smtp-out.eu-west-1.amazonses.com ([54.240.7.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuB-00000001k3h-0XMq;
	Mon, 09 Sep 2024 11:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882599;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r9QUF7QVMFgab3Q833wJ2VFjeAU7H8m4qLqgty3INyQ=;
	b=AkeXvqepN74am8AJZosrAgPH+V8h4jex9dhY7iO3eM2lNEuG5dQnS9C8t++0Y1TY
	hLYaHK+jn+uRiE/ncAZC2Gv+7dEsIItjYvMDqk2C06RA/vskTqXp43Xx3pOb6s6fT59
	XCVXn4vmEkajzsxVfcJr7GtYnV8wAJzTvjR6NXKC/oRehF1hTO1/TIBG4I4OuRGVmRH
	NLXHq4v/T3QbBs7jP2D7g/CIIpF8SsqH9S0Y8jxhPUfpWP5M8DjfvN3TAtPW62hT6jh
	j5FcWX+Xct/p0VzlnYy1FzjtPpJ1dSO2QAMiDthGoz7dFQ1SjaF9NmmvCpGMXQFjd+A
	6PnS6ieYmg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882599;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=r9QUF7QVMFgab3Q833wJ2VFjeAU7H8m4qLqgty3INyQ=;
	b=gzpwkHDSf7Plm/VuBK/eCISzJ3ZbtBm0zawPlojZsaj8InPhJQhGLVYvmYijn2DF
	Drfw2t0+MPIy6eDP9V8ShUclDRBKyemQ8+c6RBxDD2FEocmfkST0Eeur7ZIlxJcy9Cn
	Vma6ZUKDWJsaCBiA27aSE5ZWpnoqqsEwDKus3IeA=
Message-ID: <01020191d69e8733-e5caff8d-c8ad-4cda-b8bb-ae7368a8dd9a-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:49:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: mt8365: Allow build coverage
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-7-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-7-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.45
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045003_344168_A1A0D96B 
X-CRM114-Status: UNSURE (   5.04  )
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

Il 07/09/24 02:53, Mark Brown ha scritto:
> There is no build time dependency on anything specific to ARCH_MEDIATEK so
> enable COMPILE_TEST builds.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


