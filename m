Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74E1C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fDUzTpaD/GTmyAtwno6H654DQCka/Z8x1UqVQuHL0U=; b=h6aJAXZRl9yEklJZfmdwGnKGwf
	oofSmUSctNAq4WwroY7sPzGvDAkVvSqrnE5BuWD+shhQSLXobkiMVbvqsKF0yuR4QZbsXpk/+X2z6
	ECvFf2dceoTUXJJr/2m4/vgGlQYhTWft97thJo0HJbyEL508a+TEeUOtrCiW1xA3nUnpg7GQ2MSwo
	m58Ff9VhfTmdj3hbKsW0OeloYJJK/67Z4IIo+o36lS9gFt7yl09uQI/XlpDUco4rUYOn7BF5llMvQ
	7tSEqIzSCMCZAL+yQYI11aojKNDlpMJadPWoF0pwEB044/nJYhc/7i+cUfRMf96mX19vEDWr2WnFN
	LsevBf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XIV-001wjI-1u;
	Tue, 06 Jun 2023 14:04:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XIT-001wiI-0R
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 14:04:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30e53cacc10so198842f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686060267; x=1688652267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDUzTpaD/GTmyAtwno6H654DQCka/Z8x1UqVQuHL0U=;
        b=VjYSvrccY2OgtD7RCiNqCRothioaXTvzS0GzfX1luOT97zsSBHWxcKuQHU16bSxqqz
         vgbUo4q/SOkwJGdrBGaj7T7VfYFygwL9oUD633g2PnL58nPUSto3S8Orf/5iIMP7Kdlf
         sDFAIyQFeD85E/vhG25XXL32SrGf8AEmII4TyvbTWw2jJrLEfGcKCn10IAX2dyeiuMaS
         RiBl0IUMW19gxslfXn9L2cvM4ay7z+zc4rg3tfTo8CXLsyTe7YYwhMJ7NbiTC+1aIQkj
         oB2L1iQmeCR93sDMU5EsJ7SF9hdS4wR+xs+hR1HQt1j7eJDckxLm+rhjNpkvPe4J6ZVf
         PLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686060267; x=1688652267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fDUzTpaD/GTmyAtwno6H654DQCka/Z8x1UqVQuHL0U=;
        b=cO7K7FiTtIJCRtD9n2PSDiL7RmqXoLGHgWur8c2rxJqr7Dn2OgZjdiXhstBYL+Qy1i
         FPnMYKKno/4PmShd14lvaYz8gmxwccgcCq6R6utTFqk2OkYoHaoKme0TirxOlCeEL4fg
         0gDPO2Emyz4DTRmoiLmegpcSWcuxBZ3EQCB18jtE1cCXIVJ3/Uxg1lmnQpjBCiuJq3MM
         n05sy4mLl8oHFiiQm/FqC0Ga2kIf2l14MV9h2t3TY2ApKyXLVtc+sOJcXUYpJRXEVVHc
         0yJOFKbM5GTKw8NAqNrvHJ1skIO8Wr8LfpyJMzMe5iC+cmpAJ/KTS6DNZwqaelzPlUY8
         b/Jg==
X-Gm-Message-State: AC+VfDws6nQ1U79uhPz2A3sGUbiVkJq+LtrkUwbnADhu9kRM3fVj2pmP
	Sj8TZSYJxwlf9pK0NF8D+oSolQ==
X-Google-Smtp-Source: ACHHUZ65YDUp3H7WFvUIjfgRFCS2KoaePCRCWSZaPTCc9TjMDlxD9G/g2wWFJ3nyES0QN9B8wJpQoQ==
X-Received: by 2002:a05:6000:4c8:b0:30a:eeee:2fba with SMTP id h8-20020a05600004c800b0030aeeee2fbamr1937111wri.34.1686060267488;
        Tue, 06 Jun 2023 07:04:27 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b0030630de6fbdsm12677603wru.13.2023.06.06.07.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:04:26 -0700 (PDT)
Message-ID: <5857ffb3-6ca2-8012-ed9a-9278c71361d1@baylibre.com>
Date: Tue, 6 Jun 2023 16:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 4/7] iommu/mediatek: Add enable IOMMU SMC command for
 INFRA masters
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230602090227.7264-1-yong.wu@mediatek.com>
 <20230602090227.7264-5-yong.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230602090227.7264-5-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_070429_178794_5DAB3371 
X-CRM114-Status: UNSURE (   7.39  )
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

On 02/06/2023 11:02, Yong Wu wrote:
> Prepare for MT8188. In MT8188, the register which enables IOMMU for
> INFRA masters are in the secure world for security concerns, therefore we
> add a SMC command for INFRA masters to enable IOMMU in ATF.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


