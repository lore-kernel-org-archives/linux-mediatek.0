Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5639FEE645B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCgmWO74L8/F9SHjoP6bpWQX1OaQMU752ttVjsl4fKQ=; b=jJiS1/8ZbWHjR4dhWn2tFChSUc
	xC3OXxfZrRsIv2MIzRfOzQ6Lt04V4P4aWCCS8Z1ASWGox7Au6mjFNdQdqOWVnFCP0MtMm41scXn5Z
	sWlJWqgoPsy/G0GW9K4BjvXbqtQ1Wqrb/j1wPFYsOdeKVIgB2aqo6yNKaWUlzabT8y1GigrOcF74D
	bS5dknvUPt2OhbZdlYWa4uhq2PovmYbGYqzZkA/MT4wPDQeReigwGXUpv1Y9FQqh9maPZ7MVSxEm5
	OxTv6ANvvh0M4GvTrLBcB+8eqzpqcelE1VmY7jcM+EYM2etv+GYVYS0ThDwNTJ6KtETzI8MmnSyiZ
	huHaigpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeeT-0000000CGD0-3YCG;
	Thu, 12 Sep 2024 07:54:05 +0000
Received: from a7-45.smtp-out.eu-west-1.amazonses.com ([54.240.7.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeeR-0000000CGCA-40aN;
	Thu, 12 Sep 2024 07:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726127640;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pogyvsxw4IYYoxXgtC4BvI/p9pjJQOo8Pjtgwx2Z4U8=;
	b=PMu5AuMghOGx5tX6Bc6Nuri7xEnLG2vCW8ooVCbXi+DMvYmhKE908t+7jit+cgIR
	Zlkf+yBI9ZYHcdu2EKHC/QW3a/3cfCyynZ+ilf6w8EiYZ9IUMLHyMtbt8KZCuKGnImE
	ep5WsCPbD85es53zoXsQNJ9KWzp9YZUQ+6A8dIjf319RZ9D+juvLRN/Mlw6ugiOJ6Lv
	Khm7huPPYGZpsr04uO/5dVs9DUPaN7m+Jnb7COF7srtRBEr/CJOTDNkjB3RLEiRXqBW
	e70JShRRLoI/eFzjnjvdDpRc2H2rMuJmQToeHepCQIgQtl+ucDBaNB2qNVksU/YKOjC
	1rRtyuEb8g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726127640;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=pogyvsxw4IYYoxXgtC4BvI/p9pjJQOo8Pjtgwx2Z4U8=;
	b=JfCd1ndadNBFwZXAaf71Mu7FWesOQd3NqJjZaub8NK/yMLm0GPv0KfoBoRWIJt2b
	f8sXHEbqfGDqWFJM+bElLpdLOzXnj65HRlMMV11qA4wnejkHHepXejfCOGIufNUdb5A
	pAIVmuaOkZwEHDPG8Vhjju1m1QHDASocMy1nyD4E=
Message-ID: <01020191e5398d69-e1c1cbbf-1617-4df9-bbff-2e728d8e04b2-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 07:53:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoc: mediatek: mt8365: Remove unneeded assignment
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Nicolas Belin <nbelin@baylibre.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240911123629.125686-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911123629.125686-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.45
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_005404_173534_F0E031E8 
X-CRM114-Status: UNSURE (   8.00  )
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

Il 11/09/24 14:36, Muhammad Usama Anjum ha scritto:
> The ret is being assigned, but not being used. Remove the assignment.
> One of the reviewer mentioned that dev_warn should be replaced with
> dev_info. Make this change as well.
> 
> Fixes: 1bf6dbd75f76 ("ASoc: mediatek: mt8365: Add a specific soundcard for EVK")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



