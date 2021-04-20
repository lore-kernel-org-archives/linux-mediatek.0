Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4858C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C30C613D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C30C613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rWVCWj0iemGGE9t2uT+lFO2KdyteLc4LP06IbbHSFmA=; b=FegdzVABtHsFQ7509bhk37wb4
	w+awDqKtxDwDy0nJK58tpEmyzx2vcph8ui0M0RrbH7GdxPrQYnXsUhHTWnJkTmttYJ2lTKutsYjU0
	71jAKwjSb/VFrg62GZCN/+5KlU844CtIM1Vle+IoD7CBhhjiTAnsQsuddcdFHBrVLU+A6689pbdr2
	Nje7BOcrssgx6m0VjD+i9z3VxG/lJOIuLxokM8cTKZGN/cwSaLn2sd/lhk6t/wcM1mL/CNp+DT0VQ
	r1t6xwYuY/q0nG9dtPMIzsDHryCa1ddNUAdAc0hwZX4Q//0oyYDwsooN19YJ8D9UR8rmITSHgWrkk
	IAfYV6p6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYtBu-00CZQq-Oj; Tue, 20 Apr 2021 16:25:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtBg-00CZMo-RY; Tue, 20 Apr 2021 16:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xNokQdd4tw5VCGbyrKSX00JvoLe/Bjaadc0Hud+iZsc=; b=lZV6NgVturLrtXfJWC12src3HF
 s9Cm87yUaJoxThrDO7BOA1elXnImK/Rg0dKEp52B2oYcQpxZnBQJqbJSNHmv+IUyleY9gcmmjmOI+
 OLxNTDK+NrRi8dRyd3/Fsa/B8Ho6n6KQkR3px8PK6dW9nMeWNrZPa3xUPsh5+lTC6s9+aOLVKiIRR
 7tSvEMh98RIkV+kDTgJbmgBpohkGG4dbS4aSYGM103ZZugD5BaK+bxG55+8lu4zAv+DfddHJlFjRl
 ksN+sxi+hnytl67XR9A+AT/r5gAIBTFxsaZxZI5Czn/nM8ZjLApeh/45JwmdkNuYxuKiN3wM7FUEK
 xpVNPzNQ==;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtBa-00CGvK-Ih; Tue, 20 Apr 2021 16:25:19 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso3328037otp.7; 
 Tue, 20 Apr 2021 09:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xNokQdd4tw5VCGbyrKSX00JvoLe/Bjaadc0Hud+iZsc=;
 b=QzlBX88CgR+IJMbAWdLLzTN6+D4vN+JMfHs9bWHRAILsKvvCNRqNWkrimR0EkxUG4d
 5MS3pZN/7vookRStUEV5uX4vDF3haALwCAP0D9UGXkc0mZMhC4Dc6QnTMDMeB4NlhEsK
 BnSDybwWPPHwJ6O273IHIDFA5SKEplOqTc8YDgkYAn8tnNAJ3n+6g3PT32RhRf8yV0pr
 WOqhnGx8EDcynJz7P7Ob1+3VnIXZlL0qUd7Sb2OjLNvk6hyPSxZ8YzRPD0jHbb04dW2P
 CZIcA41Jx9AsoUVkFwo9WLBufUb5NHGbAMAB9wLRvBzZOiZLKK6cRQKjQlfWned8aPww
 xEjA==
X-Gm-Message-State: AOAM5326VMePUeSeFxe6lU8c2/KqO0v/QfvdRd/37N77lz26HVbgIeZ9
 vViojoMDfDdSWf9WKUzT9A==
X-Google-Smtp-Source: ABdhPJzASVJX35pEZmVLXrSCMM1IFUj/grYGNXM2VM9K/dZzVcb9p8rJj4sXmjiCuipGmkeJADIxgg==
X-Received: by 2002:a05:6830:15cb:: with SMTP id
 j11mr19339733otr.209.1618935913281; 
 Tue, 20 Apr 2021 09:25:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a65sm2362646oob.27.2021.04.20.09.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:25:11 -0700 (PDT)
Received: (nullmailer pid 3431648 invoked by uid 1000);
 Tue, 20 Apr 2021 16:25:10 -0000
Date: Tue, 20 Apr 2021 11:25:10 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com
Subject: Re: [PATCH v3 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Message-ID: <20210420162510.GA3431608@robh.at.kernel.org>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419073244.2678688-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_092514_633841_B8D6AE6D 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, 19 Apr 2021 09:32:41 +0200, Neil Armstrong wrote:
> Add mt8167 SoC compatible to Mediatek hdmi, hdmi-ddc and cec schema bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,cec.yaml       | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi.yaml      | 1 +
>  3 files changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
