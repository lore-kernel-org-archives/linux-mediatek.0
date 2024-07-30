Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533B6C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 07:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9M7HV/oJMHN9SaUohbVRMTRV7I4w25EQLwnBP6m1nA=; b=QmS/JposjT/MYpZqrpntBB+f3U
	ImTgs0brXmsvZIiExm78IeL7qcCdNsdwV+ofcB/zTP8I3+xXz8PxaKIUmf87gZ1J7VohmEOAU84ya
	d2yAWjf3XfjJxs+jUa5D3FkupgdgIw0joQHtUF3LF0R+rFnKJs+0OREGpYqyR/AiL3eVAvsbJQuFq
	hbU2rsGzrsjzoTgudYFossLj4Qr+I/GSUN/mtvVSJUuwjTNP1ONsSAmkXKOjSIQopQSgFd/BZTwZc
	rYMDODSMe0YtiwDSbk+kyg28vvUv2lgmo2cXVkxsI8x6gHb8mEeplRRyjO77m6Zf1587R51apVVTP
	jxSuaJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhaR-0000000E5Et-076l;
	Tue, 30 Jul 2024 07:47:59 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhZN-0000000E4wA-0T7Z;
	Tue, 30 Jul 2024 07:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722325603; x=1722930403; i=markus.elfring@web.de;
	bh=x9M7HV/oJMHN9SaUohbVRMTRV7I4w25EQLwnBP6m1nA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fsUL2SW5qmCX6O3DIYdLGC1B8MWnB0OeZaBATWaUSC+NQkNkZjRZi80SucLuFZQK
	 sgT4nQwrWNhpJAk4ixtW4KXrjdt1xPEQz1JA7gzy3QBaWSou8S/VptA8j4OLu9BFt
	 7LrHQv/aRUhvB2qYkU1s4OauXTYkbF+tXk4cZcMlIQDOKogDTsePIae7NV7fBRWhX
	 fl+YKMbj7Wp/YfcYvb5ZSKa2ME8YIIM+iMobey9JHOqdZF2uIvIq17HHT4r42Jn5g
	 edn4h4rL3ng2R1E1i7rHRf+xtaY1odkUBou84B1/j3c1SyJDCQSdScR3ZIi4KMgRM
	 PnfCQZAAKKeqGr0s7A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQgl2-1swP5h0zck-00KjM0; Tue, 30
 Jul 2024 09:46:43 +0200
Message-ID: <3a764900-12ef-4026-af03-7e8cd2d09b04@web.de>
Date: Tue, 30 Jul 2024 09:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HxfUk98qhjXor8EeRRmEwu+XEwDZNRk1/c9HrRw62G48QGp0iP2
 pikrkJzo4/SWpXOX5wePvMFYdIdMRWZMzRnkk4Fc1BhNrp+YFt8WyEZTg0Q7+hhF4L7gHwO
 kN0LR+Yi31HgOSaxuz3cBouWcefbb1oiSf6ZBmGQQNARZ+VZaXW1VxVcRaE09Cn52U1/IG6
 ohlr+FpKtk1jR8fJAs+XA==
UI-OutboundReport: notjunk:1;M01:P0:ChkxlR19o00=;uiURpJ3lineKtUAkoX/d6ZXTj8b
 cOzJcVdyHJkd08/1gAx1NJZnaOAFt5YTheV4N1YzLIECN2kRAnBbyKN18rSnlPQPzn2AzQvUY
 5gESyQlxbo3YI9l2VhjC7N42ep2nZQlDvTdhh2QfhQvlzdKUz7Zbop9LdzjdfhZLjwqyzX9mp
 yYl4NyzFw/qjr9qSCCD7/vJGlWkXwshnclAIsU6aKCr6vOxTISE3ksopHAiQmx/ybCXTooan/
 0hIAHvZP+LKlATMr4P42YY+BnoiUbIXntVbzqZ7rVVNzj22b3cLfjUAqXtrw82BXDgbuuww6G
 r7E7UmqDquz5uuxZpHtQbd9pf9A6jg5k1QkS3ArO96QfLrFiXjNyMYlG+y/t1FWKuJOfqMbWq
 gPYzRCu/1fLgSY8T3I2JsUPMlTECsSV6SB++8M1SijaOSikQ4SMIDtfq5A2nzvLyiTV5zYVuA
 zliVMrbJdt9bs14R15T5G+UjC/g0hrEQHv5UMfTRmjDfVejwH6nRZlmgfPrFq6aDe7lZAvRJN
 pWkOeA9x/NONJfEZQfmbU8CD0RlHGEiAxM5LReTv4ruUnB9TAh8Sq10uFHjjPu7poWn/o0WPA
 ZgK7hYY9SqWXFUDqTLfsx1gdUsU2xbldPU7wmCMKCW3pCZh1Y444xXJWhD6UmUfc8IAqSE0bu
 H8wYrnzdgQncGQW/VUqyNIxJf7YfVCyn2LndEmmy4wz9uBS4bIFTZIiSBhph2j/Ifu7atWYSe
 F6mI4NLN6AaGoasT35moG3R2/apGbQ/BcJTosqEW4e9dYISwvpR6NPIvpsD5G2+tUqBFuiLvs
 nszSfL5FPMiTmOrdVq6/ycBQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_004653_467204_BE3276D1 
X-CRM114-Status: UNSURE (   5.10  )
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

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.h
> @@ -0,0 +1,196 @@
=E2=80=A6
> +#ifndef __MTK_CAMSV_H__
> +#define __MTK_CAMSV_H__
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

