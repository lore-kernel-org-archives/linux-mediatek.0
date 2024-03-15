Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7119EC54E60
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H14rF6WiBeCLtB+EEpKUHBEsk2vsPMjama1QW0UoN6I=; b=StkKLRU8KKLpn9LbZSEzpYaZgu
	sXzaVJjusXVv7Xi1SmuG322U6Pzy5x8n3lPSnOowq3adLA+c/fTdlblMGAxX40fQdENf7UD2qFHd4
	l/OYmWvNLxgNK/yKxCj87RBI+NJ0VjlEhZ3VBgRMz6lPlE3DA71QYAqkobTKFmaAe1JJDEPI6fifA
	jo/pkUFyu4M0JmgIMTK3ZODcOO+Z0wUWtcDCIFvxAO7XtigQ7mzQqCISX+7kzGC4eW/M+27E3Rd//
	tMKgQN04IcrjdvlWmIJdv7gNOVYQQRAnWSHFeotn6y7d4O17HAP0t0PTUnc1mCUwt71R+MQ6hnwy0
	MhPwAFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxO2-0000000GQr2-3iYl;
	Fri, 15 Mar 2024 02:33:34 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxNy-0000000GQpz-2iOQ
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 02:33:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4TwpG008MpzlgVnf;
	Fri, 15 Mar 2024 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1710470003; x=1713062004; bh=H14rF6WiBeCLtB+EEpKUHBEs
	k2vsPMjama1QW0UoN6I=; b=ii6gBBV9wRUL2bJ2GfKziGD9SrDjKuuWbPGRnC61
	UlJfzmjUbLSad9mFsLNRMkmBlbHLaU2umg7MuCViRDa7x8vndZI42lP2RJch51h0
	rbVwkZL7BXI268RGJ2Qtgd8u3YvV7TKHg6Rcx1o6p5pyL6rWgH4/CiVxKK0XzuMQ
	MqWJ/OnyMTmJ3um0v8UFiRB73uxHiF1jqCGp8xcbmjVtleQ1GK0pqgnIUVclOcSJ
	9t6/VzngdJlmoqUbnCoQpUdRgMqlkAc8HBb6psYZhZ1UKoPBueQ3iMU2EywT89IA
	VvW7MX5I4KaFo8lk22P3BGUr1z+oJouQdA+jzG5eXpxNUg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YiomIDwf3-8k; Fri, 15 Mar 2024 02:33:23 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4TwpFp0RRfzlgVnW;
	Fri, 15 Mar 2024 02:33:17 +0000 (UTC)
Message-ID: <e84ddf57-566b-4f1f-9357-07b983ba28e6@acm.org>
Date: Thu, 14 Mar 2024 19:33:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] ufs: host: mediatek: fix vsx/vccqx control logic
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
 <20240308070241.9163-2-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240308070241.9163-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_193330_764600_E140E64B 
X-CRM114-Status: UNSURE (   6.28  )
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
> +static bool ufs_mtk_is_allow_vccqx_lpm(struct ufs_hba *hba)
> +{
> +	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> +
> +	return !!(host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM);
> +}

Please leave out the !!. The compiler does this for you when implicitly 
converting an int into a bool.

Thanks,

Bart.


