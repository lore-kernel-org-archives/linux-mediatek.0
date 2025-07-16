Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73266C83F1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iQt/zB03J2a7Go2W2ieiuX/6pPinyjnvVUDponP+uI=; b=Au1vljV5ehhn/f6SFYoO+7GEqQ
	C6GUvfuuf0CAsP/Dere+8fj6NARniJt7UCVeTVL7nRh4hZhqpbJ2Gxj9AKPIODD1Cv7k+70BWJmik
	6/aPQ7bbhcg1l1xKMIVZLZu+xmr9vNtNdtEjcn1XrZujf67Oi/BzAafaw6jgXnb4B31nTh+s0H+ZD
	RTLsGU3lGaT6q3I0Utnk3xJ5f93aKWiP5P8xLtkY9tNtaML63mQcdjN7qizV3s/iWTV0VPuybRKO+
	XjyxU3HP2WvJpaC2pT70vU6U2ANK+wGP+UhBCeIsnRpkCLb3sM5JPElrCN0UNJ8uBnuqDohS8Iq9H
	da9JS49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc446-000000083z4-1UeT;
	Wed, 16 Jul 2025 15:29:02 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc429-000000083bn-15Wx
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 15:27:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bj0KJ4DKGzm174B;
	Wed, 16 Jul 2025 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752679617; x=1755271618; bh=3iQt/zB03J2a7Go2W2ieiuX/
	6pPinyjnvVUDponP+uI=; b=TcTmTiR7FoDphKmR+qsR/BK/eXyX85qLnFVp2W/o
	NJsYZR+mS1iqYKaFS6PX8+L+XyKbePcn9ZXYKSIDHJR7VoTVTLkRFyAvRmPYV5K5
	n1N/TKamsven7M7nI33WR1rPkiXLYY0jT5gnIPz8iIHAZjy7+cfQ9HqHr6ZFnD/P
	K18NiDlUEkVe7nzEAY4CrfmxI7yMMgpWoZChCVqT+OxePdNqor+2pO3dtJlBZ59u
	MIkAu9bwv4m76oH/7+T5L5kqKUX4YxzI4pl4jYLetG23E0b6TtiM024nh6gLYg7n
	nYVp4z97aBygRyMo7LvinciG7wlLayiyAljlaWdziDwVng==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id N-ctaWuHE1r5; Wed, 16 Jul 2025 15:26:57 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bj0K040WFzm174g;
	Wed, 16 Jul 2025 15:26:43 +0000 (UTC)
Message-ID: <da89b12d-84e2-445e-9f60-936b41418713@acm.org>
Date: Wed, 16 Jul 2025 08:26:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/10] ufs: host: mediatek: Add memory barrier for
 ref-clk control
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-4-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250716062830.3712487-4-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082701_383041_E8991B5F 
X-CRM114-Status: UNSURE (   6.74  )
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
> +	/*
> +	 * Make sure that ref-clk on/off control register
> +	 * is writed done before read it.
> +	 */
> +	mb();

A memory barrier doesn't guarantee that an MMIO write has been
completed. A memory barrier enforces ordering of MMIO writes but does
not guarantee completion of MMIO writes. What you need is an MMIO read.
See e.g. commit 4bf3855497b6 ("scsi: ufs: core: Perform read back after 
disabling UIC_COMMAND_COMPL").

Bart.

