Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7176DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBGBYCNLDIrp4oKXXQZl9jSfCtlJXta7Ec743p1hT5U=; b=h1PCAKdvUQM7sl
	s6uKQk0tUH5i/pZV5KR6AgMoaSs6XbB386Tm1Oa77Ys6XMxN3FuhMcULQ2nOiXt90QrLwLOiQZDLA
	HQ5FrwDuGfXFX9HZOCqgmHBWqTRokFPqyzwdn4rab2rkbPq5fLWrmSQ9p0hui8OuOb277JbvFdzTr
	045wwt+UpRMSrv9D3v6xAbb1xr9uGO19iiaQrfbFa7yThxi6U041jp3CDX4p0xO/t+waBovf/wxuC
	FeyjTKJeYsFBf2BWNA9S60877YaWJh4EDukEEDJOctvMGXoxUZVU352KXskGumoWHeB5Q7QcQCuZd
	ZY87WX+/A8Xc6M3DmrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnMdg-007aom-0Y; Sat, 07 May 2022 15:46:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnMdU-007amD-Se; Sat, 07 May 2022 15:46:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 67A03612AC;
 Sat,  7 May 2022 15:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11BFC385B0;
 Sat,  7 May 2022 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651938382;
 bh=ej+1y2QDextem2vuVEnoljWBiUbRONI85ImTVfv1aqE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E1dcXnMAUm+znj4YMNLasYZDWIDhqhVgl4H0TeZqAOkw2TsJA6NozOFiiWHmLY3cT
 GEIZLF8detnZR9nQLB+0DXWJl06fvGzEXgGmXQD6JgaBPeYsiYAlOUcUpXYlw0dMUv
 wtJBS4lfazFQzH7dWXKXuOta0Yn6NOb1EJ686fvDDf2wApYxT5T3hBfi7W60Ei7zye
 8MBd+iLjSJFLXKXzDD98Komf53gQM56TfE//S04c8DOjzffdkx6tdSwf9a7JO/WicQ
 dA0DxX/2tJy3d1R7rHK9eVKkZjgptD38RBcChyahCm6vIYb1E3bjR+KyWoWdBBeLNA
 GbacFwb0CY0Jw==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f863469afbso108411177b3.0; 
 Sat, 07 May 2022 08:46:22 -0700 (PDT)
X-Gm-Message-State: AOAM531woZE1tkMvaY8QLbc/g6rBG9NAq8f5vHwZR7co/R3RVNE8a6Y1
 VJAx9p/fLAdvCkvBiIZNPQGUq/9P8kU70QC6XQ==
X-Google-Smtp-Source: ABdhPJxIPKZ2rC3PS1X9eqkb62LYQlQ1NxMybmJSYErvxb81ifXvir0lP/7H2a42abesQ1FVjH9jRmBJasjY1ZaaS+Q=
X-Received: by 2002:a0d:ddce:0:b0:2f8:c9f7:8f7c with SMTP id
 g197-20020a0dddce000000b002f8c9f78f7cmr7317081ywe.301.1651938381918; Sat, 07
 May 2022 08:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220429065429.7957-1-rex-bc.chen@mediatek.com>
 <20220429065429.7957-2-rex-bc.chen@mediatek.com>
 <276ef83c-c824-3874-c36e-4d422794d7dc@collabora.com>
In-Reply-To: <276ef83c-c824-3874-c36e-4d422794d7dc@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 7 May 2022 23:46:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-XQXe3aarTgVmnFoU84qihr+trFtM_f9+csgZ69qnT9A@mail.gmail.com>
Message-ID: <CAAOTY_-XQXe3aarTgVmnFoU84qihr+trFtM_f9+csgZ69qnT9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: devapc: Add bindings for
 MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Neal Liu <neal.liu@mediatek.com>, runyang.chen@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_084625_016218_835D30F7 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4g5pa8CjIwMjLlubQ15pyINOaXpSDpgLHkuIkg5LiL5Y2INTo1M+Wvq+mBk++8
mgo+Cj4gSWwgMjkvMDQvMjIgMDg6NTQsIFJleC1CQyBDaGVuIGhhIHNjcml0dG86Cj4gPiBBZGQg
dGhlIGR0LWJpbmRpbmcgdG8gc3VwcG9ydCBNVDgxODYgZGV2YXBjLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4gPiBBY2tlZC1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+
Cj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
