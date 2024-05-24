Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DBDC25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=103YsFNsMTXDCwKBR9YjseSwxoiUd4PI1qUX7kud7uk=; b=BOjwP5msNJZOi7AJ+nfPCmIswa
	UDuvwHn5DdTeKP8lrRmsqJpeNXn87MP9WKjpRcfZ4XzYvENNmcVA/LF24hXsjpvEJLt+M+BOjKwjI
	RUqvL99MBrLy1EWRLoA5kukC0Im93nj14XgJnrDvTOAr4xBaLo5I2HuNgL5iPXPHpcwRGRUWXYL0R
	wOzdsY2a75zPt/6VlF0bZl6caiPHhHDVNzQ5DxwmF9YMMI9aqZkjNRaUvQ/0nIEffg7Gvlo46zK1f
	Ybf5YFw0xKRoqNRe0oip/NETptw1mrJL0SUdPjq60eOka75iMIlCowjnWzqBH1PyrjgR8efUzWf4y
	1F+6F2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYLZ-00000009Reo-3qz6;
	Fri, 24 May 2024 17:04:49 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYLV-00000009RdQ-0Y3I
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 17:04:47 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-43f984101e4so17734891cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716570281; x=1717175081; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=103YsFNsMTXDCwKBR9YjseSwxoiUd4PI1qUX7kud7uk=;
        b=KLMk2Vi6EgYsfq3qZb8OWvrxxXzPxlgZtn85PXYXPcFRpQ1+5F0/pfj2yBJe4Jh6N6
         WsNVcl/l9YZH6s4h0fMEgFV+Sf47hXzQ3DXElIISm7o5DgrN9IDtQBeUZdewDuraQHZL
         JD0vblPJxlhmfhQgOhd1qeGjTIfbFAvH7mf2F+Rad6CDBUjHbEVQgfJp8pisVpCtDr5l
         lAYHntYEXw/lt/Fmo7sbwd9CcEu6Cb8sALSvOUGkLP8A+w7P27jJOT5HWnhM3CcE3JCI
         E5wFpYZpZIrJXSOVEGggmWGHjROpyxhjt/GsYMjJc+QTFur+0RJV9YjuGhflznk9FY63
         +asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716570281; x=1717175081;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=103YsFNsMTXDCwKBR9YjseSwxoiUd4PI1qUX7kud7uk=;
        b=e0mmHWdzco2pd1e6Ka+V15XfAQoFv2JapKJO7pXh/5n3/K68zizjkffAR6c5x4Kmk0
         HosKohVi5bIIPB9JWMp2rDGm9119m0nhlnR/sCvwasQTyq6eRhrkz72QCXW3XN/nBRfT
         ZtMbD75qhXwi7um36CZ9KCSDkFRaKRuAxWyAkpj+onUStnYNclu9ZPQkpNN94QWCRsW1
         naUdl+q3Mxp5kxFN8bVB0+V7cqtsK6ah1gwnfHCjF3MzL2do8IhWfaDhIFtGgizlTl8b
         MdRFcurfH61YJO3eGFAIHZGghj+imWAGez/3l+SL0cO7svenaxZ58D3+6fkIrtrUvikY
         /u/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6ODOAQQ+SmbJ9o5WDhDiyvPgM4KRm4cIvqgZIhR0I766gGkWhE+rnxeky+u2OJYcUqQNn52U1eABUrNOaLAE9sH/Aw2cl7JEnTDl0DA08Ircz
X-Gm-Message-State: AOJu0YyHcggkc4oA/+OoKzR3zwLJbTeazS51zusmB1bYGySOdVALSOwG
	0M03udtos0shmLTjslKZb0rFvyURjMx/HvhxcjJ+QCROMvKuEGDkuUDomflMSe4=
X-Google-Smtp-Source: AGHT+IH1UW7JaY6cjE18kQP2rfBZaK8ZAUYTq3i7crFhcbD2OCRGMioSXW3Nwj4b/xZ9saW9vDyksQ==
X-Received: by 2002:ac8:57d1:0:b0:43e:3c91:cbaf with SMTP id d75a77b69052e-43fb0e4c066mr29951661cf.4.1716570281512;
        Fri, 24 May 2024 10:04:41 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb17fa057sm9641811cf.40.2024.05.24.10.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:04:40 -0700 (PDT)
Date: Fri, 24 May 2024 13:04:38 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
    Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
Message-ID: <238nnn48-0o7r-22q2-2rpo-s3n7n62pn2q4@onlyvoer.pbz>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_100445_208479_8BA14C09 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, 24 May 2024, Julien Panis wrote:

> [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
> "DT binding docs and includes should be a separate patch." That's why I
> split them in this v5. The problem is that the driver can't be compiled
> any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
> checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
> and PATCH 2/6 ?

IMHO it might be preferable to preserve successful compilation across 
bisection than to appeal to checkpatch in this case.


Nicolas

