Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 03:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090842312E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 03:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090842312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gfJVkfg89Gsb+pK0dhhOKWXhyF84DuRKDoxremDrp/c=; b=t5ipkDAQWzHpUEAeZzy8k9RXU
	s+p7bFUi8Qn52OA4VUSO9mYL0OwwWBkluj820cCTdVrHVPks/T/4+4SuxmcybzM3EO8+mJwsftzBq
	tvc31MhnrS4zEiJCmJADMw58AUNSeu6T45nys4hSrrN1JohVeGtbQ/V+v1AATnVWyCEVmiU0hIDY7
	a3aJtkxUKXHcJeurADzlKY4y3eUD99ahqkFLVTWI5BzEZ2bPg4mmzOpYSeSr3J169hDTBEfMDDz1w
	Fndn5l+c0uQ4NYX4wAwu4HBfIzsmndM6xKGKGA9gwg7fkHsCVYGhwcmtoSAuHdlC94a2MztREx2LN
	fDSEwVWqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWjA-0006MD-3f; Wed, 13 Jan 2021 03:21:44 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWj8-0006L2-72; Wed, 13 Jan 2021 03:21:43 +0000
Received: by mail-oo1-f53.google.com with SMTP id i18so181560ooh.5;
 Tue, 12 Jan 2021 19:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCuXFamHqL8Ku2Wo/6BW1bsP8VAIVco/Vi8snebYSdw=;
 b=oolTHdkKbr8+qUkqLqmoPr+BtuFHzYk491vIw7Y62NcpYLZ0m56MBhI56MNO0O3qBy
 3GRnNuKhdXHfGwGkRYcVZwUYqj5c7JMtOL1OYXKB0Toy3jmhw/naw/C1XczEJjH2G33v
 HWlIKbiQgzsO6x9hz5ubD6DiectUySTEeCimCT465Zox47gYMBw7BoJvV3jlVk72oOrd
 8+A3dGleAK6YYJUqHwPYBRNbswTMKVPxbBpO8TC8At85CI7V0T0lhc3mRZP71RPwlbKp
 WCdRL5NxH/CIVam8awd1od2yGosu/UbpVNsBbCsYafEfGWLqd+Hd+i6r03Qt6MFRz5K+
 Jscw==
X-Gm-Message-State: AOAM532LnSDXO9eTkHKLLgNhx2u/E8e16pUcBZxqck0fnN1BSHOxv8+w
 tXHXUe86zsogMwc2uXZv6A==
X-Google-Smtp-Source: ABdhPJxvPUHq7F5Yf0LRxZpN5QJmeXPpj175mCAikbYkaUkymgUk6owZoKstb8TsmiK/htdrcW6F2g==
X-Received: by 2002:a4a:3e42:: with SMTP id t63mr1403771oot.32.1610508100443; 
 Tue, 12 Jan 2021 19:21:40 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z189sm170866oia.28.2021.01.12.19.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 19:21:39 -0800 (PST)
Received: (nullmailer pid 1466404 invoked by uid 1000);
 Wed, 13 Jan 2021 03:21:38 -0000
Date: Tue, 12 Jan 2021 21:21:38 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: Add domain regulator supply
Message-ID: <20210113032138.GA1466354@robh.at.kernel.org>
References: <20210107104915.2888408-1-hsinyi@chromium.org>
 <20210107104915.2888408-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107104915.2888408-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_222142_287941_91A90E4D 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 07 Jan 2021 18:49:14 +0800, Hsin-Yi Wang wrote:
> Some power domains (eg. mfg) needs to turn on power supply before power
> on.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../bindings/power/mediatek,power-controller.yaml        | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
