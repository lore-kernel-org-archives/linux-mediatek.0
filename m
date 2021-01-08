Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A500EC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:05:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675C023603
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 675C023603
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bfYCxsaXSdFTIcwqn+PkG0OrN6WBqpUG9PbSJArXZb8=; b=ALE+dIYJjXPWYDUkldbeZ5cWb
	9Iqa5/s74je9BLu5C0jh4Gy1kRXFvhiqUZckY7nEb3FHrSQf9WwzHxx2u46BxlwGCblIkpAyoDn/4
	3I8Pk3toTrzumpZX4piB9JCyEA6KRb2/astu7tyMevMrtMKhZSVZWOVQGQNnlRwZRU7GLpF0zkarV
	QHhgAYKgOrSznzZf+p590xM/DzgUpPM1eumSBhgq9kpG0jXLUyJj1sBNyNbvLP+A8OJF17X71h+DH
	Etgg/yocgu1oCGpkJR57IQ4OhtHkN3UHPGuLDXUFS9fsnSsp1NRsqP8XmiTxBTSRH/bV6wQQn+dcw
	iR5Lu7t2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxi5i-0001zj-JE; Fri, 08 Jan 2021 03:05:30 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxi5f-0001yY-2r; Fri, 08 Jan 2021 03:05:29 +0000
Received: by mail-il1-f180.google.com with SMTP id r17so8881617ilo.11;
 Thu, 07 Jan 2021 19:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arkq3vtpRQtU5z3eGsmG2DhJUAWYG7qKz2FVaRgjOOo=;
 b=U+QA9ALBZOJKMw0sfBENlZIWPe1RuAkEq/mKeEKqRI4CmNi5mo/6ySaKzHz8a7Xvcf
 rdzvFyLMMQhKKhL9r+/F3YtfiGdYI+vieXOCntXBrI4Wp+s8mDAH8uu9cuaJClWrrNPT
 J6Gfr73UTqYRAZtC4nVfjji1L3WkBkwJ/X+AGU3ewqFfnBbWpaSs3g7j7URuj29rA7OX
 bSxcURBbKdoUXnc6sx0DremSLxbysBfLNsQInqxDsNRbDc6HfM219GyOE4JIfYXg/8WQ
 UTXkeVaqklKhWEXhDweTzLICd8FAh656US5WVGrFVmOflnQIBcoMR0N14pknF0tv99tn
 sOwA==
X-Gm-Message-State: AOAM530xNbElp49eZfNosZ7Drtz2HP4JbN2gp8HmtMCFatPtHxxk9DoK
 MONM3p9GsX1e7QRw6ByzNg==
X-Google-Smtp-Source: ABdhPJyKWrLxcGC66HT5wGIZ8PKEuzgHS2mskcXZJtvK358qOBYcpO8cr50U2hVSdiPnd8PJiw10gA==
X-Received: by 2002:a92:cdac:: with SMTP id g12mr1885522ild.145.1610075126513; 
 Thu, 07 Jan 2021 19:05:26 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o195sm6066850ila.38.2021.01.07.19.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:05:25 -0800 (PST)
Received: (nullmailer pid 1800216 invoked by uid 1000);
 Fri, 08 Jan 2021 03:05:23 -0000
Date: Thu, 7 Jan 2021 20:05:23 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
Message-ID: <20210108030523.GA1800134@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_220527_140395_4E323F55 
X-CRM114-Status: GOOD (  16.57  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Dec 2020 15:52:48 +0800, Chunfeng Yun wrote:
> Convert usb-device.txt to YAML schema usb-device.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob:
>   1. limit the pattern length
>   2. remove properties description for hard wired USB devices in usb-hcd.yaml
> 
>     depends on series:
>     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
>     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v4: no changes, update dependent series:
>     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
>     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v3:
>   1. remove $nodenmae and items key word for compatilbe;
>   2. add additionalProperties;
> 
>   The followings are suggested by Rob:
>   3. merge the following patch
>     [v2,1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
>     [v2,2/4] dt-bindings: usb: add properties for hard wired devices
>   4. define the unit-address for hard-wired device in usb-hcd.yaml,
>      also define its 'reg' and 'compatible';
>   5. This series is base on Serge's series:
>     https://patchwork.kernel.org/project/linux-usb/cover/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru/
>     [v4,00/18] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v2 changes suggested by Rob:
>   1. modify pattern to support any USB class
>   2. convert usb-device.txt into usb-device.yaml
> ---
>  .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
>  .../devicetree/bindings/usb/usb-device.yaml   | 124 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  19 +++
>  3 files changed, 143 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
