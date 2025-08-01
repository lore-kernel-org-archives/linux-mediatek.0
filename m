Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BBC87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 07:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi8pB7uZ4Bkim8yK0KofXQfo++aLGUDVbEx1NFaXark=; b=f4iiIHFKnkIFqo
	OPv2/QcGbxH8k6aFLD4HuRfoPCSv7MZpey9WuW96DN75FlZ8Ebj69DbXNNdigS2sRjoJDcBT/g/99
	p0Rn1mtCFS5jaDlS2Moyomi5dZwOt8iecwkYg/U2bHnzAR9n8VzI+PFVcusRj4Ix5eaaJfKZPqPHE
	EUxnJ/ryKEwM4xNKlHFCQuHbGgiqYYpwRzDDrhzXMo2oCzG2zLADNRyj9hxRUd8As0VtBNF12RFLe
	q6QT7HT4OdgX30YJQHwQkEUdROo0tyM1n9XrKix31KF+kRicWEsnlX8cLONevZWxoNWnMlXIjZaoU
	jTx3DlaPf8N87S9466ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkJh-000000059b9-3E4m;
	Fri, 01 Aug 2025 07:36:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkC0-000000058IN-2LVz;
	Fri, 01 Aug 2025 07:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033318;
	bh=m3/oenbHZiJsXlOg59UnMyyGslcBydh5bnFLoOrqjww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DEzkPZrlaIYaXoKbzSxCXrxYPKXem0hyo6SZeQ6Zk5e4TQjdhJnx3Dm0Qs3Jnjgvo
	 jknHEDjVyEHD8+oRriNc1uO+YUBM50wuIMUWmPBi7A9ABztRu43vKMkfNdgp95orOL
	 ZcpO1WHc2yB9Ceeqm26vebN6JRpNpzogdPYTnfWM4aPeZLuvk/wVwAXCxKPW6wZgdR
	 DtiBsaINDqj8OuefTXN7y3vHRTBino8HFXGvGcagk6XldU3Q88bNbsyvECXAC9NG4+
	 CsjDQ/vDYm2aDpQhqyPNQSBlX3BaFTG5V3hpm6BXwpd6WXCQMV4ajk4P4mknIlNi7w
	 pQtz6jzNu2i0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB23217E129E;
	Fri,  1 Aug 2025 09:28:36 +0200 (CEST)
Message-ID: <83aca3fc-0880-449f-82ea-f2d8d554f0d6@collabora.com>
Date: Fri, 1 Aug 2025 09:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-6-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-6-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002840_751140_C8522249 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 30/07/25 17:21, Laura Nao ha scritto:
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
> 
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


