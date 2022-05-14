Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A586BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljdShuYalOrnCliAovZGpxDwYYdWFcdF6eiTsDwFaKo=; b=Q6UC5Q8Z5TT4PF
	DTIt7tCN8iszKr+HN45S3Ic6zsaEGaggzgKZ1eVHPVrTacXuc7SYV7EkG45x3Oc+8GF0W3SjJYMi1
	Kx7jYsd3FRG98xA4lGxTEzaWq0ZjPW/DuX2O5EUZMaX/fSOlrjUsr7F7s8rZxu8/7aq1YpJ5virV2
	IGhgo3LOe26vW6PJamShS7ukHpxmBeaxWPVwGnMsLOopmocvimfvP8jzXXpn6PxlC5zUhPvKO+rxO
	rFelEwbP/bIe20olC/iVkZz2Bx5AsIHghYIJdz96ssrpNu2JMLRThlBkacDELR8KNWapwHPLDSAcX
	fs+tqqOmq8C4bWjVS5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npuzr-001rTc-KL; Sat, 14 May 2022 16:52:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npuzg-001rRV-O6; Sat, 14 May 2022 16:51:54 +0000
X-UUID: 6f3190a2442e4197b90bf77293a612b3-20220514
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:708c4bf1-f09d-4ce6-a517-9a61931f86d7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:df564da7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 6f3190a2442e4197b90bf77293a612b3-20220514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 726956780; Sat, 14 May 2022 09:51:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 May 2022 09:51:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 15 May 2022 00:51:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 15 May 2022 00:51:42 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/11] clk: mediatek: mt27xx: Replace 'struct clk' with
 'struct clk_hw'
Date: Sun, 15 May 2022 00:51:42 +0800
Message-ID: <20220514165142.20607-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAGXv+5Fipb2Sjypv8ayRbHqNfiLxtaFXatM-vMRtX2UNFzZ-3g@mail.gmail.com>
References: <CAGXv+5Fipb2Sjypv8ayRbHqNfiLxtaFXatM-vMRtX2UNFzZ-3g@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_095152_827277_926C4D98 
X-CRM114-Status: GOOD (  10.24  )
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

Hi ChenYu,

> As mentioned in the cover letter, the patch is split between the manually
> edited parts and the coccinelle converted parts. This should help with
> review, especially trying to identify which part of the coccinelle scripts
> failed. The split also reduces the size of each patch so that they don't
> get blocked.
> 
> I opted not to add additional APIs, as we would just be removing them at
> the end, and that just results in even more code churn.
> 
> 
> ChenYu

ok, I re-read the cover letter, I will ignore the bisect part and do review
and test.

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
