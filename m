Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 20:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF6061090
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 20:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AF6061090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxpje/Qfx1MNn3F12HPbCL3kHaP7VhwiYx/rSzkTqc4=; b=yb4m+VI02+jGNV
	iWGgO28kiDG1rxF3O4FWh/nr8HxObZkVwcpwMhOICH7Vs33wpkmQFyTn+zfqoYFarpSuAi92gkZO2
	hww373oJSBi4Ldi/XX9El6M57Trw5WnfbJx97TIUbonrIocrVdOD7SDGj9tha3AZjCbsbrd1a+PqA
	X6xXeo7dfy/eS4jeCy10EA2Z0mKBZeuleytRPceCmOy6zYVJ41x6lVezaAKEaSKPom98lLG6BQWkq
	8CCy++Wi6se8eUIBuivE7GJaj7WvZRTDfKkgPRqOmVi9t+87vRLo3ipRQE84SR1CSGA/7Z6AeJmxn
	30CULFo45hGbSlLDGx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNi65-004ik6-Ow; Tue, 07 Sep 2021 20:53:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNi5r-004ihF-Cx
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 20:53:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id f18so480207lfk.12
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C2nsQAg7kmIjIclpBrhtqlSTKrFIqUX3LxjUhDb/REE=;
 b=YCsQ08Usmp+NSFE2q8Vqqu+1k2Jxc19NJXOmL6Zp4reeKHQuFtk9hbHHDQ1Xmgd0m6
 bshPY/6nYk77pyO6ANj4wcbRwCSQa3QJ+vwudNf14BMBAQkxF89NI98nGh+WXthFEtpF
 5LV1zH69hfTjOdeQXh4bCWiJk6dplQNZp4kzI8t6aC8egWr7xwOHRDBBQEJqzp0P1BDl
 oHW89Ks9NHvUdtb9B3/rPkLOrYYDG3mpEf6+0nLOinqyHGlamXgbr/mEN/xCcKNiLapd
 6X+s0483+WA7SUQ5DE6qWrfJjZG3v8EsCt7AyCAnzxOW4A32rKdP6sCZxRm7mCBrh9oj
 G/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C2nsQAg7kmIjIclpBrhtqlSTKrFIqUX3LxjUhDb/REE=;
 b=F9VniWSnYyZsD0xkSS5WE7wXj+YpiZBpv4T4FNvGqu5oSkvq+mQU7a1UDyRyG4+nJF
 MzCLypaEtmGYix+LtnA6pRHYHFG9wJFNAvTHl7tsw7i9rxK/I4v+pYDJeQLNXPl0+sQM
 vxRfC2fwyvJqSZriWS5ZToUyeiP7etaYXEW7IVNZJXrLQQ6YWZUJL3GyoLT0LwbxW2Uo
 lVTPp52x4Y5oGgz3xBnlEdyXmXVlM0UfAfw51S8ysJt4JSut2blX1x3SsKQiywRDlLWs
 tkNKI8Q3/IKgwpvfnGKyawDStMbJRmMMRnZjyT3X2IbkoWnW6PDflPT4ogA0sr+a1Hu9
 xD8Q==
X-Gm-Message-State: AOAM531MB7WIPrpBEjdJr4ce7xPxSMDXRqOJUxO53FIYJN4WVIPOlkDi
 BX4DOBV+8VVMHyt+16dXKCNUpW797epABTu73tlJdg==
X-Google-Smtp-Source: ABdhPJzhBFK+nc5T6nsZ3d/UNCMCN4OBLlDwQPAjHtpwLPGtbms1OHE1axqApJ9PGJSVbkInMFi0jFJ5cFAgNd5Hu4M=
X-Received: by 2002:a05:6512:e89:: with SMTP id
 bi9mr207568lfb.95.1631047999878; 
 Tue, 07 Sep 2021 13:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <1630065205-7618-1-git-send-email-wenbin.mei@mediatek.com>
 <1630065205-7618-2-git-send-email-wenbin.mei@mediatek.com>
In-Reply-To: <1630065205-7618-2-git-send-email-wenbin.mei@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Sep 2021 22:53:08 +0200
Message-ID: <CACRpkdYeE9piO=sfdBdq-Wd9uQpxyAb6xWYJ+9-JMTjrWX9pXw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Avri Altman <avri.altman@wdc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Yue Hu <huyue2@yulong.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Bean Huo <beanhuo@micron.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_135323_526541_59556B64 
X-CRM114-Status: UNSURE (   8.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 27, 2021 at 1:53 PM Wenbin Mei <wenbin.mei@mediatek.com> wrote:

> Add hs400 dly3 setting for mtk-sd yaml
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
(...)

> +  mediatek,hs400-ds-dly3:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 DS dly3 delay setting.
> +    minimum: 0
> +    maximum: 31

Which unit is this? Clock cycles? Then please write that in the
binding description.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
