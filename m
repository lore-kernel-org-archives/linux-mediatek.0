Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54111C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/ebyNNdcssi3hRRYLWpmNEf5xWYN6pzQQIYvDfsfC0=; b=b4eLNS0Dvy/cNaSDSzD4nj2zHr
	DB/l6I6ve2Fmmp8Q2vMXM4Z8cWVbVGWI31JGe8aK1v+qQST+InXGY9fezrMT2g8eNOiXqTESIqvmC
	fEky3c9zMIkpRc/e4xC7CaHuvXRltGVaSAjQE+Vr8D8eMJuj7mXRtfJOY2G725uavni+zlub5ZpsN
	S8mNnOb1Gy6Lxku27yCVnuTftDquFGkx0vbyy3k6JGuRoRxdPQe5T4/dsiL5SSXx6hOmgveLC+bnx
	lmUtqtp7AZ+uHnDb3tWxZr7fwN8zt6PAvfAgXbaK/F3l2xY+0TS34muE9R+FpC+Zh97pfibQm0i4X
	Qw3ihfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQAK-00EY0B-9x; Fri, 11 Nov 2022 09:17:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQAH-00EXxE-PP; Fri, 11 Nov 2022 09:17:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id w14so5639020wru.8;
        Fri, 11 Nov 2022 01:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/ebyNNdcssi3hRRYLWpmNEf5xWYN6pzQQIYvDfsfC0=;
        b=qB5rci9QMrKNx876F44YgKr3R228CBhLq9v3pbCwJc6tBdSVts7vh42/c4ZMxGiZgU
         jgjCfPMbKLRruHboDGI616o2VvVtcMZvEWRC9N8fX/ZyRMyq0+O4obDGn5xrnsqrIhq1
         NPHu9oISiqsywzGBKOTzIm631IKK2fwM3sgRhvs2W6lTsvJe+sg42I8Yyzs4tHI8prRW
         My070S3eIN2kiRBRO1x79gFnoLJXChcxAdeWJxYyJ85VvXHZJMkSkKxnMx6qY/rCJ6Ig
         nLQoPH64AbanLHHPC/pKYCaH6H2zAsupzYr7G+fMe3JTj9GG2ddz62vT33uvqzSbXPfq
         KR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/ebyNNdcssi3hRRYLWpmNEf5xWYN6pzQQIYvDfsfC0=;
        b=7coWXMduDP/w8xsv/1clI/xMdAghpD15FOXEmREgPS6Ga05fojrlZ8+XZh3/fnz8Qu
         xuP9JHTLgJ4n3SjVSI2wDXUDyq2/InLZV4BW7cBxXYIb2uRfWnqagjLBghwZZb9/OWzD
         1BdqImZrgTmT0Xy3AE5P2tz9xXIboMka0ZZpoI7Tw9hEFhkcVVqdWG/p+uT3sb+9wZ3r
         3sYDer8t1ALpiSejwqjpJ2dJu5AmFQpVPLRlqEHHjWoY7+wWRkga9jJ+HHKzhVwm/It0
         m/AjjtgugV3hKZNqqpb6Icr0zDgovPbPNq802GzsSdXtTqORU/ZihCN4f2OhEEimOcOY
         1PQQ==
X-Gm-Message-State: ANoB5pk3Nr6QhyAhn0D3U3sueTXfiNixklSjvgfvGOqT0ORgIFDzIyB/
	0fj31zp1IqBIU2dS+QjML2Gr0nD5EQMe7A==
X-Google-Smtp-Source: AA0mqf4mn3Vis0rrN5zFsq6rDmS+s0zkcStXU1hOp+ETfbY9sTiViasujU9Aebr+C2Vt5S6xmmK25Q==
X-Received: by 2002:a5d:4ec3:0:b0:22e:3180:f75a with SMTP id s3-20020a5d4ec3000000b0022e3180f75amr672361wrv.340.1668158250141;
        Fri, 11 Nov 2022 01:17:30 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b15-20020adff24f000000b002345cb2723esm1390242wrp.17.2022.11.11.01.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:17:28 -0800 (PST)
Message-ID: <a34fd2d5-b7ed-2fea-7a6c-acc7659cb001@gmail.com>
Date: Fri, 11 Nov 2022 10:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
 <trinity-e9c6aa94-6656-4d9c-9d9b-90ede6c8e6fc-1668099812662@3c-app-gmx-bs29>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Aw: [RFC v3 00/11] Add BananaPi R3
In-Reply-To: <trinity-e9c6aa94-6656-4d9c-9d9b-90ede6c8e6fc-1668099812662@3c-app-gmx-bs29>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_011733_860227_C803666E 
X-CRM114-Status: GOOD (  12.00  )
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



On 10/11/2022 18:03, Frank Wunderlich wrote:
> Hi Rob,
> 
> can you please take Patches 1+3 of v1 into your tree?
> due to reordering in my tree i missed them in this version
> 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=685798
> 

They should go through the subsystem maintainers trees. I'd advise to resend, 
dropping the RFC prefix and add the corresponding maintainers.

Regards,
Matthias

> pcie-bindings are here:
> 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=690172
> 
> i found 1 error in bpi-r3 dts (properties from sfp1 not plural) which i will fix in next version and will drop
> the compile comment in dt overlays.
> 
> also i've found this commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2
> 
> so maybe i need to rename my overlay dts files to dtso?
> 
> maybe the others can be applied (at least the mt7986 nodes)?
> 
> regards Frank

