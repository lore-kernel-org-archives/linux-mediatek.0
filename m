Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0A3C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:17:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ACDD6101E
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ACDD6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xd206ZaqO3RFRT9MdZYKtyU4DudXleK0cek1TM/LDAU=; b=Ez3yHPXPl13YWdz91zXTCP5Tr
	o3tapQzi6DywULwiyX6Y7mTOzH4ySo7rgm8txbd+x9dVEX3onAGBewB62kMI2YPI7tJhlZKrpXdcg
	MGkqBW6/uNN+eZfDzzo7A+7xaKT5ECCzhBnuzRoM4tbUDLW2hEB9DIuLGQRuJ5i+aeGFBgXRjVhpc
	VguYWUX1/nSf9TIp1x6266ZtQucTtXLkoSa/4vEAQhTItbgKOLLV1vM+VE0Bkc6Gf7edfVfEin5d6
	a/qMEK384R4afft/gvFK8O8lQoAayZKzWqPeheGT2HLPtPztgvTbXHuhdP9loNeJ5slGkyJL6jFUP
	i8Em9IwIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQDk-002aJ0-VG; Fri, 16 Apr 2021 15:17:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQDP-002aDI-AZ; Fri, 16 Apr 2021 15:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=49feG/SUpByA8++J1+ZZrgC0W5dH1DM4lfH4vm2M+VE=; b=BiGR7IdpFwN1qKW3qjCLrWxvtn
 4QQcHHAndC4BMcA05wyKsjxM2DTfwGimfpKlBq07MTIwLGAx9RbiaqSrrYM78KTTBUD5a3EAmPrTD
 Yxjr5TubZOk6bcVMug4aPP/YLkZeMkTm3N9ThMos2cs6nIK5zurP7gSMhfUYHaobFEVO3D7uaJ1hY
 4prx3DrsCoPiUAh5fcM/MKM78GNJBmLeQ6cvquPkty8X1NnrQh/Ddrz2esCMXlJL/JP2MecPK/Ngr
 slOtziyjm9IRmEPTAgC8F3tBPXeuknRZzgBD6ScoBVKaLomE77t1cEQSC8+LRfptS317as4OHnBeL
 rQLawgmA==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQDH-009Uo6-4H; Fri, 16 Apr 2021 15:16:59 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 12DF4B5; Fri, 16 Apr 2021 17:16:50 +0200 (CEST)
Date: Fri, 16 Apr 2021 17:16:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, will@kernel.org, yong.wu@mediatek.com,
 kernel@collabora.com, dafna3@gmail.com, enric.balletbo@collabora.com
Subject: Re: [PATCH] iommu/mediatek: always enable the clk on resume
Message-ID: <YHmqXi8JHK5CoNNS@8bytes.org>
References: <20210408122842.29009-1-dafna.hirschfeld@collabora.com>
 <YHhA4u7zat3vtJfD@8bytes.org>
 <3c1f184f-e666-5198-e89e-c3774917c6d4@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c1f184f-e666-5198-e89e-c3774917c6d4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_081655_336825_48930AE7 
X-CRM114-Status: UNSURE (   7.47  )
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

On Fri, Apr 16, 2021 at 03:47:01PM +0200, Dafna Hirschfeld wrote:
> Hi,
> I sent v2, removing the word 'comment' from the 'Fixes' tag
> after a problem report from Stephen Rothwell,
> could you replace v1 with v2?

Replaced it, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
