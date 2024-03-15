Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B7C54E5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Yh1Zjd9g1l5z0DieCBOoItaFXJ1TFyVCwC19BzRLDU=; b=Jps+Icvkz+TVxDOvSUnhW8+5gY
	f6nWuETfj1wgJAk6oSLOB/A+Czaa//tAq7/E0R4NX5TqvMpaTuNXLHV33Rjb5h4aY1RU9NaltrDeX
	UYcWtxNY7V9Y+IEysWgFoPDCgXd2XzO2D8zzV/LHLPvgfjhwj76u3GW+vWPX7vE+sh8TmYngShqyY
	5i0ec0ljKH9RZEcCTKN8C90JjdBTK2zZ02HyDicGrQWu5HPMtNuBmXKLvh1ZHTSVIlqfD6t2DpNXU
	YJM405Kco93A98BBloVdRQEDnHAMLiIxFyU3hNHL+JMiVyogQsq+Mz179VD73xLyag0fvkjfiPdI0
	WFs/f1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxRK-0000000GRHE-3TyI;
	Fri, 15 Mar 2024 02:36:58 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxRH-0000000GRGp-117a
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 02:36:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4TwpKy6cMNzlgVnf;
	Fri, 15 Mar 2024 02:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1710470210; x=1713062211; bh=9Yh1Zjd9g1l5z0DieCBOoIta
	FXJ1TFyVCwC19BzRLDU=; b=jXORtcdhGTtXabEcXSXXSZ9jInO1dIGtsVwmaqTW
	VorDLUd4ullT6vCRQpzWhEKoeMFv/1KoMgTNGGsum27fJMvFW5PQCsbktM7Ybm05
	WiVfbDNoO1xqY7XltxBB7ALkv2IfBXAquVPVY2CrsPir2pF/1YRx76UWqOUjPiKM
	vHg9QGL4lqj1fjsY5twl4QYPX+Cp3GwI7jUqCFN8Cih6bf37Qfgxm/t/VdqK+LPV
	NryCXIXaDM0G5xEEGJHkSKUOZnftS/gBSTWDes4DcpROKm6Y+au29QDX+AqI2Y/D
	raHHPCwmA3mqGsYqG1GP9axlC+I4bOEqd60rW4nxa+yC6w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GLOsBDmVu1oD; Fri, 15 Mar 2024 02:36:50 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4TwpKm4bG7zlgVnW;
	Fri, 15 Mar 2024 02:36:44 +0000 (UTC)
Message-ID: <67a4a108-2fec-4e65-b6a5-024f3175b1ca@acm.org>
Date: Thu, 14 Mar 2024 19:36:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] ufs: host: mediatek: ufs mtk sip command
 reconstruct
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240308070241.9163-1-peter.wang@mediatek.com>
 <20240308070241.9163-5-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240308070241.9163-5-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_193655_323182_2218FC49 
X-CRM114-Status: UNSURE (   5.29  )
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

On 3/7/24 23:02, peter.wang@mediatek.com wrote:
> +/*
> + * SiP commands
> + */

An additional comment that explains what "SiP" means would be welcome.

Thanks,

Bart.


