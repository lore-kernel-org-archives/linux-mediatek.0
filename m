Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974AC54ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 May 2025 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TisoT1GJKWQdeL0EC37oUEGlp+YGOKzOH7FoNix20D8=; b=rKBlILiG1sjX88nh4lFYuNVHyq
	Lh/a/rxIpU4pWuf/kOzKFliSbUBIFMRkKTADrVsxm+qFXEk0YSJ8vfx974fH1xcShbAvZ5qNT0H+b
	kMoilVIUMzfmr7HMZDo5yrK5uF15iPWHVvbQFHx/UFG/Nkca6W0pu2asSoQseZph5BtaJZJQmo/jj
	paTLxt7ieMATuoWsRLbsx89rzN3+GZZ1QkRLZDZ4y20fGn9CHqZvwi23VleuxyF8TK9wW10Vf3YL8
	VgsIU0ca5JPKT19GGJJwjFYTU8oEKEDKbGKItNi6qupnw9QHdApy0x3Jvb/6oXxaaEgjyoXKy1+Ra
	dMX2gt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVE8-00000004OlD-2zwT;
	Fri, 23 May 2025 16:26:32 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV2m-00000004MMj-1TfB;
	Fri, 23 May 2025 16:14:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b3qx74t2Mzm0yVc;
	Fri, 23 May 2025 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1748016872; x=1750608873; bh=TisoT1GJKWQdeL0EC37oUEGl
	p+YGOKzOH7FoNix20D8=; b=xU9vrABsUYq4zcSAfdLkpbXZnnzktvng2o5pI/Q/
	ziOO1dHMJO99+2qQY5SWzAvOo2nYwVg3yc3/eKqGXs5/F1dt80JgzNpcRJQqOw5v
	Jd2gZSRYlzhcnTYNT1Yjx6o5eJPu0ffE09owgUarMo3JEzrtzIAZ6b2jUu3fD2o0
	b+TTyegQqqnknufjqZZI9VF8mfy4agIvigdfMoCwJZM1kUEUQcw5/ibQrLgWpGVN
	71NGqkrf6/xk074GgLtYzyODD1rCOB7gXBZqjDsvQVGTVuZC53XA3gu3sS12xJ+h
	9xnPQNPv4UxRuCSZfj4+vtcQj3SuhwAgNvj9JxMumtCASA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jUb281F6MwOT; Fri, 23 May 2025 16:14:32 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b3qwq3FVSzm0gbW;
	Fri, 23 May 2025 16:14:18 +0000 (UTC)
Message-ID: <c2608cd6-8c77-48f2-bc50-2ff087b0d48f@acm.org>
Date: Fri, 23 May 2025 09:14:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ufs: core: add fatal errors check for LINERESET
To: naomi.chu@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 alice.chao@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com,
 yi-fan.peng@mediatek.com
References: <20250523101041.3615819-1-naomi.chu@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250523101041.3615819-1-naomi.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_091448_491853_83675B29 
X-CRM114-Status: GOOD (  11.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/23/25 3:10 AM, naomi.chu@mediatek.com wrote:
> +static bool ufshcd_is_linereset_fatal(struct ufs_hba *hba)
> +{
> +	bool needs_reset = true;
> +	unsigned long flags;
> +	int err;
> +
> +	spin_lock_irqsave(hba->host->host_lock, flags);
> +
> +	if (ufshcd_is_saved_err_fatal(hba)) {
> +		spin_unlock_irqrestore(hba->host->host_lock, flags);
> +		goto out;
> +	}
> +
> +	/*
> +	 * Wait for 100ms to ensure the PA_INIT flow is complete,
> +	 * and check for PA_INIT_ERR or other fatal errors.
> +	 */
> +	spin_unlock_irqrestore(hba->host->host_lock, flags);

Please use scoped_guard(spinlock_irqsave) instead of calling 
spin_lock_irqsave() and spin_unlock_irqrestore() directly.

 > +	msleep(100);

Can ufshcd_is_linereset_fatal() be called from IRQ context? If so,
calling msleep() is not allowed. If it can't be called from IRQ
context, saving and restoring 'flags' is not necessary.

Bart.

