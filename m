Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58D5C3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pss0ZUVkQ9llcafFVFt33upaXuS98JMtSIUAnIUxRGo=; b=ZUFekSr66glg+GM9yFxm/26Gpu
	N8Vfhu/eF6tXntqGCLKnhwxmIq0KJb1pRqWfOz+h/SzFqLLpQdoIYD5mAx9idpZbNhcj5RUbwz56W
	zZ8H0JkND8ayJHMYRyaJetkPNVfVyQVCzo4ByJrkbeXm2HsoJQYpySlwlr9G7bLq26gZbzYG0F6MC
	LkRwcbC9y7dlS+61fDG1JCY22pEXE47bDRK+GPY3/PcspCrAveM5wI4Mkk7VTjZYzXrq6znKhCVTy
	OD42CI+hCCZ9knJzbxzZb2JjXs3dBl+jlTVz+Ql01Tjt/J9jMCcv9M3WtuwN1nR9tt1duR+Lg4FTp
	mtESL3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQlV-00000004GhP-24hl;
	Thu, 01 Aug 2024 08:02:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQl1-00000004GYJ-0SRI;
	Thu, 01 Aug 2024 08:01:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-369c609d0c7so4549397f8f.3;
        Thu, 01 Aug 2024 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722499313; x=1723104113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pss0ZUVkQ9llcafFVFt33upaXuS98JMtSIUAnIUxRGo=;
        b=Q6K3/bOJn+41XSi/B1zxMsdvlh2uge6JwQkpGnCBCvN1BrGN6YoRwagv98EUTptQn9
         E0Z0lnCzfYg08SkHtaEAskhg0JeClUaDAxguc0YrQHPShE978zoHcw+bJxpHJI36+lm3
         BuLxm/I9NMNr52zEd0DYL6+kbD6uwEgepX3YQZgNzkxZ5DGonlRgV8HG9eA7Pk6GBJPY
         Y8PYP/whNrCnaMC5+ym4YPisHu4B7mhXYNT3DL5qmmcThq4Zbty8/8pb1EX4vz5pW/jU
         sFzJgz6uK+C6RSG+811+bdsbPepwWokZr4C+5Jmgjhp/F6eS+7LeU6YOOPRKqJ4YqPnk
         9z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722499313; x=1723104113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pss0ZUVkQ9llcafFVFt33upaXuS98JMtSIUAnIUxRGo=;
        b=jBBooXD/+sCpp7aQXRHSgSsmjUGO6yAUMDgTXL3PwgqPMkLPJln6ZsTu2o9c1ijIAu
         ntvC2fxt3TKoEUIJ0TFExBDbVFh1uJhipdUIT0qSis/ttDOKvLGPmDihSDxwsGpaw6Kj
         lzZI1yli8USc20xOCBJOcJK5mGQ9upYfid4hG8Ku7mTUbOFACqEInj678dAcPRFhFNR8
         ZJaNZXMzkiy/sdVpxx5L9pJRlGDhRGWIbjFylcV2at2szF8OQPCNeUGMHes0dmBEip6V
         ZuKMthn7e3KVW/2AblTnx3eNeMGOHXT8N1xnxuv0tl+mH6VsmZZQbH25UkZIaXiK2k/9
         oKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkwDK9IdoBBZZLwsHfSe0M9a8qVqiIYtTN7rziU8GBg5h5us7Evo2pS3+YqRNLeFgvMo3yja/8PXJwAYQtOU=@lists.infradead.org, AJvYcCXxFe/yWmaUrpQ9MS62fjhHS4DnaOy7SxKP1wUjMUk4FQHip82pHcMzEXLd1ud719MQ2RggSpkeObszjB6FawYn@lists.infradead.org
X-Gm-Message-State: AOJu0YzjGsRYvcakcAJJCxEmb/OqMZ5+mGmAR3iFVwznXDiav0bGYk8E
	zLAjrLQaSqRuiruDVNHn35NEGeE46DB+0vf2rGqAcWZsVv0CLWAHEUNKDvW8POeqvOfhBxUAMhC
	AqHxKsUDo8C+INENWq3W72o/xgHE=
X-Google-Smtp-Source: AGHT+IGzDGxYPAK57oqfHSlsGd9K7iuasFxGLFx2h2cYTdeTQgCLNXKoUee/un1WO6hbM0z6aFcsf6cq/8chOwD4G2I=
X-Received: by 2002:adf:ffd0:0:b0:368:4910:8f43 with SMTP id
 ffacd0b85a97d-36baacbcfcamr1417384f8f.3.1722499312787; Thu, 01 Aug 2024
 01:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240729183038.1959-1-eladwf@gmail.com> <ZqfpGVhBe3zt0x-K@lore-desk>
 <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
 <20240731183718.1278048e@kernel.org> <CA+SN3srMPLcmQ4h_iNst71OkQPFcCYxBRL0Q9hR=7LjJ86TFFA@mail.gmail.com>
 <Zqs5hcFMx1g42Zrd@lore-desk>
In-Reply-To: <Zqs5hcFMx1g42Zrd@lore-desk>
From: Elad Yifee <eladwf@gmail.com>
Date: Thu, 1 Aug 2024 11:01:43 +0300
Message-ID: <CA+SN3spwT1hrXQRmk8TkDOfBwp66WWqEAczvNCS7QaTe_eM=Vg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX performance
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, 
	Joe Damato <jdamato@fastly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_010155_169349_CB9617E5 
X-CRM114-Status: GOOD (  20.11  )
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

On Thu, Aug 1, 2024 at 10:30=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> nope, I added page_pool support even for non-XDP mode for hw that does
> not support HW-LRO. I guess mtk folks can correct me if I am wrong but
> IIRC there were some hw limirations on mt7986/mt7988 for HW-LRO, so I am
> not sure if it can be supported.
I know, but if we want to add support for HWLRO alongside XDP on NETSYS2/3,
we need to prevent the PP use (for HWLRO allocations) and enable it
only when there's
an XDP program.
I've been told HWLRO works on the MTK SDK version.

> > Other than that, for HWLRO we need contiguous pages of different order
> > than the PP, so the creation of PP
> > basically prevents the use of HWLRO.
> > So we solve this LRO problem and get a performance boost with this
> > simple change.
> >
> > Lorenzo's suggestion would probably improve the performance of the XDP
> > path and we should try that nonetheless.
>
> nope, I mean to improve peformances even for non-XDP case with page_pool =
frag
> APIs.
>
> Regards,
> Lorenzo
Yes of course it would improve it for non-XDP case if we still use PP
for non-XDP,
but my point is we shouldn't, mainly because of HWLRO, but also the
extra unnecessary code.

