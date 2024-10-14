Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6854ACFC503
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwqlHdsg7c729dLDMUk6ihLrDCJ3IN9vsDnLB20cfYc=; b=O6ZzoMbQz9+HDu
	j1JFslRJ144hYa8yq5nD2sYTBK8VUrygp0rt7UC9ijehome2+9+cW8PIHBkX/TG3wIfI2Alw7YrMR
	gosrtCZZLl6PdhIexuUR+D26RQfbldV0sycG0pLuEkAZB3ae+X6uh2oA8nQVItm5RgW0jDRJWcOGv
	qbm5scsT6Z4aYIRMPPZaXhi9D4ojE/C9SKtPdzHdrJ6TlHjGnSacEkfDSTOU8MCh477cuzOW9ps5J
	dZHyRJlR+LtNIkVQq/Ex2feJyROX91xCj4Wsb3gPt6thQ0p6pnV+bpTYOYgzTpcLRSFLn+wREI20i
	7iULebHYTR8OnG7rX/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GPt-00000004HJr-150u;
	Mon, 14 Oct 2024 08:27:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GGc-00000004EZ8-2kH1;
	Mon, 14 Oct 2024 08:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728893845;
	bh=f13sm+4uAzEq1nYOwS44NWG9Bv7vNyYaIcfkBEEaAh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A+XkYBCx33szv8j7fB/jBYhcRPUdNnN7j/bnNgbTpJu8toCYyTsSN1fRTYXL4VJZQ
	 89LlFbZDdwlLiDMP8xmdLZyOwNorGH9hKzarNujhojYpta23Rsx5Aqz+SUquvpkinS
	 iAxqRgzjjZcoBtwKoWP68L4nKydG9GZSNxDRx+z6NXMOmIZmqJvVLWHyXfopRGVUnv
	 XCGoGmz2Z4N4U45tPsWhvDIqUCU0HVprNAX+W9VKxz91yp3xkZG84PBEtK3gaZSdsU
	 FArlb9AWvrhm8WO9eRxEFimmjAtZYNK4hicFHY9qtg87upLOIoJor00O7j6Qdk6rl5
	 VrSA49AN5Dsfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6621F17E10A0;
	Mon, 14 Oct 2024 10:17:24 +0200 (CEST)
Message-ID: <ebc3b026-2ab5-4c78-9bb9-b8e7dc2c4731@collabora.com>
Date: Mon, 14 Oct 2024 10:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
To: Frank Wunderlich <linux@fw-web.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
References: <20241012143826.7690-1-linux@fw-web.de>
 <20241012143826.7690-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241012143826.7690-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_011726_905727_D6949EA2 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/10/24 16:38, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



