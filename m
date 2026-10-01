Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AB5CA5FCB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=; b=GQlxFFZc7qoPMnAmXnuKrgUbOi
	rUmvrsuwcBDFXHWhpvPyNio0MEAKcWm3irjhiw7LnTwW1JCLghfAvKkgEpjMvubI6MBeH459aHm1Q
	6nRRTMZ8Rh8tD3EElbutsp4wireFgbx5+sil1jp4SB88jPsISW5+ViQBSDxZpdyy0jjGtDBIaPqP6
	3pdelKdnvggGmfPD1UwTPYv+/Qsc5jLD91suFgJUCj1OT2nwcZKWwgOGJQ9lHuuJkNlmoYXHoLbka
	/uS50j1dG1HWuGbgsSt7KNCHwKKba20Q+mJqO3RBji7MF+FnXxOjzSYRvVtrEUO5jp0V11S31CITI
	xdBeJwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEQC-00000008ZGA-0lb0;
	Thu, 01 Oct 2026 10:53:52 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEQ9-00000008ZFB-3tHC
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 10:53:51 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 956f58d0204a3-67567ff2e77so2541075d50.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 03:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=NY7TQ3gkKkG+Pu4VkstwkiajrUjO0E/55z9GQykkOPCaeXMxQ99nGAUmdYNjHFRq1q
         zhiAgkI/UUFsTEPR3AD7o4J2U5USy2VCufAP+jmL2a6Gmu5CGsPFgmjF/MwkcNeeO05F
         g8IQsatkjf/CWeh0+rm907CVKXeyk1lQl/VudxpaZakJPMlqaTR3/QZlz45RKLDlOyt0
         nGl9/Etk8mPj4Ke4gtIFPfdxSHqZC7/Kux/HLhw5qZ0YHZ+oK0zoWqn0gVsbycx1DRVz
         Nz59VlJ7zsuRP4rcWm/vG/PV9ODAZOX7VUvnLBc4p4zicfbr5cRdIpxHD6VzfFSAWLQY
         ABJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=A725rf1yGoF4N8loqUau5ok7OrUA1hMkyuxehXwzZno=;
        b=qR2tWosSB9dRDPcJVx+nnIBkdM7OvxIIdjQ7/wbIN/nkTZurq0wO5BYyWlHnqYhB7U
         +gLL9wb5NZL1la8Mb1HmU3VY/mTus7t1YdaO5fW6t4C+TREyQGCC7BPrP8vRNyWAhlDt
         pR2amxMJzXQRcez8IYf06nsUWQrsrVeDrTVJn5SG8Ld1+YQx6udOfgqK4hBbfp+mmyv3
         /y6ZU8GJrskbVkqJDsFUr6nLGIlZu1OOywAFWH5TSunBwf1gWL6T1OBRq6WUbs2BUeQm
         peGO3QfmzLGaPvZLjACMRCO9IejCaPojYGMVRt9UVpI9wa2J2bEUJ+nuzY6wRaAvp+2d
         l9Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=F6lsJG0MdGY7Q6IlclZWkMURnq95KA/DlZf8BXZJSqyl9wmxSq/k1BH11DEd8ht6/m
         7am79JwVIyet88rt/CCu4KEI/tpaeDzwYGE4X+f2uP4FU2TnQCtMt105G+flVoBLQCGw
         qhCirve7R74Pqeu7DFlYoOK6e/79hotBX/GOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=RagSvUmVlMHRh2Ccvs+VpmS0mA7IH4v9u/dak7pw3mt469xjfOFIYLr5LVZ4MuNQI3
         Kjnl9ganF3Mp01KLu7Gv1EcvxJFZfQAu7t4IjNnhQwpa7hbI82ZPdoexuh5xN9cEW1Rq
         yBFTcsF8CvBPWD7xaKsjF5q086SFDWcVwPPk3hvIRxtSvh93e9wkrMrnnefJeLBMGaGh
         ntcV9EktVaRnG0kzVbn7ZYfuGHzdMgDFva1JZm5tbWbVXekZ5EM1UDUbdrVbAG+jRfvQ
         FLde2I8+QaUg5otV+NJFO3sUR03sZ6WNIAdVq4anNziB+icum8Ff6TlXu1TMISfYaQGU
         9Vuw==
X-Forwarded-Encrypted: i=1; AKwUvBygwzv5ah020ilpTXvAP/ldTpWtuOwMQ1Gc6XY5FnKpBECCQqkprjAN7Wn0nPk2MfoMNbyR95SinkIXKOMH1A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKnKNQUo3jwB2L8uf+5HnbpP3r9yR1/qe9ODyg3xl5bvMZv24Ds
	Q61oSHQY/6sSGS0ucac6XnrP3r1ALf/3xZh+Robo/6FEE1vv8UA0W7drcH7PShJsUu9C4TEF3QV
	lSzowwzsiQobJfOKB4JUEyxXGxS061rkZpTyTxsnr
X-Gm-Gg: AYBFou3r6wUNaVE642vPK7nFaEegQ/9g/DiK0QqO/BwANUsu2WsPR7hjP3QEj/3MwMR
	Srqel3eOLIxAYdUiBtbQFZRxBIba5rtKCeU1Lp1+ev3YBuB2hk/RfSwxr2eVK/0+ofPJgQnz99a
	Io0lxerUeARFuI/yH9OB87SqIesEn0Xx2bwI60BsdihPM/+p6cwycIml3sLj0zxiYW2LL569OFn
	Hu3+WhtmrU+25pM1A4hXVypnBrE5pQB3K//IEJgsph4KQItJJgt7iOiJVCBiBozinSbqJMKHcxn
	++HWCQGlc/I9g5mCnJEsUNmxXKkA7a0P8PA6t/FILdIfR1qC7sUd7jLq4SzJHuTmqK0PQMfoivt
	VkvfiOMfwMw==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_035350_012899_659AA543 
X-CRM114-Status: GOOD (  31.29  )
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

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>

