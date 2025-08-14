Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B27CA0EE6
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=; b=NFdfMMP9WRPa6qrzYibwq9S/xr
	XEOLGpgQXtUf2bjEAc3l7bJ+gLqYpXpdRMMmAb8o0e0jbY9m8MVrLQL3Ij36goLqKuSKG6+75qBis
	1+3RcGKQuj3Yuk/NzDwvT6deFJLGbB3jnCd1PzqFPXC287XxqWwUti79KrNpvl1GoT7lhaj1uEIT6
	lR77nn9d3Lt6y0zWwhw2oZai+3NCah2UbY3VVQQjvjrehu0ca2wN2OS5UPCrwGgft9LxHZEUwarzt
	eqTgX33hfGfiag48bMf0X0VYJ7TCe1o+u9HDvvo0IqfacGWQ54tWJ4oX203oxYa0UbS/TB4sNtEsM
	g5slVkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn7-0000000Gxja-1thl;
	Thu, 14 Aug 2025 13:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbc-0000000GUKr-1A5j
	for linux-mediatek@bombadil.infradead.org;
	Thu, 14 Aug 2025 09:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=; b=cH9seLJV8NGyW01o/kVl1BD0NK
	FkAVuFK7GJNS16QS8neI6v2JJ0ilT9SDeAwumFc6E9kKOd8wNr8n2jx04u2bSA8VHAqs7AtWgQx3k
	cw/7vo0SG8MRemTkulswTTjGwkK43HJaPpdc5+BPQoHCV1ts5mZ3IF21So0ZNXgClIvcalVjcDGS8
	WldpKl8LTDbjiFqtMllpnVyicFgzTI5YDWR2mbKIP/7BulmPcfzlrZEPXDOw7EOuYmMbMzlxlltAI
	YW6ozPE8AnUJHI8JPNTbDYDY9vjrLNn4ALndNkwggREEZ7LupBFTNLMoVDRaWULopa7nQiXe8gMA+
	h03iIabg==;
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbY-0000000GLBW-27aU
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 09:50:42 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-53b174ac3e5so307237e0c.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755165037; x=1755769837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=;
        b=GhCSm2FAqzAJCmoCmBySwycl9eE1StABjyQnYK+kOxdql0+7QVUXULqkl8AMvvRxZn
         wcLD0UJywsv0GWhYiRTMRgAsHnB18//ORcYw4fh3T+A41E7hgOABxQ0xpWorYPY3+Qw8
         hjbRj2Ab5HYBCiaQqrpEDaUaWoA5LPrNKeHe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755165037; x=1755769837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=;
        b=D9vzejXZN7au8/znHUblZLFltUkjsEMjqDpXrBPtnWZr/5cJ+/0pZI01fGNxxkwRAq
         oME1ItDPf1h7IM+COTkvjtyb88ByKCBTOvK1JRicBTRfp5KhSQkb74/BEQzk7GwtE7PB
         eNxK2eKcGh+pmQMypxOUbrHlvJjZVjFqDcxXTlv0H/RfwAjuQYALo6j0RotltV6Wdph2
         Pe8CeR623CfrPdritKLqK4ctqXQ75qubYAwKzgNJDyQagthb8++oO4RUM3BBKvviA5aW
         uSwh5eWO6vVP74+HBvVX8Qs1KBx1Hj94ydG3BnpXOIzyXwDzo1+9GOyEH8i+ZnNtVc7y
         lb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMqKO0GwYcbqWh0qIqGJ7+Dqr5axelErDCxqedWXNSaf3B/wrRYdLowecydRslkLghOFya3i7Bxtti49CM+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj+x1OSOhgg2nyC76SQY320TaaW7bDh0ZheiCEahkXTOsBFSjc
	JNAULPPltUltSfcznSm2ExN1SLAsoqDSQWeHmQ5P+KrVkQoMFCxYgwPVDucOll8esL19LtP2Wqx
	MD/g=
X-Gm-Gg: ASbGncvwXhew6mNLc9LyRRM8P6U/AcEJtfx2ul2nlJBwsZGp4gHa8q/+V3yup1NNjiq
	at4RyEVq+/t7o1strUCpC9DBK+9pqVYI/jCuB2eckTKkI5BvKttRGQViOT6x8f0jFQXiD3hSBQI
	f/s7UXu01hmJUoqI95b2ucUtCZIU8CdVRX590xTRKkYbFsmYeR4QBFY8vvyl3hQfMvgGbQyaghL
	eXib5bD6zhzCzfUZZM1cnbkjBSeP1AeDl397ypng56PqSBmfn99YIwiaoN31oDBujtn6cfIS360
	SuwK+Xgy+bqRSv7U9zH+s+oExiFp+rJSubj7zDLM9ZPrnFKyCHilGir+m9kQaIrso7cmnt7zFw3
	N6vaSlVdQGAbPwZI90UdrG56vAP2WMwsKjhYvdW9bnxSc762nr81n0IJSyqLZAQ3Oz1xN
X-Google-Smtp-Source: AGHT+IFvY6noA7c2+heOu2HcXMzFMU3INf5GxH+QPFONXePKMHXdKQXJ9PH0eNlbihLwovr9OFuc0Q==
X-Received: by 2002:a05:6122:659f:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-53b1899d513mr758767e0c.5.1755165037285;
        Thu, 14 Aug 2025 02:50:37 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a1d78sm4415596e0c.25.2025.08.14.02.50.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:50:37 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f8bf6a9d7so237639137.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:50:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUPhI+4XQsN66IDk0SAWlQKSP9aLsaDlGNnlZzFusqMrsErLXYaqc43yPNhJfYkYuQrR3nEOCCOK7LbIWfIg==@lists.infradead.org
X-Received: by 2002:a05:6102:3f9f:b0:4e2:ecd8:a27 with SMTP id
 ada2fe7eead31-50fe030e2damr804847137.4.1755165036132; Thu, 14 Aug 2025
 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250814092510.211672-1-wenst@chromium.org>
In-Reply-To: <20250814092510.211672-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Aug 2025 17:49:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhw2R-2YVpgBnRDAn-6prJGm2a9oq9tCASkpXHDP_-BoA@mail.gmail.com>
X-Gm-Features: Ac12FXwCy2I4l7L6eb4V9g1X9AwsA4Ouah27uikhuRM8HDiKM-hrJ7wZo6sGxh0
Message-ID: <CAC=S1nhw2R-2YVpgBnRDAn-6prJGm2a9oq9tCASkpXHDP_-BoA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_105040_800776_76C0B9AC 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, Aug 14, 2025 at 5:25=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The first SCP core is used to drive the video decoder and encoders.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

