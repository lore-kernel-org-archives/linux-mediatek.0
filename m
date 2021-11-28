Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCC2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 00:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aSEGQMZSyEWeQKjT0iZP+0eViYbanVztUR1qoffqfY=; b=pbwwwTMsc5qIba
	dm3ITfuG0smFZz1stgsY2U2HKju+x0eAVTFXb+euEyeLMqYjf8PS5l78fyW0dCkan7ISU2Wq9UpKh
	yO8Dd34EnRstFJ5Ge2/i/rj1pjle96l/zxTylJKsP2E3tiFc5O32SVp/s4LA3VbHcidQY+yeDhNOB
	oY4E0eEcmHLHtv7e56HNfDutVfwDCXrAHQdj4vAK4JymVYhHPXBff36MGrX1pgIlqPUsWGgjLvxmZ
	ZW2jzzQATGU7yqJJRs3eZIRrdi++dZfolYVfZRkcdRMe/qBrR5wGJwqbH5ueqd6faxzrhmGQaIss6
	dIDaydKTzCP21ks+WyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrU5U-00GtMH-2x; Mon, 29 Nov 2021 00:00:04 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrU5G-00GtK9-DH; Sun, 28 Nov 2021 23:59:51 +0000
Received: by mail-oi1-f174.google.com with SMTP id n66so31198678oia.9;
 Sun, 28 Nov 2021 15:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HkopmSmImQ8w6mneEpJv7+5TiqS3kp9uVIPZgZsG7ps=;
 b=MosxewbsSZYyH3GGeTJprR0Cld7bezNGpraer+2BeoleBzH1ZVY+hxzDKdJ3zFaNhl
 7KEV2qr5mU/pl4UoZ585OGCpiu9tzW66wcJ/FWUM1cD2UKd3myCuMsi4MdyInAQPHuJN
 NvBw+vwpDzP3aUN+HoN1b/EAWcAJ5JRcv2debx9A2bWtLUn94RIn+4civs5MdYl/rSRQ
 dMODxsHYhMRfd0wPNSY1zHyhTigGXhLlgDzq/OV5aUtNVq9bFQnzbZXNe2L28nkKC4/g
 8Z65aC+hDBxu0xP4q86qL+BTLM6TPaiNVcyv/WmyGjL997z73O1+DEzv7OV/w6fz+SXY
 1uqg==
X-Gm-Message-State: AOAM532yPUL3UglYwvYeNK93X30+AmLvVL79T8D1fR2oPZXysbE8tYPs
 fMHm6HMScSLkvPqoV2torQ==
X-Google-Smtp-Source: ABdhPJymWGC3cRGmk+z8SQTahYVCKdbAjCOPFeTlz8NYWGEtEd6izZ2utwiI4HU88YCnD1tXXW8siw==
X-Received: by 2002:aca:1b08:: with SMTP id b8mr36306600oib.148.1638143989603; 
 Sun, 28 Nov 2021 15:59:49 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fe7:4487:d1b1:985f:1f68:141e])
 by smtp.gmail.com with ESMTPSA id
 j5sm2077075oou.23.2021.11.28.15.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:59:48 -0800 (PST)
Received: (nullmailer pid 2843741 invoked by uid 1000);
 Sun, 28 Nov 2021 23:57:41 -0000
Date: Sun, 28 Nov 2021 17:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, dkirjanov@suse.de
Subject: Re: [PATCH v3 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Message-ID: <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
 <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_155950_476735_D616424E 
X-CRM114-Status: GOOD (  17.63  )
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

On Thu, Nov 18, 2021 at 11:09:55AM +0800, Biao Huang wrote:
> Dear Matthias,
> 	Agree, converting and changes should be seperated.
> 
> 	There are some changes in the driver, but mediatek-dwmac.txt
> 	
> is not updated for a long time, and is not accurate enough.
> 
> 	So this patch is more like a new yaml replace the old txt,
> 	than a word-to-word converting.
> 
> 	
> Anyway, only 3 little changes compare to old mediate-dwmac.txt, 	others
> almost keep the same:
> 	1. compatible " const: snps,dwmac-4.20"
> 	2. delete "snps,reset-active-low;" in example, since driver
> remove this property long ago.
> 	3. add "snps,reset-delays-us = <0 10000 10000>;" in example, 
> 
> 	Should I split this patch? 
> 	If yes, I'll split in next send.
> 	Thanks.

It's fine with one patch, but describe the changes in the commit msg.

Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
