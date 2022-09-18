Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E8ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 03:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIiEKFUEDlFjltiT3SFexWXihmvce5INlAKHnpkbpOI=; b=PLHjBLBAyfVF0xnFVHulmPaAyc
	tOjjH0dJB8Kd7yHS9wE6qmUGpM8686bnXSFZd7u2Q1sjWjoWyAdHFWO6HwI1n1g5nZhm3gO6s7a4z
	DJ5KSd5HJC7p/jYJKQXydls/NkcEnkNA5PrSzKX7mWZCVsWyBXI5ERIoFpN1gYqiQlZ7aSojt/GH8
	yfIdumsluuijGof18VZd5NRH9jCY/Xf9ksTAw0/Q2JRv/VFJp4OD80HgmEBVWz5QFEpudp35YQySt
	q6eRKBW72FF7qpAkYe6ornhz1T+++zHMseTVTSwLBIv8UqGB8qyei/G4dnkqNfqwKcXbrr/U/ahkF
	6kDCZBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkos-00Bi49-N4; Sun, 18 Sep 2022 03:18:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkoe-00Bhsw-E8; Sun, 18 Sep 2022 03:17:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6CCE61254;
	Sun, 18 Sep 2022 03:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A450C433D6;
	Sun, 18 Sep 2022 03:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663471070;
	bh=qb00ImaXysZJpvsHrO2c88a7Ds3dOjpngNqFrczjjDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hr03nYXFeceAHqZ7u2VGyT81QKhjeSwZRNCObxkGdX9jD3isSngUsiQl5UcFBS8gN
	 y8RF4zWKYuZYJnmjgoTSzSyW3xw8p8M9VqadfqWChJcOY2TzS9u8vXsYJo+yM4wrAd
	 CjawLOZ/BPCd5PV5zRmR6iRSQrN+lWn21I43pM1IEymhBZw5EVBFX0hdCxlCkg3aUw
	 CON7xaXVf89B/jgtrahFQyCxY1zAfiGvx2S62fjVGwb6VY43rM6aOgqFCoynME0qI+
	 MK7SOCETpDcBVQ/qxoqGEvrCOzbWR/osrWOQMWT+2Y/zYMwZEYnMYJW4EIMnGDvSly
	 c2jim1coxXuaQ==
Received: by mail-ot1-f50.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso17596894otb.6;
        Sat, 17 Sep 2022 20:17:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf1msYaq2XQs17P6jnUMAkl+HZMYRP0BZfKMtwe2atvMUbsFcLCY
	TD0qTuUE6bA6OaEp42ZPU5kP1tqkS6D8WwRrig==
X-Google-Smtp-Source: AMsMyM58ezG8msguUMeAH2Le2boc4pMXZ12Yr7cvpd704aw17iSXBXWn9Gr0znIRuo886rusNYTI49u//14DleuHyj8=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr5435523otb.278.1663471069381; Sat, 17
 Sep 2022 20:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:17:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Message-ID: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Refactor MediaTek DP drivers
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	liangxu.xu@mediatek.com, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_201756_538618_2CD91F9B 
X-CRM114-Status: GOOD (  13.48  )
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

Hi, Dmitry:

My tree has no mtk-dp driver yet. Would you like to pick this series?

Regards,
Chun-Kuang.

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> For this series, we do some clean-up and fix a build warning.
> This series is based on linux-next-20220915.
>
> Changes for v2:
> 1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_=
dp_bdg_detect()".
> 2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()"=
.
>
> Bo-Chen Chen (3):
>   drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
>   drm/mediatek: dp: Remove unused register definitions
>   drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
>
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 70 ++++++++++++++-------------
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ---
>  2 files changed, 36 insertions(+), 40 deletions(-)
>
> --
> 2.18.0
>

