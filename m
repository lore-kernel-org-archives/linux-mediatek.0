Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20915C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0IpBLOTMjKeGaQGcmkbpFCRRwvtPIs5kTPS/DUjNjU=; b=CI9AjoRAHGKR4B
	bX7wp3A8vR93WvdbVBrF/i/CStHFXz3j8r6GcPoVnq7M0F44D5ZdJ8PkWwxVk2fUA2jhbi2MNozzA
	5R2R8cx1Rt0qcOf99KIfRWODrY6G2HQ9QFcbdxQ3haA5b3pS38G5GE/ix/g5q13LUSDr0WqJwUc9/
	Bjg6B8CF/MLWGhb12GhJx8ttwp38BY1BPNy7GQk4Fc9h0/65PnXJtt7cmARDGuvlXPY9YsyrDxVy2
	TnbHSq3CIpQDEL564F14jGiTCIFKcf/lCxuNf8+BrMYyiD2WVFDcHMo7d+67vHlPZ7F/Fv/dqbjOG
	OIii0RMdAuFVibphDP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njUAZ-00Gah1-V6; Tue, 26 Apr 2022 23:00:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njUAW-00Gag8-Bb; Tue, 26 Apr 2022 23:00:31 +0000
X-UUID: 89f40dc6fe5848aa86857bea370ce247-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:59604ae0-5e9c-407c-879e-674ae5ec69cb, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f974cb2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 89f40dc6fe5848aa86857bea370ce247-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 31042960; Tue, 26 Apr 2022 16:00:21 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 16:00:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 07:00:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 07:00:16 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <allen-kh.cheng@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add compatible for Mediatek
 MT8186
Date: Wed, 27 Apr 2022 07:00:16 +0800
Message-ID: <20220426230017.20640-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220426125046.17311-2-allen-kh.cheng@mediatek.com>
References: <20220426125046.17311-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_160028_437474_308D72C3 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

> This commit adds dt-binding documentation for the Mediatek MT8186

s/Mediatek/MediaTek/


thanks,
Miles

> reference board.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 4a2bd9759c47..5a29b7b381ef 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -131,6 +131,10 @@ properties:
>            - enum:
>                - mediatek,mt8183-evb
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-evb
> +          - const: mediatek,mt8186
>        - items:
>            - enum:
>                - mediatek,mt8192-evb

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
