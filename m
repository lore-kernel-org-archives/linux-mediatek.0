Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF443C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=; b=s3PdzR/574STnLSelyqwsqrJKG
	+aQlAOJq7x6pTdh+VwGc20S0rMdet8BFYCcUCDUSQVh77fKzciifZLdcifirX+bwbTuiRrAZQ/9qS
	qSX4O+FPbyqAkpx5YPwqL0Wv6vCMJj/RKFQxajPkRgDVJCyexL6YfVfez7w4xixO1gyUxDqN66jAT
	OX0Ony7fAW2jNNPOLdj2dh3ckln98RxFrQgeyYevkbCG/WQEhvYE94+ZW70Ym5PTj5mXjQnSVphvR
	NpGjH/gCJ4a8DzAkgiLBf/YaTi6lAfVCSRXetBbCjFhgXnrLqVx3CWq2b3FS9Wm2/efxMQ30/fSVC
	2GnZHNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoY-000000074nm-3LFJ;
	Fri, 03 Jul 2026 13:20:18 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoV-000000074m0-2ejp
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 13:20:17 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-664b3831a20so757188d50.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084814; cv=none;
        d=google.com; s=arc-20260327;
        b=QpyPyTENIPfM5UCf8GwLnU4Z2tElrp8C88MaUMGSW4IbYbYDq8HW6lN7b6BWvzKyEW
         dxqaMHartH+dA+qwuDFz5vnHsDjMUQwNBLnMCfbl828Z4Nr9bmlZkTARd5aDtudJwkr6
         dUUZbH3bl45Y9W+y3wwhUmi25a6BPPvoeSOa91ISXnI8oc6kQ2Bxpef9f4QuU2S4B9sJ
         gHNPPiXj07znqyJWAlAQMh7Xg1JA4K3EgspUTiDryDOR0hjTA8JJ69MKTnGgtThmv/3t
         9LA3YaKD7PhIwaHo2Vf02zaV49k1/HNrYWU2uMjC6ODwGkLkSM5u191smPbMoehUPPZI
         6INQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        fh=isZdwqsMb4AVZ2My5/V28Vne60UFehTCIUsfDFrsNg8=;
        b=obgPBVmglhCgtBOdGBcKXzrI+v1uUwPO3ESNeFdzp/SbcRo8LIvmFoKVjRWTskYcXI
         19Fb000oWBGQnEiL4L/9LGnsUaUlg0f66y9X3PeXsefDtZP/VPVtfCAtiVTdwMuhd6Za
         ElDiBwpM93VBYpR0JavS0EI4CZp18oNzgoIbr6suRVzEcS2zK726U4K3fyji41f28xmW
         5Tpa5WvkLk8nD3x/90BvoZn/FsWbTlmGDRjaouREa/qFDYF3IK4RXk76/YygavODTZ/e
         fqJ406dB9TiBhEKS6TDmK+1pNKilxFgfe58Gyb2+CKgCRPLpTO6dfEkTh407A9fjd+3T
         fMSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084814; x=1783689614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=CU3TRvWzriCBbB+COt1gipzShuDEORoHjHMQ4RPxSAu0gCNES1Wm9R0QZwLw48/nIk
         8jhMdPL0/LzKU46KH60Wuhxa3I10f6a0PQ2wTbDMkEeIOUhWvujnOVO8QvgLaOeKLeLn
         3koRRMUN6rPmj/v8FCf/Zuk5UA6vwMDyuO7JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084814; x=1783689614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=MSykxMxiBZQ7Gld+xq2/6T0QyaijGWpAcM8XDw9y3qykQU0uLfc1VfFhYPG3OEHH7t
         a6CVcp301eS9S4qLH7QEBkOZn0SkiCmkq6LTccWAlVihvHH4t5hrkPXKLc/ce0QaaDCN
         eW3VWv1O/niGBHltp5cTv79LbE4RsAiB6sNF0i3fEycShvLaRIzydmO5fghbmOZbhtqd
         BWFZzBrcaYTjjDvmNJ19T1b98HWcaYDMpqWdFBCTfs0zpgvJzqD2pXC/zJ3kp3EZzg+r
         9MkfMKwKK/s232g0STzcsDfV1ZLS4rVsr9EHWxjztRxGoQ4wo7fLgaE2fm0b141DazP8
         zDrg==
X-Forwarded-Encrypted: i=1; AHgh+Rqw1YSM3ADcEc4ghu8DET/q9u/dCCUxGJzpy53tH0snTGj5nwEbzmXWXQHamgbXIvKGJhMXHTjpLnysgyMg+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKHgCLEwBXMSPULTDVMjFCz862ADaw5obQWoRCaXIf/yinj9W9
	R7D0fUnfLeI24QHkNbG+u3ChvTqTHt5vx5q6wRMrqE5nZdBKa1qeXG083KkGkWH2gZR0YXRHfKV
	1b7kE8O8BY3rtj+h1CQiHvM7wn7lPvhv+1eisDgaT
X-Gm-Gg: AfdE7clVhIYfoVc6SH18bV4mh6cJeaXyPpEr2Z23iaRJW26TXijZ1aU8oIinKvOCnTE
	LgZpefviqtYM96+KLlKr8QYbr2BPDeGRb9WxinQvOdHPHq2o3UJsGzrqylDo3ch47Qgem9QStLN
	Tfdevu0GAa1Kil6I/s0q2K8pbiHBaqhASm1mXZhZrG2GHhMZozDnGPpa/G+ZxGQPFe5GU+qkCBR
	k460LPjKPbDMhEstKQwJKywD/hAJXHGUyGdPw2ZI4DDuiMmk9Vt65SvfHr8f4kFHbJHBfmdxC6U
	Kol7F4h17f7gF0fkGHiKKq9HbpE=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9923763d50.75.1783084814296; Fri, 03 Jul 2026
 06:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
 <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com> <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:20:03 +0800
X-Gm-Features: AVVi8Ccxmi-jSFxGKDTUuToCDHyjKIoBrT_lajnjop8tp06Df09KPZI8Is_qoIU
Message-ID: <CAGXv+5GH3navtUC-V--dJOEjqiDtOauXf_TKxzdQ_T+bK_v9gA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_062015_696132_BE429CE3 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, Jul 3, 2026 at 9:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >>
> >> So this is only needed to not have to track the state in a separate fi=
eld?
> >
> > Correct. Reading the field is not the problem. Updating it is, as the
> > fields are packed bitfields, and Sashiko suggested that locking would
> > be needed, though it may have been for the peer port, which has since
> > been removed.
> >
>
> I'm not sure if it is. The user controlls the handle. We could argue, it'=
s up
> to them to provide synchroniztion. We only assign the target and pwrseq f=
ields
> once in pwrseq_match_device() and only change the powered_on field later =
with
> pwrseq_power_on/off(). Unless the user does something weird, we should be
> alright. Maybe a small note in the kernel doc would be in order.

I was refering to the status bitfields in |struct usb_port|. As you already
explained I think the pwrseq stuff is fine.


ChenYu

