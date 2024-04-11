Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91956CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUe9cTQIsVf2BzBRMP6bdVBkcbmSJtPVvYIzueVWDfc=; b=16sNnV6yrlnR5kU9bg7GgbuISm
	iIQq7Vxu5bttuzsgJ5w4LW/YOn9XOs+Lh/NK2SscubLt2kbmjPZGSWqMc7zRQF+LgzQOIrgW3Ypdo
	xQlZTp0Qg9fsP8pJC9iF/EDOwmNfv97XInvlS4CvkjaijN2A3d50qwe42LF7ftVWTLYFhrBsDQRBy
	ac00NtJovWzwvWEYRoGdzzvi7RNKMQkBXMD8G/c4M2NsJGms8rCBFilg0ucWCEKwumaNwvYiSZjZ4
	zG8SPWI5F65TUnGQzOKDf26pQhEaahANHwDOXLUVIF3w2Hk7yuhVPa3SG5E41SM/7VHCTGfBWx8Rp
	Jc3PYuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqww-0000000BN5D-1KoW;
	Thu, 11 Apr 2024 09:42:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqws-0000000BN3L-2l0A;
	Thu, 11 Apr 2024 09:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712828543;
	bh=9zHVZHJr9OoCwdLqLrqqH2nk5Gz8ExpfR6tAR6WXenk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fwxOLmbY3pDnFANoxHetL2LJBjz1vc2t9cnWGaf/5hxq1+EGBUYr7NEzdvshA7a6Y
	 QSg/2IAPjeQr7mNUnZQklXvphAXPb9qCbxHGXcY+cvyk5X3ywBDvrp6u60yPPYCw8g
	 wxl8C7aBE9K6eYhe1uCBJLJ7gXUMKBjvIdtF1bzxDi0Py6w93tmmejKY4r+ypNbqlY
	 1v5mPj0Vw/OzHTxHllYQ0jUG6WfHIGUFmVKsi2jhg6h6N06+Ec3dyqNJ4Uxzehihcb
	 hygOeTdXO/j4T9HkT2pSgfrl09zfn1lWNXkz8jQ6A8nZV1XerQQLzK5GPVgNoPGE1D
	 qxfI4Ob+pnt5Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 006943780029;
	Thu, 11 Apr 2024 09:42:21 +0000 (UTC)
Message-ID: <26d097e6-8be1-438c-85af-9bc572b74770@collabora.com>
Date: Thu, 11 Apr 2024 11:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] pinctrl: qcom: sm7150: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240411064614.7409-1-krzk@kernel.org>
 <20240411064614.7409-4-krzk@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411064614.7409-4-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_024227_019116_41A6B459 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 11/04/24 08:46, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



