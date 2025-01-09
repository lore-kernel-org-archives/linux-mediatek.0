Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA34CE77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=; b=ys8XPJqcPnehoDuQ+kBjoOxHDL
	CqNE8ZIZrTF8e81zeNP2OU3DnReYNTqN9zFu1i+FPHM4Vh62QSG+VLcW8jHp8+gOa+RStaEMIXqOB
	nTUonu0IIjbwwQ3HATBnX6jU3p3ySAoFoSkd88XMzV5HKy+ee3vW0PyTytQkXd5pgAmoNdAXdZuJO
	0m1vngmlKbg6MWJFKKHxNHFKDOnu3vzqBo4Wvke18EvkHyghWOH8kOWhMk989PWUAWuYndqEHvaBf
	4dD9F7IhxONJXd5FYIN3UJTlV91csJtfsEztmVGYjT6CjqnEzk3mZCTY2zO1m6/LfJPydcfviDL9O
	K98QQ9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpdJ-0000000BUgC-408r;
	Thu, 09 Jan 2025 10:19:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpZt-0000000BTpw-1lMR
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 10:15:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862d161947so361900f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417748; x=1737022548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
        b=xZM2bn1aT293JLPqwr1ItfkJ6l57o1Mz+q8bHeNKguMrg6lZT6Ej1fD03uz0jAIHfE
         eaFRVeFYBhLn+SH4sL7xrw26e8JmIVi4q8pAwlKmRqWUr2a37x6XEw3FJ3c0PAyIfy9P
         qhZJnfbl+/+7zmCySF4tILnk4VVGjh54er3N/F4Wl/OU9lThr105FmXjDSTQ0cnevhUG
         eStkJlgzCA5ABA4wythj1VSHsixsqZYee5kiRNAI8cqoqpCydk0/sANNhDmgGSx9NaWL
         XOp+XrGVNJtnCyIqCvqXTNHs8iSj42ZvCRtEJDz7+zuhsUw2Gp+HD4Jp1/HRwksQxgNg
         mRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417748; x=1737022548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
        b=g22APQDcxToNgzmuqAufRl6sls1Ju2vsUbD8/rCJ3lmW8J9cLcYGxdIMV5Bs+AfghO
         EZc1s3LjmxuDAkQUj/3/vimUKBFGbPd2YNPKCS3ZQWXRDXZQHrxovisdeSV0nfBL0pHR
         TrkPHItl9dfTSyRmRnWLaO55jZ95oIH/lDXhjvtp3IM08Rtkb5JXQp1jwQjxBrE0G/Zj
         UvoXif9RHD32Bn7WFtr7Du/g+PfkDfl49LpbAnGuJr9cr6RtCOxq5dwh/SZTe0RBRn9C
         MBFvPDp2aNiEMBLZuKf0s5dzfRV6gXoeG5gECwvsqbO4Y0rfGa5FrCjKD1Ujl8orVZIz
         kwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx2sQbinrNYf8PJ2e7Qlj4ep2g/KVlB6JXxSmzqmqd16GagZL1jxMEBvrHz31rM2svGy91/KJ8CwflmaNVeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FjMX30BFB+u14wm/JH4fpYMRY4/Tzaaxx72FnLu3kMe6eXmi
	1UWX6L/3qTVIGtnJGxc3MkHPAdOAcLCHwU1JP2V6eHNAhE1s6FO1Ygy4UkLPiGA=
X-Gm-Gg: ASbGncv+xTkD3fCbNAzlNUSDVzVS+fqfO8+emHhhDgdYWs1hdKbrQVtT+Xuy0zWtwPT
	LogUGCENYUJUwdLiwSkpxJXTzLRFZiawD4cd2yWVajvUS7ZMzGLI7uBeh6GKFsAlJ913+o5+N8M
	bVzmZ29I1SVS5QJjJJipzjBn96dnMRRzXvhXc0vezinndLHzGkQ/tilfX/BTcSt1aWneLr0Gv7Y
	tw+TOwDCcFZR8XyqGbqmtEUVccavA8K7U6d9ZFyK4dxBgcHTAnzb1OQLEZ2vIRfQ+Zs1op8UxO9
	W3T1HA7RMZJHeLC54rayOqgceA==
X-Google-Smtp-Source: AGHT+IFDFX3nATWzt3JJXgsFxlH2455Ys5367JQMJFp3tUUCUzhjUi2qmO4yXeOxwH6ju4OueG0nOg==
X-Received: by 2002:adf:c08d:0:b0:38a:87cc:fb2c with SMTP id ffacd0b85a97d-38a87ccfc17mr3463841f8f.18.1736417747781;
        Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e? ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e385026sm1389541f8f.42.2025.01.09.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Message-ID: <3506d2e1-d7b6-47f2-b2b7-edc208ad45f8@baylibre.com>
Date: Thu, 9 Jan 2025 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
 <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021549_503599_CFFD1BDA 
X-CRM114-Status: UNSURE (   5.82  )
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

Thanks, fixed for v6


On 09/01/2025 08:55, Krzysztof Kozlowski wrote:
> compatible is always, ALWAYS first.
> 
>> +		compatible = "ite,it66121";
> reg follows.

-- 
Regards,
Alexandre

