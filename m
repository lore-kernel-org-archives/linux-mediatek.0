Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC58C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LW4J0iVgPwH2xPrIRMPCQFJLys/Ro0aFKdy0tI++G3s=; b=jF2hqp7XK1E9ctS5iTGbEva9Sl
	6bWmvzCRAxfbvfY14Yt/4gkp9XIJSue4Au4za1p7IcqQnKcJPTPphATBByA4n2Ue2W0HCHvoVrubf
	XPGNPZvZLZBj+Pf7/MpsmAtUGVcdNkt2rJ/eZCwGxiEDRD+m7MD8TDkRFF97Pqi0THMg2DeNpKmyX
	3GKXe25Yrafhv2d8+UWfHq+Dw/TE1ravUHOcbk4DfNhcXc0b6v0H1vdqf5WAgVCuEU6Pc+01ecssP
	NvN+17plHmrIibacU4D3JE/n5gSq1gO1V1y1zzt78yJNpyOzaPSbJavKHb0VPbm/3saaSfk7yiQap
	74q8Vd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDJ-00000008NIf-2MWy;
	Mon, 18 Mar 2024 11:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6O-000000087PQ-3XEf;
	Mon, 18 Mar 2024 10:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LW4J0iVgPwH2xPrIRMPCQFJLys/Ro0aFKdy0tI++G3s=; b=fimv0QBpdHUTjWNMNrMxBLXxMp
	fQ7vQ07hLysjpqxysdukO9GCfyJjix6LzkFZizaFnx3vVxf5ltF+1uHbj8DzQLBrLQouKRBixlOak
	q0rDTLdz2ZzyT+URW4KsgYpmKzCZgVHJCrqvE2PRDOM+gi5/uRtpjjRd3alhup6a/gsKIlUNjlOFH
	N8ywFyzqpa0cEtB4JP9Dx6GwAlNue4XxU4FhUOZT3B/kfQQFQxWCwEuD+uN2+B7xCgsnRUI3nqQD9
	Ctxgz3T9B91Es2RjXf/zbXjbr2zT/PGymEy7nIZorsb6klzkN1H3c481AHATNVjg64l5zlmXYe7Eb
	/y4JXf9Q==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6G-0000000CZsX-2kai;
	Mon, 18 Mar 2024 10:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757211;
	bh=WoikhZZr0gaoJ3V1DHAFR2wjFu+N/hvofiJZCIAiWio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O/m7BrDSVJJnY7SaJ8BsVhxcMlmPjQ3ajK53VNg2mkQ9DH+HdhKKcN0QtawaxnAd/
	 FN4l7hcvFjFiyWZqrxhp8on45p/KNfuAzljCe8tUWanTUHT0uSe8Ccw8NnFIDot3XT
	 KMJZ4MDKM/Go8SYzBiJ8JEzzUcMWqMgXK/ZZrs9oEvvxhDwwusIcCQ01zwzOiingi6
	 WAxoyTscMNtaveUMvrHlXdyA1kLJRAckrInGCWaKQI9uYQKWn2VgNj/7DJl5Y4TCby
	 +C8E1qhST4Ua9i6L+utpqagLPpoCnN1oH/UHctcpQxOZW7iZTXrmRQx/SwOIUc9N7b
	 Kb+0K5VV2xrPA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C8E43782033;
	Mon, 18 Mar 2024 10:20:10 +0000 (UTC)
Message-ID: <6f8a0600-b838-43be-9544-4bea54eed445@collabora.com>
Date: Mon, 18 Mar 2024 11:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] mips: dts: ralink: mt7621: reorder pci?_phy
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-14-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-14-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102014_318036_9FDB7D52 
X-CRM114-Status: UNSURE (   6.05  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder the attributes of the PCIe PHY nodes node to match
> what the DTS style guide recommends.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



