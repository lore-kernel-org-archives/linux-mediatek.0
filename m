Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7181C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 08:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 613F861040
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 08:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 613F861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ardz09miLf1jtEb11UYFVt8uTVcCAbvzmpiTQ7JRhkc=; b=EriCnqAbsU4mr0
	mIRiqlkBcziNL2rremlwEbt9/Bg3XK/hzWmpzdvy3OAz4myCzy58CWYbjUMKnAoUNxgPjmW/Bq74j
	E9bgup8m8ZkTpOUjqGV588rUbngYaAxWnhQB1BRQSJxRhp9hW+OX53XWQvaiqjy9nvyIHYBaoazgq
	B3i8Khps9aNmfkYSgi7DNRLSzBxF1e5Gp/BcuXwVhmw6DSwbvc3L5BSXywaj/f3/lfh/4utOXs2w1
	MNjFGd8e57heLyavsFY2X7/SMqWWX9+OJD4Bg8c0wkJYYbYoOveGJ2GvngPKENFtbqGquK3wTs925
	xn9zYBjc94r8ZG0RAd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBYIy-008YB9-By; Thu, 05 Aug 2021 08:00:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBYIv-008Y52-SI; Thu, 05 Aug 2021 08:00:39 +0000
X-UUID: fec91911fe13437ab1d5dc1e0ce73d1a-20210805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6g+G19yOBM7NMq+Lhft2E2pkIHoHbfTNbAIluvK7rfM=; 
 b=gXG+4riHIK7Uzj7Ikt5KHfOAkHad5e+a9t64dY6AOwRbx6nC+bfY3x3Fk5rOqJS7+Tg0/uXgTIv3VwJ+2jM/DPzW6LrLKHgPcX3leV/OrCQyVjR+NpKBnKL4ucKUpk/shYrgYig4GBJULAB3iitQ1WwWlrlMcIvyM8ZAVZqf5fo=;
X-UUID: fec91911fe13437ab1d5dc1e0ce73d1a-20210805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 11768871; Thu, 05 Aug 2021 01:00:31 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 00:54:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 15:54:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Aug 2021 15:54:05 +0800
From: <chihhao.chen@mediatek.com>
To: <geraldogabriel@gmail.com>
CC: <alsa-devel@alsa-project.org>, <chihhao.chen@mediatek.com>,
 <damien@zamaudio.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <tiwai@suse.com>, <tiwai@suse.de>,
 <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
Date: Thu, 5 Aug 2021 15:54:01 +0800
Message-ID: <20210805075401.21170-1-chihhao.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_010037_975761_ACCB2242 
X-CRM114-Status: UNSURE (   6.43  )
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

From: chihhao chen <chihhao.chen@mediatek.com>

Hi Geraldo Nascimento,

For echo test, it means we use this earphone to receive and play sounds at the same time.
We found in this case serious noise problem happens.

Log as follows with your patch
<6>[  175.960387][T401365] __uac_clock_find_source: Clock Selector 0xc has pin 2 selected
<6>[  175.966980][T401365] __uac_clock_find_source: Clock Selector 0xb has pin 2 selected
<6>[  176.026251][T400354] __uac_clock_find_source: Clock Selector 0xc has pin 1 selected
<6>[  176.032406][T400354] __uac_clock_find_source: Clock Selector 0xb has pin 1 selected

There is no noise and I think this should be a firmware bug.

Thanks
Chihhao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
