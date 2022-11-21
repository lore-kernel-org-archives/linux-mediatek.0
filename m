Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB695C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfT/StUdt/TNq97yOnqXZF2EgZ5co+Uc0ASQ93hBnik=; b=j+tQGjxy84ZNpihKvJ+yZlLVTo
	W/3z2i+dQIEHuo03voOHcKj0eJxWGDFq9wtoXO0z1AS/XjMce7nDlBiKpRXV6rDjVvlpPY+a/D8rm
	/1WEddby0WLwBeZDj2qjE0yBcPEczQmFEtvULa7FZegq/VLZ+0kjViJbkbdpp6iahPJwa97EiR3n3
	5U/7NGuK/n25eMI6cXwJUJo+6fiSzfrz6jarYZaF2R1kX1OM7W8hJairh+G2Yktu2gTIBHRNsn55y
	Nwz2PYpcUPOs1N7eTwcEsfrzzfX3xKfE1bQpOWw6fK3d7VHTrHBMsLhlg0psElSANKuNR38UjGkQF
	10H+YLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBPu-00GoGR-4k; Mon, 21 Nov 2022 18:21:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBPr-00GoEY-St
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 18:21:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id g62so12071616pfb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 10:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfT/StUdt/TNq97yOnqXZF2EgZ5co+Uc0ASQ93hBnik=;
        b=cfvLq7cKsH0LKUiHU/LSJ9scbNoTqsIm8PBhOwUZ3mdmoHignjA5gIbEv8ndjOv6Ab
         O48djvnHOxrQuVkOGaTjK6x4fsdhs3/HTXlTsnyUzq5DEBwNzxR8zfoGxTnL1N/dZILu
         1MNH+W1BxFXZvO6S/WLRRQoae673G8oSaVd7NJeUtF8pnRMTFiasmqnV/T8biiWRG2QJ
         KCWbw5MZ4GVLChkiUhuurkLLOrMCyvTdyfJt83NbipLu/yAHIABzcn21GR20ELMlGsnn
         5tP2S0Ig9kpd2NrFtIpfegly+3baiB/KGaXigOwihiUGBmMVn5/SJHw41znvZX6HJY6K
         FJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfT/StUdt/TNq97yOnqXZF2EgZ5co+Uc0ASQ93hBnik=;
        b=WFkQLxZHGenaWLn0FEsfu9nuYCCKBmaP8rG+OqgyZnTjOqLArtJm9hlqfcpVk8iAys
         JiLMzaeUbnuz9JwjNFANXHiBKIaRI4/SlnVFXd6xi1aAlT70W3gORNAUiyztfg+kohNo
         81cakmX9bvilcjZ3lyaaQGqpoY2txCxFhuno1mgbCEL3iku2k80Bjj39FsSLUaYT+hue
         I8SUgs1Nyb2IeL/l/SguUwZPwwSY2TPzEltkWEnVumjk2q8HCn0afkVuEP+fzJFDV6lq
         MEc9yARALXtwzecraR9rb8gYstShHjMFpjzLR7RwqXS/dihurVXeLun6ZlQ2N6iEwynJ
         1gPQ==
X-Gm-Message-State: ANoB5plDPTzVYXufaQUA4zJeHMfooS1zqIhTD+D8rU/tUL/qdil+mXiz
	U2DiJfCXM5pI46KYpY1e59jb4w==
X-Google-Smtp-Source: AA0mqf481SzQ29SDy4sok5GUrhFWQwmFscxt8EGYSysGEqUvu7DGXe8SO/aW0ouOWM3XTCimC3Beww==
X-Received: by 2002:a63:5d63:0:b0:462:85d6:6276 with SMTP id o35-20020a635d63000000b0046285d66276mr13659pgm.293.1669054870822;
        Mon, 21 Nov 2022 10:21:10 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709027e0800b0016c0c82e85csm10058866plm.75.2022.11.21.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 10:21:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
Subject: Re: [PATCH 5/9] arm64: dts: mediatek: Remove pins-are-numbered
 property
In-Reply-To: <20221121015451.2471196-6-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-6-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:21:10 -0800
Message-ID: <7hsfic88yx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_102112_003840_DD576A6D 
X-CRM114-Status: UNSURE (   3.88  )
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

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the unnecessary pins-are-numbered property from
> arm64 Mediatek DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

