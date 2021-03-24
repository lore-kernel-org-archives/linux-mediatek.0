Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA199C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:00:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D5461A07
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D5461A07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OHfGO6VU5UJnpxP1WzqhVG43YNa77aGGuDOWVG/29zM=; b=rYaX+P1DN44eqJ31uJB4IH1ci
	jOrjj31RRWNWirh0IjF74r9zz9SJmBXx6sNq+Pf/demYdeWEpKYIMiHlPV57K9ugCaJYU1j52aQlU
	wADDkt5HJsdDqc/47ff727V2ywq8ymfiDfsWbDIhoimebtm/jKRmk8hVT0TKft4vClsLUA5hiMlsd
	sPI3T73WtCLCAix/JAAyRmcrVwjlVcoBKGcu6RKi3YDFTzop9qP1wXULvpiCO1HPFVxJAKM/cAjbg
	P/DSK0uTB9Vj7DBuIpEdMjWuzkd7wgi9N+d+x5Zqq2/wPIJKswja4smCw74Z6sPTnypZrfFrfSJlr
	RADq0Uw8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP5vz-00HL0B-Vo; Wed, 24 Mar 2021 16:00:40 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP5vv-00HKzQ-Ej; Wed, 24 Mar 2021 16:00:37 +0000
Received: by mail-io1-f53.google.com with SMTP id b10so22007484iot.4;
 Wed, 24 Mar 2021 09:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZ4fsIeUBgOFrkk3uMgapcWJ8o/nbEBCuiB/d2F8vRk=;
 b=Nku4P/XKY/7SkVZWYivw3qDkLBw7G9yaDpmGueATFrg/YwzOS5/rjFlSXtvhT66q9c
 BsPdoZ79c4FJnTrAz5UWyYKdBnHtbBfg99ojs27KEXd5m7HAe5kK4DjFbutbf4MTtpFv
 PTYg7EMJprAJyFxtsMx0pQk5rDyJkru5LBINbd8kJVRxOAW0tjlqjbuQ87i/Ds8XZrvu
 P8KboMqn0VdIHF6Gjq153pkbd+Tvwq5C0OrZWncmr9mlBZd86PpDIRQDVBX8FIlYUzew
 2CigG/jqxmsl8muup9YCXcZIxU/U/6/6SWtY74OuZIzPS1AuzSGfsPAuPU1+2I7hA8MS
 ohVw==
X-Gm-Message-State: AOAM533kvU6iL385EknomfC5wleXDkQgNJEEvUaYzTrUmqs4aXh6GmNQ
 7DY7sjCKGiurDKGIX9TbDQ==
X-Google-Smtp-Source: ABdhPJztDtcM0Oh6vCXlaNqlyCQKtq/ZL/vW7F0MRAAZg+GfVrp6bQ4uHM1OW2LlNOJSyAnyGEPaDg==
X-Received: by 2002:a05:6638:1614:: with SMTP id
 x20mr3499921jas.19.1616601634205; 
 Wed, 24 Mar 2021 09:00:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l14sm1314193ilc.33.2021.03.24.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:00:33 -0700 (PDT)
Received: (nullmailer pid 3150496 invoked by uid 1000);
 Wed, 24 Mar 2021 16:00:31 -0000
Date: Wed, 24 Mar 2021 10:00:31 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Longfei Wang <longfei.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@google.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v2, 3/5] dt-bindings: media: mtk-vcodec: Add binding for
 MT8192 VENC
Message-ID: <20210324160031.GA3150381@robh.at.kernel.org>
References: <20210312075542.5503-1-irui.wang@mediatek.com>
 <20210312075542.5503-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312075542.5503-4-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_160035_572634_0D3A1A96 
X-CRM114-Status: UNSURE (   9.53  )
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

On Fri, 12 Mar 2021 15:55:40 +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
