Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E291C48BCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3C76136D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF3C76136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lQdyXLU21zt50iTSQrlPDFljYrEwdI4Osk4C/FXKJE=; b=eMB15pyEI2AEq+
	/U6dldn192J+kBR5dFD6zf1H+n4JLcHBSWfI9Lr9offpHHyyddlCTLtHmLiQUOz2jraQ2WqL1aIwu
	aAxBOr2Z2Hq4FqT45/r5FcsYZl72STBm54uAAJPIYn0rI7ar/mI/jFrdf51AMzGeqEtKGkNPcQmEa
	K4FqZlveeNepdReEs3YVi9deGUqyWuY5UPKlAdQCiYBpjDvlhn1CG/mwiKtAIYTLAjQf6olB4NUfC
	mvGx1O4rBJqcm3d9sTkbAQ4Qc/XBi6U2+dT5cueWnmFbRvftBUaW9AoTpJe0rypbG4GxNu3UUb8ln
	GgZ81Mms4+TegidaZRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrBQy-00GeOf-02; Thu, 10 Jun 2021 03:32:44 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrBQs-00GeNz-2k
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 03:32:39 +0000
Received: by mail-pg1-f171.google.com with SMTP id y11so13296739pgp.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 20:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oIVo7Xzbw9TVkKcvpifrqSvzyU32kz1bTpH+C80Wns=;
 b=S6u4QNuWHqphKFRnJIadQXQdMQsCC7NxnhI9qTnr6ftqvS7l4znkBCbGb2pMZJiMIR
 rQaw+QzRZnzNuzyZjx6/9d47myK85kBWR1swpwXRCheQQ0Y13A6Ynh4zIYub4GWLGUpe
 2QTve5fmuvSwsQR2MdT86gN7Rg6pbFM8m6KMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oIVo7Xzbw9TVkKcvpifrqSvzyU32kz1bTpH+C80Wns=;
 b=PfB8xaHzkTBwFg3y95ekNP1XK54QVRDTPGKzRgf1I5QNI+pqPR20bb6QKmJ6obyl2V
 SduMuc2Icta2X3Ev4KN5PMBBQMA8UE1UCLCDVeEa/CvDIFdXA1NdfEti22jzOueoB+Y7
 b7xenG7e0TL1HXpR268EL73A7JriynofX5RxxF9iQfVSObP8R6JNMgKX/Y0fb9dFEYj1
 Ael1NGRWk1E+ijPrf0q0axdyMnRYb5V3eL5+BBaBi4yTYk/LJS2+Mn0TyromOQKAfZKU
 y1icZoQMsaQjDRjaqDtfHQcRxRS3PkkpEUz9vEv7s2w72dSLa7cSUMPRK85jEU4EOARW
 PuXw==
X-Gm-Message-State: AOAM531tJM7WXwtXg3fixLdKpT/5flHT6IcNirDNDpnqKfxhWiZqhw7j
 5VCIdMgye8vYI/1WI1jyOefzprmOKH3kRa63I064jQ==
X-Google-Smtp-Source: ABdhPJxFOr3K6ngAtBXDCOFBaf1TZc1JxsWX46LnWiU7oVYxdsIbn1LDXznYMFDG2KjGXlDY+RA8/uwdzZBwoByfIRk=
X-Received: by 2002:a63:234f:: with SMTP id u15mr2906536pgm.257.1623295897282; 
 Wed, 09 Jun 2021 20:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 10 Jun 2021 11:31:25 +0800
Message-ID: <CAATdQgD+e6FSFfOvmuib14f1-O6w6znH5agf3gP774Qd6udCUw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] usb: xhci-mtk: use bitfield instead of bool
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_203238_151829_EF6572EA 
X-CRM114-Status: GOOD (  17.03  )
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

On Fri, May 7, 2021 at 10:11 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use bitfield instead of bool in struct
>
> Refer to coding-style.rst 17) Using bool:
> "If a structure has many true/false values, consider consolidating
> them into a bitfield with 1 bit members, or using an appropriate
> fixed width type, such as u8."
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v3: split @has_ippc out into anather patch suggested by Greg
> v2: add more changelog suggested by Greg
> ---
>  drivers/usb/host/xhci-mtk.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index cd3a37bb73e6..94a59b3d178f 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -138,17 +138,17 @@ struct xhci_hcd_mtk {
>         struct mu3h_sch_bw_info *sch_array;
>         struct list_head bw_ep_chk_list;
>         struct mu3c_ippc_regs __iomem *ippc_regs;
> -       bool has_ippc;
>         int num_u2_ports;
>         int num_u3_ports;
>         int u3p_dis_msk;
>         struct regulator *vusb33;
>         struct regulator *vbus;
>         struct clk_bulk_data clks[BULK_CLKS_NUM];
> -       bool lpm_support;
> -       bool u2_lpm_disable;
> +       unsigned int has_ippc:1;
> +       unsigned int lpm_support:1;
> +       unsigned int u2_lpm_disable:1;
>         /* usb remote wakeup */
> -       bool uwk_en;
> +       unsigned int uwk_en:1;
>         struct regmap *uwk;
>         u32 uwk_reg_base;
>         u32 uwk_vers;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
