Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137C1C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 07:37:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA12461185
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 07:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA12461185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VtCzoWyUo5UAZyCczD9i0PwxGF/cuveRJUvzRvL7L4o=; b=De126301u0a0r0tagCIVkbnj/
	4ZXbCLLD9Es4VI4JGfVhxvuSym5ubqWyZqD622iZ0Iza13IQO6ShcZ+ljY1wVQo3lRq05pLY0Sekn
	o8K/GDwWGfz1bNpJKRxGshHk/MuM7sVh8XUR80IelOwMavuKzNExGAZO4Ej9USxTuzEQZlhxs+U6I
	t6lFdP6Wz8UybFtjNuD0toVSfwUHhX5kIhRUe96/FUyPE+c0TNf/DZLmBsESMN4o3scBbJsWXR7dL
	7RN15w/mstB6Jnof9POOtc0dVblWmyX6nOGBBckA2MCEudcbECHQIACxaeHuY/RYkz/BKP5qjYXLG
	QHP/WmAxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYZk-003Vaz-Ht; Thu, 06 May 2021 07:37:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYZV-003VXp-Ib; Thu, 06 May 2021 07:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kwurnpUfxFvLUEjc/qTrwjzWN9ujn5IDTO4bXh+oqEk=; b=amBYVGf87eU1inozH8cRA3R6fY
 8bmeSpP5LIAN5tmPMeyomY+/QUP8uWJfO7NCsK5cieRWvPDtYb7SlVVK30QGR7K9G14DivcIiOJdC
 J3rDrxDw+LQDri2NpWd1B1XyCigto6W2tu/V/bczEq46Qmk1nja/Wh2LBnOSq5JtPORRlJZYjxSl8
 4lS+2JxLIIFRWryd3J+GrvJMWspFFomnN2rT6GVfPpvG0x/JrWKYMcOzEm7UwkhhdEsRHPT1/vqt0
 /KusYYPWDBaxYCo820no8czAkrBEsRGBk+5gqvfwPugVl29tnIG0ufRpTYuI7HxKDvbTqNNwl9LQb
 2EuyXHyQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYZT-005fjM-4w; Thu, 06 May 2021 07:37:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B981611CB;
 Thu,  6 May 2021 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620286637;
 bh=iXe3DLUvgiP5Cycf6dDSuZIym/h/K9iMDajCibIIC1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqYakRsyddaITLilOvv5y0/bv03pi4+7eoLXGgnKAPgFbtwYGecSdJgXFUwI1RFpS
 4qdBvj+jbXeQe9ihX1Pt15i6iEy94ML7knOu59h2WzqtcVinvtZ/72LEraJmO15s5x
 u/Zn54eu9N/CZMPgN7tz7p7TP1RtYPiIdKXmEc3M=
Date: Thu, 6 May 2021 09:37:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-mtk: use bitfield instead of bool
Message-ID: <YJOcq+Pq5omZz3p1@kroah.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_003719_250522_5C3B87DC 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, May 06, 2021 at 02:31:14PM +0800, Chunfeng Yun wrote:
> Use bitfield instead of bool in struct
> 
> Refer to coding-style.rst 17) Using bool:
> "If a structure has many true/false values, consider consolidating
> them into a bitfield with 1 bit members, or using an appropriate
> fixed width type, such as u8."
> 
> Due to @has_ippc's default vaule is 0, no need set it again if fail
> to get ippc base address

Please split this change out into a separate patch, as it has nothing to
do with the "change to bitfield" change.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
