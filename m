Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0383C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZxNhueMBF9WoNcsQRrgiB02jKYBhNhqYGBvBdIMT/o=; b=wIXp4PLF3tcOfvUkD0f7aYORA3
	HDgA1jlHZSAXahEn0gAjLOfrIIJx/a7JKzIRStpbZpq8Xn0HitI5HcoLJ+dFGO6tDE2Kl61JFttRO
	+wkjef65CkByl0veDqnV78VfmwGUIRmXniIu0NRni3qSXA/v3/jlwfu6jQVIWY85q/sutc4BtYOI2
	a8c6BmvYi/egpuOc4PRzsypdcuzB6ouKhakjw6DjULzmaOGUHl7Q5UdRA6fySnz6+lPcee6tb0cW/
	jrAsAP0pwWCCBcg8Jxg8TY/gCTgD7+OebwNBmdivSfrLmARStucVBlR5/ullQBxY+Bd5dq9bDO2le
	V+Tfb5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3BbA-00GcES-EQ; Mon, 20 Jun 2022 07:13:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Bb7-00GcCV-MX
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 07:13:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id eq6so6441508edb.6
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jun 2022 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZxNhueMBF9WoNcsQRrgiB02jKYBhNhqYGBvBdIMT/o=;
        b=fy3dwtBDvc791ioyRN1572SmjL/QCaIVbg2+MyM1rCFfoafQv0OE0oBW1d4YrWIIi3
         DIrhnywVf88jJaKxiRQGAN/hGXKMSYTj4hhcL6B1cMYP7QofkT5dyPwudtEpoWiedZkf
         vKInpa/OhzZib4wmyfrDVCwTf9f6YX67mE25E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZxNhueMBF9WoNcsQRrgiB02jKYBhNhqYGBvBdIMT/o=;
        b=ZxWzsTUXfu+0BlinnbN8DFf+ZpEok6y6JsulHEHdVQ4Elh5zrc92Vzkh4fIeawJpoB
         qyODsb+9talm2QmUnIWuRMUoLwPoUu8xH/ROtymB93Pe+vkpJnv8Qxp7YLvc1HiJD9pW
         FWfJJRtPNDUrnlJMPmD4WzN4Zj1t9gwbX9br8Oxv0KD9YSyOZ7CARITv/gqUflIpIAWn
         +joeKVkavmMhdpl3Hrbcsz2ANSEvT6iuhaB87L+cuOsj34YsvyLuMI+HBZkGKUstPx3c
         zydwb2YkdbrxuOxv9ymngwrbKXZKhG6ljRMaeiRzzAZjeVEmkj3Ev36KJzRU1d3RO7A+
         Aqmg==
X-Gm-Message-State: AJIora+nCvHpvpzj84me9ocI0F5n0SuQrwifpIaNijM9OY3fVTl4d4LR
	KKsJ0UGRIYL2cjPgHejIN9c13Z3M6f4sP0n9NqXRFw==
X-Google-Smtp-Source: AGRyM1sL5dIl8AH46jNJrBl/TTzwbPT5YrA248QQiwP24rFmBUawcT2ZGIJ6uCWt77gKUpazkmOZ3P3/igx2WCEym9c=
X-Received: by 2002:aa7:d6c9:0:b0:435:6698:589a with SMTP id
 x9-20020aa7d6c9000000b004356698589amr17234634edr.59.1655709199702; Mon, 20
 Jun 2022 00:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072521.21551-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220617072521.21551-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 15:13:08 +0800
Message-ID: <CAGXv+5GG1rKsECDotA_RpXay1i7ido+te1=CbX0d21638=+Z2A@mail.gmail.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Fix non subdev architecture
 open power fail
To: Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alexandre Courbot <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomasz Figa <tfiga@google.com>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, Steve Cho <stevecho@chromium.org>, 
	devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_001321_789088_4C506E1E 
X-CRM114-Status: UNSURE (   8.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 17, 2022 at 3:25 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> According to subdev_bitmap bit value to open hardware power, need to
> set subdev_bitmap value for non subdev architecture.
>
> Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183 on next-20220617. This makes the hardware operate correctly.
Previously it kept timing out, presumably because the hardware wasn't
properly enabled.

