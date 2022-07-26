Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5530C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYbjt7tSRb6k0z9uL3Hg7njGRNb4kUS3yk2xc4wovEw=; b=bCdQzcJY71yZs08r/lekIt/EQ0
	OMWzSLgRVJ1bg3ZuZqMt5C0mGH1lxhNOXpgW1TZ+hq8LzeLzHkJRgSDsPZqy7W1VXwtZXHRypRpei
	88vmgTeZomRCv8EuHOzfoWU0BT96M9SfwXVAeWco1p83bgcQMXQ+k1EcLEzgfwYRotmQEvIPDiziq
	8xXkuYwHi6TNrsOBYFdBtJD2WDk4RA0jBva1jqihVccMIG0MSMASptjpS+vInQuIk7poJTR2E7DG0
	0u4EekyVj6OiCq5WLRPUX0rKM5RoGa7hDcffVLqN4CCPDgrEUEA9lFad6XDxp9E+tMcL4bY+6fDfI
	qywQMaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHFR-00ByXK-Cb; Tue, 26 Jul 2022 09:53:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHFN-00BySs-Sh
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 09:53:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i205-20020a1c3bd6000000b003a2fa488efdso5214299wma.4
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=xYbjt7tSRb6k0z9uL3Hg7njGRNb4kUS3yk2xc4wovEw=;
        b=MIo7PQBLFh6ZgnDn4FI5G6P2UdKX8cy9x/L46XGmxeN6RyXMD1aSfk5oqmcwmtD0rU
         2jDbQn6dPa9Plcv/F2fUybffCNWkjRdzq81p3FcA46/qyNtlWk2BZPUUba14I7z4Q51O
         kfTLiHNQE1oQt7kNLYR69nEK7koTI6wIeInKeyXAcxoCNPI6QmBsKUh8zGm4WOsLp/xN
         euEC1s6/JaEgZeh4RG6tkL1jAKamJAbch7/MbMXkLrH/9TDLFAym4U3lFlKgiqRIycBK
         8YNuUV4duEpnuu9iX1ileqV5JjtSyhjNv5tjFqkojmtaCy26QFDTxkAfgyxq58w/aVjJ
         JIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xYbjt7tSRb6k0z9uL3Hg7njGRNb4kUS3yk2xc4wovEw=;
        b=V5DAulYr6hx8jeaH8ycArqUlvUmMo8lnc/NG+hx8+bgvgMywA9V+93qaquhApgAAWw
         fbR1u2UNi03KCTn20jX2dIbLnF8TnVlMhT4ap7uHPFusyPs7MIiTEJ7rXZJOkDPEJceV
         jzJ6ftcizj6st2X2QmPwlIFYY18AoPcJ1dA+AfqC6BoDerT5344lHKe7jnCDYziOJGax
         +p5PbIeLlWfnhR5jLKXbhpULk2uJtsdZD3m7GGuesR9HLnVhw2uz+t/rf7ZOF78izx2j
         JrB9QNCw/+yeuv4oLOVjjD81KCucxSN6nwRqwwWKYYh1xNBnkbRN8b5cwqmZO86Kw6U/
         yzvg==
X-Gm-Message-State: AJIora/RuxYa88QRQSNbTw+iHBKsx7MsBWcUeDl7VD49j0DhpxEXHy88
	pE9831GN96pk+kpZdPkNQUpXuA==
X-Google-Smtp-Source: AGRyM1tU+DSm8u58aZ+nyvSDNMamUur5s+E1RPql7NSzC+QLwzm6hqiDD/OS6y1OAJjHv3638h4raA==
X-Received: by 2002:a05:600c:4e12:b0:3a3:2fe2:7d0e with SMTP id b18-20020a05600c4e1200b003a32fe27d0emr19412321wmq.151.1658829178274;
        Tue, 26 Jul 2022 02:52:58 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id r9-20020a5d4949000000b0021ea771fa2csm1141354wrs.90.2022.07.26.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:52:57 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
In-Reply-To: <1eed6877-8868-6b29-b7c9-90986d230f36@collabora.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
 <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
 <87ilnqh632.fsf@baylibre.com>
 <1eed6877-8868-6b29-b7c9-90986d230f36@collabora.com>
Date: Tue, 26 Jul 2022 11:52:56 +0200
Message-ID: <87mtcw19qf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_025301_947808_0D1A200A 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, Jul 21, 2022 at 16:55, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
[...]

> Il 21/07/22 16:51, Mattijs Korpershoek ha scritto:
>> 
>> Hi Angelo,
>> 
>> Thank you for your detailed suggestion. I like it and since I have to
>> resend a v2 anyways, I will consider implementing it.
>> On the other hand, I'm a little reluctant because it means that I'll
>> have to remove Matthias's reviewed-by :(
>> 
>
> Yes, you will have to. In that case:
>
> Matthias, any considerations about this idea? :)))

Since the binding document changed, I have to rework this patch anyways.
So I will drop Matthias's reviewed-by in v2.

>
>>>
>>> Cheers,
>>> Angelo

