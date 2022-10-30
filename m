Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DF5FA373D
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrESdhTf+ohvD7xti8OA6Uw5cnHRo0bNkMMZkvXzv/4=; b=1l1qmr9ryMZ4GhrrLgJ9KRQz81
	a65sGb2GvfWb7x3ew8PBACORSSAFQ4RtdryNgahC3rYHnSirQo+BOWUov54G0FWs2TJh1I2Lu1/CJ
	C2JZblFRP0badLa2kzITZ/dAi8tYmtPTp5QYWv+0jOxD9yuOWCinoHblX1iUtiInZkuffy2jn31SP
	IvE/dmXZiokYlErPsjND8z+aqwJ0pNny22B6ZmzuczgO2TJYjvjnQfslbCn+W+T8P2862KeWfEdVx
	SSMCtZpg+bwoMdAccy5jL0Rn07elkJaVcGE61d5uKAntzGBOlzrn1ihjN0LRpkjXx49d94C9Eb25G
	bfNNN3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op4wi-00F0K0-KQ; Sun, 30 Oct 2022 09:49:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op4wg-00F0IC-97; Sun, 30 Oct 2022 09:49:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id b2so22809627eja.6;
        Sun, 30 Oct 2022 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrESdhTf+ohvD7xti8OA6Uw5cnHRo0bNkMMZkvXzv/4=;
        b=XCPPldoPImUrN93VgBHvNuASTcusKXWwI3GrzvHSID9zUSdCg2D2FdY1dlvZIqGpQj
         t51wbjbN9deBfA2Q9Y6F0FjYilLwY1LAZW7jqAHedeSss1wUNUTwS75nBTPFHsKnet3R
         SjAhI73Ek+p3W72qWN/+VjVb7R2pw978ObKkS9aX995r3/eNyuaA+5GRJ9CwSL0cvJWL
         ywh2SzcOLIZQVEaU8QvdE3VaRMfikUtTq02cG7qkWDhW8p2UxLyQ7dHqU4dsQvRFdKcB
         3CaJkdiQjr6RlItkON76VjXpgFs/7YsuZncPWEWiaoia0Bs0lYVey8X8Lfs1c7TX+a1i
         rk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrESdhTf+ohvD7xti8OA6Uw5cnHRo0bNkMMZkvXzv/4=;
        b=JCe+1ksTJFk5REAmrHCX7izHcYso3ANvYNQQrBFG1R3zjAd09mSWtzGTzCGlG5NbZm
         gYzBjIcxqz9+fd6mPcfUJ9vSxEbx0im1WWPD4inJ1l6h1iPvyhndA+qT4KK0E22Beudm
         /XXRdk6Ltv9aedb0Euy9+RZOaWOiRdU9y7/0Jk88y+/L7sBSQNUsuu9j5HZvIwIiZDcV
         1n3GdahxN1ZCWV90cO0JyrlRpTk3XiG3yZ13Kp3E3Y5mGVxXXaOF+NgO61CAREh1MemE
         9hqBKMzIritr7F2wifnjr/B8O8+QjjwNd5SkIQooUAKITADGoJmuaQ30uvRvHwSKPiJ2
         rW4w==
X-Gm-Message-State: ACrzQf1CkKheXAOjw2FPxOrjL0x8JNkoBMjUAqKSa5jWlUw1XTgB3JFC
	V6uG8lyP5jvrEF71gJBpiCE=
X-Google-Smtp-Source: AMsMyM7LXJPbJfwCst2+OBeGHE3sUGrmmMgHlv73Xnbhlcz9oB5xVLivRHIDUAjKFEfx4+i0M6n8Kw==
X-Received: by 2002:a17:907:7e9a:b0:796:7a21:1520 with SMTP id qb26-20020a1709077e9a00b007967a211520mr7581144ejc.236.1667123371124;
        Sun, 30 Oct 2022 02:49:31 -0700 (PDT)
Received: from [10.32.3.204] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906328a00b007836d075152sm1672391ejw.187.2022.10.30.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 02:49:30 -0700 (PDT)
Date: Sun, 30 Oct 2022 12:49:16 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v4 08/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <4M8KKR.ECH2308DQOMN2@gmail.com>
In-Reply-To: <f5bf36e2-5be2-cec9-510d-bc99bb9b6bda@linaro.org>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
	<20221028153505.23741-9-y.oudjana@protonmail.com>
	<f5bf36e2-5be2-cec9-510d-bc99bb9b6bda@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_024934_344723_0BD09406 
X-CRM114-Status: UNSURE (   8.51  )
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


On Fri, Oct 28 2022 at 15:58:30 -04:00:00, Krzysztof Kozlowski 
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/10/2022 11:35, Yassine Oudjana wrote:
>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>>  Change "subnodes" to "subnode" in subnode description for better 
>> grammatical
>>  accuracy, capitalize pinmux description, wrap all descriptions at 
>> 80 characters,
>>  and remove literal style indicators from descriptions that don't 
>> need their new
>>  lines preserved.
>> 
>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  ---
> 
> I propose to squash it with the one changing description here.

You mean patch 6 "dt-bindings: pinctrl: mediatek,pinctrl-mt6795: 
Improve interrupts description"? If yes, would that mean improving 
descriptions in mediatek,pinctrl-mt6795.yaml then pulling them into 
mt6779?




