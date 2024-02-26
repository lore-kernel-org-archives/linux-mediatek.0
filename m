Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C58C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAaZsjwv4FyCkCl2y1raDjROIk3+39ywXoJAzjC8S/w=; b=jEFqIHirNp9az2TallYmy5GCNb
	AqZ28xEaYTnfXwKWfLV7kiO+h6dPa+Jlip6rMNPuX5ICQj/EcNSLdbZ1rFFnGg1NmSurcNTUOvf5T
	gEUFms1eSaHve38329LpT/avR9lbEL1P/ETSxdkAtLhAy+UfSdgLzYdJA4SicmQ6/KLvaB1KjbpTS
	CncinjJVNekcM46Xn0t7eUO5TsGcsqjxR9PgTekvrgNLrnlMh5tHvSVoA6wlhyCtMo/sMkNcS1pi4
	s+9YrK+Xb2JUUxfoBysS/91vYSILjxvkpNy+IlGwfUQQhWUjuswRkdMlQLVRJMt7oMeTPCtPGuWsG
	atUsthTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWmj-0000000HAZD-0LEo;
	Mon, 26 Feb 2024 08:56:29 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWmW-0000000HAQj-1unA;
	Mon, 26 Feb 2024 08:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708937775;
	bh=22mIqwheuC6Rn5p1Eu5S1/Bl6YMtGWLbnEVTK4n7+gc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQcQo6ua6hBX65ziMOVXmhxYZeUzXhC6tVf1nnhfV459MFCnw9caTTUatBS2relKw
	 pVOHkZngubhf3ma8nVCckAkPKECa7ujGkRUmXpeYbNoFlxop+LkGhHayDAL2wNMGJ3
	 A/n37eJWXzPa92hQuJcEFig2Db1/P7hUbxDlakLM8fp+n9y7vzm7ceaStFszOtPb66
	 AUW1xtauYgLiHoWMLSWQFSMTH36Igz8SGgsgWoA7f3v7e8VKfMn1Z0tMX9f5mwbvGe
	 JMzNMuy7drEdZXKVa8nVigbB/aRPLPCM62X+CcwSI+dF2RG7/aJhtIIow3thpfzf9d
	 YjNzlQOAbl2iw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C23F9378207B;
	Mon, 26 Feb 2024 08:56:13 +0000 (UTC)
Message-ID: <7e0a003c-7016-4de7-a193-2db28995e6ea@collabora.com>
Date: Mon, 26 Feb 2024 09:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] dt-bindings: vendor-prefixes: add Cudy
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240223101709.30072-1-zajec5@gmail.com>
 <20240223101709.30072-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240223101709.30072-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005618_694765_9A85240C 
X-CRM114-Status: UNSURE (   5.85  )
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

Il 23/02/24 11:17, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Cudy is a Chinese company providing networking products.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



