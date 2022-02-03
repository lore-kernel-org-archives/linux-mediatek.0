Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7396AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUD6AhhZrI/QwJJ64hE6KCBPiYBx8qGUcpn8JXzJLds=; b=HV/D12II3DH2Ys
	KR57An08p1pIx3cAFFnPftxWqK9c0wIApOw/G08nj5p1b/PZrFRlZV+1hoAMUJYfoNMu/Wsfl8xgu
	47y1pWP0OrPNn9zC2Fbw8uXznaJ5rCVP4gfuRagnuTIS1amBOzHGDxyPcm6RREJEklxVyJ52NpnIS
	qUC2BFQEiTTY7pDtwsNl5f9LlbmSHXLwQNx5pQzd2QV4B4f18ek0m7iae2RXDTJWZTPE0b540LbYN
	j+pgqtgLEwo6W4hdtF7+UHMJiMZUPVsWsplJLNLzLFZ5RumucuY08jsxj23kk6ow+/CozY9D1UupN
	LuWZn8sZ5prF5Xjazn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdtH-001nq9-CV; Thu, 03 Feb 2022 15:19:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdt4-001nlJ-78; Thu, 03 Feb 2022 15:19:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 308241F45DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901545;
 bh=fLoPv0+RiVmvVfeppxoTLboNJ5Eskh8vvQVvN5nnJR0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KRVIbEfFUKJJdKx9V5+0wGDSbA0fv0PEFKVp+6C3qiVO2kSkS7N2AesEajTENzr+M
 i9k3o+t29Ac7/0Nlv0tWwbWgjHBg+rkcXeFWTgw7hdS6TXrpcwuNJlt1qw95HQpetO
 Rr+y8UXWOIcBq9KEPLIjo9x6taMd4HBe9uAbCuluZJiX/VeMpzin0exBFqvmHd2juv
 jsKLeA8AwtALLmfaB6KHNL5UmvoxTBCGmqQIQTAo9jJstpTHfuSf+NnQQqKHZf07bn
 O73C61N5yEkq7kjlytno74GKt7q0rg+EAZKKJmr2RE9MV0Q+bXyKNthV/HhZhzqspk
 EiaorkfIsWMbw==
Message-ID: <abf785dd-c1d8-b433-f280-3c42043e4684@collabora.com>
Date: Thu, 3 Feb 2022 16:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11, PATCH 12/19] interconnect: mediatek: Add interconnect
 provider driver
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao
 <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-13-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-13-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_071906_420373_C484F037 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/08/21 10:58, Dawei Chien ha scritto:
> From: Henry Chen <henryc.chen@mediatek.com>
> 
> Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
> using the interconnect framework.
> 
>               ICC provider         ICC Nodes
>                                ----          ----
>               ---------       |CPU |   |--- |VPU |
>      -----   |         |-----  ----    |     ----
>     |DRAM |--|DRAM     |       ----    |     ----
>     |     |--|scheduler|----- |GPU |   |--- |DISP|
>     |     |--|(EMI)    |       ----    |     ----
>     |     |--|         |       -----   |     ----
>      -----   |         |----- |MMSYS|--|--- |VDEC|
>               ---------        -----   |     ----
>                 /|\                    |     ----
>                  |change DRAM freq     |--- |VENC|
>               ----------               |     ----
>              |  DVFSR   |              |
>              |          |              |     ----
>               ----------               |--- |IMG |
>                                        |     ----
>                                        |     ----
>                                        |--- |CAM |
>                                              ----
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>

This patch deserves my Reviewed-by tag, but I cannot release that if the
driver is not properly signed-off.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
