Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC1DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PVqhBjyilo6ZqE+iqpfGtLCN00rqLUAkKfzaHzq77E=; b=czWgSPriBrMxac
	akJ5wgtl0jkxZhHik/Wu+I+5et8d2KRPZ/h97CvEvJ5mMR3CETTggkrM63BbKy+I0WaZpCXDAXldS
	A5tADb0mevBKMpYck07ZDljN+45LcD11uEoZeW77IXDxAh8mabjTdDixI/7QFL2BPG7Owj1/YYPtB
	HjIMee+tc98o+0ETKugn2ZmUxzCdlHTgiWkLNVaqBlwXGENSYFqlVoY2vSm2LdckcFwoSRtK9kJ8Q
	aNogTGUa3wOEHmSXYlhtqnzlFoH4V+ukO2W6BxdylGE3zNE8B90eFILxplFdzfIaMeG7ulMSgJmwe
	ZGp55KYqP2uOIC56cbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX1gw-00DrVQ-AP; Wed, 23 Mar 2022 14:10:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX1gj-00DrSL-Uc; Wed, 23 Mar 2022 14:10:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B22B81F12;
 Wed, 23 Mar 2022 14:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8084C340F5;
 Wed, 23 Mar 2022 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044610;
 bh=v/gFT/8y2QNpM7jRFtSw7CA3jwTKUwu7o9yrZABFACw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P+6qju7KgrYR9PKOtOje2vk3T7msB9Dbk7AF0A6rKiZ4l/NA6fVLIOeq3Q6cV+Psf
 U84/Q23zl09bnN8MmrJjFmHzNc81xjaoIyVcteZphR5iwnf4GUrKAf7mFyK+6N7KHm
 EG4lUIiy6K8tUjZDXzdcRdcCcvSJt4/uklymGD4IuW8MRu9R07+LmehP+aLa6mWBmY
 spWoBaerVe1to5cHJfmrazOGYhZPDtoEp87mWUIRLkNPy92wYLGbW7sBeozCw0xjqO
 AEYz6xqgfySUJC3MtfNsIUw+ygBR/olYwNushte6FdFdsu5fcTHKqD0xpmqYL3DWPJ
 7kBtA+yI0JovQ==
Received: by mail-ej1-f49.google.com with SMTP id qx21so3040530ejb.13;
 Wed, 23 Mar 2022 07:10:10 -0700 (PDT)
X-Gm-Message-State: AOAM530Q0OYQhGjS074HS7unL450u3q4r6+KFAJhcJxBdcWVb6GLdbmX
 d+2NeejPi2QOo+21Wwp+lUVoYbOeoB+FtblsFA==
X-Google-Smtp-Source: ABdhPJyoHAOLWCGsvMFbQN/cBB3l1ZQVSPRNagAHnYdBe/ediYewgN8QArA8v7kajXGSiPzjYVmw0poiMS0XEAnD4uA=
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr161839ejz.20.1648044608892; Wed, 23 Mar
 2022 07:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Mar 2022 09:09:57 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
Message-ID: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix MediaTek display dt-bindings issues
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_071014_315047_D527E4E1 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 9, 2022 at 7:47 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> The vdosys0 series carried a nice dt-bindings conversion of the old
> txt documentation for the entire mediatek-drm driver, but some of
> the issues in there weren't seen.
>
> This series is fixing all of the issues pointed out by a
> `dt_binding_check` run, followed by `dtbs_check`.
>
> Change in v2:
> - remove mediatek,ethdr.yaml file
> - change include header of mediatek,ovl-2l.yaml from mt8173 to mt8183
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
>   dt-bindings: display: mediatek, ovl: Fix 'iommu' required property
>     typo
>   dt-bindings: display: mediatek: Fix examples on new bindings
>
> jason-jh.lin (1):
>   Revert "dt-bindings: display: mediatek: add ethdr definition for
>     mt8195"

Can this series get applied soon? linux-next is still broken.

If it hits Linus' tree, I will be applying them.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
