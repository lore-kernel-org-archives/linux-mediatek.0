Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B1AC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 19:28:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0FB2225B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 19:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="km5/+uoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0FB2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZOEtqrOD/pXO0nA5jHzH+7Huf+qn9VDNyzOk3dfd70=; b=km5/+uojIimdvtDNnUrPSwAe4
	JwNccIe6e87QKmE6lXz/KNoFowxzlHKC/rC0EAabzOtozZw2HpgkkYdihZ4eLe50B6CFayfwBoYuQ
	ontI4RbS5ryylJhOV6Gpi1vzMYvaBfMMK/xt6dL19X4CIzTMwiFicc/Uxve+T+lJMekP5n1NydtCr
	ZzL7JKcQTS5TEBCu7AzzXKX20Sq5nAhab7wskeBu32iv1HpCbz4AF6L0nF0fnUwF9KdgIRp6sX1M7
	tXzkqeIB3F0T8tWqsiggnd8LC+oXiZAVQqZrmWxBoOA6gvXzXw0TFiPIGd7ySSuHAiPsiq4ow87fl
	/LJlSBLZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekAd-0006Oo-L7; Mon, 16 Nov 2020 19:28:11 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kekAY-0006Nh-RR; Mon, 16 Nov 2020 19:28:07 +0000
Received: by mail-oi1-f193.google.com with SMTP id w188so20004515oib.1;
 Mon, 16 Nov 2020 11:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J5xc6rlfZ7HkVMV7Y3cl/fG8HMDEF4/W02PLjaicwzc=;
 b=QfAgYb/1/4s+fZlxpV9mqrig1V04EF9FHsLhnO6ph2Xfv15IDxKTdpPES0yoPr9ZaU
 xXHL4AZ4bggupZTMEbjDDyNOwg4LrwJ/rP4LqU0/S3L6a17d9/oYrxLeLLp5Jd/ZZCjb
 u5el5k+/pPz/EDY3oIx0EZna7K2qrnfay7fBXGP4aLTC9WGZp+yLjtzQGA7qCcC18Qgy
 t6VvsKfSyVZPmwxJQjBW0qNjQ+cBruztXmx7tbOM1xl/3d/l+8AWTjBLBU+1IHXVWIID
 jKYTIzVEj5wd84HwCLeauVOd6q2yJNr6DiIqfS+NxX+WXPT40MbWJARYW8Te2UhL403Y
 RmOw==
X-Gm-Message-State: AOAM530kng13MTxNuMidh8PNeREAjulOEPod/QPgFrDifnhiln59+MAz
 jDOlg6atNAGIxXJCLJ11Kg==
X-Google-Smtp-Source: ABdhPJx+VuHmhNuk88lWqmW72X8caft5bTSKDVs2hFRYpkVa4mGiEBKMSKP8OWiHJYpybYH5HkXiJw==
X-Received: by 2002:aca:3606:: with SMTP id d6mr146246oia.7.1605554883878;
 Mon, 16 Nov 2020 11:28:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm5046800otl.38.2020.11.16.11.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:28:03 -0800 (PST)
Received: (nullmailer pid 1996222 invoked by uid 1000);
 Mon, 16 Nov 2020 19:28:01 -0000
Date: Mon, 16 Nov 2020 13:28:01 -0600
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add optional cqe off properties
Message-ID: <20201116192801.GA1991505@bogus>
References: <20201112075208.28183-1-wenbin.mei@mediatek.com>
 <20201112075208.28183-2-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112075208.28183-2-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_142806_950711_F25FE105 
X-CRM114-Status: GOOD (  16.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Bradley Bolen <bradleybolen@gmail.com>,
 srv_heupstream@mediatek.com, Baolin Wang <baolin.wang@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, irq-linux@rere.qmqm.pl,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>,
 Krishna Konda <kkonda@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 03:52:06PM +0800, Wenbin Mei wrote:
> Add optional properties for cqe hosts which are used to set cqe off
> during suspend flow.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index b96da0c7f819..457c9a84b988 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -164,6 +164,13 @@ properties:
>      description:
>        enable SDIO IRQ signalling on this interface
>  
> +  cqe-off-in-suspend:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      After suspend, the mmc host is powered off by HW, and bring CQE register
> +      to default state, so we add the flag to re-init CQE register after resume
> +      back.

The driver change is before suspend, but this says on resume...

In any case, this should be implied by the SoC specific compatible.

> +
>    full-pwr-cycle:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
