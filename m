Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B6C34022
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 00:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA5320801
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 00:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zx342ASj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aNg9N86M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA5320801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95AV4tmG449l5uN5ApkWGZpm9vF6GnVLAAbFa/gmnwM=; b=Zx342ASjlzeDJk
	V1FPwrYbh03Mq3P3ODoBasSHttxkoa7Vu/GxZNCoOx8NoO+TWpLJ9ZOyu0hKqn2igvTRDH/V37IFF
	nQ2MPgfXCa2cQPCuT2lY+piYWBjmUy0IIZuhhYsFr4ZycyZxIeOQUPxsPoQ/JV03vPGsQPYQwpnoF
	528IaHx9Vusuz4whXtREpwXCcMq6/rxW6YAUr6goj7Nu4+br5WeRvLy589pClee7EQhdaR5BC9QmL
	5ZMDS4ON/yKtDjwBuwHK0leg8YyV4Fvm8HWSdxUFM/wuWQKWOxn13wbOpAJH9gCrVSwjHkjJr0hpR
	YNxQC4iTkmShYkejGi/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3r6B-00056j-IA; Tue, 18 Feb 2020 00:50:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3r62-0004z5-6M; Tue, 18 Feb 2020 00:50:43 +0000
X-UUID: 307131bbc75747df9a2d69654b108153-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aYb7eYVcWGhu/tm1bPl140Be8k4HkWRqF47wgIfyVRY=; 
 b=aNg9N86MZL7lAVcfmKvwzIhCL9FpIAhuQZL871hfpxwRQzBS0IHL+xCzTCghNyxzHP3EBjUiB04yyZmlvvVMri1nZDoxeVHTkkj6zpXBa+aLH64f1zzeibOFEkgX2V9HzQBVVrlpeh68QuUT1Bed6ijkhGxiXOWuJAmDE8ceMDw=;
X-UUID: 307131bbc75747df9a2d69654b108153-20200217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 967725832; Mon, 17 Feb 2020 16:50:37 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 16:50:57 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 08:51:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 08:49:59 +0800
Message-ID: <1581987023.26304.22.camel@mtksdccf07>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Tue, 18 Feb 2020 08:50:23 +0800
In-Reply-To: <87f03ff5-445b-25c2-308d-5c9e18942a0f@acm.org>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <87f03ff5-445b-25c2-308d-5c9e18942a0f@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_165042_241601_45ABF020 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On Mon, 2020-02-17 at 08:17 -0800, Bart Van Assche wrote:
> On 2020-02-17 01:35, Stanley Chu wrote:
> > -			if (skip_ref_clk && !strcmp(clki->name, "ref_clk"))
> > +			ref_clk = !strcmp(clki->name, "ref_clk") ? true : false;
> > +			if (skip_ref_clk && ref_clk)
> 
> Since the " ? true : false" part is superfluous, please leave it out.

Will fix this in next version.

> Thanks,
> 
> Bart.

Thanks,
Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
