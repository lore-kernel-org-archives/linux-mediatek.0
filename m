Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FD8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:10:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 444B6206D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x05fzwBQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="DBHCCTpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 444B6206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j/43JUyJAwnNZaTV/fYKKJxyijBwRTnOp8K9gQJO6zg=; b=x05fzwBQGf2y+KW4tsV91lXwt
	F+aA3IkUDKg2KDzLUMTEW/EZFHkH/AehYTzECvxTpqn2UmdYcfBAkUwm35AHB4gIlPxoLA1aQ81po
	fcjgrDHuUtXHlEoxRPnxD8+KoFq7e1KZa6Mzk2BMjqRgcC3ySq6pcfM+Q5I4aD8LuWPpPPzDGvY0B
	4aAx/xJ0NOfYmhu9JIF6zamj9AE6T0IcyGUPOm24d6fSfo2sq+2Gx44jBUzMuiaD3o3v+s4vBJ77b
	lSLEwAUD8eqj2oAnvT/33sD3tg0p0Bc6Cu3uiw9Rzq/KPtw/79jf6HBtxSOkJzvdRN1N5HVFWvIHj
	2KtWMdbPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Sjk-00026F-JM; Mon, 03 Aug 2020 05:10:12 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2SjW-00024b-Th
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 05:10:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596431410; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xH2GNNEeKA5M2HSxLn3DvMsbHNeHZZGIVLaa9prWnN0=;
 b=DBHCCTpZkcWS6+FO1fFvA2/o4UY3Is+e288PaH6PX+X1YdtiIVe4blj+YTLKQPp5Ig1cKdQ+
 nQ0jnijIEMZ7t/i2cG6qR/fVjNxt8KsEDqi9esetR3Lo3xZCawY1gbXBrMJca80bjoYJBHXQ
 LKVbphzw1/rpPBVPG5R9E71Pzds=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f279b9c2dfc1b5cc2467d0d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Aug 2020 05:07:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1750AC433CB; Mon,  3 Aug 2020 05:07:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B7BC433C6;
 Mon,  3 Aug 2020 05:07:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 13:07:39 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
In-Reply-To: <80f5e213-502b-3532-e782-6f26a778274e@acm.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
 <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
 <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
 <80f5e213-502b-3532-e782-6f26a778274e@acm.org>
Message-ID: <7002ce0c5c84409cae6910675f7fe4c0@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_011010_537188_F389F321 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, Avri Altman <Avri.Altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On 2020-08-03 11:12, Bart Van Assche wrote:
> On 2020-07-31 16:17, Can Guo wrote:
>> For scsi_dma_unmap() part, that is true - we should make it serialized 
>> with
>> any other completion paths. I've found it during my fault injection 
>> test, so
>> I've made a patch to fix it, but it only comes in my next error 
>> recovery
>> enhancement patch series. Please check the attachment.
> 
> Hi Can,
> 
> It is not clear to me how that patch serializes scsi_dma_unmap() 
> against
> other completion paths? Doesn't the regular completion path call
> __ufshcd_transfer_req_compl() without holding the host lock?
> 
> Thanks,
> 
> Bart.

FYI, ufshcd_intr() holds the host spin lock the whole time. So, to your
question, the regular completion path from IRQ handler has the host lock 
held.

Thanks,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
