Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F78E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i651SpluW1MRI3JjFDP6kaKt8+EEESD/wqEDYw6jbG8=; b=1bAQWXIu4tPD0SyIq5HR6FRZ7Z
	Qnn9keccEGaxEb7zEaULN2TiD14sbbrxkjmRTpyGO/bti56HvHLsCpX/OYbcE0D9GRbRss3E7EREA
	3QjTDtk6tv5hGjIdIpahUrDNdMRIfgHkwV9xbJJrPXTdFUJ2iMkPgtEGyY+s0SoIar/1pKEeeHzV3
	HvNNHfHGquGTpB9bYMRSxBsJ3d23rPncp7Zpvvz1014b0Ib6NWwY52o2ZCk1CZphDess2Nc2eL+pL
	pqSBCzx7BIdoLwNNaAsBJBxuZpF+b9gRBD1mfC7vD5mJkhJVdbo17rZLcwgmSlAVqhHzVu+6HgUKZ
	SYUwiZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpax-0000000BU8z-02Ke;
	Thu, 09 Jan 2025 10:16:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpYq-0000000BTYW-3uyK
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 10:14:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385eed29d17so354586f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 02:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417683; x=1737022483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i651SpluW1MRI3JjFDP6kaKt8+EEESD/wqEDYw6jbG8=;
        b=ZMQE5tnFasP008aFumBKf77Q7UDlSn3oOthPX62R7O/rT4FVc1Rb93u0i/9GJSypuB
         lMPzLb4ihVttJe3/bbHzIghSQ+x4uXjFqAzrncr4jy6rrk0JZFyJaJ+Ci05KqbzP19kB
         M7jh0j4PeTxMM0lMb8mKkQmoblRIdDhZulYwws+iRTeeTLuwgxt+xsjl6eFb2ySzwQpw
         kXY9V6N3gv87je6sUS/xnZ8YLI7sT7rNpXOYGPC8H4USjvJmM4JESyVK8nXyrJidyPVD
         jM62gNt6pSXgCjoTthmExVGWBlKTpJfs5r/haRpeEvKv5RMKY8kE6jYp0vOKm+hlV/LR
         jdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417683; x=1737022483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i651SpluW1MRI3JjFDP6kaKt8+EEESD/wqEDYw6jbG8=;
        b=Z5eS1smf9/vr2K1QEZmemX0+VEMB5cwFqmaeXCcmR34TMlXQT/cFXR7lEtzhRXy2t7
         TGfTx4PCg1hWUlFOqoiVHbAUzogKZ6bWbSBVCb2dznYPcBNlv5n1gBEr5UY4fJ2IwBOm
         x4Dltw4HQlU3sNZh0rVUWHaUB9nAd4NuOcqoAjnra0p3/npEai1aZ+LqlUrx415WXALG
         Eyl/jV7CGEYKnuAcCBp6UZXUH4LUQb2dg2BfMdZOAEsFe8R70RM8mxGakwlVr1K71G/u
         VsK7xOMbckoMAdBri8ra1+e8N1/VA2rU24u8NQemZLb2swBsXb5PAiMkKVQihIImxMFW
         rijw==
X-Forwarded-Encrypted: i=1; AJvYcCWPU4Gokrq4rk3dAl64+kXw3XKpICZ9RmFEgp3XmhMIQcbTQh7///bghuRnijWuIxcyGtHD6AMttAiwYmfjHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yylb02RWUU+7qeLQAi70XQn9vR1r7nupdgDWbormeKDCiUFPiR9
	vLyJlP3cnGcL8dhGyl/nrFocL9NDid7uRzSFknplllv5Sg/wKbUT3Qzu5tn0pUA=
X-Gm-Gg: ASbGnct51wUNM2o9lt4IECczO4yhFG4Z55JFiAMUqr8O5FD9AtT6PBiS8FXg5j3KrY7
	yZN3S49Ie6DBzXHlv9OoPY/PDuRVgBlypgEvvjPvHPCTPdLX3W3Lc5wzofDybNOfoq0HzLlV/eW
	yCy5AhdrqDknrWK0xqIbDD/rJWlXmVOtmrlEsnZ0R56L1pN24rhhHhYXoqH2udWuv5snTaTdHgd
	pe2pbXbPon7ig5GiIn8A1788pVjcOzq+0sri4Kv+NjkDJSyY6v2wutCf6ESlnhuMt9akjecgoGJ
	HH0cUV7S9kDO+3Ykk1hOymGBnw==
X-Google-Smtp-Source: AGHT+IEXsj3cGfTM3WuiOcTVPO3qnoxJJ8qkHw0f0Dnd2kBWv/CZsMscUjyXI2o0KFisYvaJanIsLA==
X-Received: by 2002:a5d:5f85:0:b0:385:fdc2:1808 with SMTP id ffacd0b85a97d-38a87336ee3mr5496376f8f.40.1736417683201;
        Thu, 09 Jan 2025 02:14:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e? ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm49767285e9.20.2025.01.09.02.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:14:42 -0800 (PST)
Message-ID: <35868716-a80a-4cb7-bc59-35ea6263546d@baylibre.com>
Date: Thu, 9 Jan 2025 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] arm64: defconfig: enable display connector support
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
 <20231023-display-support-v5-4-3905f1e4b835@baylibre.com>
 <6df0f935-b7d2-4961-a947-47b328a3758f@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <6df0f935-b7d2-4961-a947-47b328a3758f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021444_967451_206A6276 
X-CRM114-Status: UNSURE (   6.62  )
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


On 09/01/2025 08:53, Krzysztof Kozlowski wrote:
> git grep -i i350-evk - zero results. Please use some recognizable names.
> I have no clue where to even look for it - which vendor.

-- 
Regards,
Alexandre

