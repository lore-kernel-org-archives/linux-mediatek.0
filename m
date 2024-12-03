Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F4D4979A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1fZsgNlkr4reN03cYniZ34NrL8EnpcDS1NBWycfI0c=; b=PtGm/sRT5Kcbi/5AGUluMgrzls
	tGqs20vB9yqbqofh1HXO3Zfd0jC3Ta/sQXCQPSS1Gq2stPDwifNoVgLkYxZ1rIccMBnPHC2xuw0US
	+jONU6h6BoNnY013aYJnXH4B03nh1HCUk+kYWlHFHyYr5h8r5cpxK0sVQHpaEhaNryVAtwv1l1Jm0
	cNNM/50vEwc4RWXsdO+EkbhaN64JQ/11GL194SEOYghz9PiXtfI/p4ROFSCjn+95fhtlI0lUTTzLA
	ITegq1TGz7MDBpvHSWqvtCwNzVyglzMSZ/PhUuZXQyjGjRGmBTtmh9JqE70wOGFhFRW3oHeiEp7m0
	yFcvh6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOzS-00000008pi4-1C49;
	Tue, 03 Dec 2024 09:14:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOwI-00000008oyJ-2cWc
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 09:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733217085;
	bh=dpObWXpZ7p2t1DkUkX1XSldL6Hubf+emdmqzZJsu1lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mGEs87q1wVNvZKeqVer2Da0vnX/ygXCpdkPWthXdXpyjpfytoXtbESuhX+pUtH8T6
	 lAatLMX5wmHyTSIi76i3WIBKZqPd9X56yf8shM3wqEuw+pt02BSmzeWzwgjaSh0LLy
	 qstAg8enqn58xXhKyu11gvB/GJzAcMEbFysg+anU9gdFMSyqw3XYQ5PB4kmDm+k0s8
	 6KnYPsMz29u5kqSJf1O54ebzGZQ+/vc8HQFhtG6S3WRmTHwiOUDn49nnp6wDBBLrh2
	 4ASRv8LHLkzhQ94bjthjR7EBWCl7J9fhvuxpaqutN661sRHqZ+RWSd+w+PwnYE6R9i
	 1J4UCQlxCEQRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C343517E35CB;
	Tue,  3 Dec 2024 10:11:24 +0100 (CET)
Message-ID: <b1f2944d-5c11-4842-a2b0-02044ebece98@collabora.com>
Date: Tue, 3 Dec 2024 10:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 1/2] Revert "arm64: dts: mediatek: mt8195-cherry: Mark
 USB 3.0 on xhci1 as disabled"
To: Chen-Yu Tsai <wenst@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Koichiro Den <koichiro.den@canonical.com>
References: <20241202081552.156183-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202081552.156183-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011126_806917_4E22CAB4 
X-CRM114-Status: UNSURE (   7.46  )
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

Il 02/12/24 09:15, Chen-Yu Tsai ha scritto:
> This reverts commit 090386dbedbc2f099c44a0136eb8eb8713930072.
> 
> The hunk was applied to the wrong device node when the commit was
> backported to the 6.6 stable branch.
> 
> Revert it to re-do the backport correctly.
> 
> Reported-by: Koichiro Den <koichiro.den@canonical.com>
> Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
> Fixes: 090386dbedbc ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



