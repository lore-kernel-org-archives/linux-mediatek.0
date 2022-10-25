Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878C9FA373E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bq8bNdyAl5co9FRYH86QFP+zOKhtTWspptpU7rpeE8=; b=F5eISIA8iMq8iU
	AI3H184jbdC4Otv7InB4mwCOvyMT29+ITSY3fZIKj0LO3MXsxd9ZMB1qk/5qgbyOgOqoiTKbQnAu3
	qBePk5Rgkhu02TasrxSNRSI2FcatU5dfWB1lUUAZND9f0tXsQN4/g5s8TiQ/b6CYFatqjzcuBYPRm
	d9xhq2rbljhiRAubQMW+mpAWBqd6oIRwAnAlJWmwb59q8UbO82vVqLwcByuLvfAUi9ReguyqG2JUB
	GuLASELpbhXQtZwYXlvNns8NQBA5U4aGgdu5OL4bXPfjtMd2fbH+mj+mTIRokkRAjiH9L64xyf6gC
	pheJQIAshuk/VoHkB7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onPhw-006v1I-Ul; Tue, 25 Oct 2022 19:35:28 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onPhp-006uxz-4L
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 19:35:22 +0000
Received: by mail-qk1-x734.google.com with SMTP id o2so8879759qkk.10
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bq8bNdyAl5co9FRYH86QFP+zOKhtTWspptpU7rpeE8=;
        b=c/tvtk3KCyMvg8pBI+5+7wb+wpn7cny5S+BrrgEzKB8h0AyRYzM7tvDTTENYgAAmht
         9ZLGU7DFL5tQQ+diKV+bqbWTOvOCpu/aYL8ub1/huwmjoj5wbVXtRcWqYBl6VK6vyjoU
         orDIHQqp0bjuYBCsTw5JFlCUhMZxGwr2PMfDQCivpdwDkQle0gnhmzCQNVFKq1P4aYlh
         rDUXtI3vYkpo/1/NKsvMSfOgW83Zmj2e9bZRNMnswQhltRgsLpj9U+qx35ChA9B1Ri5k
         427iyNQK2MWyVuLQWfsXRBuG/I6zcVvvaLe5Ls4G5vkD2y41wvByWpEK5J+glWhR3T+Q
         J+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bq8bNdyAl5co9FRYH86QFP+zOKhtTWspptpU7rpeE8=;
        b=hyOE85qymsdk4JHfPgaMIkA5MnOe1Zrx4dQePPZNsSn0Fp76yVt8KssRDzwhhBQrt1
         bgYUOvdgvB0fPl8YtF0HQ9K+AXDTN17CxEdmjFwWU7RZOMYvfrv7X0r8m/webX076G08
         obGCzeYp6BLAQeGT0ad4gwp8l/iOw/V7Nif6X4QlrzJM1VULr/6PDi+6Rb2j0+Tws3lE
         xlycuc9G6AOpS8AnkawAG34SxJ+hNM9z++mymKYk0W+Nb7yLnAHyOVq9krkgX4CqS8DY
         olQlKz5g8ELIyxt4fCe7U/ucYrWiRgH5fziz8HLoOA4YuJRI1hYvKijhVWtWhBzH3P56
         HXCA==
X-Gm-Message-State: ACrzQf2x1Bi1U3IVuXy5uBsV21tS0tfRvbFkHqwTbMiNsnXOqMm9jPvb
	vK1CyiJUU/WOk85uVfFnJOnhHQ==
X-Google-Smtp-Source: AMsMyM7fJwOd+SyYyPd28ciUONaMMuTnB6KKRvaZZqShNPCGAXm+hPxBX13eeavvMQbuGAPA4rrDIA==
X-Received: by 2002:a05:620a:370e:b0:6ee:f54d:d8b with SMTP id de14-20020a05620a370e00b006eef54d0d8bmr19281703qkb.21.1666726516792;
        Tue, 25 Oct 2022 12:35:16 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id 3-20020ac85903000000b00399d5d564b7sm2127131qty.56.2022.10.25.12.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 12:35:16 -0700 (PDT)
Message-ID: <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org>
Date: Tue, 25 Oct 2022 15:35:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings for
 MT7986 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221025070255.14407-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025070255.14407-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_123521_184444_352585D7 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25/10/2022 03:02, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new splitted uart pins and emmc_51
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


