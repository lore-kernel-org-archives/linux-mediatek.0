Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96D7C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4306A6101E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4306A6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M51KxpdBeOf2cxQsQ1zBnxQNB+QFMg0TLKOkJ05urow=; b=D7YMCRrLdVn4pS
	gZd/1LQB0bQNBcTr7EPQ9HeGdB3zC4R+dhcwz7tCRi7lWTXKW72l2ZzlVlTbpAH2q5AliDHxvStF6
	ubCsIlVs1e6w4UV9O0jjkFslVkykW85xXuLCFw/bShHERslwrwrSB/VOcnyE22v/H3XABirm6oCRB
	Aaoe1N/o+uNGOq3fPz5VkgUStQXzp8MtLKNNl7FzaAj464RlB+cW1Mi9vL0tQNRDlxg83zkSImru6
	XbWkbgh6DAHweeeMw/IxJCepdvJCdvftxw6y4vFgEk8lzQQtkFHR+b6vjlLl5kzEH7zykVMKKaCB9
	GRjSHNvDApPE6TUYMFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4ZC-008lyJ-8v; Thu, 12 Aug 2021 06:51:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4Yz-008lvh-3e; Thu, 12 Aug 2021 06:51:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5125A60EFE;
 Thu, 12 Aug 2021 06:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751096;
 bh=+JN6XMwjpttxBsTsht8aKrjrIm/lywJ7yWkXDLsRnqA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=gDq9oKukKEbWu4mDHhPPopboWr4s0z5Dt70T61olO67EFlTIhHJeKn28sEE/+3W2h
 e6SrnZGbHnM/GANWf79dpb2RCCPqChKO5b9gMflmxRRJfbrLDeZb6y326injJRzSBp
 SXXb+UK8dec2x7Lj6/ZbwW0d3LfVrnjjO+hbrTPHQhB2slPbZ/gDbC7L+I+vRH9FVc
 WpW7Yp/NxKMDSfx3wtPlyIhI9HStbrW3dKkMQ0Z45SObvl6nIyBAHgCzxUtdyAbWVG
 IHt1jpwsOgdDXSU02CAF2oApzkBqm45e5dKxA6FrOM+DtzeKoYqq3waEFGSGPuk7bM
 RG3YJGOj/MkGQ==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
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
Subject: Re: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Date: Thu, 12 Aug 2021 09:51:03 +0300
In-reply-to: <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87mtpnyx3g.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235137_204374_E56301A5 
X-CRM114-Status: GOOD (  13.19  )
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

> usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
> of endpoint descriptor, not include bit[12:11] anymore, so use
> usb_endpoint_maxp_mult() instead.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/cdns3/cdnsp-mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
> index a47948a1623f..ad9aee3f1e39 100644
> --- a/drivers/usb/cdns3/cdnsp-mem.c
> +++ b/drivers/usb/cdns3/cdnsp-mem.c
> @@ -882,7 +882,7 @@ static u32 cdnsp_get_endpoint_max_burst(struct usb_gadget *g,
>  	if (g->speed == USB_SPEED_HIGH &&
>  	    (usb_endpoint_xfer_isoc(pep->endpoint.desc) ||
>  	     usb_endpoint_xfer_int(pep->endpoint.desc)))
> -		return (usb_endpoint_maxp(pep->endpoint.desc) & 0x1800) >> 11;
> +		return usb_endpoint_maxp_mult(pep->endpoint.desc) - 1;

this looks like a bugfix. Do we need to Cc stable here?

In any case:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
