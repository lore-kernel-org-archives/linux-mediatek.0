Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E05C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 22:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMoCQQl45Gbi1uEtvlYyB3A3iBkjLKBOyA0Qq2xUnPQ=; b=qQBbBks0fBlEJYtH1IdehA7Qv8
	PIMGnP/9dO0Ztne5RBCSC7/aVqANm4ZbeD6+cS/R3onuVVCfDMv+KZsGP7lFGQbbhhSieGNY3lY/Y
	xUzqMiLHoUhZMtdvk9P6WfdkqPcYeJFBf8qlC/0rs4WIFmhZbhR33aBWeHzZwqHZaX4c9je5jdVhL
	RCBIhq3U8Wy5JrKq1Mr8l5W1Qb/+IxEzPmQK18p488SS6OYJIVHwOS8eAIuQgm8tKKvtBveh8OpWb
	hGKko+UTz2/l5C0zRUNNr5ZWAiboDG9SaN3CVl6tUQWkCIFxBE5ro+YYyRcFCQCU9KkOWYJIgtODY
	kDr7dlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTqwY-00000008Har-2sYF;
	Sat, 27 Jan 2024 22:14:30 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTqwX-00000008HOd-1jF6;
	Sat, 27 Jan 2024 22:14:29 +0000
Message-ID: <39fdc99e-e9d6-4aa2-b751-f9b2bf0814cd@infradead.org>
Date: Sat, 27 Jan 2024 14:14:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] media: qcom: venus: Fix kerneldoc
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <20240126-gix-mtk-warnings-v1-11-eed7865fce18@chromium.org>
 <c8795543-c8b0-4860-8cf2-b5680ba3e5d1@infradead.org>
In-Reply-To: <c8795543-c8b0-4860-8cf2-b5680ba3e5d1@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/27/24 14:13, Randy Dunlap wrote:
> Hi,
> 
> On 1/26/24 15:16, Ricardo Ribalda wrote:
>> Remove doc for missing field.
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 4a633261ece4..a39986ce79f1 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -428,7 +428,6 @@ enum venus_inst_modes {
>>   * @error:	an error returned during last HFI sync operation
>>   * @session_error:	a flag rised by HFI interface in case of session error
>>   * @ops:		HFI operations
>> - * @priv:	a private for HFI operations callbacks
>>   * @session_type:	the type of the session (decoder or encoder)
>>   * @hprop:	a union used as a holder by get property
>>   * @core_acquired:	the Core has been acquired
>>
> 
> I don't understand this one. I do understand the patch above, but the in the struct,
> I see:
> 
> 	unsigned long enc_codecs;
> 	unsigned long dec_codecs;
> 	unsigned int max_sessions_supported;
> 	void *priv;
> 	const struct hfi_ops *ops;
> 	struct delayed_work work;
> 
> I'm just guessing, but maybe scripts/kernel-doc is confused....
> 

Nope, I'm confused. The patch is correct.
Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

-- 
#Randy

