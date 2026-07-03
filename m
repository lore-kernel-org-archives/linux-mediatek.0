Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0238DC43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=; b=hmDNHTmqw/z7RnXu2jFWFecZKD
	0TAJ03LMpJKOp+QHKscmis7yWeZtqayvNofaEm24AHnuWjnklA/DQhoQZfJgHyN1At3dKKXsmMmVz
	Mx/qAcOykugoDN06vhuQpZKw892lzoLRhbLqx7HAcj56WVmzVoL4VhP42NdHokR6ydFyK/jbfbToh
	m6o2Hm+lUJadyNDU3UCdVYipmNbM+xIwh/Kz7S/6xGO/zLF25gRg9oaMIW0wy/kvZF7tbEyXFStew
	RlAJYVygHIBYg2CIJoh5Ekl/zECFg21P8FFcTwnTQtdKRP3cWJKUSBeDSmgaU2xqQCOeBKaJV/7g0
	Y5+h+lQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfduE-000000075S6-2AEn;
	Fri, 03 Jul 2026 13:26:10 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfduC-000000075RI-30uJ
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 13:26:09 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-664cb440f9eso667986d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 06:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085167; cv=none;
        d=google.com; s=arc-20260327;
        b=GjfPfLouzlEoe3dlZjwF6WvglZW3XOQ/05Ia5uFYepPc2Fy3PtAlxwXljMaQV9ApFw
         lT0507gPVRipVRJqVHlnc8dbrjVfiqWzDuQq+cvbgbXnp3eJfcwXAjbdRIwrxFBMCYV3
         AVWZdbmJZboSz0c7wAqIS1LkWf9kPA2mRXAJ7Pxz+N2P9KfWSjJXJlM/lBNCy908JQtM
         LTAbOK+dktn3gtx7yN3uAFTF7UZsLh44HS7KBYMdZB2I5SNuh9oDvzX+il1cRix+dp3Y
         jy5p0PUTcO1v3MvzY/wd6eTQ53/4pBccCt8gVQAiTCRkx238zYFfxF3dNsTfwRtG1c9h
         u9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        fh=Ikgci6gguTuXYJdsjegK0iAxmyN0aeUmj7pI4MZM3AE=;
        b=m5XCnCI6IKUuV7XZVxHi0r5QHS9KM9G1CP5mE8OeI/FhD3+CsgHJXuQLX6A1jfLnuU
         0b6XqlEJpSbxwRkS2D275bfy1k2hej0jZ0+r4HCc30Hqif5PhLuZ3GoJ5mHJY7AobOJz
         hUjySu7+8GRtt6r1R/YREJ0N9OYRKLPaNtE8D2cIPl0y6g1BJmqhrZ7ECiQde9Rj/wRA
         V3VuqUaQ1JnnBLs7gozxJF0Cew/ZRvoWh0d4qERErjYUOk0ZHKKnOEpTj/nAPGA/utjT
         JqXV5aM1zYhfRA0iEaN3IACzPMSvRX4aPVX6cXru2lnz682cjEpK2V5rpT/DsuSeWTbC
         v3QQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085167; x=1783689967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=BfR+bwkWbCBlTApq3LW8bA6HM6BfNjlXiCeg/mjOZwy8PcSKMXqel6hvh+GAh7J7VV
         Bv4N+pzikUhRkRwI5PwyaePPPKID5vBgi5YA6O6fGLDgtxII050h3O0D2oGAmudD8Tcz
         n9bVyA2k4eq+1m7BSqpR6kN/tutl2akESfPEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085167; x=1783689967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=Tucs4Xuq3z9+P1H8vZfd7LkbgQjanr7yxTgAprU9lhgyDuesoZ11daRpI9RNjnZW4K
         skCo4qWtyAOwuz+FvsV/WJJeCmUa9dMpDxMiRUfEwGKN8P14HfByax2vmkAazruRd1Bx
         6X6v72oQkAUOPIheAEWIhkjRkcr89Mak//ZfWk5UqzDkDx4OnzKnieZjZ80asL5soFf/
         r1gATL/7rhLpzf9paf3N0eP0SgGzMOyp/PwedViMsTuSfWgIxGP0luOZXamJ5NQAz7sn
         jVb/c7V4u3jWtRfPct13GGypM/ncoE7209ZhznkLR1YjxQ3zPAfGCxrr47QQpwKRwBKH
         m7MA==
X-Forwarded-Encrypted: i=1; AHgh+RrHvDRaYg8Fv2giXEMxV17TgE8f7I4G6jHTAHO8C3fT7aRyDeniU/ekiNFelsiCFkYySigpi0o8/3RuKzQDFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAaPK7Kh6nCrVPhu1JFzvfbVUywtW/1rCmPU0x3QmjyEI/gGw0
	r1BaNsX5uSGzdkOl8fd1SHDTkc9h5jMFZkJ5D5aYBPS+OsH/8HRu0Vvh1EsE+nmAh3iXADEmgD3
	HW8Iq91uRAoL2buHe+WVaqu6kt9JOFLxD5tImq2r6
X-Gm-Gg: AfdE7cmKZx5OZTRD0FfqEECOo7IXNzC79rKqLHLnAaDU+68ikhYvxKb61/sZPZ2qlYq
	mwCLGBYe+FLztMSGsieE7OiV9KAXzh+49XYIBPD3I7mujmUOTIEyo3+3xvQ5bW3gIB5QOQ/qZsN
	l8b51l8UyvyhO6+zh/nc+tvQeCBD8k/tKnyWz6FPw7ekZFZzlCaJOgCzbXm61QznFHOnUsLovmY
	lxJRpEoYQghEUVCyabFNc3huYW0pllg9l/zTGrYdSAuvBBuTfoy0uV1hN1KJZkm5mxYCm+usuO5
	Im+thON0b8CJGFNcDnQ0f8c5kAEWvaV1QI1o8A==
X-Received: by 2002:a05:690e:480f:b0:664:fc22:36cd with SMTP id
 956f58d0204a3-66521ad34dcmr7426372d50.43.1783085167252; Fri, 03 Jul 2026
 06:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
In-Reply-To: <akeyxn390mVmYo83@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:25:56 +0800
X-Gm-Features: AVVi8CePOG6OpnrlSpGFhkpL2GOtwCFUk_NB8IIc5qFTOLO5i-BW3OK69XKCfdo
Message-ID: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_062608_812646_752C6D19 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, Jul 3, 2026 at 9:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> Now I'm more confident that it does not mess up with ACPI case.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you and Bartosz for the reviews.

FTR Sashiko pointed out that this is likely leaking a fwnode reference.
I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
in the next version.


ChenYu

