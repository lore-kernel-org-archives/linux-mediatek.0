Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07997C83F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eG1oOzHeD3fFsn5cFG9+ESqYlg1L9/SHLD15icCCqVU=; b=yu0mlRNrCYqvqSVexa2q7kW1+m
	oFWx7asXpQSZ9jpFbcV3VEz6h2bcbtg+9jjvA7e3aMejQxtNmrbENAlL2ULVmn7G7J8P47jHYOOSD
	clqXtU4GYWiZGmVjN+lwE7nvXMwcHqyaugQ2QzUXgKL8MgMOB/RCLkQF3+gGitvpTtS/lWV3+k80I
	AKX+32kLOYVzX+oOy50v5ui4hWgv7L7sDz6zeXMfYhX5x3oedQRPWJmXKDd4NnlEQiawa5TJctUMl
	BFieO0jAI2gDhIdwl0QQXAmZjkYLjvHe4JGL1RvHNbbIsBgnb/THGD80prn0XbBhiL0aYf5P1ojsn
	Gxtvtbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc447-0000000840W-3Oay;
	Wed, 16 Jul 2025 15:29:03 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc43E-000000083q9-11q2
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 15:28:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bj0Lb3YWfzm1748;
	Wed, 16 Jul 2025 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752679684; x=1755271685; bh=eG1oOzHeD3fFsn5cFG9+ESqY
	lg1L9/SHLD15icCCqVU=; b=v6+Z5+aF2wIqG+J2gZwnKE9qubx0wWv9fKBKHIsZ
	euaQUsIX7hVMnNPq/7ocmJfGgeYVg8GBRcuFvlS950FCbXqitzdOyM+H1oL17hCA
	cVjvgLGo/8i3Vc7kGc2Rdq3X7n2W+nHaTuNHgaThWH7XTkFVwqplbd1oZ696hzt4
	t8kScwks6GW3/hznNHxHWjyvFOmntH5xiLJV2nVL0Wg+rV53EV157/zS/mqjulHo
	kQX6K3I82Ul8B7OWNfbqT8lPXtR72zUTPYzn/PDkm+y5IoRZHC+mpBtLkBp1kbSG
	fyvAjKzM2H0utmnj8l5EyMb6XEfy98afRl1HtoLAnGAoyw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id W3EtcA2xNsgz; Wed, 16 Jul 2025 15:28:04 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bj0LF4jcczm174n;
	Wed, 16 Jul 2025 15:27:48 +0000 (UTC)
Message-ID: <9de567ee-f908-41a3-bcb7-7f54ebb17f55@acm.org>
Date: Wed, 16 Jul 2025 08:27:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Set IRQ affinity policy for
 MCQ mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-7-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250716062830.3712487-7-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082808_356394_EEBCD267 
X-CRM114-Status: UNSURE (   6.36  )
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
> This patch sets the IRQ affinity for MCQ mode to improve
> performance. Specifically, it migrates the IRQ from CPU0 to
> CPU3 to enhance IRQ handling efficiency.

IRQ affinity can and should be set from userspace.

Bart.

