Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C17FC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 09:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3DB206A5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 09:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Ljt6qYK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Bv729vX0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3DB206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npk1tk1unD8liOYbVsE3vyhxG9QFKx13lLf7Nnq6cLQ=; b=1Ljt6qYKG6KaJpC6HvRftmaiN
	oEZWxaQVarR9GQ7x+TkT4nOxeNdmL7LzUU8IndWUaTa/nQMeQ17iY7cGtwYek0v8EEaeh+PStOk6o
	vhaA/5DcD4ffJ1FHRC8OFtVnSyEKdgvdH/wjCiX7azF1cssEh8cvV/5xR70O/doti8mBCB+zkaf7T
	CNh72l0tb+IoIrv51yV7p/TJ2IiYgZP06BLFYR8hMkhRnO6eKa5pyZoYopemPs/cvsKDJw0jt/QEY
	vpZYn7b2IDYL06WPdRskZjFyM8wmbl+m1XmrB9diq3NmOl48LsWydDbnMY57y7MuGGf8+31M3z0U2
	c5f/erVYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD2QQ-0007lf-TZ; Tue, 01 Sep 2020 09:17:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2GW-00027b-Af
 for linux-mediatek@lists.infradead.org; Tue, 01 Sep 2020 09:07:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598951266; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=r4jgLB2Y7HqxGBSoMmSZHzBfBOvDTq/waBu4T4pLAgY=;
 b=Bv729vX0mvOkWcEop0XnT9gIMAvA+p1pXwlbrrov0D8ptsxY+VGSR6uzN+ywkzrgZn0xLCop
 VZvGu60RwN4rBa/0mLT5hnnsOsIVU2bxaJrwKD1/baGCW0D7kcbT5/2zRgACvZyh/5iupgSR
 bMyKr+hN9T7Utig5izyX3FhkvRU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f4e0f36be06707b340c618f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 09:07:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EE72FC433CB; Tue,  1 Sep 2020 09:07:01 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0A85C433C6;
 Tue,  1 Sep 2020 09:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0A85C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [15/28] mt7601u: phy: Fix misnaming when documented function
 parameter 'dac'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200819072402.3085022-16-lee.jones@linaro.org>
References: <20200819072402.3085022-16-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200901090701.EE72FC433CB@smtp.codeaurora.org>
Date: Tue,  1 Sep 2020 09:07:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_050746_863369_6DA36D30 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felix Fietkau <nbd@openwrt.org>, Jakub Kicinski <kubakici@wp.pl>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Lee Jones <lee.jones@linaro.org> wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Function parameter or member 'dac' not described in 'mt7601u_set_tx_dac'
>  drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Excess function parameter 'path' description in 'mt7601u_set_tx_dac'
> 
> Cc: Jakub Kicinski <kubakici@wp.pl>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Felix Fietkau <nbd@openwrt.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

10 patches applied to wireless-drivers-next.git, thanks.

e6cf87bfe869 mt7601u: phy: Fix misnaming when documented function parameter 'dac'
a8433a92521b rsi: Fix misnamed function parameter 'rx_pkt'
5dfcdc7a520e rsi: Fix a few kerneldoc misdemeanours
311175173c8a rsi: Fix a myriad of documentation issues
9463fd554bb8 rsi: File header comments should not be kernel-doc
7951a3bfa2b1 iwlegacy: 4965: Demote a bunch of nonconformant kernel-doc headers
2de64ca7c9fa brcmfmac: p2p: Deal with set but unused variables
457023556e94 libertas: Fix misnaming for function param 'device'
f030ed4079d0 libertas_tf: Fix function documentation formatting errors
ec511969097f hostap: Remove set but unused variable 'hostscan'

-- 
https://patchwork.kernel.org/patch/11723151/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
