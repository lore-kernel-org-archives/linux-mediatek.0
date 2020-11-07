Return-Path: <SRS0=h02w=EN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D06C388F7
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2020 07:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D470020704
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2020 07:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a0zpzIhj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="fqYHJt47"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D470020704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGdMv/eH+JE0HytVcRaMr91zGoSgzO2oDFoqXcxYDv8=; b=a0zpzIhjjlBRI1jV7XCgOrrOw
	wTwNXvrw8/6wriVTz3NOBgAaTrHJFHKlNtbkCqKp5HwNnoFNCZpAm99DcrYDHenhuMK3XBUSbFYmD
	p0x2gTnA7fqXWk2kEurlzgrejMvdJIu8GrtWDavZN85fqncIa1iKby468N7lecOdM7nhdl35C0r/B
	dgIMVC23I1yFCTn9tx3KubdgQiSj3zqef+InfCmJ6/lInAIS1X29QcWwHLDjFyYfxpcs5m1jvITmi
	yxEsEROVigRvdJA88BGdP5Z3XIeibBuDdKFPiW+jIsY0eb+I8/eNkOQ9g0xa/xtMpCssFrkUpVXcz
	EDUzp5Klg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJ7v-0007X3-7C; Sat, 07 Nov 2020 07:59:11 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJ7s-0007N1-8x
 for linux-mediatek@lists.infradead.org; Sat, 07 Nov 2020 07:59:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604735947; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Mbg1EqcfnJs+dnP2G29WHj2GAOOOm/rhkT9jO54wR44=;
 b=fqYHJt479jvS9kSoIFNejef+bB9r2aFOa2nGXXuo+HIGNAzaayHAFwaX248joF0zbgggOygI
 LmWFnGyQsjrSpfgU8vUC0UAYfnqkz5WECHFtDkMAt++oepTvHwQU62ip+/d+tVmx+FKQl9gN
 Uk6vzxzwgtlOjDeYGB44hFwlm9o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fa653cbf8c560b58005150a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 07 Nov 2020 07:59:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C3091C433FF; Sat,  7 Nov 2020 07:59:06 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62950C433C8;
 Sat,  7 Nov 2020 07:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62950C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] ath11k: convert tasklets to use new tasklet_setup()
 API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201007103309.363737-4-allen.lkml@gmail.com>
References: <20201007103309.363737-4-allen.lkml@gmail.com>
To: Allen Pais <allen.lkml@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201107075906.C3091C433FF@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 07:59:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_025908_343931_119D920D 
X-CRM114-Status: UNSURE (   9.22  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allen Pais <allen.lkml@gmail.com> wrote:

> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0f01dcb89b8b ath11k: convert tasklets to use new tasklet_setup() API

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201007103309.363737-4-allen.lkml@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
