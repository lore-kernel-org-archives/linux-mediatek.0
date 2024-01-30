Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35724C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZwzJwk/ZVqpwHHO2cbL9FX+b4lQQCc0FnrhH1HtUt0=; b=HbJMtd9ivSzzHmU4zpO6MfU6Y4
	GTcPfVb8KnsIjDe2aKzc65+fep64TUfIDLff4OaE3T35QGfYi0udS/GuUdV9dbcfeIN4sTGQylm5f
	RIuD/B+qhUfXst9dn15sjGrrbrHLQFbXAxs3Ih3QTBFewulhvS1g0IoKg56u0rR82wYo6H9rQifo/
	hguCnJ8gBaTenMYOWG63WiBgO7j/5SBvQ3eqe5Qo+cRB9u9E9/lCeNV+D68n9+KGW+p4XT3jTJp2e
	/bbdtFOH1Pm9eAZBuWOi0Xcqq3ovIw5R1Ww6VdHjcJ59LU4vOb9bDNwmnL2SjoMzhg86A0TC8jupW
	1II31FoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm6H-0000000GNw3-3kSI;
	Tue, 30 Jan 2024 11:16:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm5f-0000000GNlH-2l72;
	Tue, 30 Jan 2024 11:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706613342;
	bh=Ui52xWIkaVO5Fw8DIIJWouNt7gfaHvstMTUCljysJvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NzQ1dUL2rQjqP+79snNYiqWVKdtyNEFWLMDGzz9G/EZUFJvOx7LrS9Kp7XPNJh4EE
	 O0MFSK2IJJ8LtV6g/iiXIweBWy4JJOat51ncsA5kZuWglBbPeobxMZqBZl+750NPSs
	 vT5l12neAtKQmmXZtx4MVyXaIlvFecZR3DC7aCQgrn+FUytn0n4Bhw44n7iHvZO3Us
	 7pBUeUgJcA+aA/qMcFb4S0BhUjfdN48/PRFdpTtAG/kJ/V14DXpr1q6FuS89x6wmy0
	 0yTYgJenvj3GoPaSK9CUttxehr9RXkCgWCv31JEZ3wES7qzQ4ocqjR0/T5UWZ018wX
	 UxHPj6SJAJwEQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB8393780FC7;
	Tue, 30 Jan 2024 11:15:41 +0000 (UTC)
Message-ID: <3eb512ec-1c50-48ab-93f1-6c783b5e6e48@collabora.com>
Date: Tue, 30 Jan 2024 12:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: Drop NVMEM device name
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 William-tw Lin <william-tw.lin@mediatek.com>
References: <20240130095656.3712469-1-wenst@chromium.org>
 <20240130095656.3712469-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240130095656.3712469-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_031544_338703_E8804C7B 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 30/01/24 10:56, Chen-Yu Tsai ha scritto:
> The MT8183 has not one but two efuse devices. The static name and ID
> causes the second efuse device to fail to probe, due to duplicate sysfs
> entries.
> 
> With the rework of the mtk-socinfo driver, lookup by name is no longer
> necessary. The custom name can simply be dropped.
> 
> Fixes: 4e6102d60d88 ("nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



