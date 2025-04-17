Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A22C369C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKEFfy22Ovcnvkpz67OvpKpbb8xNVHKeALBqrUjpiLg=; b=4WNxOenQoEYpwQ
	8TKt8Exn4cEyTtmnkRDoQuUyGwgOnb0cRzxQcTSZ+Fl94JT5lMgdTRnW7UFP9JtaXTTrzoohBdgUv
	okscKtO0emFMOdhcv3HcqZNY1v6igXKBq+1OT/r6OM/7jaa9+DwMHEtk9zdtKeHwYvF3lIhccR68I
	d8wnu5ZgIj7egr60t1lJjDMFeRhzqZbA3tEl97emeEXOJPfwTcI8taxpOyYyUCv6uF6ID1VNh8ojj
	Cxe9aLpu4ri9tbq/RTGtkgMjMeqU0FRTX9LKmT69hRmeAgKWocWw2LAVSn3kqx3qwj8PN3AYs5G+I
	azJpLQpVdvhryy+r3mgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Lg3-0000000CUU6-0JRu;
	Thu, 17 Apr 2025 09:36:59 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LeB-0000000CU4n-1Ohs;
	Thu, 17 Apr 2025 09:35:04 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 37E595FDE7;
	Thu, 17 Apr 2025 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744882501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKEFfy22Ovcnvkpz67OvpKpbb8xNVHKeALBqrUjpiLg=;
	b=wFDyNzYg1F9BxMYJkyYCP+a3ZIXfZiRk5I12m2dwgUUHCeHitJo2vZnmEAwA0xtFcV0rC9
	l470vX/M1F1rLFuKb000aTbOlGYC71jXSo0nqF7TD6X6KNvdVkzMtKvARBQMb3LwpeL3pS
	tvq07rfpyOyCEWdpBObo77XsjYhg/BQ=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 5DEBB40089;
	Thu, 17 Apr 2025 09:35:00 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 11:35:00 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
In-Reply-To: <caf3da77-f35d-4a39-9102-9592d722d900@kernel.org>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
 <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
 <d2da81ccb6b9b267288a3d2f5b1bb977@fw-web.de>
 <caf3da77-f35d-4a39-9102-9592d722d900@kernel.org>
Message-ID: <b59ccb4541f4eac24fd38a65de770c8c@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 3fd65e47-3ca8-4c33-8858-deb75b092cd6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_023503_536479_363B9AB6 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?UTF-8?Q?i?= <rafal@milecki.pl>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2025-04-17 09:59, schrieb Krzysztof Kozlowski:
> On 17/04/2025 09:52, Frank Wunderlich (linux) wrote:
>>>> 
>>>> +      mediatek,syscon-type:
>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          A phandle to syscon used to access the register of type
>>>> switch,
>>>> +          the field should always be 3 cells long.
>>>> +        items:
>>>> +          items:
>>> 
>>> Missing -, because you have one phandle.
>> 
>> ok, then i need to drop MaxItems and indent 2 spaces more, but no
>> problem
> 
> I missed that maxItems - should not be placed above description, but
> immediately around items.

dt_binding_check complains about maxItems should not be set when having 
only 1 item ;)
so i dropped it in my current version completely.

>> 
>>>> +            - description:
>>>> +                The first cell represents a phandle to syscon
>>> 
>>> Don't repeat constraints in free form text. "Foo bar system 
>>> controller"
>>> or "Phandle to foo bar system controller"
>> 
>> i would write only "phandle to system controller". on mt7988 it is the
>> topmisc syscon, but maybe on
>> other SoC it is different name.
> 
> This must be specific to what sort of system controller you point. You
> are not interested in phandle to any system controller.

how about phy configuration controller/register?

>> 
>>>> +            - description:
>>>> +                The second cell represents the register offset
>>> 
>>> "Baz register offset"
>> 
>> same here, only "register offset".
> 
> Also not. You need specific register, not any register.
> 
> 
> Best regards,
> Krzysztof

