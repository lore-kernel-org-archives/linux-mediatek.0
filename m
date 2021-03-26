Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F64CC433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:47:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F253161A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F253161A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v3sxUW1RPtCfDxMjOrtrwSeow9HpXmD90oWXUYH8wFA=; b=XYhH7j/Wgs8Ymg/cDa/mTCfnZ
	/zVA/s/CN3RHbgO7yxHi2iZDnsrTCXI4gPKRgGEBKIjFNjDX2Zs2PgrNkvVs7+diI7agoLNaagDka
	4QhNoJr5d57HmnqGyEL4/gB3NWYSf0x0AFFvtNso68wnObeBzs+2r2Q07k9WbGZRUFrG5WO9nYGyK
	5Xs+JXa0Ktv+DU0gVpyHdma0zHMjk10X0PVz6iYHJDixDg98RueH4IEW1VQb1wdx4T7WgIcBhWWzl
	inlnpdb0SeQ4c2bRv5/jQbkFfknBt22YzL6ylMrgHjUIWGx7rlw3ACx8jj1gajs+08+7zcYTOa2dU
	HkYlEKKDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbYy-002Vgy-V8; Fri, 26 Mar 2021 01:47:01 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbYu-002Vdq-L2; Fri, 26 Mar 2021 01:46:58 +0000
Received: by mail-il1-f177.google.com with SMTP id u2so3825268ilk.1;
 Thu, 25 Mar 2021 18:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jml2kqyjYBIczDmIBfoy96cm/TgFfWPNgcxRNXU69dI=;
 b=ct9D5twSL2bEQ6NvfFEF4so8fTNV5aFwAuztFf8H/uDPPyzp0rAkl/HUoBvu5rb1W6
 L+8SJi6fHW7/Gp4mDsT7UqvUi53Nm84jAt4Gol8dGE4sBk3Ge37ZH0CwvKep2m30Ji21
 +sGB725el+YBGp8vLVx0n7Le7Hgb4Hb72bXejP0wHQ6J7PKkLUA6VincAgX5xRHWueml
 PVsKBD7pciOjrSrQABdyV2C9KgaB/pEmDYKhUtS9q7txcHBUmfbf9+2dicf2d/eO3RKL
 PRRBh9o0Fqg3XrGhDAyH2tkeiR5IMTNCftWaaRz0bIWiKSanEPr4VW9dVU3ysf4SASb6
 0jCQ==
X-Gm-Message-State: AOAM530mjzMA5OfsVFJpt15cu730FzeN1iy6dj9Uc147wX+HsHEd4az2
 xsWk8gn3YaRjvOzIDeBmSg==
X-Google-Smtp-Source: ABdhPJxnMHMYW+sT92LUqM9KxBk5gKQzviBp2iJdIJW/gnAj4T17Zfq1H0d06Csqf0VRkg9KBqqo8A==
X-Received: by 2002:a05:6e02:d46:: with SMTP id
 h6mr7810002ilj.80.1616723213741; 
 Thu, 25 Mar 2021 18:46:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y15sm3364593ilv.70.2021.03.25.18.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:46:53 -0700 (PDT)
Received: (nullmailer pid 2155266 invoked by uid 1000);
 Fri, 26 Mar 2021 01:46:50 -0000
Date: Thu, 25 Mar 2021 19:46:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-juniper
Message-ID: <20210326014650.GA2155214@robh.at.kernel.org>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
 <20210319035245.2751911-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319035245.2751911-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014656_891886_FB8F7E5D 
X-CRM114-Status: UNSURE (   9.96  )
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

On Fri, 19 Mar 2021 11:52:43 +0800, Hsin-Yi Wang wrote:
> mt8183-kukui-jacuzzi-juniper board also known as Acer Chromebook Spin 311,
> using mediatek mt8183 SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
