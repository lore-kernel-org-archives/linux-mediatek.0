Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372F6C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:30:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E94610E9
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E94610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rRycnCtGxR9yG/AFbWtl5r1ywW65kwOs652RVN01bVk=; b=QoczhojNVyVIDduoXaxmUrukY
	x/XCssRfYr+0CwCNtLcuiyLucTE68zjmmqW2AC+jcrgO/ja9FeSgUylA0uCukjNRmzIS1DX7jq267
	2qtCwPyzH3DIYs1b2hOONNZF9+diIUTGrMwhgXUF2iV7Z6PREP7WpmXK/3umKickhqDhxa3j5PJlp
	5QVXyYwcnSo8Pr+UNgitMzCUU4XQS5i74ekPLX3xZYC7KbtR+/vjLeeYA8Z4H3D0P6svaNic9hqKc
	ge9zqC7kzejbLade0lpwz0/3PTuu8HbCz5od3TE4XL8lJkzMMkQCendabG+9q9YBtSgi4k0inywR4
	ATaS9n4kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVWQE-004EdG-Ni; Sun, 11 Apr 2021 09:30:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWQC-004Ecp-OW
 for linux-mediatek@desiato.infradead.org; Sun, 11 Apr 2021 09:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Message-Id:Cc:To:References:
 In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=CZaQsurYXafEiO8zvG37h8CkGJKclLCmc8SRLDWNp7g=; b=bU5OwLT4fFLd0z0TjfB/JQbSIA
 hbi3nzDEB/cDhk5RWfry3tPui19F51y+L5JUUuKvB+vkOq1nwsT4ZMSYMGMKZ439jEaLtcapj7ZeX
 PUJq1/JU9OVp78qOQZ0VFgACj1ND4QpaJgmTZ+K59WK6X1sN5LDS33rTAaw64OsmLMZ4wp3pp+YES
 NUeUj1VLnxHyDhyI//my8HwXj5/zvFJ75m0BfyRakbGhTJATkakhUui95IHssc+m4GLGRt0ZajxDi
 e1bKYRO8QAHaY4dS9q6uc5p8dv4bDQEb87WHLN/2A+YNoi70kVrnX5b8L7doEWuQOHKrRAzMuaLVJ
 yt8KvPXw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWQ6-005R4r-Vb
 for linux-mediatek@lists.infradead.org; Sun, 11 Apr 2021 09:30:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618133421; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=CZaQsurYXafEiO8zvG37h8CkGJKclLCmc8SRLDWNp7g=;
 b=QtkFNX85fALp5MRpDpLZR4KeJJpn02yjPVQL7yGteipozAb1OaOyXXVoxd6sziEqDD+SRw3p
 0jHkZ+8tfALbbwPc19JebbuTG4oBdwEtyFCYZQ7wUzc7KWg4GVA+4tncWXvvqJlESyVKFE1Z
 36tXK224E/Um1lTYWtafJRmAtds=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6072c1a3e0e9c9a6b6fbcb02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 11 Apr 2021 09:30:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C9CF6C43463; Sun, 11 Apr 2021 09:30:11 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70DC3C433C6;
 Sun, 11 Apr 2021 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70DC3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt7601u: fix always true expression
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210225183241.1002129-1-colin.king@canonical.com>
References: <20210225183241.1002129-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, "David S . Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210411093011.C9CF6C43463@smtp.codeaurora.org>
Date: Sun, 11 Apr 2021 09:30:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_023022_179158_FF67DF29 
X-CRM114-Status: GOOD (  10.02  )
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

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the expression ~nic_conf1 is always true because nic_conf1
> is a u16 and according to 6.5.3.3 of the C standard the ~ operator
> promotes the u16 to an integer before flipping all the bits. Thus
> the top 16 bits of the integer result are all set so the expression
> is always true.  If the intention was to flip all the bits of nic_conf1
> then casting the integer result back to a u16 is a suitabel fix.
> 
> Interestingly static analyzers seem to thing a bitwise ! should be
> used instead of ~ for this scenario, so I think the original intent
> of the expression may need some extra consideration.
> 
> Addresses-Coverity: ("Logical vs. bitwise operator")
> Fixes: c869f77d6abb ("add mt7601u driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

87fce88658ba mt7601u: fix always true expression

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210225183241.1002129-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
