Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584CECD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=; b=pTRV8hRfWkuORYBrvoYWAST7dj
	b9ocrWZw9ECuvfJ+8pHBW30QrD4VhRIbXTyhStVij6IpZKRD3dg/rkAMDV+3x9cckNeahJ3v5uo4T
	XJtxJqHCb8A7SdXbl7qoJdF1JEjCILRw1dMM3WWTrqSeYQ8yrtItLDMDdVpY6/DBSZresCj5jtex5
	U0OiW1R2KOYgJzkh5gZNPEYQfQagawd3xlrHhSnmspMX3cwuMxcO8b75IrbeXX5PsR73he6xi1KW/
	BBTvIYH5NaepttDCEZzlUF3BDUO3e/aui4OaVtKRW/9GyHShy0qs8e6yw9nftqPlLq3LU4m8n35BJ
	BiNJanRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvz3-0000000ASHG-0sVX;
	Fri, 12 Jun 2026 07:07:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvz1-0000000ASGL-0mY1
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:07:16 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7f811da1eedso864417b3.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 00:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248033; cv=none;
        d=google.com; s=arc-20240605;
        b=b57f3wrg/hOyKU3AWpBFWojdiY3wgzLrEdaxc674xGhJlXu9BmOlgS6hr9caprwTGs
         4S7Cw0TOb5x38rsjSwHBkzMNsKfyNnR4X4gkVcA7uVc79KS/KKVPPrtrpINZ4reSlB2V
         Qee9Fz4VHSskeQ9RdmipAevCN84887FXzTQZ3dEc/Nj5cpjQtstJA0jnlp8HVwwQSct+
         PIsiteZfYpbvzpCPo8jBeRq9f6kwwX8ilZd5v4pKSKyoiJRMl7o2efBUaoo2zNn7gsv3
         3kMlODT/qYLuad28SvjatYZb+c6JBl/2B/79wat2aXZHTYav3LUSGhl6O4Ws2IoPXVgN
         8Azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        fh=f3BMQoA2mdD4XW/FT1KJajX53OGBWCf3bcbYeLLt16I=;
        b=YF4WClt1nV2s29qepMVj9vlajSHm8BNB854QBCnfonyzG+UhcknFHzJ8iIuY+UuusF
         BqWBsbk/eZ0oBSjl1L6CI88GwhGL6WYQRYq0an9WjACbv3einAWjK24DZ0TcdqMpionK
         D/B+dSPO/4fhTqIo16k+/+IxR0894g838YLE8iX+hm82Kj6xbovNsePdDW/kLtc2vIK7
         zCbD4yNlDvAKo3EUnWhWBaJEvGE87uGIai+CRbB9eJRnmTIv232qZs9ZAg4OgQhKh0KH
         0SyeC+HeM62C/Yzqp8/Y4I+UMYhMMhR8WmhJR/zfpS0I3zZoWz/QISOHIVd+05wXm7Xb
         D1sQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248033; x=1781852833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=LfsvN5oNXJpNjEehIsrgjqj9hvM8V0z3ez6/6d3eFcGkF2EOhOsOCNNJypuxfBejwO
         OZU3kH2uQfoaRfLRZ8/l74gQ1Sk7i//hMqtL/r1H391EZTQ2uWCdqDaldDifhR5bo8Jz
         a+LPVGJ9hcSSmA3MN2V+EdmrR1I49NwRJ74hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248033; x=1781852833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=LSqAdW4Uu8NqB/AQ5VGuDNPfr0uYX7rQq4+w6+//yszN6gOtl78wJazCpE/2SsBewm
         vwLsh76JH2WCTnWZQqWeto5vnPjKf8qaugYIaMhgUrJt4FaYvxGE0RZ+ESwJ0pEHmRfV
         NvM9/MDNFVtKbVR8rXJUjZjYprWlEv0MJW4sEXcLNjfQhvAwvwmF6AEyyxk8DQwj+Xnz
         MmJIwi6WYuLhcc58esDLobLO2gyVpXXx1lnIOObc4rdMuquTySETeSJM4F+linrDfel9
         BcfwwTjHVoI/HgjUMQAjG82b2uRWRQToexOIg7/a7v8Xk2A+26PQ51fazszyX7xidwL5
         eUMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ViE1kg/50R7namxitorrMkBeDmNwAZMzhoa9LIRzRxEKgsoVAN+R0zdGxUWe0GTy2cxPLKOojYYKwJTpgoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnHo/ITP0pfBHLoTP0Ollg626UUOnv2JCUxrJD34kBRu6KxjRJ
	ihdVSFO30Ijoi8fW0d6I4OmrKes1XPsv2SL6L+IKIuGwD3/yv3uj6qVnm1xo/ZnQvY6tWRpovID
	wNS07d8d7Fv8UOgmRwLg7gPJEqegOo658mlZ5mC3h
X-Gm-Gg: Acq92OGQjoYTO2yQTeQ0TS9IXn5Z6sf4P3Le7aeqc1wZfW7ZkeNbgeVDh0NN0Gl9jXt
	el2ZoJKghPeXnTYFpSQIxtNcVFrRTIhya3/HuRAddo0fLbxsZMwLPIWNZRAWtj+O5kaZWFgv2Gs
	mgobJk+KNxlOLShUJ8SE5czCIxVcMxRRYTZy0v6mFp9b2AE2NG08BUEOr3Dc+c2GJJR17lA7aA4
	ZGkvEqBYjSVC1gs1Md+lCufBvBzlGYoAB+GGKPYx8661kfzNXOkPR4c047t7JiQ0woZ3aMHvv+I
	TIPPeRAJ
X-Received: by 2002:a05:690c:e3d1:b0:7d2:6b8:6e4a with SMTP id
 00721157ae682-7f7b6448b2bmr14221767b3.18.1781248032935; Fri, 12 Jun 2026
 00:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
 <ailtMyYhbkOgaZWw@ashevche-desk.local>
In-Reply-To: <ailtMyYhbkOgaZWw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:07:02 +0900
X-Gm-Features: AVVi8Cewi0jX5G3AwANJfv_JfU8wtj5jI6ryJrZRjeBtUWWvLVEyokylnfzsf8o
Message-ID: <CAGXv+5EZp0KvTqMde9da9mUWJyg+6X6Eon9Sqxx0VbikfVr8fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_000715_226786_ABF02FE7 
X-CRM114-Status: GOOD (  18.12  )
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

On Wed, Jun 10, 2026 at 10:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> > In some cases the driver needs a reference to the port firmware node.
> > Once such case is the upcoming USB power sequencing integration. The
> > USB hub port is tied to the corresponding port firmware node if it
> > exists.
> >
> > Provide a helper for this.
>
> Okay, if it's really needed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +/**
> > + * fwnode_graph_get_port_by_id - get the port matching a given id
> > + * @fwnode: parent fwnode_handle containing the graph
> > + * @id: id of the port
> > + *
> > + * Return: A 'port' firmware node pointer with refcount incremented.
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer.
>
> Note, the Return section must be last one in the kernel-doc. The last par=
agraph
> sounds to me as a better fit for main description. Basically check how ot=
her
> kernel-doc(s) in this file are organised and follow that pattern.

Will fix. I likely just copied it from the nearest function which happened
to not have a Return section. I did a quick look through and it seems many
of them are missing this.

ChenYu

