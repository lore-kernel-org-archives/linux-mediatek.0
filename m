Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D953FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2DBC61165
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2DBC61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/X8YRwfSH/VXOG9wqj/M0IS2/3zs6sIXtx1lZPHKjQ=; b=CR8JtV2k01MLjH4zwkkTI55K+9
	nwNen5r3h4xVU/gJ/USIERJTLKiuD/OABzvbOOehVwdnih/vrl1aWebODeXYWR69m/aRJqIoFp50z
	KKktaPPnFQk5apM6rbMgAnEw42Ypcc9xw4pPupO6KDfFN3XQj03XP/xp2WOfTLuIN4ocX3QZ3nhoO
	WhtT+w3uwzVnVjsKq7Ord4BqTmbIrqzWVYFbwnxmePinD6wele4P5r7Z4f4rDhFa233RafQ27sJtu
	X8mH9vjBtwZ4/GzcNsrfaj2PkWIek/hI2//sHqPsWTD2DxIsSBx92/XRHJLrJ0mu9gMVcV+aEYbC0
	o7ypdhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYN0-003io7-10; Tue, 24 Aug 2021 15:29:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYMj-003iga-3p; Tue, 24 Aug 2021 15:29:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E66561265;
 Tue, 24 Aug 2021 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629818968;
 bh=6+biN29D5WoAzfO9BDov2cPTbiGldallkUXFPOK88js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbXQuqv9UCGWSbmnuGM2/SP4M86QwDXHD/0D0Ely67U4o2yVP56OBp6jRRMlh1oSF
 5veYNBtnUJ3pXEHicLmMF6V/a9iOwysLhlt/vsqQUdHtlgwaAorueBnqOszTuJSabv
 TsEt6GGwl8QO6aCvLpqHWBQUw6JqRhg75NNX81YzwXOx0HUEZje9xsvcaExeSvMI1Q
 omsbDbz5VS00VWVaLSIgWWbzeK3lBiYYH22ewdgCCICvGcvsvui8HzCvkjo9B8XdgL
 WVVI1RDoxyNZJwEMsnopBguQZG1QXEfa/8eYw9wpje9g2LWHi/mRztpi9Xb943SZLm
 ISBlKzlij56ew==
Date: Tue, 24 Aug 2021 11:29:27 -0400
From: Sasha Levin <sashal@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: stable@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
Message-ID: <YSUQV3jhfbhbf5Ct@sashalap>
References: <20210824055509.1316124-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824055509.1316124-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_082929_202902_9CD89356 
X-CRM114-Status: UNSURE (   7.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 24, 2021 at 01:55:08PM +0800, DENG Qingfang wrote:
>This is a partial backport of commit 5a30833b9a16f8d1aa15de06636f9317ca51f9df
>("net: dsa: mt7530: support MDB and bridge flag operations") upstream.
>
>Make sure that the standalone ports start up with learning disabled.

What's the reasoning behind:

1. Backporting this patch?
2. A partial backport of this patch?

-- 
Thanks,
Sasha

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
