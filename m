Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5F9C369AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxjWCrCKM0GR7BC/smkaOo8VxvgeDk6SlyT2ywKakPQ=; b=W6SGDSBjaMClQd7Z4g3C4R6YJW
	ot4PRoxlBqVSY6J7Mr46XZpih0TVhkRuxSj43uXukyIBmpaWqisQwyUwaARRqcqWrXZbTEGig6DBp
	Igx3oTTLZkvkix9R7o/DrMPH90raH2MmAS26fINITf/XPWEn97L4U6WsxNN/a8NyIIzbLRM5wPzC/
	xWMWFzezR6keKidjbf4IFhZ8VXhcWUv+IdvnbyvbDwq9eyvnm9yIbUEA2Ww8oqQttjx1Arfz6gHnA
	eIpVCYf4bs6Zy3VfDeibkg4v7gcpAXno+UVM6qk/BijviJ2fXoA2CPOLidvr61kqulkTc47oHecfq
	9pJ4H7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMvN-00000004QBK-3Nla;
	Wed, 25 Sep 2024 07:59:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMqm-00000004PIp-2wJS;
	Wed, 25 Sep 2024 07:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727250855;
	bh=T6k9dVIsBwrFxk5lHbMHpvg1G0w4z/IStCeKOVMeHQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=erpyU75kancqIbh7jqa011BZ7v+l6n1lr/aqaLNpLRFBP+En066UOFqnULkXpQGkJ
	 13IITw9mGRAundN1yAz2QT2diuiXdBX5vgrZTGTj86JH4OkUfkXu9FVI4wFmpomexU
	 XjcmycMarAUufrK2BqN0YU/irMlKkmgeF9wIeF07Qq0Ew05B/ngYAS+uDVvSBc7mnR
	 Jv2ymxQQAbc0Xd48umtz1m4aur/oalSEkffp2Ih/OjYLY6jHTF1G4OdZz9+G8YMThH
	 MAlw1NCvEe2/qdVEfCbeaDr+I1rcGX7f/1WaampLK6qxfZ9uAn4+6/fAEjmB1qn+uZ
	 n3WPCfy35GdtA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E00017E1046;
	Wed, 25 Sep 2024 09:54:14 +0200 (CEST)
Message-ID: <7e57ea01-f881-4c6a-95e7-96ab56dbc455@collabora.com>
Date: Wed, 25 Sep 2024 09:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add power domain for
 dp_intf0
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Tommy Chen <tommytl.chen@mediatek.com>
References: <20240925071514.17626-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925071514.17626-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_005416_919112_6592F791 
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

Il 25/09/24 09:15, Macpaul Lin ha scritto:
> During inspecting dtbs_check errors, we found the power domain
> setting of DPI node "dp_intf0" is missing. Add power domain setting
> to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"
> 
> Signed-off-by: Tommy Chen <tommytl.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

You missed a Suggested-by tag here :-)

after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



