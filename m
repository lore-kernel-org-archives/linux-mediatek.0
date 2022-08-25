Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CAEC28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhYJsbXCC7QnSXhlqyPvS2dihBeaREGth3gRm14mYRA=; b=z/eqPhyJbufKFDIbWfq7exh762
	DFSzBkB7pYFpTbhPrzyxiATxeWUPyDDngT+QnbKU1XDCqo6+6BHZ4ofXQgZZA2rde+24wkNLKrJnt
	XUdcChhtw+Ymeae4U8WCnJC7wqy3HXiH8gw7D8qA3qG05ofUggxlvWP4daGJp8mnyxIU9d1j0J6Xc
	yQej+sk4LjEL8DGnNFyMokFcxmDGGziG75cFZ2nP+xS5DwLVNqAHLf0a9u9IY5C6RstmwAF4MmCFQ
	VYbzBABjbyBEltnm9hfwLqddy2wSRdEgw9cKXxPXZ82//Aaxb9oO31o8NNeXbqHW2rERMdh68YNqJ
	sbECTvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCQh-00EAUx-SY; Thu, 25 Aug 2022 12:57:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCQV-00E9rq-GF
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 12:57:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t5so25964091edc.11
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=dhYJsbXCC7QnSXhlqyPvS2dihBeaREGth3gRm14mYRA=;
        b=kmkSLsY/gtjS6zFGEX39gf70mrjZP5HLTwjp8KZLIrFm+eCFRIUmRlOqv2fxsiaCh4
         JDTQpkl8bnPc8ELLarz6oy9jzVMmpEChbu8YwDGDSPc/+PEcHHVFUPLLJjvEIiCKW1KF
         3uGE/kV/avnTiXmNuSEHsN47n5rUeq9axYB4jntleOaIAeGaYYKhQ30PRFsL9E3Yeej+
         fGgR45F5TgCvQzJn70S2OYvhu6hAyEbEGgWJYvILlbOlGgS6HPFntE8S/IQ0V4qijmHD
         wMORK2Z+8yEiU6pmzQlx6CJioIddG799Ta7tYsaHUOvYXBL0LE2nuRcXktVCpqzhMWqW
         67Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=dhYJsbXCC7QnSXhlqyPvS2dihBeaREGth3gRm14mYRA=;
        b=g6yrzWCnFteilY7Gkor3GL4toKkrVg6hqusFdBvJpiNbLRhNSOM2ZU6pfwHKqAk4eu
         mkfDPOO0PX3azDyzhbhDmfvwXErcH9ofcwY9ELhtzcsKilUdvwj9tftsPiMXF+W30uWm
         RY/B1jumSAsgNOnJNpjlgBNsjbsqsU/9Nfw215+EwjfDWugd4dWpsNP+a8Cyu949AqZ3
         OzL8XWQ0jT1PUFlr24ZCYmcrqQWQ3EWm6JXSe8noNYtZNSE7oga0Mj1zc3Kk4L7qNL9t
         4bSBXAQN9g2mzTGbGohAsVO/uiYSRxc1pSFAhorEKYSoExqr5xb7IedP+hjHcE/l9c8k
         bK2A==
X-Gm-Message-State: ACgBeo2kdodHrdi14YaFEOf+aAe0B06dnaYB1hpIZa6XH15LFqOX+mKv
	3ftQN+p62BGOmnmgwwDhoV8BnX6pH1Bn9dCjzpMebw==
X-Google-Smtp-Source: AA6agR4JUzt+naPq8fe7NbryaurWCekMpagBd18TGWfPXFa/2srTTq31iYhtvyAYS4xHJPCCIyERxd651OnRnuQ9eUA=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr3139546edb.133.1661432257084; Thu, 25
 Aug 2022 05:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220819120649.21523-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220819120649.21523-1-allen-kh.cheng@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Aug 2022 14:57:26 +0200
Message-ID: <CACRpkdbLdORz+AzaoqSwT5J_=Mw8PHr056o5n0w6=obEWudb0g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for
 pinctrl nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_055739_548617_C983CAA6 
X-CRM114-Status: GOOD (  12.65  )
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

On Fri, Aug 19, 2022 at 2:06 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:

> The mt8186 contains 8 GPIO physical address bases that correspond to
> the 'reg-names' of the pinctrl driver. The 'reg-names' entries in
> bindings are ordered incorrectly, though. The system crashes due of an
> erroneous address when the regulator initializes.
>
> We fix the 'reg-names' for the pinctrl nodes and the pinctrl-mt8186
> example in bindings.
>
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and =
binding document")
> Co-developed-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Change in v2:
>   * Remove changes of the formatting of addresses and add C-d-b tag for
>     Guodong

This v2 patch applied!

Yours,
Linus Walleij

