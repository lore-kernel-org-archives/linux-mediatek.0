Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C551BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mTzuTr7Qws+cUrzbSI+C/8BpG+BCY4L1yCujqjQO80=; b=lwJKRW7PEs44jf3FjruWIy0WFn
	TnXerpX5hbdtNgKJx59QXqQrhZQbRDibZmlvm2ghP8J0yawhtTa/hnzHr1E/0csW4C3KT5jkV/Iu7
	PWxTJDCDNcG9jC1zwVRdJHEAwr7ZM+1f7nXl5ef7QVTrfb97QtHTzlvVmiTTKxoQ3r08KFt83Db80
	cCPuPRl/Kpsdu6HqA/r31nLuuyXymp5YTNJk0uNBsmF2xtFONBrdJYYOXj9UvDE5MguqyRW2zDVv5
	6+cBVIT1pjUFMOywLg4xpBQs9N29I50wkjSUO2DPuK3Fa2QflZNzRh41cK6EnQtTpVOIXXFPHPqH6
	j+fUJOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peXKI-00Bfgb-2r;
	Tue, 21 Mar 2023 08:26:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peXKG-00Bff9-0I
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 08:26:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id eh3so56411764edb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679387192;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0mTzuTr7Qws+cUrzbSI+C/8BpG+BCY4L1yCujqjQO80=;
        b=F0XMce0naaobBfyCQtabTxdjFlSDXtRsY59OVOruFSmpR9cvkfZ293h2nrTG5pheLb
         mjov15+plh04xZriyDiET4af/BfKT329TO0zZ4SaJ9WBsM6RqZczGF3VhRHnd+ZuO+oy
         gd0q56A62UfbLkchrVvemzOWkVE79g4EMJ5NoAUG4563Dcu4jB3ugwP5iSmX3KGkI9//
         NuEjyIQsXFxucDiGuD3faRv179z5sC1fFVnTfzU+HONr1V72R8uDwRyGkG4UuOYj9UZc
         WfHNAFeRmrZ/wnzOsH1VoKwOlBJAkNTN9ajSkqA/1FiYiAd2rYYHPPS9CqsbeXGUIpV5
         kFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679387192;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mTzuTr7Qws+cUrzbSI+C/8BpG+BCY4L1yCujqjQO80=;
        b=LPxC1pr+PN6vRdijg89mZbfWgU2SVY404Zs2YFdgJ7SMy21ktLCuUoMpCRE/SMUjJE
         KQdaIG8kc3WusqmR3OaiDFR6nfkczZhjFPvlpPhaTDsppaAQEezjSK2nnHSOfrH6yeYD
         Z/301BBdjaUOIoDzeMRE5eE2j7vVXNdqISgLENhYHzJJQVi1DFT4obj8XeR8BCbISeAF
         8UIOvFwoZd3D+5GRRas2PoH1Qz+K/h6wk7R+j6B4oqMOh/tNhN9rX4BUKgaKlSHxfbpj
         ltLWpvTwqAK+5WT/IgSALkhDL3Kww+KL1JtaMdMQHBJRqsbdYcH+zIRhnbxantcHFSj8
         9Q2A==
X-Gm-Message-State: AO0yUKUcaCiHNZuP364VFGOmX6ZayC/F1GMaR491ZvmqgDTSuqK85byw
	tVDkewqdDTmH/WN78kKjedRo6g==
X-Google-Smtp-Source: AK7set+Yo3j0orRg0yJ8E1/dJwlIJ3rt2gBjk8VtlpRwTZcxqtlBtQSIoTar3pcg+04BUhx1cgL4AA==
X-Received: by 2002:aa7:d315:0:b0:4ad:738b:6706 with SMTP id p21-20020aa7d315000000b004ad738b6706mr2495618edq.2.1679387192285;
        Tue, 21 Mar 2023 01:26:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id z67-20020a509e49000000b00501dac14d7asm534626ede.3.2023.03.21.01.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 01:26:31 -0700 (PDT)
Message-ID: <676cb6ac-84a3-025f-bb05-55dd27c365fe@linaro.org>
Date: Tue, 21 Mar 2023 09:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/28] media: platform: jpeg: always reference OF data
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Joe Tessler <jrt@google.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prabhakar
 <prabhakar.csengg@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, oushixiong <oushixiong@kylinos.cn>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
 <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
 <8b7816b0-1daa-1c49-6f9d-40769d228a39@linaro.org>
 <b9342459-efec-4e17-aee6-332ee17f44d2@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b9342459-efec-4e17-aee6-332ee17f44d2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_012636_138636_285739E8 
X-CRM114-Status: GOOD (  13.99  )
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

On 21/03/2023 09:24, Arnd Bergmann wrote:
> On Tue, Mar 21, 2023, at 09:21, Krzysztof Kozlowski wrote:
>> On 21/03/2023 09:11, Arnd Bergmann wrote:
>>> On Sun, Mar 12, 2023, at 14:13, Krzysztof Kozlowski wrote:
>>>> The driver can match only via the DT table so the table should be always
>>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>>> matching via PRP0001, even though it might not be relevant here).  This
>>>> also fixes !CONFIG_OF error:
>>>>
>>>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error: 
>>>> ‘mtk8195_jpegdec_drvdata’ defined but not used 
>>>> [-Werror=unused-const-variable=]
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> I see now that we both submitted the same patch, but now Hans
>>
>> We as you and me? I cannot find your patch on lore:
>> https://lore.kernel.org/all/?q=f%3Aarnd%40arndb.de
> 
> This is the one that I sent back in January:
> 
> https://lore.kernel.org/all/20230117172644.3044265-1-arnd@kernel.org

Uh, that's from January! It's still waiting in Patchwork:
https://patchwork.linuxtv.org/project/linux-media/patch/20230117172644.3044265-1-arnd@kernel.org/


Best regards,
Krzysztof


