Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5980C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 21:59:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7805C61996
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 21:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7805C61996
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f+4m822WrTp6bzTDGDPa9737v6xNoK6wue4qR2acY4k=; b=Tqj5kUzRcFQEntZPEbrjMin1i
	9tMj5AOvLCDEkrHf0eQAUo4tQ8rrmlxgpV1EkaTgNEf8wFbeR60QSShTKSkktYxuA00R3tqqopBDo
	hKbRi64kckVorVL7ueqEpeIesg9krFklNorrET1jxKzpYo79BbGC7fWhW7Kvik71yu8KxFbanzR2D
	+LlNGj6USGqSNzVzMpqtuyIXnXu5l7ilZCJJSMtOTHV2a2jKfeF122H1nEdQyD4cccpfeHN49xnXZ
	RQPH7WSiJUkpQwhIVLgv/PFLotGCi7Xnwox9Wu8uMdCWhSwIKQTdbhY/I6upzyEYwer9STk3dOcA0
	fR4baYddg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMOX-004yL1-5x; Tue, 30 Mar 2021 21:59:29 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMOS-004yKM-FP; Tue, 30 Mar 2021 21:59:26 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso17029573otq.3; 
 Tue, 30 Mar 2021 14:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QieyNEvpATRQqrk3pzzamwRfJpDFYjRn5x3pSxJMeDg=;
 b=WkD82zXrSHd4SISM7tg97ERGv3Ms4+f09po/cWlzC4FnkKGRK9ETkwn3Bq5S+w1NT8
 0h3xcNfvhE0Vc47s2ceHohi4aA2JncFJ2kzzixl3wTmWxO+bz89aI8cxfqNE4iFdSMr6
 sPOqWqW1Ay5gkcU/jIxRsw8bl7rBlHrjuDWPquxWClE2sF05Tv5djf1u9CeqEQpcwGOr
 mgaIdfRJ8eOlo1h4ltJgAoD1ok1e8yW0++JBljiQA5lJAhutwMkepqGqStY5QqMrHx5Y
 brJgiPwcbWg7qosGJGPg4m6/A1v6dakh3/MYgw/QiBjMMpjw+bYSknZJ7jIYH+2BX4BD
 uqcw==
X-Gm-Message-State: AOAM531YNHQovMJMy9A8Q7FSj2EzSGoma8xniZisVqWtDvlcJhfv5MWE
 eiwCV+Bhmuo8+grIKV4F3P/duSVFHA==
X-Google-Smtp-Source: ABdhPJxNnYNc5QIo0AGcTFwJPNfo+tKzVjw+K5c5RB6VuiBXfpDyPZXU2H+w2KfsXKqzkCYrym5VIQ==
X-Received: by 2002:a9d:d05:: with SMTP id 5mr42299oti.312.1617141563417;
 Tue, 30 Mar 2021 14:59:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i4sm22832otj.56.2021.03.30.14.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:59:23 -0700 (PDT)
Received: (nullmailer pid 788345 invoked by uid 1000);
 Tue, 30 Mar 2021 21:59:22 -0000
Date: Tue, 30 Mar 2021 16:59:22 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-mediatek@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: mtk-xhci: support property
 usb2-lpm-disable
Message-ID: <20210330215922.GA788298@robh.at.kernel.org>
References: <1617002411-9015-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617002411-9015-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_225924_874424_AB0949E8 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 29 Mar 2021 15:20:08 +0800, Chunfeng Yun wrote:
> Add support common property usb2-lpm-disable
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: remove redefinition of type and description suggested by Rob
> v2: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
