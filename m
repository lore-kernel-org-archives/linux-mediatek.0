Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A176CCF9E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoIJQ5MhiObxL7pikGsoI1ZJdDV3AuLGWymzLJx4lOo=; b=M8AYBQXOVH5Eo3muCHeb0uCiQM
	5BB4lZ5ROsFKdJkcTLqdTwhjJJRCxy0gk+uMkuVogG7KHoPC9yBAZAySDaGGUwbTsA+7OULQjQfNY
	1dgwqd14NC6wN/xmaK4f7n3tu0+276is1c8WqOdN9xBXzRrOL/OpkkAEsIBd/6vsW7EaMvEKj1xyK
	pWWCByjd53J0xXDos8jI1G/VR/BERqPGHWzqMEmZKa+onH3uISdMRv1EofiLUT0ACP1uhSaVdzFPw
	JeWlPDCIrTzWg53MWUL5pVjv6DjGwUMcMx9YPMN8ms8jMavx8R4NqLNyb1ABO0zlEcOrdTkm5zTEm
	3dqcnL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVD9-0000000675s-1J6Z;
	Wed, 25 Sep 2024 16:49:55 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVD6-0000000675J-1Oz2
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 16:49:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XDN4Z4lRpz6ClY9Q;
	Wed, 25 Sep 2024 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727282984; x=1729874985; bh=aoIJQ5MhiObxL7pikGsoI1ZJ
	dDV3AuLGWymzLJx4lOo=; b=3Bkq9HbX1dTOLg49btZVqXOEt7AQTA0ac89ZsCyp
	7YR1eRoLBc31JQejisIixFL4mWWHs+ec4OCQRu1Si8Ek+1fjlkx8cwqevtSoUbvl
	zzfzJw03HdAlnTyovvbjPMNqFHV0Amfn50IJlnYtIQ99m+aGZHWHSO7oTH1QHLkG
	WVIV7Lo8cQaTX7DuWGtyvNIhttR7RNNOPSHm8mzlnxCnnqlAkFSA9llyA88VcDCy
	aXcRlEEX5ObYb4zohkJNRB+aIhmcA9uFDj1YTwg8j3fbifndCwN8FFl/TcRJV1EI
	nSBm3/ryYFNcbFTciaBiMBXR4Du5LciY1MxNQlvFIkXmfA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gA5KYz7Ednql; Wed, 25 Sep 2024 16:49:44 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XDN4M3CHcz6ClY9N;
	Wed, 25 Sep 2024 16:49:39 +0000 (UTC)
Message-ID: <949fb86d-6b61-4a1a-bc04-c05bb30522b9@acm.org>
Date: Wed, 25 Sep 2024 09:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] ufs: core: fix error handler process for MCQ abort
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com
References: <20240925095546.19492-1-peter.wang@mediatek.com>
 <20240925095546.19492-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240925095546.19492-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_094952_427650_7DC69350 
X-CRM114-Status: UNSURE (   5.16  )
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

On 9/25/24 2:55 AM, peter.wang@mediatek.com wrote:
>   	case OCS_INVALID_COMMAND_STATUS:
>   		result |= DID_REQUEUE << 16;
> +		dev_warn(hba->dev,
> +				"OCS invaild from controller for tag %d\n",
> +				lrbp->task_tag);

Please change "invaild" into "invalid". Once that change has been made,
feel free to add:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

