Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BA6CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 17:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=; b=kIwkBdkxabVx5CznqZsyoFqIov
	UG8T4swblaeHH79B5K2FCvEknGcSnh2/lM97iFjTd0Rs4MagYw732Wt2lUK2IMmvK6mPjnEg26HWp
	naFHzfH5xfClxbAVYuwrvnrfebHVsdnM5dftomtAZDz5kIezmCJdrJtgi0efJMpKJ4evbhfAvR5Bt
	dO2Qc6Xki2K4mqf0JRyc3FaeeDbSV/Wvmh3v3PRbXXESxQKCJGhj6k0v1Qt1HfUH5I5V39jGWaOd2
	FTTSs0HHoWNkaDIbnl00b67Ulxv3LRcJYDM8vdg08xyMi2FhG/eDHUlrAUg/wWAJnyzPK1y9JCXCU
	aov2X88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6Yt-00BGQy-1G;
	Sat, 23 Sep 2023 17:36:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6Yq-00BGPh-0v
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 17:36:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-404fbfac998so44543825e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490613; x=1696095413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
        b=yNw+EFRUkpbGaRQvW3fsXItvSZbK1zkh8KqQDGfyjHJejoaGMEB3t4pSHg9Y1Sjc8n
         V7TQ7rxEUwIRN6VLHQNw8G13M9hIE9iybEt+YkAmoYB06z+I/RHoIEpcIEq5R763eG7O
         JlVOPqAkk3vjR8Uex6WYPor4nzXZu6YNl597UNWJpK5JjqFEpglMtDS1XZtNypB01gj1
         poqIKAv7pI3zfrzVq+ke3ejpqH1r0HoHK630FBBPxNy5n1Fse5ozMADFk3u4xncE1dXL
         NyW2ltAJW4+1JB0BCY7aD7ilHTt8Z6k4yLky96QCjsuafqOGuus7eXhZDE/y3Q4Ccewp
         TqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490613; x=1696095413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
        b=YSOV8+9CgFYzIcpD6ltDcgxquniWBTaL2MyU2pU6kckuj//lnjQg8P8h3OAMkOborX
         dBXI72dOK6tK3iBNw9PpSI0GLyv1pTsE3UZ0zVf6GAigWu96FdrFwkOKoFwPwiqvgXC3
         7hiZpy3rIImVz6+83TufVqj8VoW+Yo0WNDFSkiVo0nItQRI20bwnSR5ZFObbHWWs9YQp
         5NvDFUJiHclfhdGmXhM+Ymc1dIk1fTIs2UTtVrlES1/hvK5FvgV18I2jNgTtNWXicQot
         FCZ7tEa1B7ego5iLdSeu/hxmmGTLQdrpfqv5eNKopGrd7FRATqsiwji4YqlBUWXTs6qj
         c+bw==
X-Gm-Message-State: AOJu0Yy7o4g3pOvdU0cNg9epZciiS8g138j//Tt9SKMMF/OptGrvIS20
	kTRWG4mnpbK4ef1LatFDg7vlEw==
X-Google-Smtp-Source: AGHT+IEvo9mHZh26ly7OkIqoP9oOmRajb274z0zwHS+GCNlpI9LxxNC0Imkzhh9QWjYIELh+B5vy3A==
X-Received: by 2002:a05:600c:2101:b0:401:2ee0:754a with SMTP id u1-20020a05600c210100b004012ee0754amr2397634wml.13.1695490612950;
        Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003fc04d13242sm10682300wmi.0.2023.09.23.10.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Message-ID: <4f15a450-4344-ed5a-0504-9a2f0a9daa0d@linaro.org>
Date: Sat, 23 Sep 2023 19:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 00/16] introduce more MDP3 components in MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_103656_321358_A709F1D4 
X-CRM114-Status: UNSURE (   9.79  )
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

On 22/09/2023 09:21, Moudy Ho wrote:
> Changes since v5:
> - Rebase on v6.6-rc2.
> - Dependent dtsi files:
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
> - Depends on:
>   Message ID = 20230911074233.31556-5-shawn.sung@mediatek.com
> - Split out common propertis for RDMA.
> - Split each component into independent patches.

And ignored previously given feedback. That's not the way you should
work with upstream community. It feels like a waste of my time and it is
not fair that Mediatek is doing it :(

Best regards,
Krzysztof


