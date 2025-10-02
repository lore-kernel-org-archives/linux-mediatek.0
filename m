Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A2ACAC5B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Oct 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnmAtQg8Q7hBmMesdMtx8E8kPJLMvdHiWPV3GUbedO4=; b=J4CWRwQKeHPvuNkz5SWMswZON5
	KCc6IKYF50OY+b7U/5VBXezJ0TG19W8TUG7Tg+IFXykmnrTbek+UVtygrBAjJXh12pVwWcvabjrC/
	snYTH5aly/L+up0y2g5JIH+zBglVYJY/WtKhVOp3etzYJnfsrkDTVIEYhRpsN3FOCx1lQXyphRxZQ
	M1uAEVkzdSEwcLAytqsngovyIVai9bseUu3wcqagyrsow7a7vucReqYX2UvnL0sHCd4jlj0z+f+j4
	lkObYsxoG/UacIT/y8/CQNBsVtnTxn1urXbhRM5XCqjDveSpMk4P7ph/0xgEF5nm9KRD3+au84OFH
	QEx/c4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GMy-0000000AEIp-0quF;
	Thu, 02 Oct 2025 10:17:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GMv-0000000AEIB-0ojs;
	Thu, 02 Oct 2025 10:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759400218;
	bh=rBdIXori8WP0TwgaYABKn1raWbJCyFiPMjbMD4E+mCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vr2Bqqu+gLxMJ82V8rA5gq4SJrB52nulJwTLREEAqZFl0iEVvNLjPBs8Ba9ORsUbr
	 asg+l6oBDPmjV/KXe7v5I6eLqKJsyNMaXlMlY1BBc9kq5GK6g9yvFn/nGJmtan7ztC
	 5WjyVywbe4D6KDNBKVyy05SFKo/kwMYg5QpQ9Xar7XxqsAClCLbTvACQQsPjKvvo/l
	 wbh35IhN8N2KiHL5HQqM7deKO11w4xNtRDHgBlixAVMlbbdf52vloG+4PCqJBhHpsQ
	 KYQWJ+QC/vDfKrl/teaGxJWkHr1gDjTQAVIpKnhITq4NZWRELRVfkZzalvw04la5fn
	 GhlxY88U7S55g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D68317E12BB;
	Thu,  2 Oct 2025 12:16:58 +0200 (CEST)
Message-ID: <e2253310-8a07-45db-a3e9-ead9a9bf69ad@collabora.com>
Date: Thu, 2 Oct 2025 12:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: ASoC: Convert MediaTek RT5650 codecs
 bindings to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, broonie@kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
References: <20251001183517.83278-1-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251001183517.83278-1-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031701_414380_6E3A3F3A 
X-CRM114-Status: UNSURE (   5.63  )
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

Il 01/10/25 20:35, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



