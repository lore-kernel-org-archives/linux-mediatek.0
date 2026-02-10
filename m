Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30014EA3F3B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL12hnKx97l4mmLUzjZArPUBq/RYNl/+tH9Khf8e7O8=; b=cIS0VZOQJLWVj8X11pWTNZo3bj
	uE50YCcIy1lauPgUbqJGwIwIaUnSt4814haADtXyToJ5f0PwwaMHRSN6DR7ph3VYqi2kX3Nic9fEb
	UGRfEcjba/BSYZ2Q2KEawZlIeetqVW79V5rQ2+qF1+yJh+E/t6V+DtQ5CZ/9IN8GpKQBaGbWh/ofF
	O3yP0WVMDAhMhLAIgfcJrEXLA4Z7aDjUrCxSyQSUmcpV4oWslQtQCpYi9fVxchEvkllD2GA2v24J9
	8uTpdaZRHpbKtzmEj7qKtoum9LBgaL3WQe9RoZgZHkAft0NXoHEl4lbmF7nQroxrTZV1C4s3mg07p
	KlkiOZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplDw-0000000Gqc4-0KGY;
	Tue, 10 Feb 2026 10:44:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplDr-0000000GqbL-1cXM;
	Tue, 10 Feb 2026 10:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770720235;
	bh=ER/8gr4RoUVdfizQ8j/kdz5+MTk5ljgSDabr+0ItIwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bqBUewrPmvCSmtOo3kaGyv3RM6NK66niKu43LqJNXrRW91XBUq0uMtojRBqVMVssx
	 0Ryc/sypCfCQhfi+6/8L+GozuMteI0VuoIMDGXQZmpeXx7VXsv8AR0N6XSYDwREGrX
	 5V1WP6hIhuCDNnfUTMbFUeye8uKKBLJz4mZNOmEe8ggvrGbpkHCtfAhdx7GZi6us5h
	 PSP3e1uErlOKptA190neVpPS2IH6OqlDA5DP56lcGAJ2UjS1dq9lu1/a8N+mx8fmmf
	 PFIYFBqfL/0tG9QA83nwL+uSDhwLgBzj/FsNpX6qHUK/nnnaP2wjNq3YNRpF+gkTgW
	 CWMuRMoFowixg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55A2B17E0E6A;
	Tue, 10 Feb 2026 11:43:55 +0100 (CET)
Message-ID: <97a40011-5a7d-403c-aca0-873c7192dc4f@collabora.com>
Date: Tue, 10 Feb 2026 11:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks
 lost during merge
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260209170149.419984-2-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260209170149.419984-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_024401_291948_D292CA8E 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 09/02/26 18:01, Luca Leonardo Scorcia ha scritto:
> The original patch that was sent to the mailing lists included the values for
> the route masks, but they got lost during merge: add back the full register
> masks where missing.
> 
> Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


