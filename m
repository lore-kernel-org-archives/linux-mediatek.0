Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0177C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 11:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=; b=C9/c5YxDqvMA7x5rss0KpRjhqn
	JbpRYBz01xoKkWu9K11lKoDhRcrLjVNmdijPQ+QuDPiN0uAt+8QF2pE/a9IyLFtOYKE+SqaG31e67
	IUv1n9/EknsGfVr4ARsUyajlV0taM8S3jXx8gJZpfRs29wicdgjog0BSWPX15VsN33ErOHvrKBjLb
	/zkpoTL3JMVxG3dhdjFrDEJq/yLaARRjycFwvSVTVThtqv6JpNmYf2iyZN9PEVUqmTRau+iqH1/JR
	/4NzsZC3VwXIn6PUdUwbeOnI1+LGt2SLU5UKmYKgX9RuZ0+SnykEcVHJVcqSftTkVsEabloIQOl0E
	mq9/skXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIrb-00000007wSv-48Dg;
	Fri, 07 Aug 2026 11:35:47 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIrZ-00000007wR8-167i
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 11:35:46 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-667971437d6so4410620d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786102544; cv=none;
        d=google.com; s=arc-20260327;
        b=T4YrUl9ADQN2slKfbHmctUuZsOS/IR8HUAjEHuWx770yPmz7ooaRxbSAO94lnKaob2
         mZmGeOQBM9eIbfp3fjkJGVePP5vLsqbz4nHgyEm9+FSIUDG+0sRRQ4M4OELGx/yRHSTV
         KAkdgnUWQk0S9qXJyIEjCisrCUvCi/EntEB422y1bDOY3UTs2AjTP2jYMMwCnl0c7v43
         xIwp/K31mYWlFbjNWRGOlXVIlQDv34bd0mmXut6Uy0jQevbROa939p107YsboDQkRWfR
         zXdKIvjbiF/Cc8pU1+shM3S8mJomBDpDFHuuQu9wQsx3U6h1qzBE5Yg1YVEt6wl0nF02
         L8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        fh=EIYrXtni4nKdOm8eeNNK2tJvYrBBqdPzfDFGbRkFVYg=;
        b=jDOH7xva4/AXOmb8HoUFOAs7ud+TKpLia/Ru8kzPaAkD1NzD4SR0Dj0WMDonLofyLr
         15sIsTfNk4KHeu3Vt+NYMc0xQusVshlZ1DgVP2sr8TGQRh4K57THp1dY2oqJnmtyaCJS
         6YdOdT5LXuoHrwyAJvyoJ3tVFLQVYtIl9BvNWVYW+doxH1mkaMhfJYec34Yvk3+FFJ1B
         Zc31MGKp1TSvCIXCQWepI411SYJDIzEFp6YS8/D75rv2tD52kVID/oSBpjLWh8ZlE3Ju
         UAWcOx3fB0QfxHntjB1WiT2jZeXsfyBXH+UE+7tlxkmW/DB5+43wVEtgmbPHW35OpmZq
         OxMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786102544; x=1786707344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=GG5QGJWPxTbLpInw1o0XIVMDkXgGOgWbTUiJyRnfVqF/NJC8znKjaChX9jFuuisYIN
         SV/77/FspVqdv+OSbH12U/ei//c7SYeq9WgMC1aSxSkD8SGZSJ1gn5mPD03DvSJbSl6W
         TsOw1XDnBAGmlka7X3m6VelxrITJdec41MaUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102544; x=1786707344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=IUmcOgr2R46n8JysUomiHbq7U52oMQPI+h53yjuwThRDrV5TKry+Yy0yfFQq79uHTv
         7g8ExkFtihqicWwsTuxDxL+NU5Y96PejceOdglHSghXqUXTShENGXCDDimnCz5Rki2Tq
         8NWXMaahRj+OLhXI70IoUdQh6jY2mnh+yA7aOMPg+GqQ4VY6dZp30/ocUIWMK45ajYVr
         9f5p3oDYwNikzaFf0sxa54HAALXXS3sDo6EsKnzU3m6EQ0N+4Jf+f2DqQ7+ntoQM9vk0
         h4UorzDGINxPSP2clVFvkTbnWR6WTLrheKRRuh1fyKbxKWD7clTMnIExgnltBeQHi59b
         zpjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXB1+O+Rll2CVLSvsc9RNDPUAOkEtecrGgBAkBMsp8FecDIGXIT1JAFNM5GQu7PQ+bp/Kk/rdSbXaov6pyyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX9c36NCl+SxT2mbjnk9sXPF4GWA+1qNPMNctoyZ9bTMJd5S2N
	UyDe4qq4/F8I6JUVhRaGPTDHwY9TFQM6otq0Fpzjxj06ZuMxZw72fs4TNTiS+XNsCXJaqFB6c5e
	i+oaeaDCRWoNICVx57Y+2kOFjUiQSmtL1FZQ5TLHp
X-Gm-Gg: AR+sD11psnTXa8UfPr4L2XTW28hk2vUUPyKeAC1xD+RWGFY6lmXSIuAUNAaqkvHO3/m
	2OaS25Ci4adS8GXy3CYvAyXpXH34SE/lAtGmiSBEfu3i8Ex2FtpR1ufBku+Vr9AlAgWLDFzIC5D
	M8yHLGufjCNieE/6g71UG2huBa1pLMu2zx9NiCv8Zyp6KPYbf1RHFyKa/+DeKaIbJgIfKON9xNL
	jF55p/x8pM4PmoXi3/9yRzrENc4SMvDw8LeU0dJaU5/1KZwh7jTDgI6WFUlExijinF1vxPOpu1S
	IE6ow5cxGI1TYEGeIF0+fBBLz4fyt/PgY6+61ac5kcoWbv7sdM9qBnbQ5GaFntvuFXSsuuXOdqV
	yWyrk4o3lhg==
X-Received: by 2002:a05:690c:480b:b0:81c:872a:5152 with SMTP id
 00721157ae682-82022510fcbmr127613327b3.30.1786102543795; Fri, 07 Aug 2026
 04:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org>
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 19:35:32 +0800
X-Gm-Features: AUfX_mzUutrA5-Q9ACqE0pQ_D7Us70orWiV3KcyO1fjFDW5_he5R56G8cIzEovo
Message-ID: <CAGXv+5ETE2WAA8jwnQKSe69aR=qrqKnALuiSM12X_ZwFouxdRA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_043545_317054_EBE5C987 
X-CRM114-Status: GOOD (  20.05  )
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

Hi Mani,

On Fri, Jul 24, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v7 of my attempt at integrating the power sequencing API into
> the USB core to support the USB connection on M.2 E-key slots. M.2
> E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
> Hopefully this is the last revision. However the pwrseq patches haven't
> been reviewed yet, and the fwnode patches need a review from the fwnode
> owners.
>

[...]

> Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
> driver. This is only used for the USB target, but there is no attempt
> to differentiate the connection type. The driver simply tries matching
> the "port@" node first, then falling back to the port parent or device's
> node.
>
> Patch 13 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 14 splits the Bluetooth power sequencing unit so that the USB and
> serdev consumers can separately toggle the actual state of W_DISABLE#2.
> This patch is purposefully not squashed into the previous one to provide
> a clear target for discussions.

[...]

>   power: sequencing: pcie-m2: support matching on remote "port" node
>   power: sequencing: pcie-m2: Add usb and sdio targets for E-key
>     connector
>   power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Could you take a look at the pcie-m2 patches? These are the only ones
that haven't been reviewed.


Thanks
ChenYu

