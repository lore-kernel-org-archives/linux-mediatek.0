Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB0C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blfyZg8sXChulnwgaeTe9ss5Hc8woFKCJ7YrVAvwAEs=; b=BpCrPZH2+N1h2hNgVHJWqQ2rzE
	FYEFsLJXLiWqbj7EBU8pVwxlAYiyGTAEOwvQ9Hp5etLe7nj61zIULDITGunZjA1xuXpE4EgphLQxV
	Yr7czV2jdGWy0Ic/nIKwb8WuyF1BTWNz20SAdyMB8BsBbxsxIpRwhQLYLpJ7XjD+N6ubw8BX5IygL
	4TPthT+xVrMMjpla78tiBdjJrJnzxEUU54086Hbgg3+bh/DSGEHQdjAdhFVmMrHbwV88uLoO1ASVw
	Tu4SU7lEwuo8NIWTcvwgp6SL2I+uVJtQ+EY1bamYPYP6gpzU1/Sd758MoitA08pzJmSmIqJNkHO5+
	8xlN/qYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEc-00000002qJr-3qGB;
	Sat, 16 Mar 2024 09:21:46 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEY-00000002qJE-2fEd;
	Sat, 16 Mar 2024 09:21:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DACCB20003;
	Sat, 16 Mar 2024 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blfyZg8sXChulnwgaeTe9ss5Hc8woFKCJ7YrVAvwAEs=;
	b=oc4NeA7a2lbUyLYbGfk3WoWDevbVZKqxLeQYY/AdPm3Akb3F3igDWV6MHgCNzhpfLdWZHg
	lDmMVgn5lKg+zRn8kotWZH6Yja1n4vCDSrBxZjWmPBNwjbKyDfkpFTVLczONgVRjPBzoDl
	lCHyHm9PZ1fYBJzhkWhfs/2vxeEMG09mJ8a5D6RfcVKwFKfp0oitdMHDldBG6uPryGbjxx
	2mV+9N/jdhYXg4NFhAwkb9YzEG5cKN5/lwCRJBZlO5/8dqNDG3njL0FRddi6ZZlEmI0Jns
	ZXL3GqTj/HEO5p/PvIOfMVsK3TCWfCONTVC7ySKrDU4rUZ+oRTKwD/1vD4Hgkw==
Message-ID: <97d0f9cb-1121-4be1-850e-cdf154bd03f7@arinc9.com>
Date: Sat, 16 Mar 2024 12:21:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] mips: dts: ralink: mt7621: reorder sysc node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-5-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-5-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022142_836316_44C4DBA5 
X-CRM114-Status: UNSURE (   5.33  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the attributes of the sysc node so that the
> ralink prefixed attribute is placed after those which lack
> prefixes.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

