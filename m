Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F52BC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 08:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HF11CqYi6NhL1F8GJzpfBHOcQOn7pKc9CrEEDQPOQak=; b=WwYlAsbNujzBFYUBP2LNZTlLaf
	0Qsm3g9MngjLR/sOF98RhUGwCg/Md9HWOIcm4Qaayi1cwRfwpApoeCjivgOZbRdm/9VLbYPjofukH
	ivKQ7+W1wJ8/ch0Dg5q/hpuk4B6gD5Lkjm7eK6N5DOshh5e3C6WtuL8GTesXv6Eo0PZhTMxbCAaXc
	TmfV5p/ldnKRxsHDABJwEnZbbQcsZVVJ1fpxSmrFYJVHi3RDDlFqqiuEYCcjQiaXnH4tEcZpNWc8/
	Z5I/oworFyluXmb5PGW7gNeJ5Ft5TtGgZn3SwpsVL2HGFzxTSnw6KJp+M4BprNQ2CwnntDjsWKpMW
	DMMHmR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU15f-006seH-0U;
	Thu, 10 Aug 2023 08:32:19 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU15b-006sd2-33
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 08:32:17 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4874cbe2eebso277736e0c.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691656333; x=1692261133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF11CqYi6NhL1F8GJzpfBHOcQOn7pKc9CrEEDQPOQak=;
        b=I0fKn04m8+Eyq0QX1m7Kkl9rGpbcEnD86MqXqh7egTNhVO2uUjrA87G/6hJcmnV7jp
         tYp5fjDk+XvCkFJZtgm9LVtiNBCLHbAiTZLAGLucAQdv7X3CU2A1dmqrA6g/UYm6JfFM
         9pVjj7WoW0+Vdsf8isGAEja7UdoHzvETea4nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656333; x=1692261133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HF11CqYi6NhL1F8GJzpfBHOcQOn7pKc9CrEEDQPOQak=;
        b=F5urA/n1IgB0Hv6jSWwwBdpvmfPJLCmcs0YvvTYT3ihfo031duQjHy9qrFaW/vv+fE
         nN4lTCPzggONOsMSyYB0OJxXppaChrflQcxae7UHaPbRSYj+f4EPFGaXqN8F5z3QxYC1
         jMOv9lRRVXmXoLQ/bzzNv4UT1sst0KkSKwe+J0LgZ/0idS1hGWu5hd5QblK2KwtMF1ez
         0he7MSqo6CXdGtEdpIn8KJd/bar58zvUfKSbfRQz4tCUiTynn5vM1Arxho2u56n2rWQW
         KsVvlvm3v/UoTUGTK3R7RaqINyFac56bHu27mVBL58gxcS9Kkrg05lTndyK7piKXq4gc
         Grcw==
X-Gm-Message-State: AOJu0Yzkmbb1pWryvw3U+6zhpW7v2HpHcvPifz5fg71POQfVB2okSEDy
	mpcpHqb4hC3YKtQxOGtpMLN8uFuq87Qc6EmAMF8n4w==
X-Google-Smtp-Source: AGHT+IFZUfyXIrF6NX6XHtpQ1aRnF9OycIBf0Ukf4jcjAWkHaOt4TORLmdHUVCNyTHszLlmzibhIj00QuOu2mU1+FY4=
X-Received: by 2002:a1f:bf58:0:b0:486:4b43:b94a with SMTP id
 p85-20020a1fbf58000000b004864b43b94amr1593934vkf.6.1691656333217; Thu, 10 Aug
 2023 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230810082333.972165-1-harperchen1110@gmail.com>
In-Reply-To: <20230810082333.972165-1-harperchen1110@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Aug 2023 16:32:02 +0800
Message-ID: <CAGXv+5EOwT4ZvTLkvT_26UFk4Eg1Hi0iERp=NpmtQ63g3dZ+qw@mail.gmail.com>
Subject: Re: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in
 encoder queue_setup
To: Wei Chen <harperchen1110@gmail.com>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_013216_000720_D3827565 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, Aug 10, 2023 at 4:23=E2=80=AFPM Wei Chen <harperchen1110@gmail.com>=
 wrote:
>
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
>
> Fix this bug by checking *nplanes against the array size.
>
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

