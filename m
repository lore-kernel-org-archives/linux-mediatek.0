Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADF5ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3BRGhG9vuSYYdNc5ovNKgYhxVYSVgXzag+ifCqDFAU=; b=VrLAyn8ElUYCiS84gvC5VbhE75
	ksrX2svEY0WWHk5RxQTQaWSZvePek9FdL+aF76CES0LHSv7aimzemfgtB8JPq8nM6cN0QQp14ftF7
	zxlJKwtkinfN5Q27w/StVc2P4Qlj+Q/d6vBLWkVALd1710svivFYIL4y5Ml6mUXuzrc9korCyfkpU
	pqnexGNtSWWhm72+2PNHbl4uHf1vYYRvEP/pU+8qI1KSPHj/G8ETjidcOhJ+bksKzsMyUJgZc7TsT
	i+c91794aWh9gKyK6YrGVGL9LoFMOEEElAqqweQ/HHDcGcpU6thcfMXFvyH0kpe4asvcipo+j6v5M
	70r7rLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snczM-00000001lJ9-0FdZ;
	Mon, 09 Sep 2024 11:55:24 +0000
Received: from a7-40.smtp-out.eu-west-1.amazonses.com ([54.240.7.40])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuC-00000001k4O-389X;
	Mon, 09 Sep 2024 11:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882601;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v/IlO7buH1ErWcikn3NzRShGgbRBBdXuxB2vIRUpab0=;
	b=dB3QDbBx5LGH4dsM3OCqbEvSk0rYk6gX2e/smKUyxqPYGNrT9zD9cnDsIK2mUvhX
	ya/71CU6fOivd8YrTx2gFq4Nz3F7tixOz/6OyswOsU75MkPLLNh69354ZwwdFCq/51r
	qERMHV7gnBshX8pztSm0tlCZq9FnNTB8/706k30dfP0miUqgrniSnVM8wgi0+OIpdb6
	Gtguew29SUFdFRnWSX19BL+8PbjBEoRM9mcaDy++lIkuVFXwyPsaQFr6cBCbXU5Lxnc
	ka1CnVKlut5gyuNCsUlBZd7d4tOZeMZvvb6Y1vTeTGROfJ132OmBva48TqDBQfn5f/x
	LeTnw5By3g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882601;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=v/IlO7buH1ErWcikn3NzRShGgbRBBdXuxB2vIRUpab0=;
	b=cFvmiErLoSEDoGKVd9c1jsFG0MYbYQHMV46dqzDw/JwUrXrKrJfAsC2waEXVmpim
	lRk9mvHuq9LKucCE4qDNtD2m0jGK1bNZahxA59N9VPRsRoxz61Sg6QVpJlGv/zG9vOL
	cXyk6zIhwzopb5bfkDULjQMAUF3RU5TbFGRdrhw0=
Message-ID: <01020191d69e8e04-38cc173b-c8e2-4da3-99ba-c5598e90dea4-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:50:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ASoC: mt8365: Remove unused variables
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045004_971728_459E478F 
X-CRM114-Status: UNSURE (   4.61  )
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
> Silence compiler warnings by removing unused variables.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



