Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AEAD15D9E
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBz3NkrC82OKQpSmi69OYdhqAwX0TXP1QyvDFGOnPtE=; b=B8BGDN8q3JJmCsjE9GahQfPIMi
	x2wbSZiyXcvmkKecsD6uME81TQtwu/tdz5YgJCFsbW88wGOYQUICAMQpAagCO7hq4G1hmkrIhaOYD
	ucPGWKZ0KHmuPzaQ6vw42le802Fx8AbxZzhMtpcTrcUIxKr5i2IMWuip+qKbsbOmLwGjm8++letaX
	CSlrEp5TpDjeuytuIXwtek8UMFYZ3Ooq1Nx/GdlaQj5GIDbXRG6zViPehty+nOnSRKXPeWRSIRFfL
	WQHK2AIj0UUaRyHbIgWRqcIK+GTMrpuufu5dezMWDHQvyftdn2aNjmuNipwYFE8UBWY6LdMpT2+7y
	18b6SDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tT7-00000007d5g-12t7;
	Mon, 21 Oct 2024 14:33:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tBu-00000007aLO-4AV7;
	Mon, 21 Oct 2024 14:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UBz3NkrC82OKQpSmi69OYdhqAwX0TXP1QyvDFGOnPtE=; b=KG9ptv1j+KyIkEAiLaGg8hBcbr
	7Kekmetg6DP+0lFJ7ZG+wVmarWrgWX20tMfS8bmchHI5AfTWfC6pAtdDrpsBwzNRQqkwoFyEmm8Fs
	8oUpR532UJOMOObmRy0SL5PuVNSqc12ElmkOXqPgqSLtHLS96tL/znUBJ98i/mPxFOM3SVC4Vv28/
	EMlVX7F4LdUbCW8QUJ4EbcTUFUlZmEzpVvbufkJbV2ySwK3rg4wlgr6iXiTEz/1ADKvhwk+TRtRgj
	D2Tsel1iriVNNfdZAw8MA3ixi81etI4kVSoEIKQFnEydElF/1VPwcOrgUupDQEdh3eRtLd3yffncU
	Cw/SfCmw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tBs-00000007yYa-00hy;
	Mon, 21 Oct 2024 14:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729520122;
	bh=pHf5twCTnnJnfQtRd2qMSTYSiWrNRBO3RQNcXpO/2E0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KPx6R/4PiHZUyF7n8wGcXnnV2x85EriAD8S+BM+eA3Q4CEj3onekWZW1AsjtP5noN
	 pxUPRFt+wCQLXNA2i+WeW/9SIagFaP3ndf8iT0vd/aSpDIF0NYuxtRAgR93uFkkodf
	 d4tXFpx2LgQdkgFj57sDL2n4gWkAOuz8/s9ntrcUP75aFtTPcyLOZnKS6hwR4dQ6zK
	 9FA6C4UVa56+Yvb5GwxvociS6wpdhAYvGiwjddSepI6MjuNDGc2IlfINu99q6yRhuv
	 QYxEcWPtjsNSGjdry4zSWKkUxsjcyaRG1Gmgk17v8DzPuUi7gFEpJp4SSUlwa69fbV
	 tZrXtgT7kK5Ow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6D7517E3621;
	Mon, 21 Oct 2024 16:15:21 +0200 (CEST)
Message-ID: <b403ea3c-6a03-43fd-a9fb-daee6e1c425c@collabora.com>
Date: Mon, 21 Oct 2024 16:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Fix GPU supply
 coupling max-spread
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241021140537.3049232-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241021140537.3049232-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_151524_356596_CD8D4FA0 
X-CRM114-Status: UNSURE (   7.58  )
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

Il 21/10/24 16:05, Chen-Yu Tsai ha scritto:
> The GPU SRAM supply is supposed to be always at least 0.1V higher than
> the GPU supply. However when the DT was upstreamed, the spread was
> incorrectly set to 0.01V.
> 
> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



