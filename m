Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 03:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1kvmy5iCQW0wSAhMPI65TH7yIYuF4EJmv2hJ5D+GtA=; b=jyqsqSCuNzSQOu
	Dsuv/8yUpMHq87RjIyC7r3Nt+CWfPJaQs617PH5KWor1ymoKRcOPbnRYHo22tcmqyIOTiLKpyNhRR
	A1aj6KTR4KiNRroxy/csplQpNgsTIYp1whEYxbYpFOkU/O0Ffo1WBy+fj91SZ0VvoFKF7LkMwfkoD
	aOckT1P6gnqn/h9XFEkr1wso8IPvwsfyetybuCPH3M3Scx6rSKf790tHhtpzgReIqUP3swjVUmuXV
	PY4hfBb17FOfnOwWyoAHC5QQx0rn4D1/3Dmrp9+TZiQv7FJM2tvs2nhUd+M7eKE/7h+UNmvv8UYBT
	vrkowj0vh0ba/3rvWjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSWPn-00EwFQ-Jm; Fri, 11 Mar 2022 03:58:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSWPb-00EwCw-O1; Fri, 11 Mar 2022 03:57:57 +0000
X-UUID: b2c5c2f200594fa2a13d79e45d2d66b3-20220310
X-UUID: b2c5c2f200594fa2a13d79e45d2d66b3-20220310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1280316035; Thu, 10 Mar 2022 20:57:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 19:57:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Mar 2022 11:57:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Mar 2022 11:57:47 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <chun-jie.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <drinkcat@chromium.org>, <eballetbo@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v1] soc: mediatek: pm-domains: Fix the power glitch issue
Date: Fri, 11 Mar 2022 11:57:47 +0800
Message-ID: <20220311035747.20551-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3a55f44998645308bb1b4fd65ef550682ebe6ba0.camel@mediatek.com>
References: <3a55f44998645308bb1b4fd65ef550682ebe6ba0.camel@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_195755_805014_F2DD12C5 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi Chun-Jie,

> Hi Miles,
> 
> This control sequence is suggested by hardware designer,
> and when PWR_RST_B from 0 -> 1, it will trigger to exit from reset
> state to running state, if we still enable isolation then can't start
> running normally, so we need to disable isolation first in power on
> sequence.
>

Thanks for your explanation.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
