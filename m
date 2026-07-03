Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934A2C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV0Slrjr8IXK+MlTCt7MN9hZHNcIK5BTbT3wdZMhFWk=; b=OcBhiUVxoSMEICvA/9Q8XGlSK1
	PuU2GZH9sRz3UXqiANprkObXXyh5wJAm+ndcjRFmZ37ZlYpwKldVWcU3EhbjDrkj6qCPC4b36LmT/
	8GYx7RamoXDP+yFzCWbTmf/NtOSpTX3SAectRosSDgA+v/VWQMKEsyomhgeBQqfzSBpTXjER7WSMQ
	8uzuJv+aLupikCnPrs6p7SiyqN3aMpuUgLahuAFOotadt40rqcOmw0ZZUsRr2HowY7+24n7pTdHYW
	CLRbjDieHrQyf/qgABvauvPiRZuFJZs1MnwnBuR6ePV8oxMYqeV2veuXgaPtswcl5bIULC2c6qjxJ
	fw356a4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdl8-0000000745f-25Ph;
	Fri, 03 Jul 2026 13:16:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdl7-00000007450-05hv
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 13:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AEDC43A2A
	for <linux-mediatek@lists.infradead.org>; Fri,  3 Jul 2026 13:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DC61F0155F
	for <linux-mediatek@lists.infradead.org>; Fri,  3 Jul 2026 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084602;
	bh=gV0Slrjr8IXK+MlTCt7MN9hZHNcIK5BTbT3wdZMhFWk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oSjWQJMVtg8g/LXoUb/K2FqnMziWICTYSrswtHn0oREeAe9aGAEYylsP6FTuQE+dn
	 wjGcvMuvcRqlVqoh7z8fwaNzIObZDxlRBmXX30cJheTBHAMRiQRW2RuEZByS4wcOe3
	 jylAsGqYV5LUq0Mtm9kijSAaV4jz7Z1m1+pn3+uswdn7rouFE4CSzcakh1RFvjbTVG
	 TAo/PBKLlq4cY94y8732frnrFqI0G+57B/6Coa9bTvjuMcke80Ok/wRiEhvPcWYLrq
	 QZcgKjIj341ZG9DxLr1WSAQ9oGUWetnM5Ixk3cqNtqKBGe3XjpxSF3vLN/YA0yWB72
	 oPqwysfcEV0eQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39af6402933so4937221fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 06:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjPpcMXkS8JEtqKk74k1deNdCfTC0qxpM6II+XGLvoZzyFyaYEtdClo1HPKYN7Op4mwsYAm48tbpSOgX+q7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/rNToiALSmLZhiNU3FB1kLuyiNz3XxZDQnVihDW3ex7x2yJg
	j671e126sPBysk1NmHhF5VdZIO6qDIk4I5OuWzLNmfeGE4gLEjTpjgONeFQHLrZ2YKiAa0LK31L
	A/E33eQufJvGpKiktCkX5pcXM6dILe4VN3tEKoRo/1g==
X-Received: by 2002:a05:651c:2554:10b0:39b:90f:b1dc with SMTP id
 38308e7fff4ca-39b36e0af76mr18538581fa.13.1783084600750; Fri, 03 Jul 2026
 06:16:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:16:39 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:16:39 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com> <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
Date: Fri, 3 Jul 2026 08:16:39 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
X-Gm-Features: AVVi8CfEGr9ongua6ulDVSCJ0raV9SIaG27LcZHKlrYzQjvFFBvVAoVU8_PqL0s
Message-ID: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> So this is only needed to not have to track the state in a separate fiel=
d?
>
> Correct. Reading the field is not the problem. Updating it is, as the
> fields are packed bitfields, and Sashiko suggested that locking would
> be needed, though it may have been for the peer port, which has since
> been removed.
>

I'm not sure if it is. The user controlls the handle. We could argue, it's =
up
to them to provide synchroniztion. We only assign the target and pwrseq fie=
lds
once in pwrseq_match_device() and only change the powered_on field later wi=
th
pwrseq_power_on/off(). Unless the user does something weird, we should be
alright. Maybe a small note in the kernel doc would be in order.

Thanks,
Bartosz

