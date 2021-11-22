Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMqtRbBH3zymUmu8i0jW99Xe2QK0D6l+HFMA1CCiGcQ=; b=U2FlfYcHT0/5Yu
	M6w2cbIr3Vep9nPgvO24j1t3hKtqDuWw3qKNDpl8I0CbaT3tqtP/MVdPy3RD2FQRRZV38szXvlthI
	GFGnC+amTC4a7XJOwulI/ln1j4DYqYQ348YgVIq9zTNGomy1bQRq84rTPOjk+wzi8Jg+EvHmu9fB1
	NJ6i+yl15CFw4ms5VkK4ZVsf9tF2WOXW96tT8ubqQYhaJ/hxLeo3NBGJVy6yi5gYBsPBhWw7XsH9l
	kX0ClDcA6wkr31u/OLH5Nuy6J7VQtfw4tmq/H5gSLykWooj5MO2GjsfNqqy+Rppv2BmCPe7gBvOpp
	F/QHOwqHpmdXSyVTNlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpDzf-00HKq0-05; Mon, 22 Nov 2021 18:24:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpDzc-00HKpR-59
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 18:24:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637605478; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=m2SdxG/+az9tYnj/M/SjhTOZNFf+Ny8hlBjj9zLOrNI=;
 b=fo1j0xlx/zpgxAFPDaN/mN975aYcH4VaSyBB+p7kr0I6D2BugJI/tU/yVm+YvyEtMdIhUWsP
 EbrUn94V1+CPDqaTxny0CHUtWkWv3UN49pGEYrL81i02gRHQF8YqP++ql4X1DglOPNtjnShx
 kTgZT49lVddzo/ibbqduQTbBTnI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619be0666bacc185a5981742 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 18:24:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F6C1C4360D; Mon, 22 Nov 2021 18:24:37 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BD67C4338F;
 Mon, 22 Nov 2021 18:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7BD67C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: fix timestamp check in tx_status
References: <7e3784949c0b29a00465966b89fdb0192bd0298e.1637593492.git.deren.wu@mediatek.com>
 <5acfea49-675b-c825-4bb4-29108d6095eb@nbd.name>
Date: Mon, 22 Nov 2021 20:24:29 +0200
In-Reply-To: <5acfea49-675b-c825-4bb4-29108d6095eb@nbd.name> (Felix Fietkau's
 message of "Mon, 22 Nov 2021 17:00:47 +0100")
Message-ID: <87wnl06obm.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_102440_299533_61179A2B 
X-CRM114-Status: UNSURE (   9.61  )
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

Felix Fietkau <nbd@nbd.name> writes:

> On 2021-11-22 16:10, Deren Wu wrote:
>> From: Deren Wu <deren.wu@mediatek.com>
>>
>> Should keep SKBs only if timeout timestamp is still after jiffies.
>> Otherwise, report tx status and drop it direclty.
>>
>> Fixes: bd1e3e7b693c ("mt76: introduce packet_id idr")
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>
> Acked-by: Felix Fietkau <nbd@nbd.name>
>
> Kalle, please queue this for 5.16

Ok, assigned the patch to me on patchwork.

(A feature request for patchwork devs: assign patches based on email
commands)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
