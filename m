Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21816C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaFHoFMRPpIG6RKcXjZHLviSlVFSBgdEkRWhHfPof7E=; b=kX3G3TtXkG5W4g
	ygQLdkSoIaT9MPl7c5a0ONmiRMaths6KBkRPOpkc/doRB5cOYlC3EZK/4W/90fyZH9A6guNb/4TXY
	b3G1yTLSsPK6BaeFTe+B+NJirI1ZQ9q9oUuf7SD+H9xvA63iv96EjhrzYKdVd8ajKADYUUVMJbbGg
	I6IUp4kjg6PjaKmucdZIh0QfcyQbxVJw822hOr61Fz6Rk3Mj08MI9ppkdIxhldjfFIlSec2mfjtMs
	d8xyA2kpSuVS4gEDOG1fn9oMvBt5uWo2G624w29V0bAda4gjFzxQaAesPpZSC3xB1brQDlz7Ljwi0
	nimPlgX+F79wHeAie0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMmwX-00DF8V-QE; Wed, 23 Feb 2022 08:24:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMmwV-00DF6k-Ev
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 08:24:13 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C3F1405D7
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645604642;
 bh=OUH0bTj/LUGqclp4FyWkS6uNhE/OcvDSgnjHRV7vNUM=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=FTi15mZpVUkRJF4UJ+tE1nQnXghlR5psWwL1gec7Cx1xKuv0mHwnO1auXfabylr5N
 CpW3p3ABXoIwiHF9oFi3mmiT4qO+6rg2/O4oi0dQslBn8dA6QR9aa+vm90tJUC/k2H
 VKoqnmm8QJHsDVgfeA2iIT3ES1ICcUAnnmfpRDl43vrLHL4e1odRpaQmqJHfLboH8p
 0KyJzI3t5tiQrh10Y+DpJ3qkG3AXXOBT3Gc0DD/yXTk37p6jhE0Tdc1XkrqP6xD19V
 d1UTtJ2bD0RLM2Ak/J3bz4XjNlNWLy3l5fhhS/P9rIvsDc7PtNdAFR/MhfYF510LCG
 BN6XqrkzAn/8A==
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso13231984edh.6
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 00:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUH0bTj/LUGqclp4FyWkS6uNhE/OcvDSgnjHRV7vNUM=;
 b=hAomMH0Mk34P56JWLLgnBcflZDn3MlG3dG06QPRkzAWDRYHGpYO4A3Xjb2pO0/O4jk
 aeyERINe5gY66BkEq6+y8M4T52mnUANK1Gg9z2Yn+KrPPLMdFj8hyTB9t+PxCZd9frOR
 UhnluanlyyyT6o5gcw/i/+5NFlSLRmGIrB5YTXrbubYJAEQQtB42IXZ9oBAQtvuXK4t6
 P8ThBpqYy/KRRv6Znj19voN/1mRAu/a5YP77r8kGVVzWIvSAhWk9iNpPSD/TyWbHnQQp
 2K2sWODm7tJvt2a+n0bf1sZWzvVFytLqF68qsyDQ2e4KVWNWixCvyxWfsYpzZ0WYk/dp
 /qwg==
X-Gm-Message-State: AOAM533+55TmVXFf/jPniiERBzdmbMvaOsHi5WwVChZb4x/zMM/oYVNW
 Vg7vXkfxauCYlFwhfdpfJkzyU4sRc7xKV33mkZpTkcpgO1B8WzqeqGpP0WYChzDIOXZS23iFQVU
 KgWkPncInTUp3QM+Oq2vtVPo02fwqUXIpQl2YTA8YkgCOq0j+pQ==
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr22106121ejx.266.1645604640572; 
 Wed, 23 Feb 2022 00:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmlOe0uOWGCSaW649hZ3pFA8AEz4z12SvTxoyLOxSd5Mf7R4zHsjAvMUopfEcfA/lfYgjr1A==
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr22106094ejx.266.1645604640319; 
 Wed, 23 Feb 2022 00:24:00 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id p16sm1162411ejn.33.2022.02.23.00.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 00:23:59 -0800 (PST)
Message-ID: <968cf18e-af5c-0503-79b1-a622938d4e0a@canonical.com>
Date: Wed, 23 Feb 2022 09:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>, 'Avri Altman'
 <avri.altman@wdc.com>, 'Rob Herring' <robh+dt@kernel.org>,
 'Andy Gross' <agross@kernel.org>,
 'Bjorn Andersson' <bjorn.andersson@linaro.org>,
 'Wei Xu' <xuwei5@hisilicon.com>, 'Nishanth Menon' <nm@ti.com>,
 'Vignesh Raghavendra' <vigneshr@ti.com>, 'Tero Kristo' <kristo@kernel.org>,
 "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
 "'Martin K. Petersen'" <martin.petersen@oracle.com>,
 'Jan Kotas' <jank@cadence.com>, 'Li Wei' <liwei213@huawei.com>,
 'Stanley Chu' <stanley.chu@mediatek.com>,
 'Yaniv Gardi' <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <CGME20220222150007epcas5p22f05e6c8e80a5ad18a9528cd0ead865d@epcas5p2.samsung.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <0c8b01d8280b$868abc20$93a03460$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0c8b01d8280b$868abc20$93a03460$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_002411_640044_5CF9AD2B 
X-CRM114-Status: GOOD (  13.13  )
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

On 22/02/2022 17:44, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Tuesday, February 22, 2022 8:29 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
>> <avri.altman@wdc.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>> Kozlowski <krzysztof.kozlowski@canonical.com>; Andy Gross
>> <agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>; Wei
>> Xu <xuwei5@hisilicon.com>; Nishanth Menon <nm@ti.com>; Vignesh
>> Raghavendra <vigneshr@ti.com>; Tero Kristo <kristo@kernel.org>; James E.J.
>> Bottomley <jejb@linux.ibm.com>; Martin K. Petersen
>> <martin.petersen@oracle.com>; Jan Kotas <jank@cadence.com>; Li Wei
>> <liwei213@huawei.com>; Stanley Chu <stanley.chu@mediatek.com>; Yaniv
>> Gardi <ygardi@codeaurora.org>; linux-scsi@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> msm@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; linux-mediatek@lists.infradead.org
>> Subject: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
>>
>> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
> defines
>> uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
>>
> May be once all the dts change migrate to using 'freq-table', just remove
> 'freq-table-hz' from driver.

At some point in the future 'freq-table-hz' parsing could be removed,
but now you have both old and new DTS, so it should stay. Also for DTB
compatibility.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
