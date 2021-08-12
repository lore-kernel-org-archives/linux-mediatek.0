Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55778C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50206101E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D50206101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCHFuh+fjeuYc4eAU3CHviDVWDd4G56lu2UuW+UYIoU=; b=JN0gH9SiwjP5M+
	lpBnbfSYqh6NocNGQRB6k4o8p5j/OIJwttAFd8r8gyHa34mvEm7FIC8Lqzv2TuGumVXUDRY3Kch/I
	Rbsam1FIuUWcvqmp6hs4cWigRc6EbosGMp2RgFqF/nHBep/g1s1i2D/DDieIqcbTJqSdKNaX4bVgH
	ExMkdEL27cB/2PijJgf1+xzwOoKVGtY/wAtcogx14T8Pvq4B/3/Jq1+ECXbkdktiD5TuGa1sH8iBY
	Y1nUmD0AybQt81itJNQroMY5aO/fZylma2eg9mD528sDwFY8SpQ9OwII+tCNU+F/Xv64N2ypTWEDx
	VnUVZ5tMHrYNwhSRnQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4ay-008mjd-23; Thu, 12 Aug 2021 06:53:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4ab-008mXI-Oa; Thu, 12 Aug 2021 06:53:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C3E16103E;
 Thu, 12 Aug 2021 06:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751197;
 bh=7mu4Ipsd06cm4QBrmrbucxTGVRGJN4PzWTMdE9wwbrU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=U8hfaaReRKr31YD8Y78F+DecLCcZCKu9GSkI//D7NDFOvKxtPeu2YlwqHTZE+j9i4
 SJco5frFsk2UVhbLDzXU/Z7qX+gmd/zfUAAw/i7fb1Lk8dyMjukXj57ZmA0Q5pah7a
 CBD7hUbe5yGaPkj2rigv9WhgwFrTB/i9tt5X+ZfpYPTkFklXFAFymftnGsCcLLyTbQ
 S5DWtpeAc1zObQC9tGdGmaTOCAL/L7xFzp7RfOdFTiZsEopchH+oJHCR8UDqORD01n
 1ctSSeRfyWZVxcdUVX8oQOElJj6VAeKN6tSsOgC0XG7CuaS5z5UJ6x2cl5q3rQoSFo
 Lp8qqOrYp3rZw==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-6-git-send-email-chunfeng.yun@mediatek.com>
User-agent: mu4e 1.6.2; emacs 27.2
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak
 <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang
 <yangyingliang@huawei.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 6/6] usb: gadget: remove unnecessary AND operation when
 get ep maxp
Date: Thu, 12 Aug 2021 09:52:58 +0300
In-reply-to: <1628739182-30089-6-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87eeazyx0o.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235317_867445_85CC85CE 
X-CRM114-Status: UNSURE (   4.63  )
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


Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> usb_endpoint_maxp() already returns actual max packet size, no need
> AND 0x7ff.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
