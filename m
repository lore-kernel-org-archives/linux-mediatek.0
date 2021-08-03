Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DA8C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F30C60F70
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F30C60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SvDoRBZxkmM7wf/SQEEqqLjo/45sCD/vUvh9DpApwE=; b=AZi83oSZ6qX+Ko
	yq7tqNLzFEVoqTXXZi9EYi+7eFYDSvF3Pw6oIlfeQa+lAz/lJzpC8hX1LkNW7lkz36hxB4QjvYXxk
	Hn/R9WjiPExt1LOdJTZfQtswIxHqfHSB2AzhDOmEzBskIA1v4gBy7kSfemgT2r1PmXWb3yeJIiSt0
	dcVQ6h7FHQ174PG8rCJmsadt0m0+R98wJXd0cLDM3pYPYXGsjZ3CsSXtk2sPYtH+a2PLTHbL4CQsa
	EFoCZg5Z9ty8phMIx3H6um+P1oyWsDlVAUf0EpPGVA9C61+K1M20SuyFluRvwiw4ifyVBPKsSXjOS
	I5582R+sCWBLF1ks6fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAvq1-003IVE-Jd; Tue, 03 Aug 2021 14:56:13 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAvpj-003IPl-0L; Tue, 03 Aug 2021 14:56:00 +0000
Received: by mail-io1-f52.google.com with SMTP id d22so1228247ioy.11;
 Tue, 03 Aug 2021 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kD7lkwGnBrAWtQ4Yvyumyu5YNOwGaLH82mshMsNuV0s=;
 b=pCYnQNXWq4gjybkE3Kk3B2sC4Zji+MXFvVxEidhqxNDJxDMa0HVx2qX0VvBFkHshIe
 ohVqApIffYOp3R6WwB0S6jX/jb/O0kQfpaQm4ruje7gxAvu9arDfwAOFY3Hml4pDXGVS
 AMhBqog4l57AITJzUNIMKbY8ic3ZhKhZldZoI+n4nVPIZs/yQH5LuQfLwioVcFHrp3Sj
 QTs/a4/uh4AePNpXACpu6d5/hCxwHdb1XXia1Iib51qS1elnQfMX4SdZui16hd9SmszX
 KLxhDVCy6vj+NZjJENSXBFkRKZCTLJ4BOB1TVrQj4z6iNkFAMBbxAxsU7YM2idJupeK9
 0pHQ==
X-Gm-Message-State: AOAM532xDK6KMwoWKYzRc7dd2jdiAj4Wt7laKEmGe6srz+hblidUwr2q
 SsgtitcabH4SESt4wFD/0g==
X-Google-Smtp-Source: ABdhPJzY36XqMTJ9t/2g2jsTX7vFaYI7b8gh0CL1YPRGzel3gnv1zaaoWZzPOx7BB/gaoMf2w4EdMA==
X-Received: by 2002:a5e:9743:: with SMTP id h3mr433048ioq.52.1628002553781;
 Tue, 03 Aug 2021 07:55:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k9sm8646960ioq.55.2021.08.03.07.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:55:52 -0700 (PDT)
Received: (nullmailer pid 3254509 invoked by uid 1000);
 Tue, 03 Aug 2021 14:55:51 -0000
Date: Tue, 3 Aug 2021 08:55:51 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Message-ID: <YQlY9/5GNOGKG4gv@robh.at.kernel.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org>
 <20210803051318.2570994-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803051318.2570994-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_075555_116525_9C831AC8 
X-CRM114-Status: GOOD (  12.99  )
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

On Tue, Aug 03, 2021 at 01:13:19PM +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3:
> fix comments in v2.

That's assumed... A good revision history will list out what changed to 
remind reviewers what they said. (I kind of remember since it was just 
yesterday, more more than that assume I've forgotten.) This is different 
than the commit msg which should tell us 'why' and not 'what' as there 
we have the diff and can read what changed.

> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 980 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt

With the MAINTAINERS references fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
