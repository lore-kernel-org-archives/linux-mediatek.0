Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79B0C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 21:02:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C6AD60F36
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 21:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C6AD60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIyvstWSN/RRl9QH/gAi1yifKdWfWzZIguKn06x8sgI=; b=zllZrleAFrlfZW
	NMXjVIrirCXxIvXgGbyltLRJ3Mm9x2bKcLRCu8rkE9cJC1pHlMnrtp3sbmRpLKOsVL5t+XuaviPYD
	HVxOZUGrQd8TtItydkaVdREkGuD4lXDS1WDhTgNkBUo+c5kCff7600AyJ9HfgG4ZTSWQe3GQrYCvK
	JMIfV6Qi7i6rirgXpGoT69jYv+scSJO1i+z28a67ZRp0e9poLlM95FEJoDZwJX5hH+pVsSzkTgJNg
	mcnFDkl5sA6lK4X+YEUc5n3XO3KVXSRD47LVsEPPrIyaErq36OkO6EjH91EOexenqeFjgtshWD2my
	C6G46B6hwroJPSKERTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEeEy-00Dajl-3w; Fri, 13 Aug 2021 20:57:20 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEeEk-00DagC-Qg; Fri, 13 Aug 2021 20:57:08 +0000
Received: by mail-oi1-f172.google.com with SMTP id w6so17705990oiv.11;
 Fri, 13 Aug 2021 13:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3wvmf7DOu12lxJGmuxwNus8Ei0TqBPYTO/Ya0rfIezM=;
 b=GwbZM0pn/AI6xoq88ERzasJ6VRi1QfIkHP+0zf6f6rQX0d8leAHWL9J5yamVpLmkfO
 NILm/kIkq/LXTmr7wA7OJV9jGdv/Mx2EYQkmFI8j4k3YvIdJAeDgTP2xYM+UvRiRsy+E
 0saaA46QXmupKXxx7n/kjVNJi53IWNPELVRaJcklLJ5YQkBKPX/Piy1nfz1V3BiAUQkv
 0wUa3Erw9na1TOHK5H6kTp6WohSb2IPKXfjtq1ID1hChXChRrEnGq8ou1DC+ecQV8aPV
 WWdWgoFGgRoKZbonB5Tht419RiP1POrG+bLA5wz5SfrgznlzfM0fX3B7pkn+T6d/6KVe
 gUVQ==
X-Gm-Message-State: AOAM533kWBBLE/Rdk6DP7C0n2g8MCeDvJYWc6Xa98vtelY+pkggxBNYE
 eG4DpzfK3hEwBFv6TW9VPw==
X-Google-Smtp-Source: ABdhPJzEqww+nuVlBCG4CJ4QIjNt2ny8eoAF/xFTGVu66sG0M0ICoNa+C3HT50atfQpNHUR72XfXZw==
X-Received: by 2002:a05:6808:85:: with SMTP id s5mr3627786oic.31.1628888223215; 
 Fri, 13 Aug 2021 13:57:03 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-a2a6-2d62-395f-9378.res6.spectrum.com.
 [2603:8080:2a06:ed00:a2a6:2d62:395f:9378])
 by smtp.gmail.com with ESMTPSA id l9sm530729otr.34.2021.08.13.13.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:57:02 -0700 (PDT)
Received: (nullmailer pid 4019042 invoked by uid 1000);
 Fri, 13 Aug 2021 20:57:00 -0000
Date: Fri, 13 Aug 2021 15:57:00 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, shawnguo@kernel.org,
 sam@ravnborg.org, geert+renesas@glider.be, fanghao11@huawei.com,
 daniel@0x0f.com, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ohad@wizery.com, linux@rempel-privat.de,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
 Max.Merchel@tq-group.com, linux-mediatek@lists.infradead.org,
 mathieu.poirier@linaro.org
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YRbcnKLx43UcJNSm@robh.at.kernel.org>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
 <20210809051959.31136-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809051959.31136-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_135706_910144_5477874A 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, 09 Aug 2021 13:19:56 +0800, Tinghan Shen wrote:
> Convert the mtk,scp binding to DT schema format using json-schema.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
>  .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
