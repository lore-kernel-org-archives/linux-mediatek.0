Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOwK+yN5oVFEXfveva9RnO68O9wQnv8NuIljP2EunNo=; b=X+wyz34NijBQ8y
	JM9VbVa0D0e75/JmZaUuPX+HP/pI+pdJ98zvsA0WRpxzrxXg9+YQI8TcHbsKEOAqp+gSxddf8KFDR
	Qyiy5C9tyIO9hp3r8z/W0BbgwZ835PxuuWxw4iq2dsPpviBEd/RA5KBWc/EuJi7kgQGDQyWeqcYZE
	zLeZ/SnTrTDQrQb0GnAsga60OuPaj3s4Hp6EjkzhG/ky0NL6Q7lbkkCeF58GiwdqCelUySu0vR4WW
	1mXwq647onldmuxEthW5v/fJCAVk7/X9H174bMH3O4wr03uf8nB3y3KsGRDOiGikX+Mwd83Fefywa
	zoQTLYmvYreJ28DIc3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMOGH-0086qa-92; Tue, 22 Feb 2022 06:02:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMOG4-0086p0-Jr; Tue, 22 Feb 2022 06:02:47 +0000
X-UUID: b6dbddc305fc4d53835ff6d2095e212a-20220221
X-UUID: b6dbddc305fc4d53835ff6d2095e212a-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1251827897; Mon, 21 Feb 2022 23:02:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 21:55:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Feb 2022 13:55:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Feb 2022 13:55:39 +0800
Message-ID: <2f60ffa5f27a1afddce83b25b5b5b09a0c87bef8.camel@mediatek.com>
Subject: Re: [PATCH v2 09/23] arm64: dts: mt8192: Add infracfg_rst node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Tue, 22 Feb 2022 13:55:39 +0800
In-Reply-To: <d4e27af2-0f64-9c7f-489d-0f7dfcdd9ee5@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
 <c84ec638-3134-fc1c-4761-7f1ec8381a39@collabora.com>
 <8a3a6167450bdd51bdff2e9b12a15522a18dd38e.camel@mediatek.com>
 <d4e27af2-0f64-9c7f-489d-0f7dfcdd9ee5@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_220245_022956_4FBEAC27 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, 2022-02-21 at 16:20 +0100, AngeloGioacchino Del Regno wrote:
> Il 21/02/22 14:05, allen-kh.cheng ha scritto:
> > On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > > > add infracfg_rst node for mt8192 SoC.
> > > > 
> > > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > 
> > > For v3, please mention that you're adding simple-mfd to allow
> > > probing
> > > the
> > > ti,syscon-reset node.
> > > 
> > > After the commit description fix:
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > 
> > 
> > Hi Angelo,
> > 
> > Thanks for reminding, I will update commit message.
> > 
> > Do I need to also change the commit title ?
> > 
> > Best regards,
> > Allen
> > 
> 
> Hi Allen,
> 
> Please update only the description; the title is fine.
> 
> Thank you,
> Angelo

Hi Angelo,

Ok, No problem.

Many thanks,
Allen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
