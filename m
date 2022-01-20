Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A960C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIk1Ix7Pr/nytVDbxDtZTrvNY7+tuPozqI8Yz6tBp2o=; b=cD8LTZWwv8usCR
	P5J2VOmkyS95A2FS4PHQliTFDkg+9aP6gETjvmFRN/XgwHcLIqBn/N6wp26WvTYitTFwSfdjWPxOF
	AuBBaWvRCZm/Sb2BeLLTkwQGO0+MuIIbVEBCIzSfSBs3TvtXlcFuFdqSOP30RIXCn6/r4UM6fkzyN
	3mVw5YDDBTBC95qI0colUWM+frtYt8OM6dwTjoejOmgUAw0tg0ZQ+1YhsA89619vmktHosJQ8tssH
	1kWaK7729d0QRy/bO1w+hHCyRAbhuS4J0cO+vAPD1n+EZdZhtRkyRlQ8P8BphYisPgfKfUWLu02uf
	sdoXYCdXYYPApSYY5KdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYPW-00Bu6T-DR; Thu, 20 Jan 2022 14:27:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYPI-00Bu1V-IZ; Thu, 20 Jan 2022 14:27:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 15FBF1F45277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642688836;
 bh=Tpn1DvaJ0ytMrkzvgIimmDWyZ26VOxChjgD81PA36LE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZdIBCvHy80MeHWM7ipMw7mSEwfCcgdNh1/HquNB7dZ3rzr0bv3r4nyCvfrkj1pSd
 PLn2DQNtnQOjXnpgjH8ra4udPCbphAZpWR3cntupUHvbOe7vXSAQtIPbfZVZwbZNyT
 9gnMEXwsgq0W5IhDWwz/xyzWrSpGAQ7OJnMvXLMFIN4PYyaR2zKCIHV7/5h+JN5exK
 E7TOwbXMnWpJiXnpJwl9nKVjV4zPaK1dCgxHLCnnrj0uTxnWYqxBpYgHz4Z+/P/DVZ
 FMQqNfzmgU+7BDYuQUa4eQsFWnE3zMw/6wTpzBi6Srk2NFbTDuI17pfTYFM+0pCzmM
 AauFeTw+YNc8g==
Date: Thu, 20 Jan 2022 09:27:03 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Message-ID: <YelxN/zpdkukBBqy@maud>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
 <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d839338-6072-9c52-1893-2f804d937ea1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_062720_840906_94075F97 
X-CRM114-Status: UNSURE (   9.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> We also already have SoC-specific GPU compatibles because even without
> experimental interconnect easter eggs, people integrate these IPs in fairly
> involved ways and there's a fair degree of variety. However unless we want
> to be super-strict it's also not too hard to simply assume that if we can
> find a "mediatek,mt8192-infracfg" syscon then we set the MT8192 magic bit
> within it, and if we can't then we don't.

We need a MT8192-specific compatible for the GPU anyway due to "unique"
power management requirements, this is why the MT8183 before it has a
specific GPU compatible. So I'm not worried about the compatible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
