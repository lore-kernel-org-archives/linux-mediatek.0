Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83037C10F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0U4DzegP4NA1BFpwn8ZjTGgmn6lJFTbYfCuAtsmq9QI=; b=B5eI/mc+d/o+w8jGC9DJy0v1z/
	rRH0Do7r7umdcP+zg50zI/neqfDal+20wlneHQC6kddO+Cl6IYMkVXbKvNLbvWq/ysBJfHAvybzCF
	hZeUQXeqwlAHSxWPiySa8Cy7pCKuaLtDcGJbViz5f59eB8mq3lRX1CzxAFLA/6HEZ7TQ8t/exVH6D
	8hEdf0mM0p2bD9BudParnBO0RWmqouQL7CzwCs6TaCWlm6WL/OIIU0Vn1QoracaM0vkGUwS150Y02
	pU/wV5LUM9B8iT7Pa0MrmxBf6veR3sKQ2luzdvzd2NA9Wb2+9bF61fj7oDnS2Ko7ws63R6RPs6clN
	VC9M8xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqmQ-0000000D7Nh-400D;
	Mon, 22 Apr 2024 10:20:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqmM-0000000D7DJ-155m;
	Mon, 22 Apr 2024 10:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713781186;
	bh=2be7ddOYKWR8xs1YeIaNBfdWx9fkiLTHGB9jAzYsguI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSHRSSuNm4NDYQp300eygwILxcfazcpyBUpeCh3Szo641XH9kz2+9gSrY/wqEfNdY
	 e9D3F9j+J99thS5c58zJEqGm48rJeKqOFMVacHqbEW9yRZsa1TOVHrwSUKj+OGexWv
	 DFtDrxmsI/QFDPO5ru7SX4g/0Nk3YthxnA+GCvZbdfqg5q/y69qqbzrRovOd9kFaec
	 +uhdAz9De7DNltnyLgJYJgh0Y/6WT5Sr3kcj4ASnx31+VPNxseWgZthgIRbmV+FJDn
	 qo5X4PRwJ0QxtxcWFzZeTjt6MgAKt0kjSEYfeLIuOZFMXZpD4w2f7795fD9pNqXjSy
	 6/o6Tbqs0RZWA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AEB4337813C0;
	Mon, 22 Apr 2024 10:19:45 +0000 (UTC)
Message-ID: <8de67c04-6f5c-4c0c-9162-e5c4dfdc7374@collabora.com>
Date: Mon, 22 Apr 2024 12:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Support MT8188
 dual-core SCP
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240419084211.31901-1-olivia.wen@mediatek.com>
 <20240419084211.31901-2-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id4
Fcc: imap://kholk11@mail.collabora.com/Sent
In-Reply-To: <20240419084211.31901-2-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_032006_480809_4C2CA0B4 
X-CRM114-Status: UNSURE (   6.04  )
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

Il 19/04/24 10:42, Olivia Wen ha scritto:
> From: "olivia.wen" <olivia.wen@mediatek.com>
> 
> Under different applications, the MT8188 SCP can be used as single-core
> or dual-core.
> 
> Signed-off-by: olivia.wen <olivia.wen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



