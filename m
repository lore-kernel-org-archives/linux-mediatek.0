Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F319BC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A3660F91
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9A3660F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJcMcV8DMqgY1SsVBloNvfLZ+0kKQlT47UM8jbchRYA=; b=MsQhyC9tLdpcMp
	iXNom5nGGYc3XKGAS91IKedmyMj5RprvRCleaaPUnFXad6zaVDRn0kLwYSP8JjKgurI6JyYuJti2J
	Ikz0XZGa3lFaQhE+WaFO9LozgkjjVlxzw1/kdzb7e8KzMgUy87eIb6cWk7YyvX3LNxPDNzcSe6BZs
	4sH4WAi64Z7cn8cbJVSRD/64GQiFDTEh3ZtMMotEf/LsC7AHzUYVrEVjPKGLW5qLWFSY9e6is+ubl
	noTQ9nrw0+eyzRjO35QUUMPqp/QP+bvlk69cHVadCwJfBEobyG9DZB4SfcroVEVIEPEOve3sjaqRf
	SHiPiS7XXm/D53HGxAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKjkc-00Hb1m-1V; Mon, 30 Aug 2021 16:03:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKjkA-00Haq7-9j; Mon, 30 Aug 2021 16:02:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0057A60F46;
 Mon, 30 Aug 2021 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630339362;
 bh=x2qifvJ1cqJUkaOT6haFlQcLC+nqt/Nc3ZTkGSieFhQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mpie3L+CFw8XSKjDi4IpjUUfrZssT9UOwyRwUT0sc+Wwfp7GS8qxR3HsByRS6ISDC
 bPFoNSXDgpUNx7SroQdutdQWkFcBG2eiq1lVw3Dnu5C4bx49WPK+U3tdjyDxSccTMh
 tKhTI8qFGPuKGyV8VRJ92CDtM2cu037rabYVsjWtAKf9PUZ/2sBJ97I7klLv/BeStp
 3M595YTzjElkRGD+V1yNyr3hgl9267KIePXXWBmtiWZ/taRzxXe+7ylDVs7T3bKOno
 qKJMPkFG1yCMtfx+dJDVtHf1WTkTiEiUxYNK7GHUcB9i9V8doBeEh9aOI6iY2WwqX0
 BvSqKAkziN3OQ==
Received: by mail-ed1-f54.google.com with SMTP id z19so22369019edi.9;
 Mon, 30 Aug 2021 09:02:41 -0700 (PDT)
X-Gm-Message-State: AOAM5338I4ZOvvCKtidgvg4vvNmyZOEzOmkvYkDLFGvBUHIYiXqsdm0B
 sEmCcC9mjY8FRcEQrsdc6f7MnIPW+XoxhXz4bg==
X-Google-Smtp-Source: ABdhPJx9f5vkA1BYplPP05YhVBr3AEKG45JrVMeVtIUiB8UGNB9eGoSn14w7FGJpfzYvYQxKZzee3hZY4BNFTk8fenk=
X-Received: by 2002:a05:6402:180f:: with SMTP id
 g15mr19235985edy.258.1630339360618; 
 Mon, 30 Aug 2021 09:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210827022638.3573-1-jianjun.wang@mediatek.com>
In-Reply-To: <20210827022638.3573-1-jianjun.wang@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Aug 2021 11:02:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTW=ot=BBWQfOj9rJ82dnVV21TpHGf3vieUQ_Jd8i9Rg@mail.gmail.com>
Message-ID: <CAL_JsqJTW=ot=BBWQfOj9rJ82dnVV21TpHGf3vieUQ_Jd8i9Rg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: PCI: mediatek-gen3: Add support for MT8195
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, PCI <linux-pci@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Rex-BC.Chen@mediatek.com, Tinghan Shen <TingHan.Shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_090242_425704_B29D4916 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Aug 26, 2021 at 9:26 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
>
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 742206dbd965..93e09c3029b7 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,9 @@ allOf:
>
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    enum:
> +      - mediatek,mt8192-pcie
> +      - mediatek,mt8195-pcie

I thought you wanted to support 8192 as the fallback:

compatible = "mediatek,mt8195-pcie", "mediatek,mt8192-pcie";

The above schema doesn't allow this.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
