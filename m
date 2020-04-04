Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A0CC43331
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 03:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE43A206F6
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 03:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YZC+IuKZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3YeCMAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE43A206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iB1y7zLRRNym90vw64SW5N80dGfle4uIGdw0f7DtAtM=; b=YZC+IuKZYK3WSj
	VFCVhehnzT+3m/7n4exx1FJmqtWgZ4/SfQsrOkd2MJhwpZ7S733ukWTiB8sQqZnKbXNdWHcc5lMah
	DZYlpVH1VFtwIfR1i938X3MMq+PIyouyD0BHGJBfrezOEbuAwyBG676P0HsSJUfYFIz76g0j3ey8P
	4HFySlGRnLTIeBBStp3l/S9QVUP/HnkMigpvE/nJ5GCPe0OUX4JJCXPmrZyq6rp+fNbhgZgVOZBXq
	MfZP3eVbQMSgXmLs3E4Y5jljTl0DjVv1qfZrfcf/NKjB9WtThUiEvuqSuKN00f2QixdKUX/JWllux
	H78YBNUbUx4QoEHdBaQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKZd2-0001Qr-GC; Sat, 04 Apr 2020 03:37:52 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKZcu-0001Jo-Vk; Sat, 04 Apr 2020 03:37:46 +0000
Received: by mail-ot1-x344.google.com with SMTP id 111so9499166oth.13;
 Fri, 03 Apr 2020 20:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4WbluZDhw2UVjup7ga4DOtaPANEI0o4JCWjagoCmgy8=;
 b=W3YeCMAF9MApJBdYEFhU9WsZL11NUkjdvzGUS1f5iLxFQzYg1glMKciGmHzRkrgiig
 XS9a2TvTBLi69fV799tgOqiWowIg0UZWX4LgIy5YzskVoSr5YwPO4ty9hFxyTjexG0vd
 z9AaXdon2RpwUukaf1JCnOl/mbITMlZdWHNiPo06XwCzDy64aeO9uXx83shizIKEYxG4
 4pr5vOtVIK1+y8DXlynJXCcXSrQ++70A60vUXdCYljk/+HfcjP5TxzcmMsmxvrzA3XbN
 QsHelQ9GJ6O53g/Svw1kEHnRYhaZ58f5tJRGuaV9pdREYNiqSyXVq+9nAj8ddc8KbCD8
 UMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4WbluZDhw2UVjup7ga4DOtaPANEI0o4JCWjagoCmgy8=;
 b=LnSVNCgsUGOnIMIc56VNK/ZfoPVIEa4/e8AIj0tqSLhYhpU/4kC2kLQ8tlPFnONMya
 jf7OVCatqKodvKS+gS8t+1t8rIon58YiH9szuoFhv84alQubgoRns9oyWKJAvAKcxnF6
 YIW/XxMh1+2u72MnYqc3oJRsJt+LOdo0CUe6+pbiW9pYfY51xHCNs5Wj+0DUrFfc6Wyn
 EVNs1gaH29q8ZAUuunNL2srJ6d+TXDtGvgWZ/EMIm6dbjcgbCcFYKc7jav9C5RWLkK54
 lo/oPDcLniqZEYrFLGFPtx91rR+qdkW9KIjtwx4q98AdiDEo7cEBC+6QC37mQQbLNoNS
 pshg==
X-Gm-Message-State: AGi0PuaIJpr1Q4BgHXLCUYlIFTPpTMZy/Y404mu1LSFcFElqWkxuTsVI
 Oi93St/ALYU4cYXVdKQ2SwLtgrYxvNPzbmpil2Q=
X-Google-Smtp-Source: APiQypKyHxYIf+5TXgFLUWui2aNL0tjRUUYrTHIDbSYafaUkC7PU2HOOf4l4UI+ukKt8ZQLbURBm/vE4UafQw2ZP9Is=
X-Received: by 2002:a9d:1b6d:: with SMTP id l100mr8477327otl.70.1585971461014; 
 Fri, 03 Apr 2020 20:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200403112830.505720-1-gch981213@gmail.com>
 <20200403.161139.2115986079787627095.davem@davemloft.net>
In-Reply-To: <20200403.161139.2115986079787627095.davem@davemloft.net>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 4 Apr 2020 11:37:29 +0800
Message-ID: <CAJsYDVLGi3xczRqDC-d9q8=jHK=kfYh886erUxULoMNidSX8JA@mail.gmail.com>
Subject: Re: [PATCH] net: dsa: mt7530: fix null pointer dereferencing in port5
 setup
To: David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_203745_073369_78924A03 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On Sat, Apr 4, 2020 at 7:11 AM David Miller <davem@davemloft.net> wrote:
> > Cc: stable@vger.kernel.org
>
> Please do not CC: stable for networking changes, as per:
>
>         Documentation/networking/netdev-FAQ.rstq

Oh! I'm not aware of this doc. Thanks for pointing it out.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
