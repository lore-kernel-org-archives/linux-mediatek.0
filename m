Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4FAD1D88F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=; b=S5F88uuJm+gp9kj5kPMotndoEQ
	gLYy8fK18ZXQhn+vbDSoP02mke1QMgAHfZncJrzmvNDPDSQfEbko43xxb73Xh78ym/DLeSMcVkbys
	tK+rTY2nCwZ1n4sebVMSW6nHRNUG4GZWbBsfvj9E+UNnzLgDr+NoGo0W4TlbMfEkGeZlenvyBwuSk
	6SEw77LNa/kuLv9Q251LvE5CvP04OvscQMilh1oRuDUpu0zPTc4qDOlby8XkkdzRn2fjNezESx4oI
	ND3xG98/tWEO1SxjasA3S4w31OqdYlTzyE18GKlS66a1dLQ3P+UHhZc54ni1zvFoJ7OC1fQ11Meki
	J8KBnnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lor-000000096fJ-34AI;
	Tue, 15 Oct 2024 17:58:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lop-000000096et-1IzW
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 17:58:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3164223e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015127; x=1729619927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=GySvVzM51GvtU1NHUMFGQH2kGZLFk0GXDi/aQpOnLReGa/JgOQkjekf53uJv9y4CAz
         FwaOGg1odUhuo7939h0OxcmJDAF0gJ60H3ZlJH7IGU+2JXj1kmspG3ejHxV5e+U7VZb8
         rcgnfBt45vFyTc5eUYdzD3Xrmz37riaxCAzcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015127; x=1729619927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=ZJm57oGptw1dFb0gbKfJB5klBeZS2fOZ7fSVDYUgATBVYsGkrt5wSptOpO87a/T52Z
         etxAH3RkpKNWnpIv5uddczKI6gHl/iMUajQZn+x+lzAXo+Ioq/Hr23KX9FmJ6jJzpVAQ
         QzrMihWEJkhQGx1SRlDPHXwOhbbBPInokrzM6bzOj6Mj+yI+6iF0wPw3M7oubO1XtIL3
         kHzh/7Qv/UbI/I7lAKoLBiXyuZKzrjQ6zkugNarNcAAZjYkFSr0FS2kP7OwIPm5WMbYu
         lJxmoBzbEbXG5P9dfuIYFaiua1MBSCzZQ2QOUYITpTfjsBdyB2zLg5JE8LVb2Lf+fsT9
         GQHw==
X-Forwarded-Encrypted: i=1; AJvYcCUKAko6/7UOKvJai3jLJU4z+YZRr1fURMdHxEkehcRdsiMo8Bewg1YQMdNEKWG07MvWF74ZC9QzbOMTWTwrqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrlwhPFgQZom73HIkLNugDiycmWw6TQ5GWpND/PCLMyZn5PydS
	mcERjg7fUm2u+qV09kbgK8o7FC0gui3stFbsvNTYxUHsubAp7OWDwq2GYFgB1+8REDLe5xzqzc6
	3CHIy
X-Google-Smtp-Source: AGHT+IEbqRgUcxLevv3peNaUVEk+t2+EOtxbirvrZIOwKM49eLhe/QEJCbBsDKl6OAVC8JuVyL6wUw==
X-Received: by 2002:a05:6512:1242:b0:539:f23b:59c3 with SMTP id 2adb3069b0e04-539f23b5b5bmr4322918e87.34.1729015127310;
        Tue, 15 Oct 2024 10:58:47 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a000125b6sm223608e87.245.2024.10.15.10.58.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:58:47 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e13375d3so4583764e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZDfMP+OeMaYZDrWxxLlG0DmT0MdRz/0D+W05ZauyE0TQ8+STFPczkVlxOuhD6Xn+lJcS2296Hg820SQRcXw==@lists.infradead.org
X-Received: by 2002:a05:6512:2c95:b0:539:e94d:2d3d with SMTP id
 2adb3069b0e04-539e94d2ea1mr5104630e87.7.1729015125333; Tue, 15 Oct 2024
 10:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_105851_410076_CB4B58AE 
X-CRM114-Status: GOOD (  15.25  )
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

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe=
_cfg *cfg, void *ctx)
> +{
> +       const struct i2c_of_probe_ops *ops;
> +       const char *type;
> +       struct i2c_adapter *i2c;
> +       int ret;
> +
> +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> +       type =3D cfg->type;
> +
> +       struct device_node *i2c_node __free(device_node) =3D i2c_of_probe=
_get_i2c_node(dev, type);
> +       if (IS_ERR(i2c_node))
> +               return PTR_ERR(i2c_node);

I'm still getting comfortable with the __free() syntax so sorry if I'm
wrong, but I _think_ the above is buggy. I believe that the definition
of the free function for "device_node" is from:

DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))

...which means it'll call of_node_put() to free "i2c_node" when it
goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
pointers. So I think that if you get an error back and then return via
the PTR_ERR(i2c_node) then it'll crash because it will try to free an
ERR pointer. Did I get that right? Presumably you need to instead do:

  return PTR_ERR(no_free_ptr(i2c_node));

...or change of_node_put() to be a noop for error pointers?


> +struct i2c_of_probe_ops {
> +       /**
> +        * @enable: Retrieve and enable resources so that the components =
respond to probes.
> +        *
> +        * Resources should be reverted to their initial state before ret=
urning if this fails.

nit: might be worth explicitly noting that returning -EPROBE_DEFER is
OK here because this both retrieves resources and enables.


> +        */
> +       int (*enable)(struct device *dev, struct device_node *bus_node, v=
oid *data);
> +
> +       /**
> +        * @cleanup_early: Release exclusive resources prior to enabling =
component.

nit: change the word "enabling" to "calling probe() on a detected"
since otherwise it could be confused with the "enable" function above.


-Doug

