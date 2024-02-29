Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7AC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ke8uXRymrerkB8kA2PWB8240h5ibIaIJ+hdCSlcM7MQ=; b=aHknFlus/8o0FZ
	i+DPKn9BZYO1vU3bKTa/opGOGRL/+4mZxQgcsS9qrTUmJTc1n8zFiujBNhqSmQpid8AdxdCziEVbV
	sKoPI3iYhZn0qQjWH8YM2b/XcHdThgf6RZXUFNaJ0/B8an3WzRHPUCDlcN5GrrsmPQuKB7VLN6jgI
	lfOzS4DbT81jUZuvO1C+kZOsmgIuEpLqsw3w6uo89WSuJLNX1e0MC7psy7TuF87vqR0zn7Pwjlire
	PL+jp55AowuZflxUASAHWvg7u63Ek0SNJY1650qverA4ywcbslzS/GGmmsaqFcixL1S629WvY3yWW
	YhXDwKIzVg9omTCJ/h+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc5T-0000000CkCU-47Vt;
	Thu, 29 Feb 2024 08:48:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc5H-0000000Ck3y-0pAs;
	Thu, 29 Feb 2024 08:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709196486;
	bh=9+dpCXx7x8UpSu3QuELJTExwI0UUO/emZ4rDeXtx924=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqUeHf2gm7ya25wnu6E/Surks4FtpIdhdpaTZtIqhLZqXWuCUT1rBSm4Fz3y7d51H
	 qiPLYiz55uYSQgit4TpXAEG795vs9TecMRbNmJA6lBvIS6WuFj40bGj3PvTX/ENsH1
	 3LkJ8YBut8oDlQjXc6MymbwST6AFCZbuQoBPhA1Q92Zz7BGQzIp4Cv0IbFW6JoGNNe
	 o9QnxE9hcQ1JoySzCi4ROL5ssEd6l5UC6w+Ni3Kia6CrJWtqSiTMTmmSxkcD0I5+zX
	 lL6i6Y+xIn0Tu+a2V0txcd6imogZVCvUX1jg1UssxaH5faNL9I4HFAj324mBBBjKMc
	 KjzC8ZLfoDOcA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39C3037810EF;
	Thu, 29 Feb 2024 08:48:04 +0000 (UTC)
Message-ID: <e1f772b3-cbe5-4d6b-b2cd-d6e10bd2121a@collabora.com>
Date: Thu, 29 Feb 2024 09:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/mediatek: Add gamma support for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
 <20240229023522.15870-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229023522.15870-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004807_406506_F22D6E7A 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 03:35, Jason-JH.Lin ha scritto:
> Since MT8195 compatible is in the single enum group, we have to add its
> compatible into mediatek-drm component binding table to ensure that
> it can be bound as a ddp_comp.
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>


