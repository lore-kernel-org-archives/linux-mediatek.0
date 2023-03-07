Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF37C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWFDL0Togo3L/5bvFloyMlrVxNWJz2dZaxBpDesLPPY=; b=Qq6un0CcaVy7NyRM7dOwFD/k10
	YSg3KmtUiz/xjZM+BkiWCBHWyjVsPGgh6z4kVsJSzOYK4nJLdjcvObd7h1CaqDBZXZ93pr+HToTZn
	4TyRHYeVHSDRJP+lsTdyrbgUDBtuC5l7vrB5SYBvbwUsfDWNUpgCPyXzfoeihuNKKK5UuFZt4U0ao
	Zi3Gv6v1PVkRGYyg2z0QK29I8ECHvt/Jke4QBYvU68A7YXj7mEG7AryXVuIWwrKtWnIhlbiqGU645
	TKRphT4rT9c2IjMlt0Nncqqn9juc5OcUm7oDnOOFg8JqWKs0Y4nhNc1Op8EL3NR+3OTPdrZeOTYzW
	/54IXBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdB6-002HL4-Pp; Tue, 07 Mar 2023 19:40:52 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdB3-002HJF-If
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 19:40:50 +0000
Received: by mail-pj1-f44.google.com with SMTP id l1so14322474pjt.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 11:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678218046;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CWFDL0Togo3L/5bvFloyMlrVxNWJz2dZaxBpDesLPPY=;
        b=4Ly1d78O7tcYqEXXU6osREh+dliCh0Qg3aTJkdkGD4vhfQEmcaO9m1YSvwWPKhf1zS
         tDwekEeJluRM7UKjrOdhQbxZJ0VBCbFgMVxCgXelCaRoyyzU7FcYxy+x1pydzURYk6AY
         orivgD41VDfFudTCarJu1EJWy+ak+gBvK55MsP8GQvlPjB9uIFDdNAPItHB2gS2ty+ah
         jfEwb8rs3BcHVWIbImcwemaRD4OvrgPDDZzesIH4Wo1ql1v3Uq/GRT+NASHvZ1m0QC5W
         shDYFA3Mrv0VSGyACCcp7FhmNR+tEW4741MMOshdxUFvL9z3UJbl5BlKqsb6SED6S6hh
         0ZFA==
X-Gm-Message-State: AO0yUKW0xBqn/EqdsZ/IMvCVAysJ7+zQraS4YOP6FhlHzkwITz7VT/N7
	REplyyPqe+ldhW3nheTLSUPbxg==
X-Google-Smtp-Source: AK7set9Pfl0SQYm8o4d/CzeLw+E0U3nXeg314CNzFcmKQNtPX+Scglz04h5m+eRyrouDFqS1XFo04A==
X-Received: by 2002:a17:90b:4b49:b0:234:234c:72d9 with SMTP id mi9-20020a17090b4b4900b00234234c72d9mr16195349pjb.14.1678218046516;
        Tue, 07 Mar 2023 11:40:46 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id fy1-20020a17090b020100b0022bfcf5d297sm9742902pjb.9.2023.03.07.11.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 11:40:45 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Bernhard =?utf-8?Q?Rosenkr?=
 =?utf-8?Q?=C3=A4nzer?=
 <bero@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
 maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
 nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 sean.wang@mediatek.com, zhiyong.tao@mediatek.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 8/9] dt-bindings: serial: mediatek,uart: add MT8365
In-Reply-To: <0dec66ce-424c-e682-3f73-594e5b1edb65@gmail.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-9-bero@baylibre.com>
 <0dec66ce-424c-e682-3f73-594e5b1edb65@gmail.com>
Date: Tue, 07 Mar 2023 11:40:45 -0800
Message-ID: <7httywfiyq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_114049_638630_E820F3BD 
X-CRM114-Status: UNSURE (   7.23  )
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

Hi Matthias,

Matthias Brugger <matthias.bgg@gmail.com> writes:

> On 25/01/2023 15:35, Bernhard Rosenkr=C3=A4nzer wrote:
>> Add binding description for mediatek,mt8365-uart
>>=20
>> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Greg will you take 5,6 and 8 from this series through your branch or are =
you Ok=20
> if I take them. They are all just adding a new compatible string to the=20
> following files:
> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> and
> Documentation/devicetree/bindings/serial/mediatek,uart.yaml

Might I gently suggest that you take these along with patch 9 through
your tree?

The driver portions were all been merged and the bindings and DT all
reviewed since end of January.

Thanks,

Kevin

