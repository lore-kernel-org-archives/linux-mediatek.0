Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267E3C10F27
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 17:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA85D20828
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 17:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kmb4fceE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VIDlz9gZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA85D20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inerFlEwU1v+nbRluw/EZKtcXBTsJdSfBDgJrnJNNlc=; b=Kmb4fceEmp0/bE
	Rv/mLQCnWZMFS7u/syiYbNtovGiBmddFA7Fmg3TsOPcAxJj4WWBTkfyNyj8F93i1HMpT4tUxXRzqY
	SHLRmKTyfILvj6MmG38U+yG61/OkWLR0swQ4uX3/0T4XpNYQ+xlzwDhlUjPLWoBXZpKrwbD5XtoYk
	pdULAhxqc6xveq0xCUKYfrh2S415x3yxpVjvCnhKZ7k6/tDaKYBGMXNSLQR+2QRJUnQee/az51bSv
	X+J8NxjQhwjnPyRJzMjCjgzlyA7rC5vrGw569qNBoFLdoD0YX/uRMJR4n0ROp2s2xQOcEra4RgE39
	6zE5H/JCtui1rPK/LSKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBM4u-00058Q-RK; Mon, 09 Mar 2020 17:20:32 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBM4r-000579-Rl; Mon, 09 Mar 2020 17:20:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 029HKJhW081517;
 Mon, 9 Mar 2020 12:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583774419;
 bh=9tqG8lsZxDbDWkjZmACtivY21dcKdEeq8w0vOUqH4wM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VIDlz9gZSFX3vc5gnrDWmH9BzHO1hAaTY7kP7VJhbF0/J6Ei/Hg68fdhKNih8KbF2
 t6pZCiBmY+w9oLRjvEbPESi9UJHewOPo4bddYsBhyo/yDskkNi2wMjF+PnrwaMhCVS
 vv/Kx6Gb4pVV0CT3LCvFcnQpRJ7l2+dr/fON115g=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 029HKJGN068509;
 Mon, 9 Mar 2020 12:20:19 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Mar
 2020 12:20:19 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Mar 2020 12:20:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 029HKJUl079705;
 Mon, 9 Mar 2020 12:20:19 -0500
Date: Mon, 9 Mar 2020 12:26:07 -0500
From: Bin Liu <b-liu@ti.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] usb: musb: tusb6010: fix a possible missing data type
 replacement
Message-ID: <20200309172607.GA3839@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Min.Guo@mediatek.com, Chunfeng.Yun@mediatek.com,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1579603670-10970-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579603670-10970-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_102029_989622_90F26C92 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Min.Guo@mediatek.com, Chunfeng.Yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 06:47:50PM +0800, Macpaul Lin wrote:
> Replace "unsigned" to "u32" for checkpatch fix to tusb_writeb().
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Queued for v5.7. Thanks.
-Bin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
