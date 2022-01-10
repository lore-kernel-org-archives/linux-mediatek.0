Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEEDC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU14WOVyqfjeEr9zJkwUICkxCMU1rEAostFu6eNmjFM=; b=F7/WCq/NYzqMcaldYlVHAdBG6A
	emZQNvDCrGWzaIJXfVw8sEIpRbG1XCfH54nGL3GYcSsAhaNM2QqM7YJmt+fjOIWEi/wvvgyhhHqeR
	WGsJMgz3Tv9YEDUp2miCnBlAP9MuwlZzjdhr+4V66SPrTmCS9xpPvJrW62M56U9yRX44ytF2LqX4u
	B9Uq8UBefAzwtEyco8iPmF2/G/Zs0ueAzK7hwyG8R0c79E+C3GH1D04PT6auWnokDpwKT7MyIkg+i
	+1lL2EaquIvb/X/uvIJ8TaWqZ/uFfCkDd+iZvdpaLs2q5Q9rhsm8y/5Y0Nxs8L3SMi653SzBZFiDw
	S0Jc5KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wvi-00C8wm-Ml; Mon, 10 Jan 2022 15:49:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvI-00C8lY-FF; Mon, 10 Jan 2022 15:49:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C2B1A1F431E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829767;
 bh=VXCtvDvQUrLbupuCpkEPMiaoUXD5PXNvPYcJ0sTKWMQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VzF3op+mS7S1PxY9MnT9wVBOOosYJHX6QZ2LABXXZcr/ZIFsMzT7YpgbqcO7fin1v
 pJXkdh8q08GWVmXifKJJmQmU2tFzbAQQPFoJ4mIgAvGA8EzELdDOUKOdLlJmzPba2C
 uct0AYnJVClzBOURJqN2748/2gwp26UfG4E5GF3MWV/ieJhX5SxRVQPRE76EDJs4EA
 iGBUO6FOjzDvQsNgzQrvBrLZVb7GpKVQQb+7in1zluHdZY1DYzLXiqHiF9ZZu1F2V4
 ocdGGG6II4BnuSTAyKoFig3YPE2hoH8WbaNqCWcKuHL+eIZk0lHdGJg6qtVnlnio1L
 z5L2MWx0oNa1Q==
Subject: Re: [v1 15/16] clk: mediatek: Add MT8186 mdpsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-16-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <da97ff55-afb4-4912-5346-76c7426a64d9@collabora.com>
Date: Mon, 10 Jan 2022 16:49:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-16-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074928_676021_11DEE5D2 
X-CRM114-Status: UNSURE (   8.16  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 mdpsys clock controller which provides clock gate
> control in Multimedia Data Path.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
