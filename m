Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E4EC5472F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Vo4GnU/h3M3K1jWnYOrEc1dy12RZqxDX2LQX4mlL3w=; b=PJcuGSOKozGmjErW3DlWCvAKoT
	QG+Q5GTaPuK71eAcdW9F6ni8xDBRJ3hhe9MGsTJq5j8mO7d8kMsFDmrCWdnJkFxtePHUE/eRSSTup
	1vtW1Es2ZTz5TUgYQekGGMqtcrXlCaHrs91XqwJnp4EIymuJwn8ydwfYT+nJB8Ep9A17iZvsr5Oy3
	tgIgL1/wb09NPJH8/YQw6xAQMtBhTSvOyNxh21IDtjzN+Efb6JrCP31zTvgLKXz33G2GyvinSG0xv
	fVwK8P2pa7iWAJD6MJXz5MCo34c1imw8BoFm3ZlpbhS3tEsRww8OI72zWuOQeWIlr1vz3rFRE5Pwp
	I52cHNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siyb8-0000000Bz9e-1Nct;
	Tue, 27 Aug 2024 15:59:10 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siyUc-0000000Bxg3-0Ca7
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Aug 2024 15:52:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WtX9h5XBBz6ClY97;
	Tue, 27 Aug 2024 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724773938; x=1727365939; bh=0Vo4GnU/h3M3K1jWnYOrEc1d
	y12RZqxDX2LQX4mlL3w=; b=ztapJpgICCnsXGCJu7kgE0+enJV1LzHbwWNGlzmx
	auGf9hOOGL+UGoKbrTAgScgPk1OD0j6sw+swwydeZZ7gw63oSkHYmYRWmHWk4oJi
	qQ3Yg1Q6FKoik9XoCycETbaURLYPuozjVOoyVrQ9vcVbSwK4eZGz/jnhnttqOXsh
	iyk57fa9YUONwaEmyYxlbrM7zL7agA7IzJs1i/ukCaTytGfPhnUO15bV/PGbRep6
	8irOJ1rpUb510XiDy7G/IaDYsqCHm5wyNjRXpkKWbeXox1h3sDRwezaTr2tXHZdL
	NydiTksKCQTvYc7EToU5FpRq8TUho+zvNaalyx3GC3KwJw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id V4rI_lcFRZEJ; Tue, 27 Aug 2024 15:52:18 +0000 (UTC)
Received: from [172.16.58.82] (modemcable170.180-37-24.static.videotron.ca [24.37.180.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WtX9T39Txz6ClY91;
	Tue, 27 Aug 2024 15:52:12 +0000 (UTC)
Message-ID: <d2916681-09df-4fe3-9c19-397edd488aa5@acm.org>
Date: Tue, 27 Aug 2024 11:52:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ufs: core: complete scsi command after release
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 stable@vger.kernel.org
References: <20240826034509.17677-1-peter.wang@mediatek.com>
 <20240826034509.17677-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240826034509.17677-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_085226_183494_57F3569F 
X-CRM114-Status: UNSURE (   6.82  )
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

On 8/25/24 8:45 PM, peter.wang@mediatek.com wrote:
> When the error handler successfully aborts a MCQ request,
> it only releases the command and does not notify the SCSI layer.
> This may cause another abort after 30 seconds timeout.
> This patch notifies the SCSI layer to requeue the request.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

