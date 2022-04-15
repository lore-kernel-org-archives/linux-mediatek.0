Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5X2Rg1jtEOocWvrLgA+ZBImQhYgLE0N4EhATWGkJQQ=; b=1t4AOYdY+bFkzE
	6c5RXzADOKGe/ed407inOZ7CKlmeMfQswPgo8VlQu7pCU5kj0BvPaKPq06SIZx+8SmsASf1W3Uv6K
	Q7X7acog4+o/2twQF9KZsaJJCbPCMZJ05m5fQ2AwOXnMPBHwg08MpJ2TVkbZcwIa6HyARjB/6Hfxz
	jXt1Y2BfRI73U62ExCDWPgGXa4tQTr6rkncp1JBEPXKasxrXmd8B0xmQKgZr72lfdagq3Ygpob3Se
	XF4m409o6LAMfoeEKTWheij64X5JgjQAkIZdvXaTZ0eq8w/B2Ktdv+A4deUgeEOteIM6mFa5GKkx+
	7JMBDbgT6qnv/0FtA8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFRC-008zTB-3n; Fri, 15 Apr 2022 06:28:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFEG-008v6F-RJ; Fri, 15 Apr 2022 06:14:53 +0000
X-UUID: 7dcb9392fef844839a32442056f7ba0f-20220414
X-UUID: 7dcb9392fef844839a32442056f7ba0f-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 151100220; Thu, 14 Apr 2022 23:14:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 23:12:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 14:12:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 14:12:53 +0800
Message-ID: <e40e760a4674dd0562c46f285c2193c26f52fb41.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: allow reading
 firmware-name from DT
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Ohad Ben-Cohen
 <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>
Date: Fri, 15 Apr 2022 14:12:53 +0800
In-Reply-To: <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
References: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
 <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231448_930965_52AB4BB5 
X-CRM114-Status: GOOD (  11.16  )
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

On Thu, 2022-04-14 at 20:21 +0800, Allen-KH Cheng wrote:
> The SCP firmware blob differs between platforms and SoCs. We add
> support in the SCP driver for reading the path of firmware file from
> DT in order to allow these files to live in a generic file system
> (or linux-firmware).
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
