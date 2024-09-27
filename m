Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9632ECEBF7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=; b=LqjLZR3ePuuTEZSiv+dMUSvaVB
	/6adXxs8fJiZLLIl+kCJoPoVWBXr/nSk0oT++GsCQfHHSPz1o9ceHlPPsyQRZfvauU9+hdRcSaf+Z
	qZRH6Yyh8TcQKiM77M/lSeLXjCKJEBzYs/aClGcVe2polwcRS3T3oVznZGKDXBNHtsUo69boTr7F6
	q86cwgnsvJQeAyg5qqm2MS279Fna0yRffpxFvMOLk/qXM0OpjzGdCQDDODjumkWP1xsTrvrCdgV3d
	+6wyt+fZpeR8H58w/jT2G7O3/Bb9228lxreirb5BTQQr4zG6Hc6zGPzq3ST8P8lJ1hf6RbDSojF81
	zywfS0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su4cL-0000000ADIa-17zS;
	Fri, 27 Sep 2024 06:38:17 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su4b1-0000000AD3E-3qvJ
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 06:36:57 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f6580c2bbfso24018111fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727419013; x=1728023813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=EbrPyp1m/AljZAPeoyHxcOmZDQ4kiHd8myo7lD2AcJ49OfLGegybESwDifA6pgxjS7
         117ShHz4gv4JeqRXtiB5pQvu0dgpGr4cejHMapPPmnctzS8vlNBjq5ffXkaijA453SKX
         vJqa30N/5Hc3DtljhBScWOv7B9nTPee52q5laSaJMWfrhyYCcghOZxo3Az4yv4KBMkaE
         feofbzJ4qi4y8voABXIZ/Oi/ZsITnEMyLrRnc4cCA3BAaIrWYkOf/xBek9mlwIOI+V0S
         jJzp14dl4r7NKxB7FgjJIxbozyIWUUwoUvuyzr9nIb/cwK0cFXD1SijPqZf7QHDTtuy6
         rWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419013; x=1728023813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=P0yGfdWleZiuy67hzM5u6FDG5vD9oz+3I5p5qFP7RPcn9gNebyTYpJvJnOvcHpZ5lc
         e7XBNUawWdtJwbs7coWo711HOZ0G7fwaB9fh18YOcOTSEzxJPtxWssvjJqy/FgrMJit0
         1UiVx4L4ymkubCCdcosjuZvuDP6vMdgQPf4VDq04fEsX8pq+CpbLLNC/9k9CAbTA1x5n
         0Bs4fO/JhifMT2yuiXRAKK+vaW8yCTNoB1M0106HYzJZIuEvuN4mCF8N8HY0avV5TMFF
         JBS7pf36e1mbxLv/U11bkiq15BjbHY6DwZEqHEAfqkRhi5lepMQ7e7fq+U+3nOFRLjV6
         A6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUmOTdHKGi0kFZ2A74/EWBQ7uZIl9OGl1R827TGEkDBx4lofHJMwL9XjEgZKCg52OVsZSK6266Gi4Hioo6cGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrvc4ATRJLKvCtvMNB3EJUKfKWUQzLAmfLZcbAEhkaRxER2WwA
	r5sGoHvfeeGiu1AIU/upWfr8tAcBvfU82AD48mnJLlwtXwyqxEb2Fx0KjUdst9e+DlN8g2HT1/r
	mB6eTUJ07tnWXsUTemy1DBoS83PfPkbjHo9aekw==
X-Google-Smtp-Source: AGHT+IGgFYfXHCal2e51gzgszcfItBm9C194Qyz5q41DI00iOJq9PeBaLsT1ymvZJa7VwGDM3d1wVm/E+xtj8hsF0w8=
X-Received: by 2002:a2e:84a:0:b0:2f4:3de7:ac48 with SMTP id
 38308e7fff4ca-2f9d33928c1mr6048771fa.19.1727419012116; Thu, 26 Sep 2024
 23:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Sep 2024 08:36:40 +0200
Message-ID: <CAMRc=MeXxeXq4m4nvb+P2ZQuYbQ18n4572cwkkHG+=U7nfa7Vw@mail.gmail.com>
Subject: Re: [PATCH 11/18] leds: max77650: switch to device_for_each_child_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gene Chen <gene_chen@richtek.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_233656_234799_39493501 
X-CRM114-Status: GOOD (  10.65  )
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

On Fri, Sep 27, 2024 at 1:21=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
>
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
>
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

