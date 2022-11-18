Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F3BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkFTIrtdwyX2TNUxD2qJjCXIPObhIeqFxCdl7ZlUGmo=; b=Xa/LSyi9ZrdzYM5dN2jbOy2Qg4
	ah4w/V+AWImhYPhNlr2M1HDylj9Iy8pa+r7qG8UkR2RiPPsdGeZUZYMmrv3Vda02hkBwqxbD1mys+
	kUb9PkgNZYty90DxmOlDGzY+gKLJ/X73yIUVSz3txCNxXUpSUT2Ox4QYNBJfxBAebEpQjYVSMTI+q
	MT1bArF62W0zbsIy6U37XiGBIbnJK8GWG7UcDAuYinL8l+fQ8KmJLQZCLL7obrB0TUjtTCne+bOAo
	7QHhl0aQmTlUTRb31iMHbytFuOVj6969S1N2lMWNatsxou14klrnTJxmB+5mrzCJHxwabRJwsoy/W
	J6Xqy3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9AO-008NU6-Sd; Fri, 18 Nov 2022 21:44:56 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9A9-008NFT-Og
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 21:44:42 +0000
Received: by mail-pg1-f182.google.com with SMTP id q1so6068950pgl.11
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 13:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkFTIrtdwyX2TNUxD2qJjCXIPObhIeqFxCdl7ZlUGmo=;
        b=MsjnoeBu53p0gdbA1586WCQkU81avv2/xaVE778G2MlNG7WA9/MsHg6tBWKV1ho/Pu
         0e4Cx+B7qDjN5QEazro/t64ogz0t0RdkRLYbIt92clc6ep+rR7x2oSozsshfno0QPH3f
         jVbTUulZHjN2ptz57yIT+bbmAyF3yIyTpbDZnyqnDccVbEZE6Mo1xDuDbnqN886qFQT4
         tl0fHuraEwF5KpVy0AZV8ryAN2VBZuNDx04omkktdxfwKoF2krN3VxG5vcbhoYpw1nBC
         HFsZaCH09T5tBbEnmvwHKNvcdLnD6LHPn9deVgV4mP6OSPihIqH+WGIQj30ckCjCg8DM
         ZdBw==
X-Gm-Message-State: ANoB5pn/uCKw8V0P3VR2sV9qp1shSfz1DBHk7UGZp3b24whChr6pnFit
	CdTgM02tBkJTCeayFvV3PGs=
X-Google-Smtp-Source: AA0mqf5fbBfts4orvzhHSKFQnZ47lpMAoImHSv5eqLfE89nX7xdyPt634pCIiyOtVtRngEXPvBYPIg==
X-Received: by 2002:a63:1659:0:b0:46e:f23a:e9aa with SMTP id 25-20020a631659000000b0046ef23ae9aamr8092182pgw.428.1668807880591;
        Fri, 18 Nov 2022 13:44:40 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:5392:f94c:13ff:af1a? ([2620:15c:211:201:5392:f94c:13ff:af1a])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902ca0b00b001867fdec154sm4126856pld.224.2022.11.18.13.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 13:44:39 -0800 (PST)
Message-ID: <5379c0ec-8dd3-f1bf-0a08-a621c68a3b6d@acm.org>
Date: Fri, 18 Nov 2022 13:44:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Chanwoo Lee <cw9316.lee@samsung.com>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com>
 <20221118045242.2770-1-cw9316.lee@samsung.com>
 <db25901b-8537-ca16-aaac-0daaa636d84d@acm.org>
 <c561e1ca-7739-efe7-5c36-952b01634a26@linux-m68k.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c561e1ca-7739-efe7-5c36-952b01634a26@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_134441_831929_C023345E 
X-CRM114-Status: UNSURE (   7.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/18/22 13:34, Finn Thain wrote:
> On Fri, 18 Nov 2022, Bart Van Assche wrote:
> 
>> There is more Linux kernel code that [...] than code that [...].
> 
> Thus mediocrity prevails.

Mediocrity? I don't understand the above comment. Personally I prefer 
the style without !! and I don't think that it's a mediocre style.

Bart.

