Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2147C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Z20n8EovjQK6WWHRBaG09kppsRVXiyp2olQcDL0XJ8=; b=xej9XCqkW4ap0HQK0/cgh7Gq6s
	X6WGpVNYXYMFjjTI/Iosm8Y6QAVgXZBDdlujnVGXMtj3yvspK0M1lVdZJphx5/ekQHdMKV5u0doom
	lkgstDS2qu5qBe57IPq3u7VxZP5uFzWzeekTOGrgJHXDMmZ/ncn14xBNn4MWfoRpLT6AFcJdvi0rh
	cR5htSe5fMDHUagzZ+Hvd7lby2ytUqGS3nPaxFWWYWSZW5ANP3uOGsbejC24v9n/e+txaniaFNC96
	SMhy32ki4HRocHTZ4j+13Lj/NpClRJ4ZExlJQoj1JfclpZ6w6AmNYseaB6AnFeUUx99eX1hw1IVqS
	DzW9icbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7Yo-00AqNx-1L;
	Tue, 14 Mar 2023 16:31:38 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7Yl-00AqMM-2L
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Mar 2023 16:31:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id da10so64515833edb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811494;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z20n8EovjQK6WWHRBaG09kppsRVXiyp2olQcDL0XJ8=;
        b=JK44/SsDXBuPDZzc56hUjt+1W7VutqTow1gDp4b7GRufbuYANwBW3zJWk/Fdr5oy1V
         5NvGdMpCt9KdMMZ0wXSMshyMmavoyRhfXn4dByC3Ra59ZWEliXiB8mN8v7xyWYoY+EKx
         9NbExJxy4XW5gsNpzG0e2gSwtq/3tG8E45K4EBifKcy720nyV6KKjD8tKWWC0RxYMvI4
         CZgvENMmgS4n83pA7Klyg+owq9LWy3TuivG7ClIC6BZPRDK/whWULBNFJTPomgpe6M8U
         PpRFx1/qm8hUiI8BU9FhfgfI7bFQIDM024dDiYyf9bSQQj+BqJ/PDrxtzbJWxOGY3L03
         zCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811494;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z20n8EovjQK6WWHRBaG09kppsRVXiyp2olQcDL0XJ8=;
        b=yFr67EOMuys3/GjQyNGER9Y4rRqphr+Qy+kU4dUS/Hlp1g2KxDjdGRKyCqjz4R1LY4
         GCS9RCw70zGj1+elTq5bNVstwYS5u1B+pAASzU1M0DlAEM7QFIg31HkwearJt4xMoT4W
         pMg4+TGC9/AVue6nIWGWGYpiLKHvyGSWQgEMWVW104/PMkn71N6POLhZnNin7VHPVMtm
         wEVyLZpHqtHQudaAcbpepqV+dAfVtAFecb6js75V554S0nikKjyMTSOrQq08MNXNXz/U
         tCH58dlx1YNBVl6ZAB1/uH70p+WwoM4pcMIHoKanRiWVtiWst+jOEdIbGkJ3SMhmO5mp
         GsQw==
X-Gm-Message-State: AO0yUKW1ySiEHuFng/AfeqoMrTOYtD9XMle86iOtqzpC8J3pjffOLXom
	G5tBJDVXhLdlqdWA1E7YhYic7g==
X-Google-Smtp-Source: AK7set/vSQlRu82Czuk12ElmMiD/0af+VwTO3KMyjJOjl9VfNhfnYkq0M4g5zeFFPauB5KWKj9oZYg==
X-Received: by 2002:a17:907:31c1:b0:92d:6078:3878 with SMTP id xf1-20020a17090731c100b0092d60783878mr2427954ejb.33.1678811493961;
        Tue, 14 Mar 2023 09:31:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id 18-20020a508e12000000b004fa380a14e7sm1281024edw.77.2023.03.14.09.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:31:33 -0700 (PDT)
Message-ID: <5092a0b0-6a31-f984-e28c-ca11bafef6bb@linaro.org>
Date: Tue, 14 Mar 2023 17:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Tessler <jrt@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
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
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <4ee5e059-6e9f-0804-30ec-ff073f436780@xs4all.nl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4ee5e059-6e9f-0804-30ec-ff073f436780@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_093135_764773_2477E14B 
X-CRM114-Status: GOOD (  11.68  )
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

On 13/03/2023 12:46, Hans Verkuil wrote:
> On 12/03/2023 14:12, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).
>>
>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> I assume you want to take this series, but if you prefer to have us do it, then
> just let me know.

I prefer if you to take it. Please grab it! :)

Best regards,
Krzysztof


