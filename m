Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EA5CD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=; b=uKprhLkxHWa3oRkndGK9OdhkQq
	867uAKkdK8VaTGv5EhqnZQYj7japd57oqRQbKeRonUpyyq7oU0HHY9X6SmeWvqyZrvL1nfo5Az+p5
	ox/ph83wTrUsfsxLt7d0Qi3v7VAhp93J/v68IM52291JYgc1yGq+K9k97fBhZU4QbXp8rSmVq7Au5
	BDnZZ5GeH83YUnGbaUECzXOPRwcwrZeH4DBWt5zCJ5jMxtG30b6kjg66l1k+5Gu1/QiyFQ1N0IHBn
	UxTf1CMBtWfZiTP33/29r8s+iWn3TghQzm77lNVeYGc+0UAi8UlR1sg09b6MPUm1dLHHL6GZLozZq
	iH7fRYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwBt-0000000ASo6-3pfv;
	Fri, 12 Jun 2026 07:20:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwBr-0000000ASnH-1IiQ
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:20:32 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7e16f05fd79so7315457b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248830; cv=none;
        d=google.com; s=arc-20240605;
        b=Lqzq4O0ixJ7a99bT5xzqMNdxcItGVMCe18w8X6U6d+x9KdXG64N1B0sr76Kc70jkgN
         0/Zw+Y3ppwq8vSlG1oeItTp+aIKWAevvaEV74w0wT1JCJqe7OFPvUdTGgtyslAaSAqbt
         d2rUnTGzu52l1eEy419z928XKi1+EBMEOor41v7yzYEhZ9yD4S4BQo8n0NC90ZlamPYS
         eGB9gqYbeVTs3sH6Z0dKm/Jmyk7S+bRnSSKR0wyZZp2ATnXx2vUowHXhv3tKqiuLVy+w
         VurKKtN00/aooTRloTYCqvpH1lLPIi2dE2dgEFV524fewbQOV1j9kgwrqGP2EqgLGc1U
         SgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        fh=QxcsyZ/dsNDtr4RJVaLRMPZkGkELY3pT3EhPKynNWRM=;
        b=jWlHXUvliFOlbmWNtwgAsmRFuaLjfacr7tW6fayBMHbb9OH1txcBkDcdR1NrIuhAtX
         bLreJG0mGT3GvAo2c/HV6THkGeE6uIKiDrgmbNcd22sETNXbaOEMo4JvQYU6L70cGz13
         bec5qrIEC7Jo9cDw1dDxOUh6HipMtQgKPUtYM5U+YdfsgvGzxKGJT4nM7nqZyF3J9+gf
         czs1iZ/PsTIsHN3mY+zUt/0hNSgeQ4j1mbVEuF/5RbFu+cZs/DgPHOl0/OQQLM6m2MMl
         Tjx0Q1I4vIcLSR905VxggG80Xb+THWmtAYzaKkntPPLojADLnrV4UgkoeWkhHcy4XGPr
         +INw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248830; x=1781853630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=J7ADuSC+g2eYlfBQtkOd+1zwPOXJmZTlllVqUcwc55FB2/hd1uUB4kzJHiqhLtWkmd
         xqM8ga/Mgd+knML9G5/+8utiWAnUB2ehM/VYnfpbNMaqexPJYuWifITGBIKpmX4Q9C7e
         njLnsA3tWGm7MOJHXnVFvf/1WMcvdQm3qsXGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248830; x=1781853630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=snx0baPE23uDfKTzab97n+DgttNmXEuctIubJOmFeqhr+GBS18Os65FZvx6nQ15I/X
         INxWbLwCG9jn1AUt9H/WlqtkysVDlkHgKkxAPU6AHT7bCyVHg7hcfwX4bR/SgMj0YdFt
         VG0NGSyLVgyR+kXJdxhXAFTOzUJyzJIIbJGuL7GhdhmadSro2uMp1hSx5tCGEBYt73l6
         MRYYExLsyX3s+ljiYPjTnTdgxIvq3g/MI6xbTJYNCXb1yAXlcyrl59Cr3g2usCA++tOk
         huwo6ZFMoQslc2PA1/c6FC5fej2gkINht5wY7dIspc8lJd+1uenMlOwes9dvUpXhjsni
         Aarg==
X-Forwarded-Encrypted: i=1; AFNElJ+C7F+dt7/u7NG7tGJgZ4dVR13RpQS8ERsy6fWMiFUtQocivw+oBQfuq4Zsj9+X/ZpiB/urBVZwbhz/bbRP6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0YOHL795whQDGKYR7WYGPewoSsjN8uNmu+58/111nnjcLF7Is
	YGiojOKPhrTV2ydLBOPbK9Xyoe2ePdgECn78xfVr55Fnmgp+jc0voHuO8PSlO7UTDVjNIFqweqC
	5XNI9WJ12GoD0EuMHQ3WIMkrFozPpRwpEAMVIURok
X-Gm-Gg: Acq92OECFbV13Vs44tb0klPYbM52WUobTLBHQeRJygChfezvvlRZVWAZ39+FDjKRMqZ
	WS/rvCKxHdb9xg0sNhCQd4azcPlGy6ihqic+jfU+k88ntwk3gnZiFWQUsVGA76gZQEmGpDXR9L3
	ulx0c5sxSIoJ1WkkbtlS0bTMObxTdVmNHTGjMX6lVuWlRQxtJAJeIN5wDzINoD6DGYlgIGLtuOM
	9jP424scA1gjoeteVlk9dCtPHbu3Gfdl2BF9+Zhad1C48nvthMjjmmkVcnwpOFlGv1DejU9ekpR
	C5/4cxlx
X-Received: by 2002:a05:690c:c4ce:b0:7ef:81dc:c0e7 with SMTP id
 00721157ae682-7f7b6242881mr15277067b3.19.1781248829675; Fri, 12 Jun 2026
 00:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
In-Reply-To: <ailv8HpnrCH3Zb8C@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:20:18 +0900
X-Gm-Features: AVVi8Cfix6rlRxpmlL_G61si3smqjEz2qk3oIH1X9DTqc3HutmT3uL6lEMZg0_I
Message-ID: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
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
X-CRM114-CacheID: sfid-20260612_002031_398071_B810CD1E 
X-CRM114-Status: GOOD (  27.10  )
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

On Wed, Jun 10, 2026 at 11:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> > Due to design constraints of the power sequencing API, the consumer
> > must first be sure that the other side is actually a provider, or it
> > will continually get -EPROBE_DEFER when requesting the power
> > sequencing descriptor.
> >
> > In the upcoming USB power sequencing integration, the USB hub driver
> > first needs to check whether a graph connection exists, and whether
> > the other side of the connection is a supported connector type. The
> > USB port is tied to a "port" firmware node, and this new helper will
> > be used to get the endpoint under the known "port" firmware node.
>
> ...
>
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
>
> Yeah, you see, even here is inconsistency with previously added kernel-do=
c.
>
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     struct fwnode_handle *ep;
>
> Unused?
>
> > +     while (1) {
>
> This is usually harder to read and follow. It's like "pay much attention =
on
> the code", but here no rocket science, no code to really pay attention to=
.
>
> > +             prev =3D fwnode_get_next_child_node(port, prev);
> > +             if (!prev)
> > +                     break;
> > +
> > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > +                      "non endpoint node is used (%pfw)", prev))
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +
> > +     return prev;
> > +}
>
> So, this can be rewritten as
>
>         ep =3D prev;
>         do {
>                 ep =3D fwnode_get_next_child_node(port, ep);
>                 if (fwnode_name_eq(ep, "endpoint"))
>                         break;
>
>                 WARN_ON(ep, ...);
>         } while (ep);
>
>         return ep;
>
> But also big question why? to WARN*(). There is no use in the entire
> property.c.

Will drop. This function was lifted from drivers/of/property.c then
adapted to the fwnode APIs, so it still has the structure of its
origin. With the WARN() gone, rewriting it as do {} while() becomes:

do {
        prev =3D fwnode_get_next_child_node(port, prev);
        if (prev && fwnode_name_eq(prev, "endpoint"))
                break;
} while (prev);

return prev;


Thanks
ChenYu

