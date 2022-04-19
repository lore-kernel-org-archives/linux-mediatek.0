Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AB8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3enr6v8PB66wS+OXT79ri8xmzaHEJSgGx+8cUe7aTs=; b=dfTyQ+E8U3BpXC
	FcV7e5K4K0IqDmmaTtBxaN0FaRSJSD+rbbzmzCkD+cHG1BTcDT5k2AUmp2CEzZUHOljeXGVNnWarV
	qbZlyMh0z0tXyquCsH/vIHKSzrYdDZXIg3yDfH18C3vjFaZcB+btbCgOsy4zoV4YkoQ3A7bf88CKX
	T4msoub6AxRKLS8A5g9mSB0zcgfLbB1oczKb15nM/JOsp9WOkhnd2nz0p11EEYLmvqNW1FO6xuHej
	47DQqkNfm07aD8dLZO0/d7EbDtQnHyFu6Ul02JRJTxtIABcnLkSqpVutTGt5VksaDeLLaSotZzNC5
	tDZ3U5jNs85Go815YIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpue-004iXV-CR; Tue, 19 Apr 2022 15:37:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngpSt-004Wis-2c; Tue, 19 Apr 2022 15:08:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AC9801F4267B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650380899;
 bh=wE87yBeheg5nImXJNHE8hDnX7SEP4mrWfxluB9Rr99Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iAOE9Sv0da11Nw5ZlOwrnD+04YO8d9pRVEOtAeTuuCzELSb0e7r/+3sVXylYRdLNQ
 2YbLQXFNhKthcsABt5iOFOH1mk+ZXJZAwIjWnWJs41gl6KEW2zt11XwvpnCSeqSdb4
 lz7nKBrFFdFl5zTztschsp8IA7iYk+v7jynLoRJYRdDxiDbMbXoK+u7MqAux3e4T1p
 VpAEml7dKCrm4ljeWeXPvYHHZq/cE/Mqo3kxN5m4EXoFNbSmB8soa7F+L76TUbdpEW
 6/PyKOYJq4yZVcSd4tK9Npksy0IzurV1FRNS0ibppcHt6wvZXZQ7eUOHQbv+fFAMka
 lb1JTfaq6WZ4Q==
Message-ID: <3591fcc1-d34a-b40a-4e78-edcf9d2ddf08@collabora.com>
Date: Tue, 19 Apr 2022 17:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419081246.2546159-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_080827_271970_7A2AC2CC 
X-CRM114-Status: GOOD (  15.46  )
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

Il 19/04/22 10:12, Chen-Yu Tsai ha scritto:
> Hi everyone,
> 
> This is part 2 of my proposed MediaTek clk driver cleanup work [1].
> 

..snip..

> 
> The next phase of the cleanup/improvement shall be to introduce some
> variant of `struct clk_parent_data` to describe clk relationships
> efficiently.
> 
> Please have a look.
> 

Hello Chen-Yu,

I am grateful to see this series, as the MediaTek clock drivers are getting
a bit old, despite new platforms being implemented practically as we speak.

With this, you surely get that I completely agree with the proposed cleanup
and modernization of the entire MediaTek clocks infrastructure, but I think
that introducing a `struct clk_parent_data` for these drivers is, at this
point, a must, that not only fully justifies these patches, but also "makes
the point" - as the effect of that would be a performance improvement as we
would *at least* avoid lots of clk_cpy_name() in case of parent_hws, or in
case or parent_data where no .fw_name is provided (which would be the case
for most of the clocks).

That said, my advice would be to add that conversion to declaring clocks
with .hw.init.parent_data and/or .hw.init.parent_hws to this series as to
really make it complete.

Of course, if you have concerns about old platforms that you cannot test,
or for which this kind of conversion would require a huge amount of effort,
then I would go for converting as many as possible as a first step and then
leave the others for later.

I would envision MT8183, 8186, 8192, 8195 to be a good amount of first
candidates for this great effort.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
