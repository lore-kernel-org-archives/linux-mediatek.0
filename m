Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DC5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 19:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6F76103E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 19:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E6F76103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MAedwM9e/1WLd2sEwCL2JmPUu9J8Pn666kkGfqN6oc=; b=wq4tmj3JQ5loyFT2xNHVX5ugTx
	TeIV3cA43quAu0fcGa6pIupbGbtjIoPNsMn2hNiwT3w/KuCqabvnPULEzEdYhoKSOfBRqC3u9m59T
	YA57y1+dqijWD0bXaCV3YFkr5yWS6d+No/yD4fx9RwAFGwIweZIQe4sXGzhZt6mFj80ZIqo1yF9xC
	g7Suv6qDGSxvDesDxP+kcHLpq1zh6PnE4FlcQBTsTaMXyvo0PIn7LbFeFffMnxxFeiriRVY0SJF/N
	+EiAHGL7hcH0tM79Nqk3te5CfhUc+ZBvE+YDMof+UerKlLgfSOyPNEow5rp1SClbxVG0nAaMHXp5i
	hnMPc5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXphd-00BcAL-NA; Tue, 05 Oct 2021 19:02:13 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXphb-00Bc9c-31
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 19:02:12 +0000
Received: by mail-pg1-f169.google.com with SMTP id r201so241333pgr.4
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Oct 2021 12:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aIANqcVrIntmfysP+bq7J22LCcoMMLlhyf8xbm7ALS0=;
 b=qsOqiLOcX89LjTevN0jIw4COZm/uknw0oVwa1cD20NxhWjoJKWuPye44YLJhDimRbq
 R1RfElqqwY62VAmM+5h0WDVQoodvROS1oAgjKO2EvUk3ghbpDim4N8oG477YKCYiJwnE
 DK+6DC0KAE7nHhPu/J94Np6ZGUOBzsOomqM2sJQ9+I8h3QrAXPzuU2aqXBKYnzRy6eW1
 XtcR8r/I/JIF+aVjl3ON8nocZ1g9fsq19oQ7uw6/HeY9zJ0nKnJLIqq/KgMjGGa3gQPm
 aNHx4ECWPPlOiDNf1eoYC0Rw8KagxAXeeSYyLGiBNuXEIlCRyg1oKOA1yBuLSZPEjvOX
 HOcw==
X-Gm-Message-State: AOAM533P0/GBCeH7Bknc68J8EsDUNZ/npN/dkTNO1Sxffm6wGEumWU2X
 gK+VWkyPgsODQlabl7/cYvc=
X-Google-Smtp-Source: ABdhPJzeILe4dVQU1m/ZcIDL0f+Bj128PBhnF2fipPPYcbkEFKTi3aUw/pjqp8vvProeVyHj0KItog==
X-Received: by 2002:a63:e651:: with SMTP id p17mr12254202pgj.66.1633460524889; 
 Tue, 05 Oct 2021 12:02:04 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:e8fc:af57:dd49:3964])
 by smtp.gmail.com with ESMTPSA id g22sm22195183pfj.15.2021.10.05.12.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:02:04 -0700 (PDT)
Subject: Re: scsi: ufs: support vops pre suspend for mediatek to disable
 auto-hibern8
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 mikebi@micron.com
References: <20211005132738.14820-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <e8f8cb97-c681-0fca-56f0-30c442264761@acm.org>
Date: Tue, 5 Oct 2021 12:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005132738.14820-1-peter.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_120211_167013_BD07C280 
X-CRM114-Status: UNSURE (   9.79  )
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

On 10/5/21 6:27 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Mediatek UFS design need disable auto-hibern8 before suspend.
> This patch introduce an solution to do pre suspned before SSU
> (sleep) command.

This series is not bisectable. Please combine both patches into a single
patch.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
