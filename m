Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBE4C47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whazQMvcS0EoXt4SdwfLyIksmCvU+xpV5kM3zRxG6Go=; b=k87A3kslta06ek
	E0Zbtkt6Kt3hUQ/jbBglyJlg7JZzWXD8k5oI+oBKYo+oX941nkRiTGqIvMCoA0e1+pGaMWw+/NZgQ
	+VeERNmcfnd4tIQ0biAdhVcery+SaZwkf0pwmAC6L6hYemGjWiNhgrOopeXcRM7gTK/mtw9ISSpMH
	NHG8GuxFPdIz2pRKNAf+BtqT87W95qZAbcabKTenweswJNeAwkut8ot227oUkAQMiMwV5EJzBkjmV
	YEyhntbdfrtDvdZVXghkGwZR3lGmIxwXTA0jbBUiFte/KJSoIsQUevzfQW6ZIu+sYt6uP+O53Tat5
	mpc09OcyBxQm9VppaT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ4c-0024u1-0Z;
	Wed, 24 Jan 2024 08:57:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ4Y-0024rL-1X;
	Wed, 24 Jan 2024 08:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706086645;
	bh=mv/7ewEA4l7pAVBAP8biUVLUr2QSV9pQKC7zQv+hEQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l29n1LNa4UC1tyoaI2ZVW6ekOax3ozxHbprpCoveeOUHpLNpPcK1uDNawsVKXqpOG
	 FKzntSiTGRWcBsWdfGNjbo4doYTt4uFd9GNFeGDcp5IDGryVZBycZYzGFYr3brvMRx
	 tW1j0yuv2fP0wgXojS/WkxRNhAL7u9D2OcY1NZUfGkDgkTh5g8MUxXRD+zhavi471c
	 GTpoWaCp90tz5/5nD/6wsX9jiwwuxRXUD8jUfteBWaJOTwC8pq5h7AO4xWEfOK3bsh
	 PJIuxAKVQX3bRFPA89SwaCTjKj7/XnFA3eSG3ty2zFn62Gv19nQaS3ncPxk7cam7XK
	 inOcYNx/epBlQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C692C37802F2;
	Wed, 24 Jan 2024 08:57:23 +0000 (UTC)
Message-ID: <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
Date: Wed, 24 Jan 2024 09:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240124011459.12204-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_005726_648034_5BF0C476 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
> 
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a software driver.
> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



