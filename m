Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3CC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 02:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+jij6rP5UZ59u1I5lN0gCJQwmvORQQf/bMnAxyJg10=; b=Ms+eizxC85FG5/RrQloRRzhZ3Y
	4wnXL9M4ClmEMysCoY7QTB0+VXrPzH/hXU0K3h9f+xSKzGROpZTlogGUOv0pIR1O8CoUZj/yHf6rW
	es5hxfTihxjcNctqZoxJkYauiFEICo4TTNjSfPcNNasKM/OYVgfj66a1AWIKEiIFu/YyqbKwdn2FX
	TA32Evf9RjQpOr2BG821snvF3T/rXxGdCfgb79pcM2pALK+uJpOUb/IGBGb82crVjr9sGUGFFNPyT
	niRe3ZUPUgagOmYhmgnRpbB6yusxKX0UjoqbVOT/BfhN83UrO/C2ur+bQnmZmkM+uXv0rh15HnDF1
	5RJOiOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrTw-00E7Yk-QY; Fri, 19 Aug 2022 02:11:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrTd-00E7AV-0h; Fri, 19 Aug 2022 02:11:15 +0000
X-UUID: fbb1f3dba161424e9763a427fbce21dc-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=j+jij6rP5UZ59u1I5lN0gCJQwmvORQQf/bMnAxyJg10=;
	b=QnM/kQ/YAsT1q6oq13kg3f6ecCJXwgmYNkZVP6866nq4aboQe00Ubtaz1bQtpUxnRAMVRE85hfLE3ko3hedGeTTMxkiNv88LqmYLRtg+EMTiPH5BUTOGJaSvc2C6YtwsdrvVjsjVzOkKzrZ5CHfbfz0x+BvIngjUhAYwym4Em1Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:fbbad9bf-dd4b-45e5-bdd3-e372b21595be,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:0d633eaf-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fbb1f3dba161424e9763a427fbce21dc-20220818
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998139947; Thu, 18 Aug 2022 19:07:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 10:06:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 10:06:48 +0800
Message-ID: <b047015e91b261ffd5ff48cf076c4335b4765084.camel@mediatek.com>
Subject: Re: [PATCH v25 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 19 Aug 2022 10:06:48 +0800
In-Reply-To: <20220818204231.zvq6tipjyzen33oi@notapiano>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
	 <20220804072827.22383-2-nancy.lin@mediatek.com>
	 <20220818204231.zvq6tipjyzen33oi@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_191113_104149_EC370CA4 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Nicolas,

Thanks for the review.


On Thu, 2022-08-18 at 16:42 -0400, Nícolas F. R. A. Prado wrote:
> Hi Nancy,
> 
> On Thu, Aug 04, 2022 at 03:28:21PM +0800, Nancy.Lin wrote:
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno
> >  <angelogioacchino.delregno@collabora.com>
> 
> Some line-wrapping happened to your patch when sending, so it's
> corrupted and
> won't apply:
> 
> 	$ b4 am 
> https://lore.kernel.org/all/20220804072827.22383-1-nancy.lin@mediatek.com/
> 	$ git am
> ./v25_20220804_nancy_lin_add_mediatek_soc_drm_vdosys1_support_for_mt8
> 195.mbx
> 	Applying: dt-bindings: mediatek: add ethdr definition for
> mt8195
> 	error: corrupt patch at line 228
> 
> Fix whatever causes this in your setup and re-send. Tinghan also had
> this issue
> recently [1].
> 
> [1] 
> https://lore.kernel.org/all/96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org/
> 
> Thanks,
> Nícolas


The email issue was fixed recently, I will resend patches soon.

Thanks,
Nancy



