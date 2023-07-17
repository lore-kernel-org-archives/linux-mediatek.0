Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29580C0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 04:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rane9LymWOzuf5nVdxKmicrrVi/5Plm4e1af1OJmuGo=; b=3YUimAw8RY0dvyOz8htCLK6oZO
	G01oqZdCPM78jc62Hf6uaB0xDtiOK7Trk8ITaKkzmMcsBjXjug1eR/CRT+fDP094Mwg0SqczIIhJF
	4nq3bKD6y4xyolDI7ilhoAElPFHZaIxSd8gaKWv9pTLWIPB1kQE6mtcEwixnAMIcmXu30+s4FMtd1
	kMxT8BT2v798i8TMY7OcXrvFR9fewUjHA+5dBo9xXBZDLKlNorUX55nn2bNEQql4O6VoYql3bTbyq
	YCzTfonFDmRSo6j3sRxHWcKoch7jSXDovuWjFXDxYHpVIwawFAJtRKMGsGOhTFNAUQwiQvk0Y5AkW
	YbjaTOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFPN-001iGK-35;
	Mon, 17 Jul 2023 04:00:26 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFPG-001i9u-2u
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 04:00:23 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3457157a164so16743965ab.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jul 2023 21:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689566416; x=1692158416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rane9LymWOzuf5nVdxKmicrrVi/5Plm4e1af1OJmuGo=;
        b=DeAi7UPa7J5RPMLgaBGKipqwjcPkkqSSXuEc9ftX8/pT3LdEynyXPvvXHsoBuoweVK
         K+W20Bcm8gviQ+3+cgoCbuF6wacfW34Xhqm1f6UBpwkNqVso9STiOkM+PAE+xBh3g41G
         CWCN3iqWakKicn8hjXfGA88G1V9z0WWvgkFxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689566416; x=1692158416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rane9LymWOzuf5nVdxKmicrrVi/5Plm4e1af1OJmuGo=;
        b=IycW88ISlTAQJq1HN1pL6jDC42GEcGDOsDNLzCyduRBpbQcKG6WTJ66tIChrf7pN2l
         K8tGKGFs5O1d7+gOiukfgVpBWK0PMTfITbizucfLr26vU9i1sH3awY1qkeBkBrA26Eb0
         DMB0eRU7fOAJymqDWN669G9MXSxSFyt8LTGA0q/Uj+g+5ujyR0Znp44++CW2II1er4ms
         qzlBHdBk1st/9v8ulJZvBXpHl5APTk0Ftyr/Af2+4c/22ByLNYu969SDYYSHW6ZExutF
         IndwcMRW6b/p1gXKuY1ZcK30aBL2Z51oc7xSfEsFbnHDbjPALn0y3XouhPnGeYLOk+5T
         VwyQ==
X-Gm-Message-State: ABy/qLbX2C10zWhb5YaR14AzRHnDZPM+6PTg4fgyaTFhroWcKnWREo6J
	H9vhf8m54uVGVQ2izHcIP/LqKNOlTiKv+oP7csE=
X-Google-Smtp-Source: APBJJlEGcbqjZemv6tUZihe79vx29cZSfp92+UXs0zJXOzVyWGyURaW4AhTc3o72SHQcHJHPW5rMzA==
X-Received: by 2002:a92:c70a:0:b0:347:7399:e9c1 with SMTP id a10-20020a92c70a000000b003477399e9c1mr8928045ilp.14.1689566415923;
        Sun, 16 Jul 2023 21:00:15 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id f1-20020a056638118100b0042b2e90ed06sm4388417jas.23.2023.07.16.21.00.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 21:00:15 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78666f06691so161850139f.0
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jul 2023 21:00:15 -0700 (PDT)
X-Received: by 2002:a5e:890a:0:b0:77e:288d:f3c1 with SMTP id
 k10-20020a5e890a000000b0077e288df3c1mr9803357ioj.6.1689566414860; Sun, 16 Jul
 2023 21:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230421021609.7730-1-nancy.lin@mediatek.com> <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
In-Reply-To: <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 17 Jul 2023 11:59:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
Message-ID: <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_210018_967802_19DA743C 
X-CRM114-Status: GOOD (  15.17  )
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

Hi CK,

On Fri, Jul 14, 2023 at 5:27=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> Hi, Nancy:
>
> On Fri, 2023-04-21 at 10:16 +0800, Nancy.Lin wrote:
snip
>
> In line 566, the statement is
>
> if (nodo) {
>         comp_pdev =3D ...
> }
>
> The comment says that only ovl_adaptoer has no device node, so the
> checking should be
>
> if (type !=3D MTK_DISP_OVL_ADAPTOR) {
>         comp_pdev =3D ...
> }
>
> and later it would return when type =3D MTK_DISP_OVL_ADAPTOR,
> so there would be no problem of uninitialized symbol.

That sounds fair, but IIUC what Nancy tries to resolve here is the
false-positive Smatch warning.
How about this: given the `if (node)` block was exclusively added for
ovl_adaptor in [1], plus the init function will immediately return
after that in this case, it should be safe to do the following

```
/* Not all drm components have a DTS device node... */
if (node =3D=3D NULL)
    return 0;

comp_pdev =3D of_find_device_by_node(node);
...

if (type =3D=3D MTK_DISP_AAL ||
...
```

which is equivalent to adding a `node =3D=3D NULL` check before [1].
This should suppress the Smatch warning because `comp_pdev` will be
(again) unconditionally assigned to something, and the `type =3D=3D
MTK_DISP_OVL_ADAPTOR` line can be dropped also (optional?).

[1]: commit 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub
driver for MT8195")

Regards,
Fei

