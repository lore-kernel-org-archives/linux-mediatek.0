Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8ADCEE339
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DVpDAPKhEQs5DGtkKhEpGFCtL0k+5cJbfMeqq+88o0=; b=XdVjR/xx6KIRpIwLTaILTI3HTY
	5gKgAcXA17LkJhq7UtpkCt7ZwcVXyjJfTUriOYHMGmxR6l8s8spoAFiFR8kprB8QMxacIaL/5lKXr
	H2vhNCX0CUH19QbD7RaJiqAFv3sI6uxcnLPLYG+2Kzr4Rwi/owrLyZI0d2BWy1hvbBPn5zBTbivr2
	nyY5pKfQ2A/BMylprd+zW2OR6uxwx0oiRRyTKWylsJtSZcGQRZ4NbkcbmK2TaBKUXSAt3hk2KRdxq
	7EspFmX33kxrjAtNq44tiduNSyepBW4bN/ziyQWTJt6LvRFqQWX890vTRZrilft/mNqVcQKD/hUz2
	GsYhMIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syar5-0000000AHBE-1dvB;
	Wed, 09 Oct 2024 17:52:11 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syaYB-0000000ABek-2184;
	Wed, 09 Oct 2024 17:32:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XP0MT6kK6zlgTWK;
	Wed,  9 Oct 2024 17:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728495152; x=1731087153; bh=3DVpDAPKhEQs5DGtkKhEpGFC
	tL0k+5cJbfMeqq+88o0=; b=DiJJd2oZrVYWhoVOPCyKUzLAXJ4n0ACW3pYzj/BB
	lmNj1+MFwNRj/G8yX7cf3ONGLe82tkGxBJWP7hKx3kKN/kAix29xQFdGxN0qVMZ2
	qw/Oe3N/SuMnxuWuGCSqR1535AvW/FKWoV4qpQUbkXXbvfGMCeuNEf0/OBQLyB0I
	d3RNz6kQbKdQQcqTd1i4gWGbNsHkBIuIw7ArGzDC9Cjsg4Ub52SHrWVic9fLHnYq
	0VI/yUVInYb5VcX4RI+qgbjRWOxs1lP0u1GyjyEiljmFM3ZdAtmiSAsUWHEoXRnP
	rs9LaUziK5iwAKsh8vA1gXGhJxDNuYUIQjupLrvsNB42yA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MYxXZzrosPRi; Wed,  9 Oct 2024 17:32:32 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XP0MJ6TNJzlgTWG;
	Wed,  9 Oct 2024 17:32:28 +0000 (UTC)
Message-ID: <17abd508-3d83-4926-bb16-0176fd46f100@acm.org>
Date: Wed, 9 Oct 2024 10:32:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: ufs-mediatek: configure individual LU queue
 flags
To: ed.tsai@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, chun-hung.wu@mediatek.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241009053854.15353-1-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241009053854.15353-1-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_103239_573176_83C3FCA6 
X-CRM114-Status: UNSURE (   9.90  )
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

On 10/8/24 10:38 PM, ed.tsai@mediatek.com wrote:
> In addition, because the SCSI probe_type = PROBE_PREFFER_ASYNCHRONOUS,
> sd_probe() is completed by another thread, causing the sd index to be
> obtained asynchronously. Directly setting the queue through sysfs is
> cumbersome. We do not need to change the queue settings at runtime, so
> a simpler and more intuitive approach is to set its flag once the SCSI
> device is confirmed to be ready.

Please set this flag from user space. The example below shows that it is
easy to set this flag from user space without knowing which sd* name
has been assigned to the block device:

$ adb root
$ adb shell 'cat 
/sys/class/scsi_device/0:0:0:2/device/block/*/queue/rq_affinity'
1
$ adb shell 'echo 2 > $(echo 
/sys/class/scsi_device/0:0:0:2/device/block/*/queue/rq_affinity)'
$ adb shell 'cat 
/sys/class/scsi_device/0:0:0:2/device/block/*/queue/rq_affinity'
2

Thanks,

Bart.

