Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400DCE7E0CD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnV0X6ZG8qLf3L+SsSNDmfQBer6hQmYkfHJu6QC8bvQ=; b=oDAhP2m/1wWZN/RX+T5KyqSESl
	YaSQ7OlrKVg5OQpyIZuDRl4qBocs3v5pi6K2K6CJTAqK6SllviokSqmZSNhFI07I9OBAtvrcWLzan
	nDwPBSEsnEd3yXeRA5nbSrLjkD0aNXI3w2yOyMDtVZHwVa5cXBZU+1r0wRlHZbFcY9OdJYldbcuc0
	qlE+VNb/mUj1Z3RqhXAJ7GRqn1v3DYQeQWTjBGqq8CbFiSLEPzeZERfAUALlb9ErRsIQmIQmXW9MC
	PKee474hEXLGMgJvVAnlgD89iL4SLiJB2J18cms6PUSOl/csJ3tj5U5HpjQXZhFki1gojgXlu2D9l
	chKLgmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUZW-0000000FjSg-19fM;
	Mon, 09 Feb 2026 16:57:14 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUZT-0000000FjSK-2sdo
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 16:57:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4f8rTM05SCz1XM6Jh;
	Mon,  9 Feb 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1770656227; x=1773248228; bh=rnV0X6ZG8qLf3L+SsSNDmfQB
	er6hQmYkfHJu6QC8bvQ=; b=Z+wKuS/xgS/2QsTHXeH45SeSyOdZwaBhmwzPGNhV
	rFuMhs930tLrxqDO2NfFtCd6+BS0tJ6XU/l/vklFBiqyVSIC3jPZ6txYnlRulrxy
	1Cdb29mkVsm8hQ5bcc3IMszHxZETvMoYwMfTVOUqDw3I+iWQh7HYh96jE03j6eT8
	akR6subSMIcYxaB6nR2VPlE/iyS4+C/HEkpW8ABfGuusqoGOf8iArRHoPeaPew8P
	h/n7/g5lBHZjdr/cc0aAxyYdlIDIVTQ5LP815EOpX21fXmSIQFy/XOdCwm826kI/
	KXWgsThbyQRepcg/DP8rZ59MU9lOh+Fc1o4iBBl1WmWh3w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kEmNqcuJDYaf; Mon,  9 Feb 2026 16:57:07 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4f8rTD3PZLz1XM5jn;
	Mon,  9 Feb 2026 16:57:04 +0000 (UTC)
Message-ID: <6241685f-fc24-49aa-96f9-c2a69a4cee75@acm.org>
Date: Mon, 9 Feb 2026 08:57:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ufs: core: add debug log for uic commnad timoeut
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260209083053.1467647-1-peter.wang@mediatek.com>
 <20260209083053.1467647-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260209083053.1467647-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_085711_755897_A61E5D04 
X-CRM114-Status: UNSURE (   8.58  )
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

On 2/9/26 12:28 AM, peter.wang@mediatek.com wrote:
 > [ ... ]

Please change "commnad" into "command" in the cover letter of this patch
series and also in the subject of this patch.

> +	if (!cmd) {
> +		dev_err(hba->dev,
> +			"No active_uic_cmd, may timeout and be cleared.\n");
>   		return retval;
> +	}

The new message is incomprehensible to me. Please make it more clear. Is
this perhaps what you want to be reported?

"No active UIC command. Maybe a timeout occurred?"

Thanks,

Bart.

