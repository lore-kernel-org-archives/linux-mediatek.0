Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F44C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 02:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiPwVaVzo5GR9ksv0pLwQnIUMYDpzHvmbmDsANDIXJc=; b=djGOljf6NJu4zE
	zRF8JNctOWiJ6SzAOzcvuCus2tKBZbDPn3oldm5rzJHgNFoj2qPTI8p8Xv5jlxSPqPfwPw5pLShZb
	94cUOa5ymTF6z4iiKhOxqI6LsAvnCs+DSt5AY4giS10Yf5Ak2B8auQyKActfjvMSQnRSIVoM5tB/Z
	022qFJcKM4Gvxt3tZwm/rMiWdySof8Jxt/gcGKEAnaJCVnqFFElE3stHEMuHikfg09NSlIJ59BuXX
	V1m9F+Ec6jRrHL6Yu2xq1RqStqLPK8fmm0chmrGhBRsBuWWPXWNveMImezAAdivNJ8h6ogX6AqYBW
	LpCbR5SWwUcvfxRmiD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neSeI-00GN6W-TV; Wed, 13 Apr 2022 02:22:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neSe7-00GN4I-P4; Wed, 13 Apr 2022 02:22:17 +0000
X-UUID: 0513becf4d804297974276d42d19e2d6-20220412
X-UUID: 0513becf4d804297974276d42d19e2d6-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735895823; Tue, 12 Apr 2022 19:22:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 19:16:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 13 Apr 2022 10:16:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 10:16:50 +0800
Message-ID: <25f9b550e2a179db63aff2639f7a140633dd5b17.camel@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mt7986: add built-in Wi-Fi device nodes
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Ryder Lee <ryder.Lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Wed, 13 Apr 2022 10:16:50 +0800
In-Reply-To: <20220221020708.12724-1-chui-hao.chiu@mediatek.com>
References: <20220221020708.12724-1-chui-hao.chiu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_192215_845134_FF2E4F26 
X-CRM114-Status: GOOD (  12.81  )
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

On Mon, 2022-02-21 at 10:07 +0800, Peter Chiu wrote:
> This enables built-in 802.11ax Wi-Fi support.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
> This patch depends on below patchs
> 1) https://patchwork.kernel.org/patch/12704208/
> 2) https://patchwork.kernel.org/patch/12704207/
> 3) https://patchwork.kernel.org/patch/12739683/
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 41
> +++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 19 +++++++++
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 43
> ++++++++++++++++++++
>  3 files changed, 103 insertions(+)
> 

Hello, just a gentle ping.

Best regards,
Peter Chiu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
