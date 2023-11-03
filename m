Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D552C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnLwrLAyR7JqlbWF71omz9lusykP8cULNd4VOIkaf+c=; b=avtYZ9kXMaa8Z7U/m/NJEvo900
	7R3ZOPbNj9HeOHprutnizy5JWTjy4+I62cuXrivTBCSgJloNaIk4EgZszOnhvaRNjKyRe29BlyBRv
	a/QUEt1Np0QKJ4d5pSVPkTGyTaXYQJam3zcyOwrG9hH4IxvR+//2k+KU4ZcS/VBtLYUDO+SuwUnx+
	oFWAEY+2n0303grI20GN3yorxBTpaB1N+riMmGjr8eycmQ7EMAF6Fgg0SXIBHS1xF6U+GndNbkf5J
	vetrWjOaQTlXV+jB+a87aLoInNGodtpZ61YRwb8+vQh9bXm2XdOqlY7ViTWFDPKmx1eIAV/66y9dF
	Lxew5QMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvTW-00BcMh-03;
	Fri, 03 Nov 2023 14:48:42 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvTT-00BcLp-0t
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Nov 2023 14:48:40 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5872c652a66so237095eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Nov 2023 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022917; x=1699627717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnLwrLAyR7JqlbWF71omz9lusykP8cULNd4VOIkaf+c=;
        b=eOLhRGM7b2LZsA6UNANly3WCL2i6Bz3bVdSOLEzdqpjAhqG50TYd7jubi4fa+/SFiC
         JjC6evFGRvm/FepHJo8BBzUNegwf7jlzGzA0P0mk1YZ4SXTMkeAbAqGNAdCKZl7OQuW2
         RIicrQ/uEdEN3V4kIX7mBeYRXGguCV4z1gxPGTDuz4C5kix8M4cglUluRXLSloZVrQPB
         6f9khfhsozPSLEbFPcWcER2qRVlFw7H6dBJ/efJRpNOYkt47IEM78ANd+uueAokRWjJn
         DLrCjtQlSS1JegfFzi5NSAdNYZ66ERUpjbxcMfRlkUg3JLSUkn47JTTId3ZJbNv4d36m
         5ieA==
X-Gm-Message-State: AOJu0Yxbml5ZTQ7UgtQZR1dIGGdMDiXL+h7ho48cjv2g8g3htMYCRx8T
	krR5gyCLC4YgJVUZjjaBbt1zeO4h9/G5Vrp0jHk=
X-Google-Smtp-Source: AGHT+IGjKURclSqydK6kWxSfSIlPGOuR/YzJpciRF8vTZTp9AyFyQ8kyZAOBh+/mGVNZoVSC6t7kXDM8p9kJK8d0aM0=
X-Received: by 2002:a05:6820:1899:b0:581:e7b8:dd77 with SMTP id
 bm25-20020a056820189900b00581e7b8dd77mr24924270oob.1.1699022916970; Fri, 03
 Nov 2023 07:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Nov 2023 15:48:23 +0100
Message-ID: <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] device property: Add fwnode_name_eq()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, 
	Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_074839_315572_9EDB50ED 
X-CRM114-Status: GOOD (  22.23  )
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

On Thu, Nov 2, 2023 at 9:22=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Hi Rafael,
>
> Could we merge this via the media tree (pending further review comments,
> if any)?

This would be fine with me, so please feel free to add

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

to this patch (when ready), but you need to ask Greg about it, because
he's been handling device properties changes lately.

> There'a a patch to be merged via that tree which will depend on
> fwnode_name_eq(), namely:
> <URL:https://lore.kernel.org/linux-media/20231030133247.11243-1-laurent.p=
inchart@ideasonboard.com/T/#m489b7e83cbc755815c5002f85454a76bfb41adb2>.
>
> since v2:
>
> - Use NUL instead of '\0' and "at" instead of "to" (before "stopping
>   comparison").
>
>  drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 8667b13639d2..572e065e8797 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -595,6 +595,34 @@ const char *fwnode_get_name_prefix(const struct fwno=
de_handle *fwnode)
>         return fwnode_call_ptr_op(fwnode, get_name_prefix);
>  }
>
> +/**
> + * fwnode_name_eq - Return true if node name is equal
> + * @fwnode: The firmware node
> + * @name: The name to which to compare the node name
> + *
> + * Compare the name provided as an argument to the name of the node, sto=
pping
> + * the comparison at either NUL or '@' character, whichever comes first.=
 This
> + * function is generally used for comparing node names while ignoring th=
e
> + * possible unit address of the node.
> + *
> + * Return: true if the node name matches with the name provided in the @=
name
> + * argument, false otherwise.
> + */
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name=
)
> +{
> +       const char *node_name;
> +       size_t len;
> +
> +       node_name =3D fwnode_get_name(fwnode);
> +       if (!node_name)
> +               return false;
> +
> +       len =3D strchrnul(node_name, '@') - node_name;
> +
> +       return str_has_prefix(node_name, name) =3D=3D len;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_name_eq);
> +
>  /**
>   * fwnode_get_parent - Return parent firwmare node
>   * @fwnode: Firmware whose parent is retrieved
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 083a1f41364b..096ade186601 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -108,6 +108,7 @@ struct fwnode_handle *fwnode_find_reference(const str=
uct fwnode_handle *fwnode,
>
>  const char *fwnode_get_name(const struct fwnode_handle *fwnode);
>  const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode);
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name=
);
>
>  struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwno=
de);
>  struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnod=
e);
> --
> 2.39.2
>

