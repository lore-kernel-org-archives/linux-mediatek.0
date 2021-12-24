Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB90BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzLvilIKz+tp+3lKaG2Y+44BHM6WtoINxTa3DHY4+b0=; b=b2Gd6u0PBXORLGOkqxeeM52iO3
	XWQmk8yA+IED/vcsb1BkmuTASfci+X9t/60FTB+8Z76+9EzyRgjtHJcED91fllFH0p2H9BYZ3S3d/
	SHYFwWIjHH5Nvi1NQ91uF61cISkOannJT9MZAYsC1dTe/7wokxinH1LehAHfvAZZC4lSK1tT6CHa4
	AsIZ/XO1e5ZZath2Iz7kTbCHX6NIv1FBwvTaIgquBcwu7+SFV1BeQ9grkokIGBWdNtIbnYCGlHPK5
	E6bE6reT/YIwII9YMQ6haIb3kk2lSzpWWiwHq57kp0af8UF6lrx07cyq2YzUgzRw2QGpgADgxNTqn
	mn34LjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gqg-00E0Fh-PG; Fri, 24 Dec 2021 09:26:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gqV-00E0E6-Me; Fri, 24 Dec 2021 09:26:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5E3BD1F45CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640337998;
 bh=BXFgTWFlZLjIHyV2DG0s0M4PU98Sx4Sf7sp7gLh0MFw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S1m8ancCIzOmDMa2zl87l8CaPUrf1LsHEu80kWFB8Nlc0ith1YyzcQW33xYJjaBjO
 +83NE8Vqkm9jaEyAdq0Pw9n7gCkvaFStnytcn0N4oW8fkak8aTqeBn/77r9az2CgOT
 LOEn+rZhzlMT3uun2w91W7KgR3jhOJzi+eC+Oh76u5iWFM7uysoVPulb74ofqAg7DI
 AbdSz8ytJpUZ8feeSAIwUS8z74ZKzpNpKHprVfeRnAtEJlMD9HsUNv2UQXKV3HkFxS
 rnVn41qoxvi56CFgv0nbdmjprWII4RO3LoIv15QoojTYQ03+UgcL6z0ngZ4cc1CYtv
 usMerIPt59oYQ==
Subject: Re: [PATCH v7 4/4] arm64: dts: Add mediatek SoC mt8195 and evaluation
 board
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org,
 linus.walleij@linaro.org, matthias.bgg@gmail.com, broonie@kernel.org
Cc: bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-5-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <18a3ee82-c295-ead6-3fef-6ca3afa81d71@collabora.com>
Date: Fri, 24 Dec 2021 10:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211220121825.6446-5-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_012639_917158_22FEFE2E 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 20/12/21 13:18, Tinghan Shen ha scritto:
> Add basic chip support for mediatek mt8195.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
