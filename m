Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6B2CA1013
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3d9LgivSXMoLNKcbETWiE+fGRhYxj5rbwvQIJLHYVA=; b=UG9NCZ4eKVyZvtH4dQwtUui6Pf
	6fDQXbwkxNM96YvJZIcCmKZEKP6uZ9Vo4WsiKNuxPkWVhQmnhMMgCLg/oRwtr80f37J52VlzobrAc
	lH4fnZCK2w0OamkmTx1amPjU249Q7NJbP55w9hF7GYLHg7clZ2e/OWrlw20ApIki2AWeOP/RFIAay
	EQTox3a6XvTn1i/Cldo0IPpRj0MOrPyD5GyMu6mESsx8FxW/2fOEF9RCMG1VOIhSrLZFkUEQAcHqU
	jiDM1NuL7VnBR8hTDdzYidVFIykI/d+dcBXNRy6yekQMKRRMOweyKYfN/pt+MpYOdCUjRVMIylcRN
	PCGdkrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKK9-00000000zYN-1CPA;
	Thu, 18 Sep 2025 19:29:45 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKK6-00000000zY2-2jTY
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 19:29:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cSQgn54qGzm0yVF;
	Thu, 18 Sep 2025 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758223778; x=1760815779; bh=j3d9LgivSXMoLNKcbETWiE+f
	GRhYxj5rbwvQIJLHYVA=; b=B5xP7BHh3TR1JY17//FlGJwBErXzcNqHgVCamrif
	MHIkGFLftk5XeHQENrxpm1wVXfelyqAjfSJcUtbjjKhxaI7YX5UCoS6gkNqckPrA
	Ell08reLHgs0MVM8qI5nW+z6Xq0xgZIJ+H7n8l47HBGfiM8M4gLetYbgM3Q9Zn5p
	2yKyYBTunO3e0xAvVnHmlh3I/wDqUFHdtv4MaosEj0Js8lRG5kHRGM8EEVRWSib5
	pYNE0BEGlZQOBY5n2Me9FDC2OJytIF+715+yfBHfT5B3k0Vz9iaxUxXftEC3ja+D
	1skhGdh/VcCigGua+89u/n9us+KuFgHiD1NajFkvyuXFRQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ssvqe8TAYQZm; Thu, 18 Sep 2025 19:29:38 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cSQgW0XCbzm0yTF;
	Thu, 18 Sep 2025 19:29:25 +0000 (UTC)
Message-ID: <c1b426cc-f45b-41dc-b4e1-145c1af5b138@acm.org>
Date: Thu, 18 Sep 2025 12:29:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] ufs: host: mediatek: Remove duplicate function
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-9-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-9-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_122942_767171_DC4C62DC 
X-CRM114-Status: UNSURE (   5.98  )
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

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> Remove the duplicate ufs_mtk_us_to_ahit function in the UFS
> Mediatek driver and export the existing ufshcd_us_to_ahit
> function for shared use. This change reduces redundancy
> and maintains consistency across the codebase.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

