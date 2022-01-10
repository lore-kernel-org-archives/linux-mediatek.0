Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5693EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcvmgIxAfm77ZCCOjTKL+ZzQMqzNrYkx0oHGKntdk5M=; b=XT2rySB84nVzMp8GLQDwJSaYM5
	Gc2Qn+CVn/1aWxVx92iDB3M6nLcZWtOCO8lyOoH9sv7CQk32wHJ/XQDeYmTF2Mr7CJb9/Jb3bcTDn
	JiOME2yaV/TlFCQxELWhhazl7GmSisQh7NZQaLaVBBM97ZXvBashm/B4JdPKUBcWglCiIWtUYqJqX
	uKaqGhlq/lqwt5T8azWDMLFMCssI0jBCEHJOCjZsx40atMjAzRD25XUi8LeQRozOn6t6uqOYJZaH3
	AhFlvm7u3mU0aW/jhxgpG5gLA7pTAg3lpAhgk1DfCShzOFKFs+1gl39afyfoxs3jNzN1CAcr5QAmS
	jwZ4Lpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6x0J-00CC7U-Eb; Mon, 10 Jan 2022 15:54:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wwf-00C9eW-M4; Mon, 10 Jan 2022 15:50:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D037D1F43326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829852;
 bh=wR16xay4clvUBA/3f26Kgxsmj370GLNzt5+k3MOOQxM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SVghEG/V39naq/7hZY+Uh2KslIPINLj/HLXmKPUPKicbjY5/BBBcdVQlTfjavoNfA
 +Y8bNkXd8KxN+vZRLN4omf/xEAAXJzahzHnaz4MNXVL4rvq2cldfr8bG6eVg4T5blW
 bpoOb0TiEuBh390QCo91wibiIo6ZNVvIj2iwUhAk7C6yHzAbnkoHAK8qL1TdPhOKLW
 6Z14ptPWWqlZQmDL39k5Weuzn+No2RWNrB5jQHVnhBy70pEOxGLoWbXl34gOwYpJQM
 jTsArLlji83IuZjOhy+Ca8vrzVrtBYbsIb2I+z2GyiuAPeD8e0zVPQbzHaQNJ97Qql
 ZHyUO8DRcqlwA==
Subject: Re: [v1 05/16] clk: mediatek: Add MT8186 infrastructure clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-6-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <993b0a1b-c78f-2a50-a9e8-fc4ba639b25c@collabora.com>
Date: Mon, 10 Jan 2022 16:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-6-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075053_902458_3ADC030E 
X-CRM114-Status: UNSURE (   9.11  )
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
> Add MT8186 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
