Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F289C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4+ZiaLWMukiLvIwNHs0KkiZi/RboCANzZvIbq9hfKs=; b=M6i9NxXiHOt3U4
	Yf6cyZvVZMmi7wtJJPjOVc2EOAckRHtlmchqFEvDL5K41SM1TTFD8H1yyKfPbvNBlq+HxxaiBtkwn
	T4JOaj5e30W0WSUnNXULngmX3Xgx4AUCozbr1n9bIGn7rpyNnjdGuKo2UslB1+oZwiqsoWNB9tktB
	yRNNtuaUAOkMIvDxAvfO0dl9D05kpl8pCt0QyCorp4+e4sTK3srQ3mBnVIEfdp2LFequEE+jiDu4U
	/I7oanRwiA49JUJewk/EbMylyafDtuotamZlZjTfn6OOPH+iVpJ1aH5yJKCf02JoEvcaARpcnL6YF
	ThEbNusg+9mwh2dSKf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvxa-005Ok3-Cu; Wed, 24 Nov 2021 17:21:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvxX-005Ojg-Hx
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 17:21:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637774486; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=M01Y8I8szJyaaqijlrdkbvc8yPB0X9qG/VJJ6s4t/BI=;
 b=hMHv5FJh3QxgLHFSIUV/P5r/9k4m5VS4OzNTnmkmPdBkByWvxlk4DJgwwkh3JLz5KbGKKpRg
 gSUYiqZCNKYUSM1MIxKdJnORI/5pLivKpOvc9f2xus9Sc9aGsRnoVhsGBjG3Cw6h4Jj8/PUn
 CW9k2SzoC7Whbn5wuRwzroJRbj0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619e74951abc6f02d0b8887a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 17:21:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6B730C43616; Wed, 24 Nov 2021 17:21:25 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34834C4338F;
 Wed, 24 Nov 2021 17:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 34834C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: fix timestamp check in tx_status
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <7e3784949c0b29a00465966b89fdb0192bd0298e.1637593492.git.deren.wu@mediatek.com>
References: <7e3784949c0b29a00465966b89fdb0192bd0298e.1637593492.git.deren.wu@mediatek.com>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 "Eric-SY Chang" <Eric-SY.Chang@mediatek.com>,
 Deren Wu <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
 "Shayne Chen" <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Deren Wu <deren.wu@mediatek.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163777447590.4686.12255886247452017.kvalo@codeaurora.org>
Date: Wed, 24 Nov 2021 17:21:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_092127_709307_3DD95C4C 
X-CRM114-Status: UNSURE (   7.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Deren Wu <Deren.Wu@mediatek.com> wrote:

> From: Deren Wu <deren.wu@mediatek.com>
> 
> Should keep SKBs only if timeout timestamp is still after jiffies.
> Otherwise, report tx status and drop it direclty.
> 
> Fixes: bd1e3e7b693c ("mt76: introduce packet_id idr")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless-drivers.git, thanks.

ebb75b1b43d3 mt76: fix timestamp check in tx_status

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/7e3784949c0b29a00465966b89fdb0192bd0298e.1637593492.git.deren.wu@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
