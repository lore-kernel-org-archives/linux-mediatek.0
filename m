Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F592C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37gGL6Jw2l0tKYWgVGTCg3eSN+EAxtW6F9x/TNJWld4=; b=3xpeBd3D1RoxlpVUX4jGKjWAqe
	zZrzCQ9X51Zzn3dgF7FGciG5yOz2V/Lio82FQcCdRJYMbzxxnj39qmPEAq9bEXSoPvjvsG/utid0L
	3/y8Cszspdho8tVBSvJPNWy/s/SlsB6cmReNkcmAE7FqU36bxrQbHHFY1+qqhLbpM8JabRPysE5dr
	jvsnYXy0mItl9egrF67b0h1nmLDxeYue4+hHaa6ypT9ko+Nm5QVh/wBFHnf226f9oU3buPICQYZ/N
	4fORiiBuNneDQOCzIrV0FODgEchd/Mn7KXYf26IJXG2Qa3467ULOkO7zjha7835qHCqtAEEHf1iLj
	TrIYTauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDEf-00FPcC-1c;
	Mon, 18 Sep 2023 12:20:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDEd-00FPbB-0j
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 12:20:16 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5031426b626so1609360e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695039611; x=1695644411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37gGL6Jw2l0tKYWgVGTCg3eSN+EAxtW6F9x/TNJWld4=;
        b=POWssvOTIjgFyeGxOvwbWTZasHCZv90aioJRTqYhQgRdAI2OHhTtdlVbS3NhLrzjIv
         P9F5Z5Hlc82hu0Jhd7B/FdTIf5VHuYbN1R0vWPe/fSojT64LTQgX8HAVIiLOcqg/4/s9
         dE24KSByFcJy0fEBTcw7TatIFu3/oWzky18X+XGx7XR84tW/VolbGX3zK7cAturRD3uW
         sJi6cwHgQ0T4yhRmWmBBmNKCZa+lUf3R3m9RJ+Z2FEByEzDZ7WHwbw93608KzGWyrwgs
         W/8Fx/M33wMotTvXyfilrxWeI8YbpAoeuwP+tBU2AOWsd5OW3vcL4AmLp295rgCDCaM4
         6enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695039611; x=1695644411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37gGL6Jw2l0tKYWgVGTCg3eSN+EAxtW6F9x/TNJWld4=;
        b=snxYe/8WMg4lbfpV9nsJxfELAP/0fDSHbg0C+x6T+26Ag1oiN0LNwu+Es5DeDNOOsL
         u6HKDZBEbUE5hOj5NM6T88A7pumhvQKeXCUmJGVMbvGVdR9yv7ssrW8Tp7fBtzI1dYCp
         CcpsNm5GxXLbhOrrw7UlOLGSHiOjw+x6OiFBQsEUH2EeARYg1n6u+k9+A2guLj5FpFoO
         s0Rx4yopwufoAxIcL4MSdWyNWOh/nqZREHyEAPyphZ+RS2jSCIXQomy7AnoPjd+u2o2+
         b9C7PQT77lMYHdFg0N9NXSUU6Lt/PLgg7Ej2hV6pJ3W5BRZWccHwczdY3pvxTzmMn+Ze
         CRFw==
X-Gm-Message-State: AOJu0Yw4OqVxIJ0FMVgOhz6NtowXggA0anSKsmp+ISEgMyKYIKFV8eVW
	OqeIYgvY9cRAQ+O4DQifdIq1Ug==
X-Google-Smtp-Source: AGHT+IHMkJKZiVpJg+tLigw+N6NXKAtpmNFN/BdLPmJ+19DhydtwsrfEqqkG3R0omuA7UHeHeMpURw==
X-Received: by 2002:a05:6512:1115:b0:4fb:9f93:365f with SMTP id l21-20020a056512111500b004fb9f93365fmr8492523lfg.38.1695039611392;
        Mon, 18 Sep 2023 05:20:11 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id a3-20020aa7cf03000000b0052e1959db1csm5966342edy.20.2023.09.18.05.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:20:10 -0700 (PDT)
Message-ID: <d70ae419-0038-c9da-8e4a-5ce90fe61f79@linaro.org>
Date: Mon, 18 Sep 2023 14:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: mediatek: add mt8188 svs
 dt-bindings
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Roger Lu <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918031835.12352-1-chun-jen.tseng@mediatek.com>
 <20230918031835.12352-2-chun-jen.tseng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918031835.12352-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_052015_266187_355D755C 
X-CRM114-Status: GOOD (  12.65  )
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

On 18/09/2023 05:18, Mark Tseng wrote:
> Add mt8188 svs compatible in dt-bindings.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


