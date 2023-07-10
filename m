Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA275C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+TLvPFhBy0VZnH7T1qJxJl1HxW6ZD/qq/fnzKOm3lg=; b=vbk6EGwY8X2Hn9Y6NWLqw78ZLe
	m2lVK90ZjDzSofgr25gxxfaRNniFliF7cTfqxl7Nyq6m4xViMuMyA3wrl/JYzBMy8EmvoDk7R1Pkv
	VmwYsW4sc1qC3MbrEskSgfZf1IEKYOyLr6qGRRNRxPvIlr0M781hRx3BC6Xr5XHlmo+oKQ+P88LzX
	A8ZFypGzLnAhK87qw9CvO5fvuOFDGyIatlV8ejgUaBPSIq4d3qzBYwc4hJLJaYIY8oeHUWgd/0/fO
	JZEEq0v9E3vobHp/biupgVfkHKuQdBgvXO+JBUNqfcnALVLaL/c6ULWKsJOtcl3VY4g60bqIkT6ut
	rCFmIK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDw-00C7Kt-1e;
	Mon, 10 Jul 2023 15:54:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDs-00C7HQ-35
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:54:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so52209395e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004486; x=1691596486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+TLvPFhBy0VZnH7T1qJxJl1HxW6ZD/qq/fnzKOm3lg=;
        b=EKLidUAYuZqZn3qp1dUjWlm2DxvKzKwB7D7K6DaZP+xN+3JCwWc7oEHv4jldB3k3rr
         weY4MbI5L2NIAirxPFueNE7Yz7PYbWJD+/dMZC/owxPXra8uc41ZpzZTge9PBUciEtO9
         gxcJT/DLFwSf3AM6hzhK4MXqtPwuXsle6sMO45gOTVn/W3YBZIeMzmCsRK0NRKui+T2L
         rW8lxeXhrPBKAPSYpqubOGQvzgx0WEWh7JnSeZpEhIonRge1GiYWvYB6EW/A05Rs9a97
         X8M5WRiBBZEB8eaHNhzqwSGmXNLg9VlPkRLshqRP1ayIk84j9npdEbj8AS/J4yn8yAxi
         sFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004486; x=1691596486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+TLvPFhBy0VZnH7T1qJxJl1HxW6ZD/qq/fnzKOm3lg=;
        b=YcfIBcP/wpIkiyh0sr74i3MrIjLdLuxA3msN65gEeFYCThTq/uPtSxTzWBctnlgCX+
         YTRX01gKtzXeyPfYoZ9VWVx8t3DPDa5sRS0mZ5KxqkZFdA/dZCvbGtsYCknPPGtP5fdI
         cI5iCd2zSxKDmKKbVwWg9NWlGqQncV97WZPy30rGvfAPrvZg3AXDfyhTYJCF/H6Md/rQ
         h3DhBaW5r/xm678N158iA2XP4pNVGdDUXUCk/esXSEAMGam6z0jFNVYC7wso+JGj1Sj3
         70YynrZ8pGVOjHBGjr4vKnpSupfIg6LO4Q0YgJlk9NpwAXgKqDU+vZxG6LWFfrvZ8Cq4
         euRw==
X-Gm-Message-State: ABy/qLZhcIRcwBxuv+K+Mjn3YONXbw2W6nq+cY+v0lEZui2jDKQN07W1
	S5Em4U9g80JwEdd3xaOL6BcEOQ==
X-Google-Smtp-Source: APBJJlHKZAYdKNWF7zxUjdZaYyNJ/9cmV19/PYxoCgu9UK9zQy7GLmvhMxO7al1IZEypAiDtH1//bA==
X-Received: by 2002:a7b:c019:0:b0:3fb:b3f8:506b with SMTP id c25-20020a7bc019000000b003fbb3f8506bmr11600743wmb.24.1689004485634;
        Mon, 10 Jul 2023 08:54:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c7413000000b003fba137857esm231670wmc.14.2023.07.10.08.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:54:45 -0700 (PDT)
Message-ID: <00522cf2-c90a-659e-00e2-722c4ac0244e@baylibre.com>
Date: Mon, 10 Jul 2023 17:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 7/8] soc: mediatek: Add support for
 MTK_SCPD_STRICT_BUS_PROTECTION cap
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-8-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-8-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085449_021960_68211E45 
X-CRM114-Status: UNSURE (   8.94  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> This adds support for MTK_SCPD_STRICT_BUS_PROTECTION capability. It is a
> strict bus protection policy that requires the bus protection to be
> disabled before accessing the bus.
> This is required by the mt8365, for the MM power domain.

-- 
Regards,
Alexandre

