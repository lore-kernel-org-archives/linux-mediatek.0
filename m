Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E546C001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 22:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5APYFm2DOcUlHFwZTgKZHuYxuZ9KVmW8+AsBSuN6Ix8=; b=TN5BbfCjpJ4tIlFtP0S8ciG5V9
	1oh45d2H8UsK+4Oc4x42WeWqV0mbH9/sfonxx/Ik0jX1EW9zLN9XfsLp3j8Hk/iOSl0mLB2IOaZSV
	MZ6fdnLqafK/HcJOhkFZF1ErZ8rtZ3pkuevu886zWkcdm54E5ShK2NIttAp33Lec9dBfeP+DKbwI0
	9Z4ZNoUpV9OcqT5gBHG5Z9YO83hUgjRj52i3QZAGQFp+0nlbMifdkBQX1stQqzwkeu0iiIyJtkIV7
	z0SNSEKXOQzs7tDE0owbQJtUW+zcc/4LR5I2OYg3IWq5yCQzH/iEzWZy7h6cRGouBbNHTk9uJqTEX
	YJLPbEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEVA-008roE-2k;
	Thu, 10 Aug 2023 22:51:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEV7-008rnh-0y;
	Thu, 10 Aug 2023 22:51:30 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99EE76607234;
	Thu, 10 Aug 2023 23:51:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691707887;
	bh=xX2TKwjWSum0DXCFhBKwo7grgh23hCvtVCMmYEmXmyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaptVNrqp7UANGPO7f3GoJzbdNmTkraXOTFZUZJlCr4/2zgcZ5XRb+eKUlTHOyWhu
	 ommN4v9BOQpsZdevBR+wrXFpl55W0N1j7CT2+L6O6aCc9WF3b7mInL5Twq3CdmgygA
	 7z/p5IVJZZf77Pjzo9U73oaY4I2tVHkQFmuoOBF7fa9j7c/fxgEIHuVKZy6H5OcumY
	 3m3R1mooQIma/H67JokJIro8o45Tjt9fucg3tuUTksrr0pn7DZqjKqlMSguaT1uDQv
	 PTDaVlWJFxc9W+OLm8PeU1/xksR3A4hiDR3MQH0nBLd4Et63YndN4Kq1VgN3qNrh4M
	 ujNWWDWwuGz8g==
Date: Thu, 10 Aug 2023 18:51:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Make readings
 valid in filtered mode
Message-ID: <8117521e-efb8-46dc-9db1-d521a01af0bc@notapiano>
References: <20230713154743.611870-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713154743.611870-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_155129_539462_2D4602E1 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, Jul 13, 2023 at 11:42:37AM -0400, Nícolas F. R. A. Prado wrote:
> Currently, when a controller is configured to use filtered mode, thermal
> readings are valid only about 30% of the time.
> 
> Upon testing, it was noticed that lowering any of the interval settings
> resulted in an improved rate of valid data. The same was observed when
> decreasing the number of samples for each sensor (which also results in
> quicker measurements).
> 
> Retrying the read with a timeout longer than the time it takes to
> resample (about 344us with these settings and 4 sensors) also improves
> the rate.
> 
> Lower all timing settings to the minimum, configure the filtering to
> single sample, and poll the measurement register for at least one period
> to improve the data validity on filtered mode.  With these changes in
> place, out of 100000 reads, a single one failed, ie 99.999% of the data
> was valid.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Daniel,

gentle ping on this patch.

Thanks,
Nícolas

