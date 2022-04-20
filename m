Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D8CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWThh3/nGHz8Pgw/3RXs0hFjW0LABUXMZ2id0UpYD74=; b=3Vvfd/qg5Oy3ez
	f99Nd/VxsFD/WfemuIPXcex7dczYbrV/sLpIWyIdtncYImV4bcVW1ywg3exixJ0I63yooPdFtJxqA
	t1Aby3QJcgQR4I1Zg57uFeInJlqMhpSIm9r8kgU5Y521Or/QPro9uCv7907KAFyFyeWEJoBj1+D9Z
	657H/kVY1TZH0kXa2OUfA4JFS1hHKAjDAgq4BFIBhxhQcGV27LMrP54sAjo7sldS/aOh2IayyEQAf
	f1GrECQstfRHAxQ/EGhBH/i/nhugBshcKDeTx2JVY1SfgI6iD/Mdxoj7KEaMWp7uiSc0rGA6HCgfM
	wfum+A7CYvWIFMl7iAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9TV-008ylM-OS; Wed, 20 Apr 2022 12:30:25 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9TS-008ykT-Ne; Wed, 20 Apr 2022 12:30:24 +0000
Received: by mail-io1-xd35.google.com with SMTP id o127so1607991iof.12;
 Wed, 20 Apr 2022 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=Xz4W3uwgD5u7Fu/Wu+J5mZSSF4lKujDTVil1iZmmtI0=;
 b=jiXOEm7c4DvyxPMX+4yqBD7wGBJv9Ewoltv+il6LimSG4Haj/7tvVkrCwGc0xwaQa1
 oVlmphccbWXZ9mBwyGpMSdlL7ql3ipHHx9eYVwwhwLIn9yHgLAsZ5KG0EjfRuGHvbURT
 Jk2mJEb+gX3gKQZYDqkNxs/+rZnPzNakkUPj6FUqEONVZddB+UcrDKWJw5Vg2Da9ETCR
 ZjsYChmV5TOc8tq8kQaM4Ml/P9HDzchKNz5jnt0jvg/zClSDiNIv7yiqmKckuIkyZvUF
 +EMDhCjJkH3vcPHhSZE09CwWyQHr7JWxEdzzJt8aSVmoCuwZHNJFFnmCVh4tF8gxbDr8
 depg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Xz4W3uwgD5u7Fu/Wu+J5mZSSF4lKujDTVil1iZmmtI0=;
 b=KxGrnfvWrok1pZZs1Tx3ERnRL8E4BipkrDVibcFhrOeNp5NCTaYSHX8PR1ZqyrPSlf
 IWCzPOOBKzPMVAaWPo6vim5Vn84CnxKgYX998/46PoYd91MJM8Nhiyf90ylXeqZpM7vb
 H8/8cU2QFhV1+F11mCqxaDrRf1ENTlnXxECTKi/j0QOU3eMhf1LafXdtuqoGDBUrlOX1
 Vc317qiKVJ8/oJZ9nYw+k6mwrXd9MKAgenJNKkqwecSQJxdxk+6x+7OT0ZAtmbab20hF
 056SK4xK6RjVg1EiIftOPviHa2OTc59uXab9+lz1iM99IzvqtF3RHuNeTnkox+K3EiQY
 6shQ==
X-Gm-Message-State: AOAM533WTN/z6mESCFUxt3ez7385X6ZlWp70h6BczA9eO3iKL82YzylD
 Mtt2ECB1VmYF1LQlCAPYOzE=
X-Google-Smtp-Source: ABdhPJwGRhXFbeJvDhxNl4PQvkHxnDazuTIyslmonAXkW1GqI/MI4eYUOWbmDbDUpAOx49PP1iJ9aA==
X-Received: by 2002:a02:9a07:0:b0:31a:2642:9e1d with SMTP id
 b7-20020a029a07000000b0031a26429e1dmr9739495jal.159.1650457821518; 
 Wed, 20 Apr 2022 05:30:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e203-20020a6bb5d4000000b0064dafa0416fsm11356904iof.2.2022.04.20.05.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:30:20 -0700 (PDT)
Message-ID: <3c24dbdb-7677-bba6-685a-43293a01e777@gmail.com>
Date: Wed, 20 Apr 2022 14:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: mediatek: Convert some docs to DT
 schema
In-Reply-To: <20220419180938.19397-1-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_053022_839268_01A3A136 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 20:09, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> This series includes DT schema conversions for topckgen, apmixedsys
> and infracfg bindings.
> 

Thanks for the effort. Regarding the bindings Krzysztof mentioned should go into 
bindings/clock/ directory: please add the clock maintainers as maintainers of 
the bindings.

Thanks!
Matthias

> Yassine Oudjana (3):
>    dt-bindings: arm: mediatek: topckgen: Convert to DT schema
>    dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema
>    dt-bindings: arm: mediatek: infracfg: Convert to DT schema
> 
>   .../arm/mediatek/mediatek,apmixedsys.txt      | 35 --------
>   .../arm/mediatek/mediatek,apmixedsys.yaml     | 60 ++++++++++++++
>   .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>   .../arm/mediatek/mediatek,infracfg.yaml       | 79 +++++++++++++++++++
>   .../arm/mediatek/mediatek,topckgen.txt        | 35 --------
>   .../arm/mediatek/mediatek,topckgen.yaml       | 60 ++++++++++++++
>   6 files changed, 199 insertions(+), 112 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml
>   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
>   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
