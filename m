Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9610210775F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b33qdSFprBgEgqtAwWoqsXIoJCWkEftC7WTzR/V4YAw=; b=07kmVVlO+bpYt14iTQ+evsLkmj
	k/zzbxb0SJ+KE/ZhRsEuBwXAs5IYSb2EcFQEWj7xbKxj136RFbJvj6oeeG19Xvkj097sE8c9EueM+
	T3Q8nGS3LhmTaKmaRf76fJhYyaWLVcWyMxf/VM3PFX0UgtsOw75WOVHEza8fp4hpVUO0gnFQ9RFiS
	XsvyVKSTLfaFSll7zumsfoy2uRceetJsTqlyUNKXxTn/2Rbynw/4SzuRuhTWQvuf/dMsAeD/vHNct
	m+AcR8f8eGxB5xxNOKDVmVQQ38PnjD0nhv0A+skFhNwwcN/WzaYx1mO1BgU2rQiQn5LKWmPTBuW0C
	jaT1YVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ulK-000000095ZS-0sec;
	Wed, 18 Mar 2026 17:32:54 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ulE-000000095X5-0wkq
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 17:32:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fbbWM4f0xz1XMFjF;
	Wed, 18 Mar 2026 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773855148; x=1776447149; bh=b33qdSFprBgEgqtAwWoqsXIo
	JCWkEftC7WTzR/V4YAw=; b=G0tWOye+IiT3a8ksPwdvfqjMj6DPZl7yYvK7VWKi
	wEJzAWuU7rch8ZKTYxGX2CpjYJPJMKI6Pk9OQFVSfst/nFEWWgapeCCZAz1vVCAw
	fcEz4XSc4OMht1l9AnH/siGrFlJD2J3OTpg1gpioKpnADr2dA+mSZ0IlE44W7x0g
	jycbZgE+p2K2Q93TW/6v7A6E830fzfDF9C4VA46xPSU4RmBSQ6axzbxc8GNPiUf0
	/+yQPxv15m/J60sIfyxLxW90iKMZGDPfPoELtFVOtCoQbCi2gOu++uAoTWETaywE
	II7giEJX0fJbNHa0LrTwGwuRlFqSfGxQCKZZesYtPtYghQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id EgntMdz2AOrV; Wed, 18 Mar 2026 17:32:28 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fbbVk5c5Mz1XMG4Z;
	Wed, 18 Mar 2026 17:32:12 +0000 (UTC)
Message-ID: <364d15bf-8d11-46af-bbc6-b4ae45618bf5@acm.org>
Date: Wed, 18 Mar 2026 10:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: Marek Szyprowski <m.szyprowski@samsung.com>, peter.wang@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@sandisk.com, alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
 <CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
 <1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
 <df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
 <1b9db59c-f736-4c59-b37a-15a60cfa4f3e@samsung.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1b9db59c-f736-4c59-b37a-15a60cfa4f3e@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_103252_204436_063B00E8 
X-CRM114-Status: GOOD (  13.28  )
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

On 3/18/26 10:13 AM, Marek Szyprowski wrote:
> On 18.03.2026 16:50, Bart Van Assche wrote:
>> On 3/17/26 10:11 AM, Marek Szyprowski wrote:
>>> This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs:
>>> core: Avoid IRQ thread wakeup during active UIC command"). In my test=
s I
>>> found that it causes the following regression on QCom RB5 board
>>> (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>> [ BUG: Invalid wait context ]
>>> 7.0.0-rc4-next-20260316 #16535 Not tainted
>>> -----------------------------
>>> swapper/0/0 is trying to lock:
>>> ffff000089f58048 (shost->host_lock){....}-{3:3}, at:
>>
>> This line is a mystery to me. Are there perhaps any local changes in
>> your kernel tree on top of linux-next? I haven't been able to find the
>> text "shost->host_lock" in the UIC completion path.
>=20
> I don't have any local changes, code is at commit 6475cfb81fc4. After
> looking at the code=C2=A0this 'shost' indeed looks a bit mysterious, bu=
t
> maybe it got that name after some=C2=A0inlining or code optimization.
>=20
>> Instead, this is
>> what I found:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0guard(spinlock_irqsave)(hba->host->host_lock)=
;
>>
>>> ufshcd_sl_intr+0x3c0/0x6b4
>>
>> Can you please help with translating this information into a line
>> number? Tools like addr2line, llvm-addr2line or llvm-objdump -d -l -S
>> can be used to perform such a conversion.
>=20
> ufshcd_clk_scaling_allow() in drivers/ufs/core/ufshcd.c:6492 (code
> checkout at git commit 6475cfb81fc4)

Hi Marek,

I haven't been able to find any call chain from ufshcd_sl_intr() into
ufshcd_clk_scaling_allow(). Am I perhaps overlooking something?

Thanks,

Bart.

