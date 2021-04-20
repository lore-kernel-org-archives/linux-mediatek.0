Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DACC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:29:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32926052B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32926052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Evz/VSIYPpRfE2icmUXthoCJIrNXq+voa9uYPyDYfxY=; b=q1IbHDYjVDW8+NyUzjRnL4NSC
	UPzn2QHJdD6OgF7MbJHrkr1/06Idqzv+gslvIC0o3NvoNtuyw5u8ak+AjxpkL6m/iOLfRo/t7yLts
	TSSm8USK0NBYO/6rHYXdJJo6a9iARusMXdxjyvrHv+vK+BPbq9V5wUE4qxNpRlg7OFg9CRWx2KgAF
	gWiiusKn4iJKKbHuPhdbZ4h4ofluk0w8U75aQ21oIbjfIjkBKuztSBpu1cN2aGr6Aq5JQJiFGagRa
	WUEiwafcekSOwyqopQSD9ip0nULK0dFVULbz8Ludr7KLPiNr70mB4tau21FBQMlmdf0/maYgGjy0W
	Unm/cakoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYv7y-00Cpjs-AX; Tue, 20 Apr 2021 18:29:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv7v-00Cpiy-CT; Tue, 20 Apr 2021 18:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d7LlXLtHF7kRiurMSaEVCbtNq5eGf5BuN3Gp5t3XCEg=; b=F77V8rOy0MBYZ3aZVOdRZqARbA
 ULis/TopQmVe6zcPyhVfBNAjP8w3Q9eh8OLgH2jTZ05V3ucgU11YbyblqXo99Yy6DRe4Gs+FyCDDY
 AoCUQlDWyloQdkP/0atGa7zXfxkbbgld7QvkDdY05k1RvBPU+kJ85M6VQ05DspxzaqYj1C4Pn4KMH
 UJAJaK+IjO56qljZQBcUKGRXvp415hndoiCILOc8L1O9NEzi1GPg+9eW9/QO7KIS10XLxBHW63wUi
 KWSRB4fiD2/7/HJWChzwx9Ds1q69BJD5Va+ljD21IkSPwRR3VWgAmKGTHyIz6fm2M8rzpEUAKz71m
 oJ6mz1LA==;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv7p-00CLUC-OF; Tue, 20 Apr 2021 18:29:34 +0000
Received: by mail-oi1-f179.google.com with SMTP id k18so34965371oik.1;
 Tue, 20 Apr 2021 11:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d7LlXLtHF7kRiurMSaEVCbtNq5eGf5BuN3Gp5t3XCEg=;
 b=eXKyM0K0+qAE8SAg0p6ToQpHjBK4B7vfY+eV+tmp3V1eTEo0u+V+zWamInHGrEK/Kh
 G9vchyB2/uGOMosYgNo+Yuwirc1ANYc22ntaY3RJuj9Dd0ljd0H2maLX8n1LhbgUxAK9
 lA6mtZ9WNNvcUpNdkJKfwrO22PQW5gNHHjfqWmb9XiCKmSQwiyurZCRnt5J9dUs6uGvk
 y+PA95KiscKoDaPJYbgko+L3ltvFR0DB+X93NpNKphyDTLwegjEpWeO14EOGIvA60w3A
 M3uWtnCQ/bj4+gDiDsJm5vJsfFD7hPh767i7RSQWVITjbmcL9BPLsUPOFupr1jGwWymx
 UO7A==
X-Gm-Message-State: AOAM532C7Ozm2sJCLxFxe/EZFdoXxN+7e05aMDmkRi+kZHmcClGN4sQb
 W1nExzHloe8chQlqaMfQ7A==
X-Google-Smtp-Source: ABdhPJzX5Ki14lyW+QTuObN02IkSiksk7PCgzUJRqVI+QsjwTfdFYm5l5wwGv//2AV6EY2XIFu3aIQ==
X-Received: by 2002:aca:b7d5:: with SMTP id h204mr4144569oif.18.1618943367147; 
 Tue, 20 Apr 2021 11:29:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d7sm405632oib.49.2021.04.20.11.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:29:26 -0700 (PDT)
Received: (nullmailer pid 3595907 invoked by uid 1000);
 Tue, 20 Apr 2021 18:29:25 -0000
Date: Tue, 20 Apr 2021 13:29:25 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Ben Ho <Ben.Ho@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-willow
Message-ID: <20210420182925.GA3595853@robh.at.kernel.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
 <20210416164055.3223088-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416164055.3223088-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_112929_805550_069899CF 
X-CRM114-Status: UNSURE (   9.81  )
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

On Sat, 17 Apr 2021 00:40:49 +0800, Hsin-Yi Wang wrote:
> Willow is known as Acer Chromebook 311 (C722/C722T).
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
