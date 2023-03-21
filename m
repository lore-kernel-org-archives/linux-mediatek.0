Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2548EC7618D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=; b=r+5NC+2fAUmQHbLQDx50wxghC3
	GbwKnXFqLDUCUWuOszkGII7/nZW4AoJJ228vgvA99jqI4bCQtY9qlRKe1eGQ2zmzWQItwkkyNAhiD
	Fcep4gXf16Yajz9fN4Kp+EVcrF9XdXrUklZMpGpafa9Jwdhpzw5m0KQlccAk5cyHqzLxgKpfmLy9s
	uW6JZtACBNf2F1whj6F+ehDeunac2S11cMywQgkr1LIagWcsquV5ZEAK9qzD3Wv0889jgAo3wCbqF
	Mur/qT1guYFo4M2qtP4QM5mDUiGDvFPwc32iyoyoatyjhRzvEsjhCqI084S+IT2LZRaK3JL6xjjvq
	vaH6XdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peXFO-00BenD-1I;
	Tue, 21 Mar 2023 08:21:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peXFI-00BekP-39
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 08:21:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cy23so56310977edb.12
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=KCVpYwy5GslZcg2w/pnsd8XD8fl9oI4gTI7eu3h/7VXuqpW8TQdXNDAK+sPofcAMdl
         ycbY9Xr/ULZro8rx4v9I3OHqiWPEUuAMOvfc2ZyO39n8Zrbsiky3tXod+YDFqwsXWgC3
         S34BMx+RCcIQ9vdtol3bHFe6wb5qZ+7vjw052gIrZbJob9mArZMAiHiPax3LRCNw/xgS
         jZjPnQylzihCDnVoOw4tPskB7fZD8ZKLiWh6LEyly9tD9N3Qf1s8y+TqjFVXBP2AGm9q
         mL31sS6a0lGd7StHZXAe3czDWmrdc3pwltw6CGcsCP8GUZPrcJffasoCBbGwipL5+2/s
         U3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=pAG0FqbUv3gkCPFF2i1qbWJhKAwCjsHpCtOpWe2Y/wZGKneG2xscgdmn8b67qEucWo
         UMNZ/l04Mipy7wkhasZaikBJDuoMsqRK+z75RiWiijUBTsqiaUeCTMAQjbB0SN2olnDH
         x/+E8LkU334T+mWt5J0g0+9k8XMeINF7n/bJ19rlOSMQAVb9rxw+Ux0GZ4BMIB2mvIFL
         y0monXzZ4sSm0rhJs1sqXTXQZNLj5+8XQvXLdcdzZPjD2Hlo+dAa3DGFkug5aeD6sI4x
         1/uBqKGqFRPMTC4DkrYjGoEbB+3M5Dd05AjfOiiX2D9kkw9rLpUdFUT9e3B0eDKNiMv9
         Vayw==
X-Gm-Message-State: AO0yUKWSjFY5ZyBijetgDktdvC15gPBEm7lKh7As0esrtDi5DCgKZpoX
	Iu//Dmteck2LaouKtLS4hGFZjw==
X-Google-Smtp-Source: AK7set+6Sf7lskRnCtVXZF0F+OgifgUKEDMmWXjnbQFKwSnk5FABspDdYivaIjgEpa8Ajasi1pfhJA==
X-Received: by 2002:a05:6402:55a:b0:4fa:ada1:796d with SMTP id i26-20020a056402055a00b004faada1796dmr2339969edx.10.1679386885235;
        Tue, 21 Mar 2023 01:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id s29-20020a50d49d000000b004fc2a75c6b3sm5865294edi.23.2023.03.21.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 01:21:24 -0700 (PDT)
Message-ID: <8b7816b0-1daa-1c49-6f9d-40769d228a39@linaro.org>
Date: Tue, 21 Mar 2023 09:21:22 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_012129_047326_4AACAD79 
X-CRM114-Status: GOOD (  13.87  )
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

On 21/03/2023 09:11, Arnd Bergmann wrote:
> On Sun, Mar 12, 2023, at 14:13, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).  This
>> also fixes !CONFIG_OF error:
>>
>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error: 
>> ‘mtk8195_jpegdec_drvdata’ defined but not used 
>> [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I see now that we both submitted the same patch, but now Hans

We as you and me? I cannot find your patch on lore:
https://lore.kernel.org/all/?q=f%3Aarnd%40arndb.de

> merged a worse fix [1] without a changelog text.
> 
>     Arnd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=4ae47770d57bff01

Uh, I can rebase my patchset.

Best regards,
Krzysztof


