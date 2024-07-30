Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE10C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5LVzzB7kowWJcR0ltmplTWIAFHKASYh/zNFa6qeTwk=; b=j/kq5/oFu85vkPXES5Sdtue0GV
	dNLJNjB29/1mxO4b+p31DqgwJE834ui5SgjrGrDR2NOHaYOZEOkPSkCswBf9dJuGfU1jIOTXUIXXX
	txZgv6v+ORas2kW0dhRnuqEs+6O6zcZsBbSBq/4e/Kzodz0UeSz0/W6TL6HaS7Xnn26cQcDvm+6iH
	PVlEHGDcV06PKGdtq7EUXvINmpFJEfeWvRg6sPe3quFCanJBWvfvzV2x2XiRUpN90DQkPTpeP7j3a
	MrwfxiHl2xaSddMQ7eP4MTHyamG2dPsa/YNBKkb3ezXecJgFUAvybrLFza0sHr52jJ/MFOgfxvGr6
	ycjBqjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYobV-0000000FdJo-1zcR;
	Tue, 30 Jul 2024 15:17:33 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYoZZ-0000000Fczo-3XLW;
	Tue, 30 Jul 2024 15:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722352525; x=1722957325; i=markus.elfring@web.de;
	bh=D5LVzzB7kowWJcR0ltmplTWIAFHKASYh/zNFa6qeTwk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=u2BG2S5fShfrTz2KSbLCvSFXFwItKYCMdoIxmASSv9b8s2xQCV235GafUv6vUldP
	 3KHlmW6FNFT6YUNaPHKPaxLr9pwBnhk/9NwB3Yyqu4olL0143qZmOXk28Li4/fDd6
	 gamQN79EM94ih2w0faDWdRAwZ2gfaoHz48snPD2sgdIGvZqKk8lgWgLg5Oppm1YXD
	 vx7pDt3kro8kM21sk1WEICxNBmoF8w7CnOTMP0w7xFNRcA0LOe+z0yz1tUClO/AHH
	 RbzL//hjSFEJjmqDuctnUF+AXecMR2o5b5LFILpK2dggCo8OOyEJP5/lC3/yXvJVg
	 RevWNc1SOmNAEMNN2A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1sFELl2X1M-00yGFk; Tue, 30
 Jul 2024 17:15:25 +0200
Message-ID: <51bbc95c-00e7-41fd-a3eb-65a4eba5ebd0@web.de>
Date: Tue, 30 Jul 2024 17:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Paul Elder
 <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:21Jmp9I0A53wGyh/tH2upxHfxiNe9xt5HKxVrv5eI5sABo4Y9ZX
 SFCQ8eDdb7WPzamqdlBCwf/uRhdkRTfE8F3gdhpI65/dJxQuSeG4hnd3dzheZ8R9AJXdjcy
 FYxBBRSOy57Oa6UHLvPoXwbHiTIBDmWjbiJ4EEd5rqS2CBHOK3HjPzThNvGQ241L8CrxfE+
 bBfb/BENESk4mfJSyeGDg==
UI-OutboundReport: notjunk:1;M01:P0:bInlfz3A99s=;5rCP1cLLs+hEWLWLOFuvYTh2W3B
 H+RWSvGjnEOgHOGsQbuqVGOODQ8+cVXrLJdZ5tRZGYeFH2sANVGAZjDHzrszwRFgc1CNw+j3G
 jR1WEZ9png0gtiMAsecQBAcSlRti51RZN61xEdR0l+qciQbrOsE/rEGSHAaTo/KhX5iw6UHAf
 CsFRXZo/7o9jtyuS3OaGrUs4eGJp0XZYkzJa8HFwk2xws7VjoFI6WZcAZb7XiM1MqJ3PvH3f1
 XrPnFONOT/6SFXuK8pjYA/+9bIE5/N2sXok8h+ORRH2ztoHz0DJ5P/DpkLOkW0rp8FrG/S0pE
 TibRD5Agx5CEeqQL6mjgnwpdY2kjUpusSUg9rqE0U8R982Z10VBBScv2955a0qpwH+0BmIN8f
 REui6T2VdWAFfkFih5O5C94STBlDdX9e+udkojjjZDlywOs1wn+EYr0ahdkRHW4R6M7WO0csU
 EXN2wD2qGH56+ItmH+EvtQvGeBY02Z1TIv2Euj12tUhLyi4j2/VBtTJEwJNtPDba9rfIlQUSs
 deJPpkkOXPDXZTh7BYjf/jEqpvxY/gl/YEN9Tsv/r1Rl0eiJuSK10c8E3y3wFW10FUCG6N3rl
 XhpY9+YrSWj8iqtBp/YU8Cr3ya/M+Q9iN7sNHAzpornNYui6dWwVndj9Sh8VU5gruCtBJtdW+
 8HhmDgd6R/VilktpnM4LVJE8Dm6Bx4ZAhajd/xYLF2+izVgYQmbmcY+NpTyF7OtcDmEkfLgjD
 ddoxLNAefhIZpivlWOpWasTQr+e2pwtRPGbwNB8hEiE5i9Y2FymtLozy0XV8S3vDKJHqvOOyP
 Uqh2/xmGPlcv+rNzflaNt6Kg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_081534_189465_F3115298 
X-CRM114-Status: UNSURE (   5.91  )
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
> +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,117 @@
=E2=80=A6
> +#ifndef __SENINF_REG_H__
> +#define __SENINF_REG_H__
=E2=80=A6

How do you think about to omit leading underscores from such identifiers?
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

