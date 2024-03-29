Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D39C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcm3DmQ2iHw+PviwOCf9Ftc6RGJJ9+JQbwpOGmGLRmY=; b=LK4xSdHVMdPKdOSCHQ95Dgt/rS
	+P2Bh4f9P1xeMD5lSkNZDIjUoIQG1k+vOBBaap7V6X2BvfAzHX4HmyKWDblkjKs0Nzu2HJTQ+6Ir2
	Jh+igEJpgr/54O7vbpFkL+vMjrDxMM/meKxYWMHuQW6/2Olz+I2gnhvIcYUiE0b3+T/PnlBV2ytmd
	wtiZf2Tw/n4lew/uo7jL8zmyuwKiHtrvluZikTiyOyvX/78qn6QSLJlnqkc7CGakzD5fMXFsBa9Ez
	hl336tbCS7DJ86Z14kTkAMO0CVL2cxHTiTUEDS8w5sNhn+tILx36IP7I+Qj42oyl4MBVwG/0yIaLW
	lOCPDvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGwM-00000001bKU-3dNa;
	Fri, 29 Mar 2024 18:26:58 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGwK-00000001bK6-0US1
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:26:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4V5plf3fg3z6Cnk8t;
	Fri, 29 Mar 2024 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1711736808; x=1714328809; bh=hcm3DmQ2iHw+PviwOCf9Ftc6
	RGJJ9+JQbwpOGmGLRmY=; b=kgsCxlYNwKs2PPDeq6Ne5gyXzJcXO60aFH2NTYBP
	/3GyzAN1+kVOj+zGw9x59eq5H3ae+jB8/1WC9NZ98YNsLcWSuJ2RhU1IJFzre15K
	pn54eEr7JeMworiUnto/GQlYU1yy9h0e0dQAZ3vS+j0iy7EAKutYCAlXd3AdUKwS
	s7T5P0iIad7xL3eOLZ6B8xeI1+mYLN4gJDpdfebxerBSIdgLh6wXFqDDGvPNlzFe
	YUFqnEuCeoWjmYEkW63KMtfANmYA3+sB7YzxR6LVH7HsJkuKGCr2ngsYcvlimmvk
	O8FW9yjwWnOLhe4j4TAjHSu222LBNl+rzpPq8QSFa9fcFA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rBxUXmIg8p1M; Fri, 29 Mar 2024 18:26:48 +0000 (UTC)
Received: from [192.168.3.219] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4V5plQ1wJrz6Cnk8m;
	Fri, 29 Mar 2024 18:26:41 +0000 (UTC)
Message-ID: <0e8f3f8f-2a60-4d52-b21f-bf36533e7a7e@acm.org>
Date: Fri, 29 Mar 2024 11:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: wlun suspend dev/link state error recovery
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240329015036.15707-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240329015036.15707-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_112656_209338_BCF18FBD 
X-CRM114-Status: UNSURE (   8.05  )
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

On 3/28/24 6:50 PM, peter.wang@mediatek.com wrote:
> When wl suspend error occurs, for example, BKOP or SSU timeout, the host
> triggers an error handler and returns -EBUSY to break the wl suspend process.
> However, it is possible for the runtime PM to enter wl suspend again before
> the error handler has finished, and return -EINVAL because the device is
> in an error state. To address this, ensure that the rumtime PM waits for the
> error handler to finish, or trigger the error handler in such cases,
> because returning -EINVAL can cause the I/O to hang.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


