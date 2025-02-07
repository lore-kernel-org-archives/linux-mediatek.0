Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F23C02194
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=; b=RMyU/Rxbd6F5aGaCa7ghHtKdEN
	GMEg4u7Fyx0lU/S734Q4MibKiKxlHsqBAvRtViwVxRTibA4XOwy+nQstJJJvRLMkUeEbypo4qvmXV
	Wvxx0wdl72ohEV3rex7G20JYf307vSOISiVgBz+idI2M4fecVn4yBIHTjV/ZZBe+hrqf5O3wPbKq5
	9h8fIrjLGZGBKtalutecTEhhNAchXzLe1eETuXYYkCfWpPTbRDjqlnhXEEd3uZytcKK7dtHPvsOft
	bK5+ZQfe8kl6w6JAXLth5RuNDNKnmoVPU4VYyg8uKowCBrfrxaH7cXXwA/6lKIs1G72k3y7KZmrxd
	6jIf2fbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPDt-00000009pTR-0VBK;
	Fri, 07 Feb 2025 14:20:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPDq-00000009pSa-0cb7
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 14:20:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso658889f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2025 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938044; x=1739542844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
        b=EIFVCgVdqXYm5Mkj91kCx0MFu9SwfCEcLMSs5ubWchfqEm29bFdrMXewmGYdt5flgW
         j0sYOjV8gPYh19ZsZd3ynb1mmlPBvZ+Gjd3jhclTC26rRIVrmYuKt8Ufbf/9aULIJ2TN
         3K1NYxed2YLZj0UGvQqTVXs/chIdZnBTvT6quDTpIW3gX3Arcr/dujrm5s2ojsTgL2Oj
         3phT+QKsk0ktjrgvkr5BWAcVIjAN/BcVKSuk3DmcxWp7hgp4xayvjBA7furHQATiLUuK
         nFmLU9FUcSF9qt0ybEUmI858tqz4zj6LH1ysaE4lLRwl1Q56lP6THCDlERcZBYFbWxb+
         7kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938044; x=1739542844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
        b=tgTkVSaOMnnqBak12PG2MS/wyulb+CPzb9JziSNKfB79WsgUhfcSHSzywl4hP+C2wx
         aCNnAzseqZsB1GVMIHyF4m7V2JzF79WipWi9BWaxVaMJ2pelwUTd8hAQ9dq5BB10eWgm
         CctMoocagAiq3XlcQhirTipug+fdl06jg6hOKdhFs00C8rxIKDnGOaJAjgNSjPdXSUL3
         FiMdwboCvrRLFWICIetdCVB4LtyJVM2lmB9N72ZcoGDFobaCE687PfhllFQtsTbsMxde
         P3xOAGPpI1lakVq0vgdCMBhV4ZlIhvuxhDxlvfUnBjuDctoMPFo3QqG8khY5Lq6iwh6v
         5WwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfPizptpQFdBS+OK3CGy4QogeCRPZNlZpo0MI9e3iO5mEH5HEYySpMt99aSsrdMaUH2ZgO06/c9E84cUOKYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Z0nFT2WwSFX6cn5N62lSkQ49GoBdGZ84/pfMIqFMqyGdbUpb
	VO2DkyMOFad0ObA5ivDeafeFEjLSZiZ8sjrwRdwEO6BnLd7wILQvNNbmebaAi2w=
X-Gm-Gg: ASbGncsw5WcTfsIlAwDaWS3UAqA84p3HeQ4Sjz8m33dDIWN4ZTL9cY3uH6PjYqp0jEJ
	761LDRduC+ujBiSwXFmUVV9JcxW/rBuUfhxFpWNHr3CIcVbbRZ3KXcyN+RYBC3qJxWcJXPTS+L6
	LqZsTeSsHHPZOWQk6BZqd6uDXX/NP1XesD8yw8H0cC5/DwH8+OucVYbh0HjmuwbNyhgOOQzGP3+
	rN82c5qgvPqm4us+UoGzTSBucxX8iuBYOdrwj/6PqCbGqXsn4pHsP+g9GDX/8MmkQfISdFE5qaE
	NF6ZjdcGClms8c8mNastIXfQ8SICs+Y7z1YeE0h4DjpHpfipWHfme5NvLMozTEw=
X-Google-Smtp-Source: AGHT+IHb8NiDsyLlRIFbUrauOpegRl5HcLPG5P5HG+ThsLlczAtmqh5c1eeSyDNXReTt5f+HIp7+9g==
X-Received: by 2002:a05:6000:154b:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38dc9ba7670mr2614925f8f.24.1738938044458;
        Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5839877sm3151857f8f.3.2025.02.07.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Message-ID: <f2f07151-ecba-4e28-b156-8a85388cd064@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_062046_258761_465B688D 
X-CRM114-Status: UNSURE (   5.68  )
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

