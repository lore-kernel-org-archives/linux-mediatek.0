Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C78C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 04:15:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86CB239EB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 04:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A86CB239EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nf2N2ak3CwE3L1Xbx+koYR5JlPuHQSWqbH4WGzEAT34=; b=ao9GoeKhWe9785K98LU7j20FQ
	SuLHjcNTyRzfXl/tF2fPsoWDx/AZgiOPBD3G5tsdApLRlBLVG+0LIyziMtQhUuh9jyQjDFegqBF/+
	a3/aEa2nvtpvF8Pm+Rk0cRO/dpejFjlPi98F/mv1YsLQ/h4XmGDJWdWAoQ8jDQZEQ4yL1ea0YbcWw
	PL8OlD/wXUcz9SQpKuEEGqp4wfdmRZG9zvFeqT2pd+YkgrTFlZa3a/OE2YA3ZXIe9ZkrQdY/FzOHs
	9JLCRk4T2TnzYJyGhzk9Ghw2EDR6BMVwpYwLc5au85JxVX9aikSHyfca8iPUVnKSyC8osJ5r4mnJK
	YzXSVH/+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmUPE-0008QB-QC; Tue, 08 Dec 2020 04:15:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmUPA-0008PZ-1h
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 04:15:13 +0000
X-UUID: b04e0f17d1fb4ba9a8dcdd4e8d2576ed-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SQbAfHtOLLKSe7iUTymu6Ec7aPGYJE1hWO211GToPfM=; 
 b=kRJX/vvzE+9P9brPBuZlU+p3NZZ2UM+sRTCvTQInVw3qYWrNQJjBmaRFE0sK9l3pEXAI9eENdURgZTLwOjGXBPgWIVmqypgBrTiLx5iweQZGMWUMnfhDvVebLkc/Fxf+DbPVakbNNOtNSoizd6ZK/YBCR4bDdAn2hYY094xKzzA=;
X-UUID: b04e0f17d1fb4ba9a8dcdd4e8d2576ed-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1499547853; Mon, 07 Dec 2020 20:15:03 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 20:15:00 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 12:14:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 12:14:57 +0800
Message-ID: <1607400896.23328.7.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: mtu3: fix memory corruption in
 mtu3_debugfs_regset()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 8 Dec 2020 12:14:56 +0800
In-Reply-To: <X8ikqc4Mo2/0G72j@mwanda>
References: <X8ikqc4Mo2/0G72j@mwanda>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 125EA1465074F59FE9EFB536D80038FE4E5F9648639B8DC7B9CA890AC9C2536B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_231512_859229_A5BE0653 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 11:41 +0300, Dan Carpenter wrote:
> This code is using the wrong sizeof() so it does not allocate enough
> memory.  It allocates 32 bytes but 72 are required.  That will lead to
> memory corruption.
> 
> Fixes: ae07809255d3 ("usb: mtu3: add debugfs interface files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
> index fdeade6254ae..7537bfd651af 100644
> --- a/drivers/usb/mtu3/mtu3_debugfs.c
> +++ b/drivers/usb/mtu3/mtu3_debugfs.c
> @@ -127,7 +127,7 @@ static void mtu3_debugfs_regset(struct mtu3 *mtu, void __iomem *base,
>  	struct debugfs_regset32 *regset;
>  	struct mtu3_regset *mregs;
>  
> -	mregs = devm_kzalloc(mtu->dev, sizeof(*regset), GFP_KERNEL);
> +	mregs = devm_kzalloc(mtu->dev, sizeof(*mregs), GFP_KERNEL);
>  	if (!mregs)
>  		return;
>  Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
