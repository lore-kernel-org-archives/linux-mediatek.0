Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DBCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENP6EZgTmEPxyrNKQ5/f8JqAzUL3tSYed4vAPBNLoSw=; b=2nItFITr5gCLhg
	AGcS16XGWaXEGgpmBd5OW5VSeuOxDEDibA/plLztqqclupRnf4Gqf+kXBKdToh0nvz3RtHreAF/et
	yytOSpQq6Uy6spvV0AGNjxN9wskEAc4v9mvtYTVrVZPkcqXpUaqsF/lDEgxNdo1t4Gl8m1Z1Y6NgT
	XmYKASEh8vX0NCJGzOkYP/przob2l5wdY7HdHOZrg3lyWuzSB+uKFnAOj30L7bgfUiYNc15pfUhwp
	qPujMAYkRwI0CH8kej6eZVY0LqWjOeE/X7Y9LHGUdt7dKFO588cVIqKzs37HdpNN6pa8ORvrZdLob
	dfj7cHZ2dGXBOQCgn8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHM4-006TlS-Fb; Wed, 16 Feb 2022 10:16:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHLq-006The-0e; Wed, 16 Feb 2022 10:15:59 +0000
X-UUID: f5849736b08049b59bd7f8eebeabbb33-20220216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XdYC62n2wE1hvQc1MbLBioQmkPbEHK51Tlk338ECURQ=; 
 b=mKsm33CMPfWllElz/Q7Psw9B5zZ1WSn5dFic55WV/twvW1Yp4WgmikOeox7MfjqqPOPIE6/Kc0SKmglzEVoAMcwDJ5h5XTGVYxJ627s3rc8GWkswkUdsEy/N/DC0VCZXQniGVrBRldgRWyaW30FzWw9+1oVKJh+kNVfGK+WFqVQ=;
X-UUID: f5849736b08049b59bd7f8eebeabbb33-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1197776456; Wed, 16 Feb 2022 03:15:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 02:15:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 18:15:52 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 18:15:51 +0800
Message-ID: <e8ff95d6c86d28fe5d14ad85a03334cb39a32669.camel@mediatek.com>
Subject: Re: [v2,0/4] Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <allen-kh.cheng@mediatek.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Wed, 16 Feb 2022 18:16:01 +0800
In-Reply-To: <7d54ecb2-bb7a-ab3d-9e29-fa2541ec549d@mediatek.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <7d54ecb2-bb7a-ab3d-9e29-fa2541ec549d@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_021558_095010_DE471E2A 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, 2022-02-16 at 17:47 +0800, Macpaul Lin wrote:
> 
> On 2/16/22 5:32 PM, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > 
> > Changes since v1:
> > 1. Fixed formatting issues mentioned in the v1.
> > 2. Delete pwm-mtk-disp.txt.
> > 3. Add mtk_pwm dt_maintainers.
> > 4. Add "#pwm-cells" & power-domains properties.
> > 5. Make dt_checking successful.
> > 
> > Xinlei Lee (4):
> >    dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-
> > disp.yaml
> >      format
> >    dt-bindings: pwm: Add compatible for MediaTek MT8192
> >    dt-bindings: pwm: Add compatible for MediaTek MT8195
> >    dt-bindings: pwm: Add compatible for MediaTek MT8186
> > 
> >   .../bindings/pwm/mediatek,pwm-disp.yaml       | 74
> > +++++++++++++++++++
> >   .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -----------
> >   2 files changed, 74 insertions(+), 44 deletions(-)
> >   create mode 100755
> > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > disp.txt
> > 
> 
> Why did you drop [PATCH] tag in the subject of your patch series?
> Please keep it for distinguishing it from RFC/RESEND and other 
> meaningful tags next time.
> 
> Thanks
> Macpaul Lin

Hi Macpaul Lin:

Thanks for your review, maybe the processing of the [PATCH] tag was
inaccurate before. 
I confirmed with my colleagues that I will keep this tag in the next
version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
