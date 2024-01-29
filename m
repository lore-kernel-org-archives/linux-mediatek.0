Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677F3C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3ucDEk5yaDbFRmAj5gbSuGrdPHZuBHpGsrjpMY7L68=; b=4/zZr8umlmVSECndnpzo3C+Kx4
	DR8kKc5KuY4hK91Cq7pSXfq52waN4aXk8ev2iKTbM4ULik+ky32ZxT5okQp11h4Fe0T8EsBvq2pV+
	Nt8DcUVjYsUIQbZBkUSRSjBG8HuXRoynjijfc70WsTTlHxhwimyIck+tAFa5Zn9Vo+Ihg+BIIXVd0
	6qKygjH3WFrPIOWbdEIrMUyDy2BphkEdbSGTTE0H7M09heOI4pfzht/sk9ImxhQuLEKFF6pbeNuM+
	XrR8jkjyDomRAlly0MPRqGTvN3EdSkW3iN42XFYOcuyNLiixZ3THQrdsKAfXDII1zH35Lkdsm92xg
	xDhBj4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOa9-0000000CAFw-17wz;
	Mon, 29 Jan 2024 10:09:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOZZ-0000000C9m4-13V8;
	Mon, 29 Jan 2024 10:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706522940;
	bh=k22DrZkhdiOba8UrnvCvdbYw0Cw6bjAM1tvjvZWHmNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H1TsLa++irKP+ZC60RucqXcKR4nyUyEZXvEvzodkpr8XNuTO4nAyFMYh0P60zp2Y4
	 BzzTlSvPW7jsaMQtVJVtUb+P1hxeac2y7F8q4LmNomrkxbQfrK17UdIkImU/tOcnwZ
	 Ti5iluANzCWx8ePGohCjN9xKyTgKvC6IqjG5KolOJDsBdmHhHvEga+4A9ejGoNC/uo
	 2MvtIDz58VHojkZojMnH9viurSgYKb9CcPRyNbYMRXNlY3w1cYBctFcm0mvWaq9bdR
	 gIpj9caVlHR3UEHveq9u5S/Z3YZxpG9f59znfmAdHEklAtwHqSHS5eB9VFynOOMrFQ
	 gvfYhzVeIirGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDA103781FD9;
	Mon, 29 Jan 2024 10:08:57 +0000 (UTC)
Message-ID: <5e0ae5c2-d3c6-46af-82e0-8141ea3aa2dd@collabora.com>
Date: Mon, 29 Jan 2024 11:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] media: mediatek: jpeg: Fix kerneldoc
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-8-eed7865fce18@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240126-gix-mtk-warnings-v1-8-eed7865fce18@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_020901_562782_53C7A12F 
X-CRM114-Status: UNSURE (   6.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 27/01/24 00:16, Ricardo Ribalda ha scritto:
> The field is gone, remove the documentation for it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


