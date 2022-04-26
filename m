Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83842C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEjEx4CHQvAXoQEN7Iijpc8B/iBywPrQkWhEA1opqeQ=; b=3iDqPE8F7Lwta2
	mtuHibcaDpGAZZKb7bRwoLqSrbRyBaGUGviTlitbJZ0Y4HsxS3Vv1rfIEN/ndBZAgyQ6NOqe6/LTF
	y8ccx3/BIU/AvPP5pFovzNKqAZwGJH+fLIQnF4EZ8sJ+pfdJpcCNmVY1tgOuXkH0hWv+fwGeNIdxQ
	DirguRJev71WEe6iBh6MHeMTRVwvG6oj0nTscGxbcxow2ghV8E7Lswwyyw2vmkYyb/9Wj9qPzzxKY
	dYqhyoTPfDAejEleBldHTx0rGxfg9McsyoCI38nd1IllMoLP7JULJEcBIP7ENAu1j9YBUDVAhKr32
	erJw+ZF75vLf2eA4WnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHaJ-00Ddfk-Pa; Tue, 26 Apr 2022 09:34:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHa9-00DdbO-46; Tue, 26 Apr 2022 09:34:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EDE171F42EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965642;
 bh=c5VK0IT9t3KtYKHu0hf12Xkf0OG62spu/kt30HKCIP0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=NOD8QUnpN8f4dnyEwFFFapHWGLkJSmyVAS6eVs1WyhsKCWb7nhf665ssmSMYRXK1x
 IVpHRsCL7Thle3y2akbS1ho+vnTTmI+VFm/7tQjtx4GJjJdm/ackV3wTeVyoWzMCD1
 RXyN2RDgpSCPfKnBMX/evnXyXavzgjdF0BJSiu18QWUP/k0wggn9PeJhgwTUWP7qnZ
 dVc5hnfdfai9DnF8H5Nyp3NzMg4MxxL+lPe2TG4LvTMe2XEAfKym/efAPvteVwW8E+
 Z4mKctfGadNHYDNlXEBmf7Hdr3ZYTyZo5gWJvenas+f9RV5oxVjHzbXlWBqRmbkyov
 7A1mJPs5rgdrg==
Message-ID: <d33afd78-8caa-3625-536e-0222c2f395a4@collabora.com>
Date: Tue, 26 Apr 2022 11:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 01/17] clk: mediatek: reset: Add reset.h
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-2-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023405_320963_15067FC1 
X-CRM114-Status: UNSURE (   5.44  )
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

Il 22/04/22 08:01, Rex-BC Chen ha scritto:
> Add a new file "reset.h" to place some definitions for clock reset.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
