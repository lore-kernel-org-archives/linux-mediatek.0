Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmqNqXczW0jP4mweEewN+WoWcv/Ku0dwH+JpsIGO7SQ=; b=1RT38twAjbpQqD
	RbYOz8LxpU+Q19hyps59HX1UcOjR8R0yU8RIMI9mp/xiNM9nlSuSNL/Mp2YzKQ38TsimCrtTIOHkp
	5fDCcndBK/u+hDkHGrifqa45kzjPLr+aADmrA7gsJao7VxmALbW8dj78bRgcBoMxsm6OlnJZ5ljbG
	VsBaiTOV375cAyHL/KKP0mAJIev3q+BD4ukgA2VaaT7MSHzkELtw158EeKXNk5Kpf+LY9RrH/cQX9
	BckLdbkMI7x4anpGBgJNdPokCKRGl4pq9Xz2CNO1LQJ0BwWimtZWfHmPYNgFW/E+/WVjYfrvuhxRh
	4m6s/AnJElpxB719Bapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqu7b-00CwHq-0L; Tue, 17 May 2022 10:08:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqu7P-00CwFK-UK; Tue, 17 May 2022 10:07:57 +0000
X-UUID: 8a9589b10cbf43ae8c36c098eec4aad8-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:30c45d0a-6afc-40df-bb04-41407843cd62, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:10a88c79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 8a9589b10cbf43ae8c36c098eec4aad8-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 942570753; Tue, 17 May 2022 03:07:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 03:02:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 17 May 2022 18:02:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 May 2022 18:02:07 +0800
Message-ID: <eab324a190c47cd139c243d1034fa44aa51f9377.camel@mediatek.com>
Subject: Re: [PATCH v6 00/10] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>, <hsinyi@google.com>,
 <khilman@baylibre.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 17 May 2022 18:02:07 +0800
In-Reply-To: <dde746ce-5663-e12f-4537-4206945b6b59@gmail.com>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
 <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
 <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
 <af82434adea0b648d74ed5ffd123e0faaaac6508.camel@mediatek.com>
 <20220512054825.aqe4g4lupuqj3rcq@vireshk-i7>
 <ca85977bcff2e3de925d7ab834b8654ec5ddf8c1.camel@mediatek.com>
 <dde746ce-5663-e12f-4537-4206945b6b59@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_030756_013093_B8400FB3 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, 2022-05-17 at 11:57 +0200, Matthias Brugger wrote:
> 
> On 12/05/2022 08:05, Rex-BC Chen wrote:
> > On Thu, 2022-05-12 at 11:18 +0530, Viresh Kumar wrote:
> > > On 12-05-22, 13:33, Rex-BC Chen wrote:
> > > > Matthias is not the member of mediatek, so I think we still
> > > > need
> > > > his
> > > > feedback for these three patches.
> > > 
> > > Please ping him and ask for his feedback then.
> > > 
> > 
> > ok, I will do this.
> > Thanks!
> > 
> 
> Sorry for the late reply. I'll take the DTS patches through my tree.
> As I'm late 
> to the game this will be for v5.20.
> 
> Regards,
> Matthias

Hello Matthias,

Thanks for you reply,
I send another version for this series.
Please refer to this:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=641933

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
