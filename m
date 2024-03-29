Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD919C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YBZWqBkSUv7ch15sq5yXuPsdi5P9MWlsqMawvgvm2o=; b=00hDkhc23IcMX0LFkLnxC/IMlE
	XnxHCzucCwfKIm527Aogmfw3jYA7x83k8vjXKhMbp5vqQMNYfmHj3WFLruZhFqY/KFmpYTkq/jywR
	6Wf0Ll0b8nHh5pTbZ5OsVVNmV6yYOcJmS8X707M/Ks3bot94SvoefvRn0l7M8Jtp9cZ33+NsQkwZz
	K6FS2YjNg49jPGBLCltEagMWjmaPAOO3KyiYVZYPkl9EpiILZD5Be4yox+SdO0LauYtoMIP/+o/Dj
	fW9DsTuYDBYI4jx7Tmwq8btN+Pn1FqliNSno8rXPaL1cVm1sbl1Dd0VOL8rmha71rdcmF6gUyGjII
	/fP/HiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGx6-00000001bR5-1nK8;
	Fri, 29 Mar 2024 18:27:44 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGx3-00000001bQf-1ihJ
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:27:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4V5pmX71dwzlgTGW;
	Fri, 29 Mar 2024 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1711736856; x=1714328857; bh=4YBZWqBkSUv7ch15sq5yXuPs
	di5P9MWlsqMawvgvm2o=; b=H82NeuPGekOXpGoL11zRKXqqLtJ5N1e+fp5DgC7/
	qzyVScq5XMuFn2NVkHJP14RYfw1zdecmCkjxHr5Zz+BgUa/fJbLlSC+BDDFq5emy
	Igvl/qWeobhzdOAHNU/09SMpVntAtQK7FivYU4tJis7Lc16LFD3Wf/aKBtY4U2AR
	WNGrvYtURcAYASa307HOcsrJ3aEK9GpmtHoIEQFfWh9p1zA4qnvOf+u337vsLHew
	bI7V+RJOFmqU2cTgC0YPm7tWwwDkqo/NKO3EoSQHxXneN56UE/1ZPlBtPzkNdSMF
	J6MLtz9x4ukS+j0imIKbW3spqKi2J2J9zHpUJjmThPO64g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2elengDEaMkT; Fri, 29 Mar 2024 18:27:36 +0000 (UTC)
Received: from [192.168.3.219] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4V5pmL4dsSzlgTHp;
	Fri, 29 Mar 2024 18:27:30 +0000 (UTC)
Message-ID: <a92979fa-dadb-4758-9066-96b3b21c7d98@acm.org>
Date: Fri, 29 Mar 2024 11:27:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix mcq mode dev commad timeout
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240328111244.3599-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240328111244.3599-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_112741_570445_BFFF2A0B 
X-CRM114-Status: UNSURE (   5.03  )
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

On 3/28/24 4:12 AM, peter.wang@mediatek.com wrote:
> When dev command timeout in mcq mode, clear success should return
> retry, because return 0, caller consider success and have error log.
> "Invalid offset 0x0 in descriptor IDN 0x9, length 0x0"

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


