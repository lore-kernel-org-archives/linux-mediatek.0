Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7554AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyJtb9xmmK8tTXJGT9phjC27YLFVp9m9lPuT6vLXDaw=; b=igZ1BNL6NVArdz
	HgaaKg57UY8RQo7CzoXcg+3OOU5jFfFToAx1K99hh014psWCuv2E88zb2wNaOUth0rehC2mPXE3WN
	AVR4YiPPIHzIAEa9+/Qqc9trpRx8suzC4VvnHpmsW0EtF3cfS1jXuy19fwH/EAQVA2+UL4f0Ha9Ld
	dVbd0XFJf2cXjxczs9XRLzkhO87jtM5T3/LHb1ZrGydbk4OtuOTuUMdpGxvVZ1i0gjx1JFprwqRdo
	qpavQr9GooLjWoYTJyywAOvhKI2CmlWm7jP1FSzg0LcyrCgUf66zpBshszMFo6QtGJiksVHJ3OhWR
	+yscbZDl8qwknATUUaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrufl-00AWHQ-JU; Fri, 20 May 2022 04:55:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrufg-00AWFa-Jc; Fri, 20 May 2022 04:55:32 +0000
X-UUID: a67f7b16eb2d4e4ebb71f56cc202d632-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:be1d970d-35dd-4b72-9a82-28802d24f1dc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:a453f579-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: a67f7b16eb2d4e4ebb71f56cc202d632-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 842192924; Thu, 19 May 2022 21:55:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 21:54:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 12:54:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 12:54:43 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <bgolaszewski@baylibre.com>, <chun-jie.chen@mediatek.com>,
 <ck.hu@mediatek.com>, <devicetree@vger.kernel.org>, <fparent@baylibre.com>,
 <ikjn@chromium.org>, <jason-jh.lin@mediatek.com>, <kernel@collabora.com>,
 <konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <p.zabel@pengutronix.de>,
 <paul.bouchara@somainline.org>, <phone-devel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <sam.shih@mediatek.com>,
 <sboyd@kernel.org>, <tinghan.shen@mediatek.com>, <weiyi.lu@mediatek.com>,
 <wenst@chromium.org>, <y.oudjana@protonmail.com>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 7/7] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
Date: Fri, 20 May 2022 12:54:38 +0800
Message-ID: <20220520045438.25661-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a253f338-c162-17b8-f412-95cd63195151@collabora.com>
References: <a253f338-c162-17b8-f412-95cd63195151@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_215528_681068_3AC2E054 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

>For MT8195... and 92, 83, 73... and others from the same era, being them for
>chromebooks, iot, smartphones and whatever else... yeah you're totally right.
>
>The issue starts raising when looking at older SoCs featuring an older bootloader
>that does have a kernel size limitation; for example, to make the loader happy on
>MT6795, I had to strip the defconfig a lot and keep the Android-style boot.img
>smaller than 10MB (that's Image.gz-dtb + ramdisk).

I think you have the point :-)
I did not consider the older SoCs case you mentioned and there is a real 10MB limit.
I'm fine with this.

ChenYu, What do you think?

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
