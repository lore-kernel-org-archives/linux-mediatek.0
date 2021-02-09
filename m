Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B07C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:42:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7FD64E30
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C7FD64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GUsX1xku3Gb6YkDmG7JjwJWlIkaqWZWnrSCsRhLp1c8=; b=mWYpPzDrh5ffYTX6TXxl97Cxb
	9+SILYrwHq3EpeaERwMsBvqZ7hiJwoVqCWKC3SjHEb+q2KwSSdYpkTTN23VfCF1qJJ8a6T2z9XcmA
	3Rj0paHFzNY0GKC+uT2u5Wkar0it4eRo2D5b3FNbGefWTkBO7Gjju55K18eART5BLo0znKXb2cQXP
	bFZGmrQYJr+X/pmtARAbqYRJ1gNU+Wfu8ckVv6b7eYjPFiv+uSypRJi4PgYZ5/Kf7jDozuFeHXVpq
	dL1QTvzkbayvYqTYH7ulcCFrxUXdpdhPo/oGaxEkmI3dG4qqBff7UW8nbuReRK9vOj8P9fhNXCaEi
	mH1JYgtZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Zpk-0004iZ-Tw; Tue, 09 Feb 2021 20:42:05 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Zpi-0004iA-Io; Tue, 09 Feb 2021 20:42:03 +0000
Received: by mail-ot1-f41.google.com with SMTP id c16so408225otp.0;
 Tue, 09 Feb 2021 12:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fZZM67EhmMbZp5VJU7IlbmetXBbcl+XmdSzt7HSdY1U=;
 b=ZelJiOaM5jSyDnjSXCK2J2diYk6qyCFFnqcSsgZA/Arwj69bre91cl7xCE8t8I6+Tq
 rvr8QXy2YmmOmNmGm5rFef2G4x5sS1UJsALiWzz7vDjP+l8ZM5W/TfF3doCYMpWzd74F
 7h2mZ7cnBqjRIt+cObgk7Se3JzAQtxzmlL4fjiCn945AquXzC9GBJlSA7sVAfIZ1OF3h
 36R0S9Eg3G5koO5ektsJtnxSGFrb4JkRf+s0ow/qVos0Y2tQjztT2w11FOScsNZ8q+TI
 LMAWzmqnK7jZWGqw53mliEpec4lCF8+NNaGriIkYDr/kVjLoUKrZ5MicJt1FB028IYiv
 F+yw==
X-Gm-Message-State: AOAM533ricB7A8wX1K/EqdezZP5BuB3qQt4/RALaNe6odzUEMFB7kVnB
 CEwkwcteGF+mUXY4bmRFtQ==
X-Google-Smtp-Source: ABdhPJxGCnWyUkTc1TkCgfXZaB6ldc17uw3AhgXdcQPL7wK34IO4FS5r2QxnYclB57pQ3y3rTJYVIQ==
X-Received: by 2002:a9d:7dda:: with SMTP id k26mr13308366otn.284.1612903321022; 
 Tue, 09 Feb 2021 12:42:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r25sm1711758ota.42.2021.02.09.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:41:59 -0800 (PST)
Received: (nullmailer pid 139152 invoked by uid 1000);
 Tue, 09 Feb 2021 20:41:57 -0000
Date: Tue, 9 Feb 2021 14:41:57 -0600
From: Rob Herring <robh@kernel.org>
To: Yz.Wu@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: nvmem: mediatek: add support for
 MediaTek mt8192 SoC
Message-ID: <20210209204157.GA139100@robh.at.kernel.org>
References: <1612151986-19820-1-git-send-email-Yz.Wu@mediatek.com>
 <1612151986-19820-2-git-send-email-Yz.Wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612151986-19820-2-git-send-email-Yz.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154203_082903_B23DCDC8 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 11:59:45 +0800, Yz.Wu@mediatek.com wrote:
> From: Ryan Wu <Yz.Wu@mediatek.com>
> 
> This updates dt-binding documentation for MediaTek mt8192
> 
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> ---
> This patch is based on v5.10-rc7.
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
