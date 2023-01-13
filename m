Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6CFC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSEovFFW8xEl/MriTMcDQE5W2ndgUtT/Q5n0Tj81zog=; b=Y9F4nArQXGorsyRn9irmkTPkOY
	vO8FjT9lQG8/cb0GIpBWWThh4dcK0+kBKqoJY+Z4m2Izc8brBF2WMFg3RNG1MtBZ7IpczrRbsSKln
	tAGLKJXFe0ao8OnDCqlYvnqWbiVExXB4Y/lAvGcCZWWWX5o6YGBONT1X6vDdVJ+OWUv2qfO5Kps/1
	AEeTnIs85QT3IIeALVQ+kHHoZwQc2g3aH11EmLj7MNG+cK0DzvIMtBHvYLvY8jl4V+fXmpsOg7M0s
	rBKqL1h8/WSvC1t5Uhr4nc3alUx3ceeJolPqLQNjiVaeLMvnf+uMzgurGPis1Md+AvJr8iqVWm3BU
	daczOYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPhV-004DNx-6C; Fri, 13 Jan 2023 19:26:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPhK-004DLZ-MA; Fri, 13 Jan 2023 19:26:44 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A64DA6602DD9;
	Fri, 13 Jan 2023 19:26:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673637998;
	bh=LUiSIC6J7YttLukRAsDFVXfuaKDaC9lBdGSnRpQLYnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOAetAQGclEmydwEenx5CUj1aJv03X10OrckVDjG5zbSoiy5QTMYQSvUQKCAMEjDm
	 LvIAekYCs365QlQWLokXZZTW/sIKE2Ja2WzTzgR3s4HOgVDMKOrlbXGItOGcT1/UjY
	 h4ga44MRaLQqCyC6G7Q6lE9K5XJZ4VwL9BKs+//Zq/e7ytvC+/rFodp47GuPJoNtP2
	 xrp4AXm+Filel2uMyE0naq5nl6f0+mBIuFbo+KpqjE+B3Mg6IjKiaSsU6kRgsp7Sa4
	 f67da2/ehXqZ3s/nqTZMuH1PwO0G0pd4KdNHD3BTLnMpXv21kpXZZXtqCXWOjP+HDr
	 jakMZB+/PyOCw==
Date: Fri, 13 Jan 2023 14:26:14 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192: Mark scp_adsp clock as
 broken
Message-ID: <20230113192614.uqofivoqc3wbaf7u@notapiano>
References: <20221229101202.1655924-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229101202.1655924-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_112642_972087_EFC7F8FD 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Dec 29, 2022 at 06:12:02PM +0800, Chen-Yu Tsai wrote:
> The scp_adsp clock controller is under the SCP_ADSP power domain. This
> power domain is currently not supported nor defined.
> 
> Mark the clock controller as broken for now, to avoid the system from
> trying to access it, and causing the CPU or bus to stall.
> 
> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Even though personally I couldn't notice any such CPU or bus stall after
manually enabling or reading back the scp_adsp_audiodsp clock without the patch
applied.

Thanks,
Nícolas

