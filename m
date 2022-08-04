Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC9C25B06
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIORngB0sJGV1ji1Y4RLvLnyKKsot5LN83hiUmkIc/U=; b=hlX1KC8jVjbQh1xyJfSimo6vXJ
	8V4V1GcMax/CWSoP1m443MpoHZ6k3ptGX8aU80q3SFMma5d1k4yojyo0qOGHokA91K3ELcjB/Cr/G
	IIeblnM8gfeJ8bdP6shcC99Zu+e4REmiHos3oAzbUbHx7kQlP3N8ksrDsB5Tqp5Cd2S/6c/YnYB0m
	6CZyMzJw2uQgfGESFsl9rj7rT9jad43PfW422Qz4RBQ+fv11XX9o3Z52Skznr4HaTDcGn3EWUWPX+
	Ll5gA/XViZKw9UKrnhy57eIm7WYjt1bT3eAGFNoHc+tRDCQwB3xJ4EeAWkUfcjbXEm+qg2FjsTa9K
	6Kc4q6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJk0F-009wbA-9R; Thu, 04 Aug 2022 23:11:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJk00-009wSY-6J; Thu, 04 Aug 2022 23:11:29 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A8376601AD1;
	Fri,  5 Aug 2022 00:11:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659654684;
	bh=d8bpUmqtai/1bwZEwBXzsGHcuijSaBnMTHwkrXO56tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFiM7Krsc/reEMWSfgyR+v9yvflTVqOWv5wp39o4YXTPMVH5asIxCFy3BdOPhMpM4
	 r9/YWaFK9dWXErCotYCzZQNMrdBfOAB+RY5rdRXMwiz0FOuiiVWSHF/7uJD/uz27PC
	 7ipDdVlWUjSuH0KPdnBysN2cqgY0hObckJsW+XSfXld4hJJ+6zXWAKRxj6FTT0sEI4
	 cUrL1j6cYMhuMOd3TS1i9wsZ1Pj36c3e5Dg90ID/8XCcHBNsWLailX3koTLkRmr15X
	 na3BlvgJuNS/ltnyJgFmAb32wBQBlM6Mbzdi1mMaQsxoYGTBEwG39ENrQMASnkPCSh
	 QvxkB8Rp2C3Kg==
Date: Thu, 4 Aug 2022 19:11:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8.1, 2/7] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Message-ID: <20220804231119.x6l2nl362rqvlk6u@notapiano>
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-3-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804130912.676043-3-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_161128_396053_81DC0D53 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Aug 04, 2022 at 03:09:07PM +0200, bchihi@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..53c44a73f3a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
[..]
> +  nvmem-cells:

       minItems: 1

since mt8192 only has one of them.

> +    items:
> +      - description: LVTS calibration data 1 for thermal sensors
> +      - description: LVTS calibration data 2 for thermal sensors
> +
> +  nvmem-cell-names:

Ditto.

Thanks,
Nícolas

> +    items:
> +      - const: lvts_calib_data1
> +      - const: lvts_calib_data2
[..]

