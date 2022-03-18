Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F60FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mLwZ+bX+8lwbuW4dP1F+FwL/aiHsIms++V4dtIHegw=; b=uIaq+Lr9mJ6CRd
	ul3zH+qDVx9EEBKdJOQRiQXd1DVxLvmO5RJQiT6ZZZpEYTDl91CPACPyFU7WZfeRAghcFzqT//8YY
	xZrlLfYM6JwhAoDgdOZAi8nHh+II42Pfw1X5e1XPPVg+bHOOy6lUV2iAh/UJ/xl7R1Ljn/QILyIUE
	7gMFADLi6O/9zdXUV3AZHx5x9/hqvZwUwnKPnYB4gtc6hWEchcJtP62xMa0pViyvg94rZiSLQ9bhH
	ecf0xerplnWZ8zRd0jW5gMidUvIrdxxyQkNmOAEImYhgTXrT+mZzqna02jqs3ReyO2OlrtwcW+Su7
	410HO86Kbp5hDNxPcKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV8GF-000rTC-90; Fri, 18 Mar 2022 08:47:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV8GB-000rR5-09; Fri, 18 Mar 2022 08:47:01 +0000
X-UUID: d8242c47883d45bf9daaa074f613f66c-20220318
X-UUID: d8242c47883d45bf9daaa074f613f66c-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1278727932; Fri, 18 Mar 2022 01:46:56 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 01:38:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Mar 2022 16:38:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 16:38:44 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <moudy.ho@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <acourbot@chromium.org>, <allen-kh.cheng@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
 <daoyuan.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <geert+renesas@glider.be>, <hsinyi@google.com>,
 <hverkuil-cisco@xs4all.nl>, <jason-jh.lin@mediatek.com>,
 <jernej.skrabec@siol.net>, <laurent.pinchart@ideasonboard.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <maoguang.meng@mediatek.com>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>, 
 <menghui.lin@mediatek.com>, <miles.chen@mediatek.com>, <pihsun@chromium.org>, 
 <ping-hsun.wu@mediatek.com>, <randy.wu@mediatek.com>,
 <river.cheng@mediatek.com>, <rob@landley.net>, <robh+dt@kernel.org>,
 <roy-cw.yeh@mediatek.com>, <sj.huang@mediatek.com>,
 <srv_heupstream@mediatek.com>, <tfiga@chromium.org>
Subject: Re: [PATCH v14 6/6] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
Date: Fri, 18 Mar 2022 16:38:44 +0800
Message-ID: <20220318083844.24859-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <72f7feabe22064365457b5b72dfb1972ba2b3151.camel@mediatek.com>
References: <72f7feabe22064365457b5b72dfb1972ba2b3151.camel@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_014659_057782_6BB0071E 
X-CRM114-Status: GOOD (  10.44  )
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

Hi Moudy,

>> >  		}
>> >  	}
>> >  
>> > +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
>> > +		mtx->addr = 0L;
>> 
>> addr is phys_addr_t, which means that it holds a physical address.
>> 0 may be a valid address in some platforms, so I think
>> we should not set mtx->addr = 0L when of_address_to_resource fails.
>> Maybe probe fail by returning dev_err_probe()?
>> 
>> Thanks,
>> Miles
>
>Hi Miles,
>
>This does lead to the situation you mentioned, and sorry for the
>deficient dts parsing flow. Maybe we should follow "gce-client" usage
>and add a check condition when needed to avoid compatibility issues?
>
>Thanks,
>Moudy

According to Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml,
it is required to have a reg field in the mutex node. So I think we can
fail in this case.

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
