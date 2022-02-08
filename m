Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B549CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfvVr0YNn0y1wLnuBH0ub5fZ7nDtoqtdGdmaKNxzpIc=; b=pl79pAm1jvh7Va
	IRaCFVEirc1iLpV0IWWTFmZSJIiDOLz0X8EdOjNaRXUNZQH/BCZ4veGO4WreA0rNyNuO06s9k9+ZS
	GnCJGBTFHf8igIPgGaCauiFY0zTsGJKSHIGGc5vdNsB/Lw7IihfiCQyH99hUpZW5NuMEA7L1kwyrc
	oRv73E5cc3ZBWOOpCkzpQa8tnMv+zfJCba2rNDu2oAkH1vrswGk6YMECpYRIhiFpPZQqf3dBEudGl
	/DYe/2ocT5+mppOZ9a5XXSqNimCS4Zx6WZdDademV8d8WdWVCD/4p0HMdHzPxUNWjPPXcRi8JPUJO
	/0XgLAhgumlLXBvssDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQXj-00E6Zo-PL; Tue, 08 Feb 2022 13:28:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQSe-00E4no-R7; Tue, 08 Feb 2022 13:23:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 86C721F44D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644326591;
 bh=uJUlKX/iIA11lRA+PlFkLXQAKC4sa9q+whrNfqSm8S8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xpmcrru8AC8ypC5y8KCIRjU4n+yYy2A42pD1U8MuLpxJLLxbUo3eVUzqXMhfJqXJU
 EpKVKpxWpJxgxAWZycaYWXiP6e+T+v34lLFIV35rZoAQkbCBx2VngNc2LJH5+60ns7
 LS5P4f1QVjn85hpDabzVUt5cCnU6DL4pdC4cceSqeM/mpFolOFbXFcsQfks0ABuqVc
 TQ36fuaQQgu4AU4TdoRricDCKOrslXiIlwovl3fV1py6fNxiPMtGt1+qYSvSQWHyhj
 jTV/HwbYI5nE25VQ0y3CYYAoY7L7eBNo1i71gNrO3IhHVadHTJxK+fLQTBaGcJ0URK
 AZkAL2svZe6Zg==
Message-ID: <9b74cc0b-e4ec-9152-7be2-c20d45cddb10@collabora.com>
Date: Tue, 8 Feb 2022 14:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 30/31] clk: mediatek: mt8195: Implement remove functions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-31-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220208124034.414635-31-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_052313_069715_B11780C4 
X-CRM114-Status: UNSURE (   8.86  )
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

Il 08/02/22 13:40, Chen-Yu Tsai ha scritto:
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so none of the drivers implemented remove
> functions.
> 
> Now that the library does have APIs to unregister clks, use them
> to implement remove functions for the mt8195 clk drivers.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
