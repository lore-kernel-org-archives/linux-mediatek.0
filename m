Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE7AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuJ4/jTuy0YGXdcpOP1ROa1VeFFOypLl1ecBM6lYC+4=; b=JifIiiRquhb8gg
	gUAHuWwBDFHc6xlu/tZFI7Tk2Ehzmft2PpNnuGpjUCyJAFvyWW5vxkwxngZSK0uKm1UTSKp6LJh52
	FLE33nXZBzDBcxKxiU80xMFc9HQDoJwSbenzUympzLhDYvxXAeMyW2twi979pSnOFEN4J3dSksFSO
	ONmDZpH5AMPqiXbSMAzL/5yDcYDNfp0BXXebkqbUIgTUwRbsW42qoLf1vQqM7VfPRAIAmkQedURwJ
	wkTqpEj9dSy2Mz32GyZeAZGRztE9if1khxoOD0+/8DJ1LhhLgQMa22zgPh+akIZdS0eAiwILSShZg
	OMw1n3qTP6alCoa0jEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU75F-00991y-8D; Tue, 15 Mar 2022 13:19:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU752-0098z6-Ep; Tue, 15 Mar 2022 13:19:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1276C1F43FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647350354;
 bh=KBc4Aujoo1XQDCjrBFgZKWdDskak3aNfGrunHc/KcHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BteBlx9Save0tBUDlrZL+Dhk/GRQ/FhCA0YV7AJ81xpeUyW/s2lgLiGa0w56eF/zm
 Fhab1w7mm0Syq/1Q+S9Ug7SbhsKwGOnxG5bbaz5uqplp8SUewnXhPrN5RBowPIdipi
 Wmj+aZLoCAy7UlIgpaJrsnNSzQdLINFJQqeQ8FJKfbbVwECvqRIzN8wdkQEwjd/3FT
 5ERI6uXHaA1EizH8LhgcP9J7swA0d6cKuWglRHWYJiONRxzT/p9OeiyAjXg1EmCoHt
 FRJBxkMspgCbHtMBVu1nxChP/UP4EUzUJFYmLWGiJGQKUe9V2VSWRN0SLK9T4liAuW
 O4/ZL+7Kl3F9w==
Message-ID: <8aa94e65-0a3c-47dc-44d2-60d5dc996cf0@collabora.com>
Date: Tue, 15 Mar 2022 14:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 10/19] ASoC: mediatek: mt8186: support tdm in platform driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, robh+dt@kernel.org,
 aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-11-jiaxin.yu@mediatek.com>
 <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
 <YjCRZTu8AkYI0JVR@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YjCRZTu8AkYI0JVR@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_061916_667162_B85C7696 
X-CRM114-Status: GOOD (  12.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/03/22 14:15, Mark Brown ha scritto:
> On Mon, Mar 14, 2022 at 11:39:11AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
>>> Add mt8186 tdm dai driver.
>>>
>>> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>>> ---
>>>    sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 695 +++++++++++++++++++++
>>>    1 file changed, 695 insertions(+)
>>>    create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
>>>
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.


I'm sorry Mark, I usually do that, but this time it appears that for
some reason I forgot to delete the context on top of my reply, and ended
up deleting only the one on the bottom of it.

I'll pay more attention to that next time.
Sorry again.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
