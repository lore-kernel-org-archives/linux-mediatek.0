Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DEFECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP8fZuaOiI3v+ItamDfuFYpdbyC1ss9qsKtbBgOeokE=; b=2CI0vLXNBjx5zlZPd5VGDKDi2J
	aVVL7KVNQWbna8WJVNs2Ba5z5qtzQKNj5Om8mXh0AoPSfGVySfJodt2goW9ouekBW5jf24GgJuC4W
	4eSkF/5mWrTUsTNJyMUZFvyMMqjiLXyvWzHzMSZKPmiMhV2tcABmOX44S5eGr6JXdovYkQ1d7d5vp
	fq638XDuATQMzRO35+Tn9LVi2Of7bqVuDel2Nc8rAqUGSCcesYSnn9R6D9ZWmeGMFhnk/HUCxmblH
	SJEI9/kNDY2gdCiwQ7x+7nH9+6Z/UL4dCQdJOqzL+n0kUTpe4BN/+XkyrwoFvmH9DUqqOkrBfOT+2
	2guggxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd2H-00000001llH-3yB0;
	Mon, 09 Sep 2024 11:58:25 +0000
Received: from a7-33.smtp-out.eu-west-1.amazonses.com ([54.240.7.33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuG-00000001k6M-2aON;
	Mon, 09 Sep 2024 11:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882604;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iC5xb1PCE21Z7wSb3P7L24hbphA9tazfjRfLi+Ga2RI=;
	b=hF6rdhodKUpjwjqrGNlJq/+zbsISP2G6hO8HhBBVVBjPLlAIsYPqUG4YUCLijr1S
	ZixMbAg/CPn80DSC8oCVwIk75Evigo3zSSzLq5fWLW4pEMH4QowbLeHHvVMlYQdfQPL
	2yUpWaMnsMfQ2WV2W/CZ3cZiU9pS3xqTgcC9PZVKt9CHsRtafbEQhlMJtYkWwKzM61G
	VIR7aZZoHD5UuXd1c9MSBEIP0L+QM7EZAqvbUq8IpcoMAu9bCMN5sxz6+IjJe3ediNk
	Iw4OIEoWaJe56I8Fz4VGD59C0YPhh8y2PIWlCQbyvqaNj9ErO+xxSeAJF9ZPHSSZvN2
	hDxyE8FfWQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882604;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=iC5xb1PCE21Z7wSb3P7L24hbphA9tazfjRfLi+Ga2RI=;
	b=PSqJvddWZ7Ot+/bl75lVBuZu+RhtTNZJFa86SAqRcNDKkgsYYyIhXTi2GmqBempg
	8fBolcO5ez8Ogl45TD9c9Ebu1oq+iH9yQoYsvPEvqs9gXEyXd4ObP3D8TEpdmZYrQqm
	4nJIoghaFYZWv7q0Ms6dfgD1swNenKCrra+0Vv6s=
Message-ID: <01020191d69e9a85-63fc522f-fb6d-4379-9ee6-5165a820991f-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:50:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: mt8365: Remove spurious unsigned long casts
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045008_834225_E2A1394E 
X-CRM114-Status: UNSURE (   5.78  )
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
> The regmap APIs take unsigned ints not unsigned longs so casting their
> arguments to unsigned longs is not a good choice, the constants being
> cast here are all unsigned ints anyway.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



