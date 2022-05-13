Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94266C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZqujO/VB86nsxxe3+ds8JN5yvkpqglhznT/Kj7yW9w=; b=TQxzhFuSgH4mTo
	hMLWyJU/AhSWO9YEkj1IH3iNaAYzXV7XQna2o4pbMwTpSnn/9RCW48bgbCwiMI1JF23NbH9D9VmPU
	wXfTCg6unpU5TGkg601x/F3UqB9Mz4IC86VMathGcpnggPITpi44F4EdhvajgZLIynzgwyAhrS21U
	jaAzU2BvOEYEBOQelJSaALtW0IOYVlGUigd236QzrFjHh5Et+PENYRy4qWGISfo6hVp/yd3uLLoDN
	F/h6DyObCzm83Bt7YJu6lrMALEbGLckq37IKM8PG7KOcxbZZmCvmKQmZCGvULOe6hhbCB2Ah3zWvL
	vJO1KrA++3l4oUx8OAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYZJ-00Gwla-Q5; Fri, 13 May 2022 16:55:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYZ4-00Gwex-62; Fri, 13 May 2022 16:54:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 908D91F4637D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652460892;
 bh=BPDSRJ3l6xkyIcsf0pTvPMccH18vwhA/gg5edH7HCTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dc+BOYbBSlAvKsAfLKJin9vTOc+nc+UCgcZKn4Bn+P/1wzurDas09aaHUJ4GMIZ1+
 h92jFExBpnYC6OHttD5RcKqFDvCm5kXCTziM8uBZp36qtvX4sgdk5fssavim9M4T/y
 jEUCQ/XQKc/f4nf8EOjzgVwJL2nw8sM5ouLdHrSw/jLvqjaFJDMymMIUyCIhelIQ2H
 8ljXMWvJYA2eok9Ac1XzDpHkXlNW9/JxZsM5Rq0LHEK4TjtrpSg/5VxqyiCWs7EPff
 XU5LUZQDBTmlvTai16KDp0EUdI6/vI8v54+8Cj1WH43xXQjdL0w5zZd2vbA77mngS7
 xeUATyvJy78yQ==
Message-ID: <7ed1b785-389f-9730-4686-bc6b85cc8f6d@collabora.com>
Date: Fri, 13 May 2022 18:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/5] MediaTek Helio X10 MT6795 - Clock drivers
Content-Language: en-US
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_095454_381373_B95D9D77 
X-CRM114-Status: UNSURE (   9.52  )
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

Il 13/05/22 18:50, AngeloGioacchino Del Regno ha scritto:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This (very big) series introduces system clock, multimedia clock drivers
> (including resets) for this SoC.
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 

I forgot to add context to the cover letter for this series, so I'm adding that
in reply to myself.

This series depends on Chen-Yu's clocks cleanup series (clk_hw) [1] *and* on
Rex-BC's MTK reset binding-cleanup series [2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
