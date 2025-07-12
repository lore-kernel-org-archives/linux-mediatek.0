Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA8C83F1D
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jul 2025 21:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We8JOvusDnYKwN43BVavZsqnZtq56WFDfbjzvvdQ4W4=; b=TMrkbJHCe1XLiWltUxGFodAS7u
	uJi98e4fi+WpWZw5nMpM+U3lar2UY6UGH8VEIyNaFzbu0BHkoPsdrxitwpxaPwhGCEgsXA//dhHxW
	mWzxnjlmMFwr+23Ajol19HhBgfnH4B+wxWXAG9BQfCudAZsMmUJ41XkCxax7q4tf2MusdcgUR3e2H
	zfwfnktBq7Ikao+BjKmA5Sv+ErQgt8N/RneKGa8kGNxx/o1EAEjIDUafEneONtkEilHgPpoPMIZ1I
	tn4nv1L7OEfiKY43RAG/x9Pl7/hRFWg5iPreP7wlp394VVrdCUqX7FCqQMzumswqoMGyL6kiGs19z
	QJZxiLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahkO-0000000H2qL-0pkz;
	Sat, 12 Jul 2025 21:27:04 +0000
Received: from 20.mo581.mail-out.ovh.net ([46.105.49.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahQX-0000000H1TX-0kQQ
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Jul 2025 21:06:34 +0000
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.249.197])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4bfh2g6lVdz5yZg
	for <linux-mediatek@lists.infradead.org>; Sat, 12 Jul 2025 21:06:19 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-lvk2g (unknown [10.108.42.28])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8FCB9C15F9;
	Sat, 12 Jul 2025 21:06:17 +0000 (UTC)
Received: from milecki.pl ([37.59.142.113])
	by ghost-submission-5b5ff79f4f-lvk2g with ESMTPSA
	id sZQeF0nOcmiXIwAAwJQ/6Q
	(envelope-from <rafal@milecki.pl>); Sat, 12 Jul 2025 21:06:17 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-113S007dfe7229d-c21e-49a0-b67c-aefe61f6941c,
                    F8652911B2760FD5DD3B3FE7F023F1798B178A20) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 151.80.29.19
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 23:06:17 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: thermal: mediatek: add falback
 compatible string for MT7981 and MT8516
In-Reply-To: <20250712195904.6988-2-olek2@wp.pl>
References: <20250712195904.6988-1-olek2@wp.pl>
 <20250712195904.6988-2-olek2@wp.pl>
Message-ID: <3d81b3bcdb09dc20e6d54028301da882@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 89.151.31.85
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14864974998312692504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegjedvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhfkgihitgfgsehtkehjtddttdejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejjeekkeegjedtffffveffieevtdeuieefueffgeekheekleeiudfgleefuddtueenucfkphepuddvjedrtddrtddruddpkeelrdduhedurdefuddrkeehpdduhedurdektddrvdelrdduledpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=We8JOvusDnYKwN43BVavZsqnZtq56WFDfbjzvvdQ4W4=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1752354380; v=1;
 b=GXp5BDBkaqJw6lDUZrBe4jqleyB2iZrYyScPtaAd2WqNGo1dBK6Huu8PBsolrwQYtVTxFyyV
 Qti9FAZryIWepBIxWI0oFHbcpEPjK/NL8Tc757BuMMvhtf5W7BkmR4rWcAGK5ViZW+zvbnMmEw/
 HyvzUUmwnX2Sq9i3LvntOwQOuFzIGJHyTcbBWsuP3lvJQHViPDiWMDFrKOmjZTIwkwH3XxL/V4T
 UuEndBCJwknWR6aGp3+uL77LSNEPZUtsIF6WE7qEMrOl1vZHjUphgdEGY0dxLAXKBv8K6mNTxbp
 e0PgYvpnlV4lFQm0oHr8dsY6KniqXMh4v5pQJyhSlqMSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140633_351145_17EB32A6 
X-CRM114-Status: UNSURE (   7.34  )
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

On 2025-07-12 21:59, Aleksander Jan Bajkowski wrote:
> The ‘mediatek,mt7981-thermal’ and ‘mediatek,mt8516-thermal’ strings
> aren't definied in the driver. Both should have fallback compatible
> strings. This commit fixes this issue.
> 
> Fixes: 788494ba0999 ("dt-bindings: thermal: convert Mediatek Thermal
> to the json-schema")
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I see my mistake I did while converting to JSON schema. Thanks for 
sorting it out.

Acked-by: Rafał Miłecki <rafal@milecki.pl>

-- 
Rafał Miłecki

