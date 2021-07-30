Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5399C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 10:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BA160F12
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 10:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83BA160F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBHABFYAPXCk8pAJhKRf7JOXKiWwsrh7vH519Oo0z7E=; b=TgQvgupK1QVCc8Gih1iDeRf6fT
	XyGK/wn/eDzR2zchsuKUTQTQISv2pvYV1nniYBaBo9v4vnJqOcfgM818N0R0IBgZtr0/difAWUw/B
	F2h1LuXDQsQe0dbC8Mf3z/NRp0RZEMfneKjBu3gYe/9L/gUjnWIWYW2/zUp/RKkoc+wN4imGoGfAs
	/ftI4S3jK0XTomIOjeDEn8QlfiKU/o75FzQhF+Cbbo/E/SVszuBuiIDqvjvYNXjhdEedhcVBPWbgw
	kxAZN6N4O4shZoZOthajy/bSECj/h2tg+c9+cjnIMHEnil6y8CuKfR3ys2P3W2XbZVkqbVAgHLWep
	7TlaKUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9PSp-0085bP-Pl; Fri, 30 Jul 2021 10:09:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9PSX-0085XR-Am; Fri, 30 Jul 2021 10:09:42 +0000
Received: from [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c] (unknown
 [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 98A291F446BD;
 Fri, 30 Jul 2021 11:09:37 +0100 (BST)
Subject: Re: [PATCH v3, 01/15] media: mtk-vcodec: Get numbers of register
 bases from DT
To: Tzung-Bi Shih <tzungbi@google.com>, Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-2-yunfei.dong@mediatek.com>
 <CA+Px+wUXmpT6TBOvD9J6ircLQ_X5D=bByOotfk+L7U+sXev3nQ@mail.gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c6ecd39b-a756-b1b7-3191-6d9536f72b87@collabora.com>
Date: Fri, 30 Jul 2021 12:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUXmpT6TBOvD9J6ircLQ_X5D=bByOotfk+L7U+sXev3nQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_030941_562532_12C07765 
X-CRM114-Status: GOOD (  16.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30.07.21 11:31, Tzung-Bi Shih wrote:
> On Tue, Jul 27, 2021 at 06:10:37PM +0800, Yunfei Dong wrote:
>> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
>> +{
>> +     struct platform_device *pdev = dev->plat_dev;
>> +     int reg_num, i, ret = 0;
> ret don't need to be initialized.
> 
>> +     for (i = 0; i < reg_num; i++) {
>> +             dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
>> +             if (IS_ERR((__force void *)dev->reg_base[i])) {
>> +                     return PTR_ERR((__force void *)dev->reg_base[i]);
>> +             }
> { } can be removed.

I think that also the "__fore void*" can be removed

thanks,
Dafna

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
