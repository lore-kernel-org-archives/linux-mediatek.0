Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B678CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=; b=xp6pWyEMShiinbb66f1vYdnEKV
	HreZbRyXPltQ+XP0Ncr0DVGH3ySXjBlqt/Cjsae2LjCnqO0ZXz8Cka1/a2TRUC9zpmOMhQvN6Mw3I
	pP7rMlQEMiLlJrE3y4K1nvP2ATMjRoTfS4wtBoS83UGXuE8Ly5U5ghk+sOw2/Mou9APXI0QxHXozt
	L3uxD0sQlsAUr1hdyMpUw5Jpqps+8rMuKiszjCToZhW62sDGf7DscKxjSCdxezi4d+xOBNk7hHudI
	zXIXG5rekVEQ86pEjIzUiRgIkKn/4Lf/qEDAOAKFraEHQoimT6qV+GdYSMyzM78U1OGY0MIC/bhIq
	21kamI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLb7-00000002R9D-3KAU;
	Thu, 04 Apr 2024 11:49:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJRe-000000021nC-2UHq
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Apr 2024 09:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=; b=DlgrPIlzrAYs2CffiACZ0ddU0K
	ok+7oYdabRJG4BNMFJQDfyB/JEFv0ubwJXUwtvj9I6y+L+a/Ltf2hc5jNROL3YgFAZlhiwQVx/mUY
	XrK3y1zIuA3J46GO4oTX21bN7oxn7ACtm9uVkRjtdRQB8fSj2V2Zd0PqS+A5WAiZZUcwrZ8N5ki9J
	MAAkHIffDD3xFLy8xG7CL94GLPxwEAQZmWsAtnYEG8KgtLIM2GnjoocPY14sszLiL6QsnHJyXHL3B
	IqJPkYao2GcywgqXPYdO0HamzvXfklDXwZEMEE4oaIAGdz17ktMpFcUC83ICUUU9cJIhUYFh62hBi
	D0jDiDvw==;
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJRX-00000007j6u-47HN
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 09:31:41 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dd161eb03afso746005276.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712223091; x=1712827891; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=zc/kZiUY93GsKWMF/62TB5FDeJvLowiJcNNtjrDiVbh9coJnWG6my2pbNtlOsOetD/
         lbdMsNDHunbtZnbkQeP31q1doSdkP2GuuKLQJZdXx9Uw9jqesltBFxBrWpR7A9QtQ4ze
         4Plx/mnBgFcAlem9JbKLq+pfhi+jIAddrVPgGr+MvRxHZtTLQZL+uFA3kq6K2wdTV6JD
         1LzztWX2Q/onKTDtrP2dIPS+ar0u2xlTv9CEa+6+7aI2w3SMljSvG7lkFi3eQI3GZaay
         PaWYaLZvutFqAM7dV6AVCUmtT5aHcLkuZn8hHEwJx4QXC/PmGQsCddlaJ6xlRlQBwp9Y
         GRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223091; x=1712827891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=rx9XgrCp8HHwc+8lfKmK7yoYhPZEmz1velWwLFtpEy6p1N/7GjMQwKYKxyKNobYl01
         yH9oYYz0ZH3wFFa/PoMyDafUWARAAR/6Y06HEQO4hv4tDn4sstJVX/6i0ykHjf4wzQQM
         DVNDUb8sTn//8MAjSnMo6WJhWORRxkKlGX7Pp5amHSs+w2NYS727SEhokByam3kCl/cG
         UWApXyIMbtULctm8p3Tt9lfKj+iOgQlJx/KvqL/e4PnFn20STo6JkjOIO3VxzIrfO3m+
         +zVanF1tUCHjrg2zXr+C78ZomA7WDFWW3aHOPzB1oigGjKyuXReb/biaMYhkQHSKztUa
         JTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0rOAKvBVxcaOJdQc5nQsjsuA5QbP+gT20Nwa65eisogLDNLiZsi47MAbjNGMlgE4tMGdiXXOGW6HhgRkMg4j8RDgGPanJ94q0rB6UfjdBFPp
X-Gm-Message-State: AOJu0Yzrm7USBtr4M9DfqC3gbslo9p16Mn0wJbthy0mOB92xWk3/Qvzu
	IKoFvFPKI4J80MPhAcAIm4IG6Mv5StQU3XcbVqcaDi/2jEGyIJ3HcHj58qimwIveXVkU8tUG92K
	7l5K+9knEhGLm1Yg6DsexJ/0jUBqXsBo1PaIWGg==
X-Google-Smtp-Source: AGHT+IHTXtbKZV4PRrgxvlL/R1tUqcSFTjPcwK6//feDtYUO9NjrShijYYET6/+oeV22B9HIEQVjv5iZuw/cw+hBGTs=
X-Received: by 2002:a25:ac04:0:b0:dc7:423c:b8aa with SMTP id
 w4-20020a25ac04000000b00dc7423cb8aamr1828891ybi.12.1712223091503; Thu, 04 Apr
 2024 02:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 11:30:54 +0200
Message-ID: <CAPDyKFodTh-KN+=b1B3V+7aNEoR0SPo5-xjFaWu=gYEtsDy1pQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_103136_066831_2435DBB7 
X-CRM114-Status: UNSURE (   7.64  )
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

On Wed, 3 Apr 2024 at 16:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v2:
> 1. Add "wifi: ath10k: sdio: simplify module initialization" patch, from
>    my other patchset to avoid conflicts.
> 2. Add Acks/Rb tags.
> 3. Drop applied SDIO patch, which was the dependency for the rest
>    cleanups.
> 4. Update subjects according to feedback.
> - Link to v1: https://lore.kernel.org/r/20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org
>
> Merging
> =======
> With Acks from Kalle, please take entire set via mmc/sdio.

The series applied for next, thanks!

[...]

Kind regards
Uffe

