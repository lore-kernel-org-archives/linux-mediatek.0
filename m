Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860EEC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33B8B60EFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33B8B60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyyqSZdBkkLbZuF8cqLIDLm8knfdUrlDdNEs63UAC5s=; b=JFmaNBYY+np3e9
	b6hlH5DpV8GrE35iSC7sKnELvw/8wrTXlNB3mczmDhO2BLt92/uWrDWbyBkGaCX8payuG7sEhEpCM
	LHv4YBdjoui2GQw0yTs1GyahbXnWd6zJGmjoBzL2wpDKS3KsggivmImMaDv8U20VMjJIzt1zz1rpY
	ECaOXfHWdZ2/0Lvf8gS8gpZtC05E+QebXhHHpOeKuAEjJguZbZVgP+k4iNKShiyw7LH+DdQtJ5V0d
	gwdH8piDi4WWEq/3Hev7P3wBWdhk5zqw2XwTC9elI4B5XsYp3H677ked/dY7uTgcHfVYlOmTj+z+E
	1z7bDSejQiV8k3djQdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4Y4-008log-8l; Thu, 12 Aug 2021 06:50:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4Xq-008lnK-QK; Thu, 12 Aug 2021 06:50:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C19F461019;
 Thu, 12 Aug 2021 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751026;
 bh=c+4J0FBEXZ/2tJWPz7C9GfE7YiH9bbjcw8SPYAJS6ro=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=GJ0TZ7WtpRHEqU1S1DGcFW6ofointi9Ktt2jnsFJ9MuJk9kmCdalPbTE4K+kGUop5
 TRMDRvP7ty7D4KjrBIteDDIr0Yaq9ei88ekggTyNBe+XCJeom8qz8Y38G6nxGM8iu0
 4r3mOwaUFy0vE6OZG+vCFrOlDA8mbR6zyUxBZ9pGZiIKJJ3uWzwGzTmimU/14q17RY
 7RcirRQ7Nq2hx2WFJTVX9d5o2tpsh88QJhItKHtFqiAmPXmyxw/MxRen3f6Kk32oV/
 W1IePoKNBNSUdIDtg6mU5M+8XQmzj2TZLLUmGTYQcVHQkDlOsbafrMo650ccj2iu/a
 MSgnM/nyzex3g==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-2-git-send-email-chunfeng.yun@mediatek.com>
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
 Eddie Hung <eddie.hung@mediatek.com>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH 2/6] usb: mtu3: fix the wrong HS mult value
Date: Thu, 12 Aug 2021 09:49:36 +0300
In-reply-to: <1628739182-30089-2-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87pmujyx5f.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235026_912464_4EA45DF8 
X-CRM114-Status: UNSURE (   6.28  )
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

> Use usb_endpoint_maxp() and usb_endpoint_maxp_mult() seperately
> to get maxpacket and mult.
> Meanwhile fix the bug that should use @mult but not @burst
> to save mult value.

I really think you should split this into two patches. One which *only*
fixes the bug and another (patch 2) which *only* corrects the use
usb_endpoint_maxp()

-- 
balbi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
