Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF58AC5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=; b=u7gUIkSND1qj0HDUDZQ9eDao+x
	fNJvHwb5uG0ozuJ/9wEwyCKLMaWZ5bt59ODAxBBnVdztODiU7EXFZkdqew21HOeAXxzsLG9aQjDXC
	+oSzd2HU36JWoV3lWu6coYjZ8leyOFQGoZxwZxsNECNde3BqLecmJ2RAV5rgxtCDyxyvk4eFlLz8J
	nR3w6o/P8mK7fA6ccE+iBuV6hGFjuMNeODYDUE176VtVwXWetP3QPD8Oh2cWy+Awqg6NY5zq8K2Oj
	LTdhCpjsnTNqQBC5Ci6FAK7u+MjC7h9rCcfDB7WvkiBVf3vszVMQndGNYujqILtAOKgxA6CRAphmg
	wIK/vHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwm7-0000000AzpO-1ZtJ;
	Thu, 20 Aug 2026 07:01:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwm5-0000000AzoM-1kg2
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 07:01:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so3374560a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 00:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787209275; cv=none;
        d=google.com; s=arc-20260327;
        b=Ax95wUcFAevVgyavnq4bubX29QlTmrmwC2G2NnJK8lB106DA0RytSPz0VrSHXKluz0
         zx7fxYZVU6m2QHSDMwt4YdYXK7j2JuhTQ5DS9mRZtpd8F3S1JYqlNjVli2o6XuWqr0gS
         /Ch6i4QBlrKK9bhX/7Yvt404nGMvEfQYAqYaKimXTqK44SOkmuFET7HO1tDV1y5gpvUf
         R2qOkO3oP/UCHefgKasj5b/adPF8g1WZfyZZeFKxo+t0kGl5v+9TaA7v5LjZaXlFnE4A
         +a1mTgAr1j7oTdFrJw14UZTR5Ju5SFvqdb9Sa85XxNczXhE0AQl3UGSYDABcuUuxuf0x
         Cq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        fh=4RcNdqh1bqasO4dfc5aPAtMd0wkDyGXkP+HO3RTg5rM=;
        b=j1SC8xGkGpu8t5HTquV8ER0PMkFxu2rEtJEnhGSUEKEIWNIrw+ZCQInzM20Xr+pHiW
         1F/IrsRj2aoeDY/pQW637A+bsUil/PtVMVA60w76NnXIiestR0N6ioPWaG11M6DNL2Wj
         YpWJwWo93TpTxg3pXPWX2Tr8DYIyoB1soyw+SX9WPLmlmtIbbY4DZnmczhRlvPcDOSbL
         yS+PG0hmaMnEv8mg3e4wZzotPhK6Eprxs4Gz1E6bzm04KBvshd1HoMzD6RvXr4gui1R1
         kdMgtZ0nGMKHB39yXh1RjtNCCQBaQhvrOxbM/2r8YAUnYYe2EV/NiwzSxfg4/MbVCyhR
         oGHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209275; x=1787814075; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=eddTueyI5kqjA7kfqLVwzZoNiL81nNgjRXfwbHo2/Af430d9FT6n8ZP2qKX9yyoEUl
         1MNEd+gTxj0Yjz1bhGwpBiiJKyHHC2aWxkcCZ561i1TS1j8NNvO+kwOUV5zL4Xq1A4kp
         VP6Nbb0q+UwiY2gQRxokDBXrUFp8pCQNNhtGnugJrpu3C1B3m10Yh6X+nSttNpDm/vaO
         0r1XZSJPFMQ46VTvrV4zvsqKfgOGz7MsGjp7XMwF3qpgjaHaAfuypwDR7OCfpoSR4S8g
         qU79WgBZvOukELgd+dMqyCCHEFcQmXZiDyPvUpUUHzFZkJgZvxQb6v7HzjNHrNaAyHI/
         Jm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209275; x=1787814075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=I3aa9REDZY95nGsCWP9hu+Ahp6wISO92M/lt8ClJYgOLqVXijwI41P76JaVJBcy2Oe
         ENwoJ3slvs3LHrKFlHh44HGhdIPtnqzsAbI2HAtz+/Y1n7s7PRvLPz2LAtG5rKOCsoMk
         ZOittYrNjDbNOZMk1YhEihx/AisW3wrWB74QhuubUg5Y23zzSPeHebcmraoWBXf3CadQ
         rfDr9X15wtutsJEEestYmlvke9+mqvminH6bBKWpYYJPz0K5bKasNutQC5Q9WjwSZUxB
         TMp8W2laExhSTmAVU0dNx2cHYZAZiE3ix7ejCV6hOxUzrwgvnFtkWnUYe2Tltn5qd6+i
         9zlw==
X-Gm-Message-State: AOJu0Yx7PKo2uZOsytiFEGsezAFNdt9UMhFzgsA/DxnhJCygsRtZ2yyj
	sPmuUGYiLrwkxMv6Hg8RTTU4+LovBkEvLvTkETYp2tpqJhDO9bTNofiGnnkudCYKTmHCtrEDbAd
	rV+dJnN2y/VtYqIIIjfRiIKQtUQNsD90=
X-Gm-Gg: AR+sD13lU9a4S054DkFtPklZFZUFvbCDS6nX6YBbF7L4Q8FAPgCsr32l3dOH4VZ3Qqu
	G8kGhkez51v8qGaOSVx/lhYrrO80UIAK48OulqZae6XVPBtvX0LxmL3vcvI6HFjwC88B830e5xd
	ncpJhEC0c8JQY0xkdFLym9Cxug0HRVH1wDv7jUMtQM8lFfVrgq4Z9IFRn97IGRRXSyY8UCfxxdp
	QO1tO0jSvd6u5RmnbdAtvX7xdOmw8+hMMZOtT7AceBNti00D/0LUojg/CEkLJzpyo0dPFZSIXGH
	OloEtrCMiYku7mgyHUJyeu8AhLZp5LafsQD4/5leqDc=
X-Received: by 2002:a17:906:ee82:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c242e38bf8bmr723860066b.24.1787209275106; Thu, 20 Aug 2026
 00:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-4-l.scorcia@gmail.com>
 <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
In-Reply-To: <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 09:01:03 +0200
X-Gm-Features: AcwNN1XJDhHftqNShtFzkYfbAjGi7imuQVN4JqERVqBvua6db_cDNPHETOvjtjs
Message-ID: <CAORyz2KMg1-zxSPVCiFCiC4EpVFyR9=Tcowim9vVzv-g7SS35Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_000117_472592_02707748 
X-CRM114-Status: UNSURE (   8.59  )
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

> Please drop my Signed-off-by from this patch.

Of course, I'll do that in the next iteration of the series.

> By the way, this header is not used by any part of mt6589.dtsi,
> so I think this line can simply be dropped.

You are right, I will remove it.

Thank you!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

