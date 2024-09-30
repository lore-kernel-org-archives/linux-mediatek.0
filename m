Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E11CF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2hpmCYLT52hmHAC8PHJuuNJRWqEsrc1hkQowF/FPhg=; b=JSRtiWKeQZFStQX+vFwpplj78m
	B0XGeof93jZ2hEZNqi+jUP4rBmCTq1bewUaqz3nFYT7dgLap/fwP6FsQTGEc7ZmhegCyge52QUyQM
	B/yWTv4cxs4WtlpcNSZ/jOTuCaJx3OyIWou4axk91rWmWWDtId+jkPClj4B3yDeAd1KwSlN2bItiZ
	dy6Qgff6fgJwQ2+RMJcWUlZ23SCKBu8CbTFtVSd5GiaUyAHbL+ylB5/BMhW5VMjfj/+n7ce6mh7O/
	D21fLG6UbYeaLGbgFCXEih42aSvyvLlhDt6oee7uOb7QBcRL71khprAiDjRZ8z3ROIjV9QNPWoJhw
	y0ORam5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCFf-0000000GQDS-3uZO;
	Mon, 30 Sep 2024 08:59:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCDI-0000000GPep-2TNL;
	Mon, 30 Sep 2024 08:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727686621;
	bh=RRK9Oszbh79YT4DewKwCNUO67et5+TBu6p5sJ2Au3kY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gxRsvhD03S0cWwbUtL7sqBtCluUD69qqNc87WZkMBQGPx30E39voB4FbamMK0ME0l
	 QooGgAyiKgNKuOrsa2A0aKNHFRs6mZKddKzivfHwhDPq8XVNzpGre0Zmb3rZy/DMam
	 RBfad1caeHvQ7F9zUHMdnF4u9NLSUFzMO8wqwZG7LoJ4L1Ltrj4DYqhALQma+o09tk
	 4SMffNO17Gx6AsfmISZSv5xL0wlxEhLJUinDkc409u6gyIA5B3MBWtt5bsyAEnC+Ae
	 ux2d9sbFfYpmqbM/cpfPG7WKuCTF9Bzl1VsEV9cIXBvgKYIq6fICf2Zu4R1iVQxfNi
	 41ZbPNd6CRjsQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 542DB17E0EB5;
	Mon, 30 Sep 2024 10:57:01 +0200 (CEST)
Message-ID: <b261e9b1-826a-456a-bf69-b15bf50c3fa8@collabora.com>
Date: Mon, 30 Sep 2024 10:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] regulator: Add of_regulator_get_optional() for
 pure DT regulator lookup
To: Chen-Yu Tsai <wenst@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20240930044525.2043884-1-wenst@chromium.org>
 <20240930044525.2043884-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930044525.2043884-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_015704_832306_B0A8BD18 
X-CRM114-Status: GOOD (  13.35  )
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

Il 30/09/24 06:45, Chen-Yu Tsai ha scritto:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Add a new of_regulator_get_optional() function for this. This mirrors
> the existing regulator_get_optional() function, but is OF-specific.
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case.
> 
> Also convert an existing usage of "dev && dev->of_node" to
> "dev_of_node(dev)".
> 
> Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



