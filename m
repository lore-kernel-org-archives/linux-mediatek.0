Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF798CD6E7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCvxB/+dBXFv2rNSKeHbra6jgSQPb7w0QpnaCjhqlhw=; b=p+fxmtsx9ST2O4jTk1/MUMd7gI
	zR0LNvwvkzEhgAJXfTtfvq+9am8GLa1mqt0Lvm4g5UNLh3pzdK7wBeGzUrwyaUfAxptrSzDmdIIT6
	GTSbuUSPUG1z8zO7zvWC2P3eh1tlKt+OfzVvc2Ez0pmDz+Wdm+4+49rFllTgOGn5e2h51QK+t5xpB
	MTdDfceGdCMOHgfjfcLo8c/T+en1yYT7Fy48I0DUnJpb8nZ6hx//9smXJeveu4KN8khXHzS+fg9k2
	OoJ6I0tAwBj6sja2Np25k/hlU8Jv6uLq0+m/kuYmheGpImo1ZlAymrOsDW25vjGJCRBbi0BqlsgWC
	cIbuwCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbIG-00GCGG-1s;
	Wed, 11 Oct 2023 15:38:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbID-00GCCi-04
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Oct 2023 15:38:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4054496bde3so64667295e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Oct 2023 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697038703; x=1697643503; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCvxB/+dBXFv2rNSKeHbra6jgSQPb7w0QpnaCjhqlhw=;
        b=vHaIZbVG3SlKVQPAbZd9EsLTdFNiolhSDe/9XCvHYHSTZ99xZEmuHSbeabZvawKZ2s
         njUw2PNsL/L6FvbweITao2HFGhL47KqudlURQAkY9Y3a2eowyrkGfNvLZLfFUqMfqAMS
         xduW3pFsmC7jeksCWlSPJQe+bIRhPf/ftrG/JOODqW33u22ZSPkYZUMfGra4ZkI+hEbg
         5BIBtL7+ARe42ZV6nchYR8LzAptzi3x5pR5n3pszfGoxg0H/057M13rvc3b0b8GgP10x
         mm5PSfxLSLw6p5uZEC1vCDaOloXB2VklHi/MxlxYXw1SJIqzWQRRD3WHtj+G323WMyZ6
         4oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038703; x=1697643503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCvxB/+dBXFv2rNSKeHbra6jgSQPb7w0QpnaCjhqlhw=;
        b=Vsuh7bjqwC3W1lYK4Hg7gkMno9VyBmbHys8WOBlQ2VHcL/UCBipowZgczjxAvLryLb
         585uX6rx03PniKgsIa0DwWGIp0sf80DSM/7oPN5hd2V3EGQ5ysg4pBXQjEsZxwmqT3eY
         tbQLasZP6MXnZnr559PqVBzWq24n76j0VWb8Yvlyem5vZlfs5Bph5j3YD8eXV/LpjbQz
         V1Deevxpshvyy3E+bMWlgmYnfkDRJNCXQ4T5St+AfC2ygpnBUnc1Ctrt0//8yyqG+TYX
         nhXDjdGQhCfCWGZkR8pTHprzhn6+yO6FukJ2VOOt577ULVTrva/FkAl+CCHmN1/7gGXc
         hGcA==
X-Gm-Message-State: AOJu0Yy+VKumdnkQGRqD5PA5jDwjiDCzwy+5vXhoSxw5JYmnK+txH1TP
	l22xQm97+m/k3c9yFzaGtR0Rag==
X-Google-Smtp-Source: AGHT+IFJ8WJKE7vEKFkfOXPL6F+ZSOLBJaxUlC5THEtjVgUXbUPSwzbmht5i3Ga90Fbbmkh/IFB1BA==
X-Received: by 2002:a5d:500b:0:b0:319:8a66:f695 with SMTP id e11-20020a5d500b000000b003198a66f695mr16591567wrt.55.1697038703102;
        Wed, 11 Oct 2023 08:38:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c248400b004060f0a0fd5sm17104653wms.13.2023.10.11.08.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 08:38:15 -0700 (PDT)
Message-ID: <899c7275-ccca-43bb-b1ae-a3403dd18622@baylibre.com>
Date: Wed, 11 Oct 2023 17:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix translation window
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryder Lee <ryder.lee@mediatek.com>, jieyy.yang@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20231011122633.31559-1-jianjun.wang@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231011122633.31559-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_083837_062437_08D0DC71 
X-CRM114-Status: GOOD (  11.44  )
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



On 11/10/2023 14:26, Jianjun Wang wrote:
> The size of translation table should be a power of 2, using fls() cannot 
> get the proper value when the size is not a power of 2. For example, 
> fls(0x3e00000) - 1 = 25, hence the PCIe translation window size will be 
> set to 0x2000000 instead of the expected size 0x3e00000. Fix translation 
> window by splitting the MMIO space to multiple tables if its size is not 
> a power of 2.

Hi Jianjun,

I've no knowledge in PCIE, so maybe what my suggestion is stupid:

Is it mandatory to fit the translation table size with 0x3e00000 (in 
this example) ?
I'm asking because you can have an issue by reaching the maximum 
translation table number.

Is it possible to just use only one table with the power of 2 size above 
0x3e00000 => 0x4000000 ( fls(0x3e00000) = 26 = 0x4000000). The downside 
of this method is wasting allocation space. AFAIK I already see this 
kind of method for memory protection/allocation in embedded systems, so 
I'm wondering if this method is safer than using multiple table for only 
one size which isn't a power of 2.


-- 
Regards,
Alexandre

