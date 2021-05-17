Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7EAC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 22:43:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C935B61263
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 22:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C935B61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qVKE+eC/kJjdXo5J9dRGYAVUz4HIpzb+sD9XLlcBQJ8=; b=PdotDkqSyS+MqxTv/DWzblHak
	xz/7719cRfIy08nxsp50Tra9SFQSWTfumD2LlEzFIoQPPUamUDpeLyG5pIFkpjMhKbEcPyu1fkouY
	kLfL0YVk6ijfRqZIY4bH/VFoS/Jvs2xYT/qZeo7qKdH3z2VtfgkhMWBoutwL759xn2kgskelslCT1
	6K/F8nCyg7zeAk41CTyZx0WYYJ1RdoUehHb6k/IT+Z+zZAXGxnbRYb09yBQNOK0Uolqn4QVVB3gcZ
	PkGydZH/BYP7oJ+ier4puKwjoSY06hk4HefKQZ0bCRv/zcc+SS7EjOna3xNyeFIqVKtT7eyRH4imE
	fDdxcJUaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lilwl-00GKWd-Om; Mon, 17 May 2021 22:42:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilwi-00GKWD-Vq
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 22:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:References:In-Reply-To:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n3Djli0CBbr/m3SaXSvVNvzipKsQbtn+bmmLzOnVVqI=; b=ABpr3YddXNB6IaJp+Br3PpMROP
 QtnLUKbflOY4gFKKKChnRBx1hgVKXXp6lkIXZmEF0w41IaQllRgShdpVX1SL8jIZ60HSLp64waBZw
 VwvpozMX99s5eJcZMjj1xVIxmy/rbnYUY1HObLoKtSCsKu0Ph9s0cdU+PHLszTjAcjEJjibV/OyRB
 SHopYdRkEL/YxkmG8LgXgxVrfk8hzbDu/R1yJNRHgQZKL0EtukWa7NVLLGOnVlNP6N+a9jTyCvZI1
 AQSQQFd2/ELH+1yNyzahUgZ6g/B9e68UsJoOZxNsvrb3bbtmES/Bg+S13d7+HUz3lR2UbYcIzXIzn
 gr3KUu+Q==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilwg-00EC3C-80
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 22:42:43 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so6988789otg.2
 for <linux-mediatek@lists.infradead.org>; Mon, 17 May 2021 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=n3Djli0CBbr/m3SaXSvVNvzipKsQbtn+bmmLzOnVVqI=;
 b=nCoLyuMlxHCUgeTLjyz9XLZgPJV8gVt7fHvVleOKVgXyMbYoTOTnjn4s2niBe2ZQmP
 Y1QLjAH7k6zw/Fj/f8O8N7U9ittx6ZQUrVx6sj04EOjq6C+tjhUTZU6ugXRuzUR1bRUG
 YaqYd770CHzQfDlKuHqA8JhTB1zLEDRVfC860=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=n3Djli0CBbr/m3SaXSvVNvzipKsQbtn+bmmLzOnVVqI=;
 b=gWu2OShn/p7JNxOq6d3YpewYnru0IHMmWX4eo1HBrlO6+LjyPgavbqUvgOa8/8WvKO
 LIFrKB0rXCM76LewrdC8ZP/5Pe20XqkXkrwKmBS9RgVfdPoS5/YtqS/4Salzn2J7ty1s
 kmobkhbzKmScWHJ6Bqj/s+PcsmveYoKLGc5oNZUvpgPIokh8dSoEx8x9v00jPGggg8MJ
 flm4YgeVC/sb4VX74ZvDSGOIrquxhCkwB83HEzvOz+t4EjVFMDXsSGqODzUY6Hbrb5IZ
 jrpIAmxGldknppWVPBRLfNVjN+sRD9vrDOIgU78IVizSu+Tnv0kJrmZVzprYT2dOUzaO
 vajw==
X-Gm-Message-State: AOAM531eZPWlDwiZuDGlUdi6MRy0rydY8aw60zp3QIHqM247sXheSkmB
 6tPFCwfWRpQ5RMqylyYgnhUY2Dh7izKN+9ACGdRgjA==
X-Google-Smtp-Source: ABdhPJyrlcKA5TRpRHBaLxQm81FvqdUsYD3Zuf8Wq5ItOf2C8GCdiAJD8DSnsXJA9rpT0DGnCkm7oobN8EvyA4mOsRo=
X-Received: by 2002:a05:6830:4a1:: with SMTP id
 l1mr1582306otd.25.1621291360739; 
 Mon, 17 May 2021 15:42:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 May 2021 15:42:40 -0700
MIME-Version: 1.0
In-Reply-To: <20210514122051.266169-2-ikjn@chromium.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
 <20210514122051.266169-2-ikjn@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 17 May 2021 15:42:40 -0700
Message-ID: <CAE-0n52_fypoKrobC+fSrMqf9aovHFgu71qRqKK7J_Q4g-tPTw@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 1/2] mfd: google, cros-ec: add DT bindings for a
 baseboard's switch device
To: Ikjoon Jang <ikjn@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_154242_293792_F807C7A4 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Ikjoon Jang (2021-05-14 05:20:49)
> This is for ChromeOS tablets which have a 'cros_cbas' switch device
> in the "Whiskers" base board. This device can be instantiated only by
> device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> probe the device.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
