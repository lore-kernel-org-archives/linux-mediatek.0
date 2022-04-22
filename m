Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE318C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5Ld5mJCpJam+2NHdEs1nIuh5LESKrX6bnLBSJqJlWU=; b=RTmnFdgMoQvwgr
	GIRmi4IsmePDll/ykAfz1LBFBNRvEw/0aXx2B71XxsRhZ75lgqRDGPo51lufom/PmAwFUZ2BrG5cp
	kA4FMp0ScuZ6t7K2q2fHaec/JUjvaebQLBKrGkYW10c90QAAy62CJjKfb0NRPWp7tRSicAnSLefHh
	JJ1QwQTPC5YmrgXYvsMjSwiyqrsFRoMsn0iW5nKPM4h0j0NkKp1BttfcQI5qjIg05DBwQPUk3j0cU
	tMAlwTogSe+eZcYTZo/W5snVGs/IWwrGO3qtLKhb/qmlh6WmZ2OPlSijc47OApcw45J+gMto2/naI
	dpSuBXG1PrmzM9JAltUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhjUz-00FpxW-8r; Fri, 22 Apr 2022 02:58:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhjUn-00Fptb-38; Fri, 22 Apr 2022 02:58:10 +0000
X-UUID: b0d89e9583ba415e9fd28e15208cd0b4-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1ddd5e76-863b-4a2d-9da7-160b33b58682, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:9c628cf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b0d89e9583ba415e9fd28e15208cd0b4-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1143381695; Thu, 21 Apr 2022 19:58:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:53:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Apr 2022 10:53:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 10:53:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <perex@perex.cz>,
 <rdunlap@infradead.org>, <tiwai@suse.com>
Subject: Re: [PATCH -next V2] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Date: Fri, 22 Apr 2022 10:53:12 +0800
Message-ID: <20220422025312.7718-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <s5ha6cm4xy2.wl-tiwai@suse.de>
References: <s5ha6cm4xy2.wl-tiwai@suse.de>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_195809_180260_F2E720F2 
X-CRM114-Status: UNSURE (   7.89  )
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

Hi Taksshi,

>> We observed: 'dmasound_setup' defined but not used error with
>> COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.
>> 
>> Fix it by adding __maybe_unused to dmasound_setup.
>> 
>> Error(s):
>> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]
>> 
>> Fixes: 9dd7c46346ca ("sound/oss/dmasound: fix build when drivers are mixed =y/=m")
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>> Cc: Takashi Iwai <tiwai@suse.com>
>
>Thanks, applied.

This patch is needed in 5.18-rc3 [1] too, should I submit another patch or
you can pick it to the mainstream?

[1] https://lore.kernel.org/lkml/alpine.DEB.2.22.394.2204190925230.302265@ramsan.of.borg/

thanks,
Miles
>
>
>Takashi


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
