Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193C3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=; b=1Dj6Ol3p2LJTx6jMU6ThnitZuR
	LqEKTvBuzFnUdI3Y9loESFK9Kti4Wys4lYVHqoh9Oj0VG5aOD2fO8l+vFc+kCv1qK1CpFt3xXXz6l
	/4YIwKCjCg6TbiRQztHN06gw0F85ONypAjC6/fT7HWaPFkLwVja0r2e7bc4yfmnnkB6AdkKS0nwJM
	7b2pEGz4j1VTrX89RWr4zIYQzP7xxipkj5/l8HzWNDbyYTR4SqjQ3M38KdOPiGLN4VjsJ8p1VCfLm
	gfQEZIQSir6qKhy/wo0I1wuUG6MREF7GYzdNG27gUWVMo2JJde8Trg/H7ddNwi7oZbfaoNBu2f0wV
	5VvHeqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paF0d-009m5G-OV; Thu, 09 Mar 2023 12:04:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paExc-009kJZ-3K; Thu, 09 Mar 2023 12:01:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id by8so1549422ljb.7;
        Thu, 09 Mar 2023 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678363283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
        b=PKXkA4WiA8duFtEJwBSGgeMQh5pTE1KoLqyioyMj57ImMT8E5tzaJa8Cezr5Ac+udB
         dohArEBcvlwsvfpPY/VkRXG5pxCBioA5v30rcjLDCviR5gJkkP+XEeaxVWr0R1GXSFvu
         mY8AgbmcW96ld6ZTFuaKaIVYvXqY/NhH4+SN/hXF64q2DtSBpOxlBJylrbxJP0DtVtbJ
         TcNfMSR8WLEoUXOdxw7vbbTtl0ApDDk2b+AAUsrOlX0v292IdbqAfhmHmtHrqnLZPbyl
         GnohTfVo+Y+Anb2hVBX+PfQYYZpSMgOXg1CmZBureC9Z8PeQccZB2IijuNg/SeGIYztr
         dS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
        b=5LvfquWEbTQKKsBrP5sSp0xzmLvr8JHlMagWWPT6520el9epeA7Xulj3l373se0S5B
         5/p4eYLVicRERO+cq/VxCyV/+935T7T558DsibkqdNs9miKVhRWIJX7kx66h4L2fsABE
         lRldzofBro7vOdtlVFaWWxVzItdbGZ7e5pgGy66PkAO98o0L01TWtjHiYhpx7tK9lWwq
         EdYXhURDxrfWVxXCoADP+p88QfDCR6v09unKBibunaak95f2m1OcZXbwSumy22MYiERj
         vJ2aGpkdHySyNmSCvf795k5y41aZbmfmWSZ+fBa/DFSj1SUbdDQyEJQUXMDYVSRw++3d
         4ulA==
X-Gm-Message-State: AO0yUKWVp8I4sNy1VGfKX7sqifBhLWQ4kqvDsvPcVZ3+oBlZThfywPle
	Aha87LfakmL98PmXqJFZg1o=
X-Google-Smtp-Source: AK7set+NMF/8gy2PgvVPpR4O7pSBLhYbUzPDmj5xP0+SqTAcGzlCByQXPVnKs759lKsD9WYcfwK9nw==
X-Received: by 2002:a05:651c:b1f:b0:290:4d4b:481f with SMTP id b31-20020a05651c0b1f00b002904d4b481fmr7275446ljr.16.1678363283077;
        Thu, 09 Mar 2023 04:01:23 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2e98c2000000b002934fce87bfsm2846420ljj.108.2023.03.09.04.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 04:01:22 -0800 (PST)
Message-ID: <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
Date: Thu, 9 Mar 2023 13:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3] nvmem: add explicit config option to read OF fixed
 cells
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <20230309123513.43b7134f@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230309123513.43b7134f@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_040128_237514_B56B45FD 
X-CRM114-Status: GOOD (  23.93  )
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

On 9.03.2023 12:35, Miquel Raynal wrote:
>> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
>> index 0262b86194eb..b3c14ce87a65 100644
>> --- a/include/linux/nvmem-provider.h
>> +++ b/include/linux/nvmem-provider.h
>> @@ -73,6 +73,7 @@ struct nvmem_cell_info {
>>    * @owner:	Pointer to exporter module. Used for refcounting.
>>    * @cells:	Optional array of pre-defined NVMEM cells.
>>    * @ncells:	Number of elements in cells.
>> + * @use_fixed_of_cells:	Read fixed NVMEM cells from OF.
> 
> I'm still unhappy with the naming, especially since you explained in
> more details the whole plan which involves using a container to put
> these fixed cells from now on. In both cases you extract cells from
> fixed OF nodes but this boolean needs to be set to true in one
> case, and false in the other, which would not make sense.
> 
> Also, regarding the bindings changes, I'm fairly happy with the idea,
> but if we go this way I would prefer a full series instead of
> individual changes with:
> 
> - the boolean you introduce here (renamed, at the very least)
> - the new bindings

I assume you mean fixed-layout.yaml?


> - the update of the current provider bindings to take the new bindings
>    into account and deprecate the old ones officially

What has to be updated in current proceds? It seems to me that:
1. Current NVMEM providers reference nvmem.yaml
2. nvmem.yaml references nvmem-layout.yaml
3. nvmem-layout.yaml references fixed-layout.yaml

what else is missing?


> - support for the new bindings in the core

Please, don't get me wrong, but I'm not going to spend more hours on
actual coding without approval of chosen path.

I'll need to have
[PATCH V2] dt-bindings: nvmem: layouts: add fixed-layout
reviewed/acked first. If you can do that that's great.


>>    * @keepout:	Optional array of keepout ranges (sorted ascending by start).
>>    * @nkeepout:	Number of elements in the keepout array.
>>    * @type:	Type of the nvmem storage
>> @@ -103,6 +104,7 @@ struct nvmem_config {
>>   	struct module		*owner;
>>   	const struct nvmem_cell_info	*cells;
>>   	int			ncells;
>> +	bool			use_fixed_of_cells;
>>   	const struct nvmem_keepout *keepout;
>>   	unsigned int		nkeepout;
>>   	enum nvmem_type		type;
> 
> Thanks,
> Miquèl


