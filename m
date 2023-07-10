Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D829EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abv8RbjDLsB7qEHaf8MGMChzo7Az5wZJp4aotAIPofw=; b=ELqPILVvfXN5O61fNA6nNNaJW0
	W8NK5PHFbnWkWjer6vTxoQy2B8vLN47sjKPZFNAQIiN6ttjKXImDAKMlB2sqmpiI9oFtm6j3SA67R
	8QP1KDlO7ptP5ZYcBJtlny2C6IXLy+IZIg2bm2/UFBXYbpuha1s44aSRiodIAhWDedA8mWeMPrGBq
	NRTsQyIWq/js4t10lAbFN2aWdQBThd+8oM13CrDklB1jC2dcaFfeSLNDpNF5+gPI+TgpFZ9+NmWGd
	L4hP0HfxB/EeOdelWiGtkovqfP3y25sUv2S9d8rXQSBypAjtzVXPAaY9Ozs1d+AakV9y4TH1fjgLs
	ERPlM5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqPi-00BfGL-2Q;
	Mon, 10 Jul 2023 12:54:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqPf-00BfEh-2J
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 12:54:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3142970df44so4218100f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688993685; x=1691585685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abv8RbjDLsB7qEHaf8MGMChzo7Az5wZJp4aotAIPofw=;
        b=b2IwCjppmUDIKW7ZIaF0KTVBe2UZDvxxN/b3hBOykv4/OjDBsrpSaTVMty/DwdZd2g
         d3IiIqQUVBoiIw5iq2qhak5rlUTZKp60BPw7nfrdTWzkeQndrdVBPqyje40q8Aty2vU5
         hHO1PV5Aui/ycRm4xA/lBcY5kJCvWU5VOwcEA1XjvzJhGvnJE5o7JxtA+JzppYUfBb5S
         5JnyngwQbPD0GF4/WltI+XBcw+55akHyWsyxPYuxVncUx15DQXHMJR7QGYEXDvv/aKIx
         jS2e01lA/HONXz+/9XytOyRNrPd8c+wa41F1g5TM37u+XOQLLksG/dfsyIkCA148DLNP
         NfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688993685; x=1691585685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abv8RbjDLsB7qEHaf8MGMChzo7Az5wZJp4aotAIPofw=;
        b=geOfDxCAqywVTYe3/pzVBHO2FHQp/p6PbXuHAYz3gnaX+wplRau9yQq29QsG5zw5ty
         diXhZKixxxsF8nyeAmbTxEHJzSA6fvt5JljdzeV/t3QHpjV+A/h5veWlkyvFwIqeQqSg
         z0O1kmelc2r220WWfSSl9VrCANKcq3K5+5XjwHNG/KVEV/ci9wQzvu1ey+6j4b2hKhQd
         LjXjJ+FmCVbOVffgXNmieLyXOLNQedao3EnOB0gxKK2/De/HOoybCWe4oXfF6dvzpP2r
         KyJfpx4YoeZne5vxMNWWAQO1S3elogf3TFOa0BT2pbmnEDQzhMXImbNwcWYckv6tE9G+
         aJhg==
X-Gm-Message-State: ABy/qLZ9QKW9KocmnuR9UsP1SsSEOW5V8R5yT3DniOX30F79T63ju1Lj
	CCiKkOThT+oe1bC1BonqFg2t7w==
X-Google-Smtp-Source: APBJJlHCI4auE2IEOjXBCxZiOjauKMJU0L917s49nJJx2e4LjmSAQnLYSQYOsSTxBjhnt4Aw1NVolw==
X-Received: by 2002:adf:e34c:0:b0:314:3b17:d7c5 with SMTP id n12-20020adfe34c000000b003143b17d7c5mr12183853wrj.43.1688993684720;
        Mon, 10 Jul 2023 05:54:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600000d100b003142eb75724sm11636974wrx.24.2023.07.10.05.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:54:44 -0700 (PDT)
Message-ID: <fd1c1034-c54e-2e9d-0c9e-f62b0bcdc3cf@baylibre.com>
Date: Mon, 10 Jul 2023 14:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 1/8] dt-bindings: power: Add MT8365 power domains
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-2-msp@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_055447_762609_8A701C9C 
X-CRM114-Status: UNSURE (   6.12  )
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



On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> Add power domains dt-bindings for MT8365.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

