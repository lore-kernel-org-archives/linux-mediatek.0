Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB0DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:50:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709C36100B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709C36100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GguKcxvkq2cz7+XE90GtbAKQF99TRq6u2FtBh0LO1zU=; b=jA4rkGWyyOGe1IXnGgEWxt8Bv
	G6VV1c8AGLMB9NJLPSDploP5yNjWorXB7wYs/2YnHs78axjmrK37olOKSg6NX6By6higTbOCqAODi
	Y5fSjzsF/OTF816vBspZgIsKq9QZBugjFzdalH4kMNQ4iPLjdkvgCqYzW8j5iZPyIR1cu/e/1ptMs
	+e4HzWea2G0Tt9GvuH/P8Oq63zEbEGgEwCcO6YzEcOIRJ+x/RguIQZhZ/wAD0X7iaeYbEfm7ne1kK
	R1Q6sHgULh1/tOu9t9bEJvBIS7VoVrZKAgpQknI74LaHJNdE2igtv10DNESP9bEMd6ToGRO/YOub9
	xZF+4JwLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhPR-00B8AE-5m; Tue, 20 Apr 2021 03:50:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhPD-00B896-EO; Tue, 20 Apr 2021 03:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CvoIToNjQG2udbqm3ipvUBy5hlaSF8l41XQVBPJoGwQ=; b=RW+wA99mecmbBFVmdsW9kUx9dP
 nQkyzx4nPIIynxZXEOZwTBYrN45FuZSWHjtN4LgNKNo5fCPk9/m5aVOD6EEMpaIPyINeBijzJ7DeZ
 bAZbcQbzo1uUMGAQh/Uq1DBg8021D1ywsOZ0+jaZyrzPh7XruHPpGNFj/yf5j4xaMTvn23BvjvWHo
 VQkSG7jFAQnVhvHHEJhFWyqH1DsGVYMwrqdauTEdiWWwRpOHwLg6mozTAxvXYmfsyZfepOFLssL04
 HT7vmMPB+rVwbwHQ/3Uvyszd9yMxGnUxXyGOcioXHqobv6QCygt3Nd2aIFqRCTfVxbjLRw3QpK1vQ
 zweWKuOA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhPA-00BnSx-W8; Tue, 20 Apr 2021 03:50:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42055613BC;
 Tue, 20 Apr 2021 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618890628;
 bh=4VHQO/2Y5QQ2o1qMGFqr4wyOmnZip6mdpmq22Di4o1c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LldPUIP/tlfnAgepSvDsITxKLbtbs42Z6TtiCBo6fVGRmvFBkc036zw5NoQY8xABm
 A6CxHTMN2CSKAk1atUzN551OAYKrykA2cMPuDfx2uRLPU2mYOyPQkQZ8tA9702IZlc
 KeWlbaUXz3P3VFH3qFIYnIlV/zNAS7iUxElzDZkfyJj3Pij2kDn139Mjmx455RVeqE
 3xMC8bPrc0FHtXYu7eMLhPI1++nRYxc5FR69lfynJNPLVnyVVGnUfjEGvvec4axoaw
 +gw9ONYY1/Vqlcdbz+v+NK/oCQSpZXihv5jRCRP/4Lfhg72QSKMu8pnXhojc+iFyzv
 n8d4+VRcnp+Pw==
Received: by mail-ej1-f52.google.com with SMTP id g5so49418947ejx.0;
 Mon, 19 Apr 2021 20:50:28 -0700 (PDT)
X-Gm-Message-State: AOAM533HAxifd4/uBSogkcyVhtNmAFTMdXQxgn7/TyK5y3/4GWW71+mF
 S3mT3/rz/tFy3yD5u9yIJD3RhOEwBYk30k+UA6A=
X-Google-Smtp-Source: ABdhPJw4O1TlT/Leyw9rMnpP0rTdXgO2SLoIAzcJZ2GEZJnq8QVTyUazhJiBAF3L9Nu9CLYdwqmNjSgGsgo/F4wmIKo=
X-Received: by 2002:a17:906:fb81:: with SMTP id
 lr1mr24077340ejb.62.1618890626699; 
 Mon, 19 Apr 2021 20:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <20210413055702.27535-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-5-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 19 Apr 2021 20:50:15 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
Message-ID: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pinctrl: add rsel setting on MT8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
 jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
 seiya.wang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_205029_092362_EFE91388 
X-CRM114-Status: GOOD (  10.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

<snip>
> @@ -176,6 +180,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case MTK_PIN_CONFIG_RSEL:
> +               if (hw->soc->rsel_get)
> +                       err = hw->soc->rsel_get(hw, desc, &ret);
> +               else
> +                       err = -EOPNOTSUPP;

I think that should want to be -ENOTSUPP to align other occurrences.

> +               break;
>         default:
>                 err = -ENOTSUPP;
>         }
> @@ -295,6 +305,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case MTK_PIN_CONFIG_RSEL:
> +               if (hw->soc->rsel_set)
> +                       err = hw->soc->rsel_set(hw, desc, arg);
> +               else
> +                       err = -EOPNOTSUPP;

Ditto

> +               break;
>         default:
>                 err = -ENOTSUPP;
>         }
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
