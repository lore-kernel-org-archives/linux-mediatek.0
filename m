Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C3DC83F22
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX9lBraUuanxGYhCFaLBB3OCqc6O7Dm7X6jDDXnf/mI=; b=qUSy9TKD13bU596QDUqfKhHeS5
	pUz05nrwBMjPgOWvxJbY0kuoswmDdZazup16pwqO4VjIfXewasV7PYNMinGEFHrJWU5ZKH+M5k9Zo
	WnUzkhDcmFzy9xpaQ1Xu2kTUt9sIHu5eG6m4HVPwp2S0YC+q8QB+3AxgGIhYB6uMcscv2YeagieFd
	hRWfhXFYb2AnSRjB3JrxCA4zwCMLj/8RsUzVJElDh+FUcx5YaN8PSHuVTLRHBOlnPQjDoO383k8oX
	X7W1nUjuYhq5Np8TOR2cQhzibh2082Oyi/GYjEDp/hjPSDSN3xfVmCDiYOwlgWQEMbaKjU7Ql0xZj
	R4VGx+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3vc-0000000828A-0Fjx;
	Wed, 16 Jul 2025 15:20:16 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3va-0000000827U-1Y1J
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 15:20:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bj09P6kZlzlgqxm;
	Wed, 16 Jul 2025 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752679206; x=1755271207; bh=sX9lBraUuanxGYhCFaLBB3OC
	qc6O7Dm7X6jDDXnf/mI=; b=jCABoDDJtXskta3KMa8pDNjGowhnblnFJl+EKz3V
	CF2cI3TIWKWca84ammf0NP4oDiD/bctOe12xdq6aKZ2YwLdEiPmPPcvhRwKL4mS5
	fAu0dN9CzEBio9gtIh4n3rR8XpbxTs6UdtfS4h0wsMTZ6vCcgJSWHIKjMvftuo8q
	7F/pIyFtpZ8Np3HoAbvoIbplXBr3Af+/jyk6ht6M7eNMRIVEKhqXauZ8p1H3ko5X
	XK2P23TkDGirMLvCLGgS1KVUejpMFyVucPBoETBix8XdE6/VgJ2VS1wPf2L1sqy5
	v7lDwmeqrqsEeXk5pNfXbbFOLD5CU7b1ZHAjXA0MDGkvBw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WJhA_2P1SuSs; Wed, 16 Jul 2025 15:20:06 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bj0966mxpzlgqTv;
	Wed, 16 Jul 2025 15:19:53 +0000 (UTC)
Message-ID: <f3679ca4-9c77-43cb-a0eb-a4915f0f2c3d@acm.org>
Date: Wed, 16 Jul 2025 08:19:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] ufs: host: mediatek: Change return type to bool
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250716062830.3712487-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082014_494709_FEA9AC62 
X-CRM114-Status: UNSURE (   7.67  )
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

On 7/15/25 11:25 PM, peter.wang@mediatek.com wrote:
> This patch updates the return type to bool for consistency
> with the previous style.

What previous style?

Please follow the style that is used elsewhere in the Linux kernel and
do *not* introduce any unnecessary explicit conversions to bool.

Bart.

