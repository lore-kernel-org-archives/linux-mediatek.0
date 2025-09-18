Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB94CCA1013
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/fSSvgsW3pawIQ3Egof9djmka1o0u7cLgWNCZuci0Y=; b=zwgmmv7tR0QfvuCGLzHoOQpFRc
	xNt9yI25e1N92xdE5JF6kq879imErEwoIXDKI2afQByfiJr/JWo/hvoVn8hZpBAnfj9+A6BpZwOJI
	RJz0zOvjmaSqfRijb7h0cdGLwAO8/qAncgQIZBVLYn91GtlejHKRNx48w1O0HDVgrRFWEMCrENQPp
	pbulVzv7biDJCCBsl6QGJvcoCrt402FMBVSTgX2LYRH6fmPFrgjWUPvo5RFabaYbj2+SjnrsMH7bV
	PSRoEMPAR/YiJANs2dMX4zyweph3Osxd5aCaI3VTcVvMJUTuMnnHuFZwsVVT4eHYF3ERwzsY/r3BO
	DUhwjfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJOq-00000000rz2-46bL;
	Thu, 18 Sep 2025 18:30:32 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJOo-00000000ryL-2aBc
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 18:30:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSPMT62CRzltQM8;
	Thu, 18 Sep 2025 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758220227; x=1760812228; bh=t/fSSvgsW3pawIQ3Egof9djm
	ka1o0u7cLgWNCZuci0Y=; b=mX4ThNNBBpA3VuHN/e7FBXzarWrcMXSMZAVnh7Sy
	9APgPdd+tgFfviyh2f/PpapEe0zR27IGmeu+EU4o+O8/6GIjHJbg88VDMY9Xrd43
	BD3CzalNnHJLJ03DR5eBsljHsmdvqFyij1njUBr8o6UEOCQN20P+nz+ec3cNgayi
	APlWtJAZiaaGJC2ey22QGcl8TDhuEpAHfYCuwlGLG6BYf56EZrOVorjPBFPctKJy
	1wfJeifG/x74FceyRGAaV6u9rPHg4WbNlr3Ra+7fIJlAetfocf2Idk3EmVGfGBeu
	fUI4RXa4SkDFjpY/fCB/ookNyJ8yFShOrUUep/q2yu/LZg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id oxVgUQ-ehWAL; Thu, 18 Sep 2025 18:30:27 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSPMC47FQzltQLx;
	Thu, 18 Sep 2025 18:30:14 +0000 (UTC)
Message-ID: <02338932-b3e9-458a-ac24-41b4f29eb514@acm.org>
Date: Thu, 18 Sep 2025 11:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] ufs: host: mediatek: Correct clock scaling with
 PM QoS flow
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_113030_736937_672B6FCF 
X-CRM114-Status: UNSURE (   8.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> Correct clock scaling with PM QoS during suspend and resume.
> Ensure PM QoS is released during suspend if scaling up and
> re-applied after resume. This prevents performance issues
> and maintains proper power management.

Is this issue related in any way to the MediaTek UFS host driver? If
not, please change this patch into a patch for the UFS core driver such
that this issue is fixed for all UFS host drivers at once.

Thanks,

Bart.

