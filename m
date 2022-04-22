Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWGxcbq/xBINMsQxz29iI1bLzsrGXeNXasCfAwwWyJ0=; b=XMy3CNrkTY9lsx
	RkqeONZ5UUJO2z7Li+zisd55ZlZaEB4AM9Nn6kdKXWwZkBnZHX1Ru4Njk3yucwELGJ1CXaeB7xMiK
	NvWnFYpXEChkSBsT7NvsID9YQCWGgVemx0ZVw6teClDV+4cT61wdvMQA6va7H8HNM/Rw8ynuolKYN
	yWEudIfcxYP1+8LVXRBD489UpyXpu5LbC9xdw2qtWq/jI7ylxo2e4RqOs1Y8HePsNcz3iHW831zKW
	joiwXbGuJHg41Ybp90P57A28OHnXp9dKAv1qrD+UuCCJdD0Ctf2BQuF/lOsivCLfO2V58bjZkM/+q
	cGcbljb6XaTqjA47+XLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmJH-00GJKO-8I; Fri, 22 Apr 2022 05:58:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmIR-00GIrA-17; Fri, 22 Apr 2022 05:57:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A74B61DDF;
 Fri, 22 Apr 2022 05:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A684C385A9;
 Fri, 22 Apr 2022 05:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650607051;
 bh=Rvf90UcwzPbS3F5AqAtneVu3nF9B07X7cwvF7nN8ENI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bBXFaJywcqTcX8KxDYflryjhANwgEc2Bam3efuHS/L8sddABY8ol1JI333xINwl/x
 mkC4XgNcMUNV1ZyKxdgrMcIb67PF5i8sOG1mN5LY/P2TBErRJPCha8euLdDppa/YBT
 hRZLeqNjkb59HQX8W1QqAa5GIOYRRtNjUE6AVdECGvddUCG+SoZw9GBIzhMLhYO1Cn
 wttlxzGWVq4Ishol80XcTWBC87GvIb+BjnbvfgbpQTsL+l0Ev6Lrixyboso7u3R7Kk
 wrG+pUgEDv85U3YCcrGtAOU/UVkdgxuNo8gKLGJbiGLi2h2R51VtJ0JhjRhBdIQL0U
 5XtEbXYyKMPHA==
From: Kalle Valo <kvalo@kernel.org>
To: Bernard Zhao <zhaojunkui2008@126.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, bernard@vivo.com
Subject: Re: [PATCH] net/wireless: add debugfs exit function
In-Reply-To: <20220422012830.342993-1-zhaojunkui2008@126.com> (Bernard Zhao's
 message of "Thu, 21 Apr 2022 18:28:30 -0700")
References: <20220422012830.342993-1-zhaojunkui2008@126.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 22 Apr 2022 08:57:25 +0300
Message-ID: <877d7hoe2i.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_225735_158454_C0194238 
X-CRM114-Status: GOOD (  11.74  )
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

Bernard Zhao <zhaojunkui2008@126.com> writes:

> This patch add exit debugfs function to mt7601u.
> Debugfs need to be cleanup when module is unloaded or load fail.

"load fail"? Please be more specific, are you saying that the second
module load fails or what?

>  drivers/net/wireless/mediatek/mt7601u/debugfs.c | 9 +++++++--
>  drivers/net/wireless/mediatek/mt7601u/init.c    | 1 +
>  drivers/net/wireless/mediatek/mt7601u/mt7601u.h | 1 +

The title should be:

mt7601u: add debugfs exit function

> --- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> @@ -9,6 +9,8 @@
>  #include "mt7601u.h"
>  #include "eeprom.h"
>  
> +static struct dentry *dir;

How will this work when there are multiple mt7601u devices? Because of
that, avoid using non-const static variables.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
