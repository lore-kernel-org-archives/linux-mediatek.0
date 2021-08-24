Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F273BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAFB600D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDAFB600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oynOc3bXv3bWzBfVDaLDpuhFKjIcD19hiqKMguR7w4=; b=Huc/FvnLH1VF2k
	j1YihuCtzdCmCfWRo5xuF8PhOglwEu51miK8fBSCq6fmtWLHsTnqSmPyE7gbh0zK3fVCTC0oUdLcD
	P/z2NWlbRD0hKRoW7GLmnLlXHtBU31hy1HF0OqYqpJgfGlPSe+h1kJLjh1cdrI9t25IAdMO3Wi48b
	gZGUALRwP99ydN4ikUhj76jOTeejGEduXyAIR/PwRjfLHT+IQfn2YfgwyA4fW8HZUCtUKWK9gLBHC
	Mdt4K5ywfMSDmqfPr8SP1cSOl3nAnCCFaDfqZnEN9I6mWmYq9PEOym6rns7vS5Ezzj4UJ1Hdz26Uc
	OKtVMJUotvke4jryDoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYod-003p3x-RM; Tue, 24 Aug 2021 15:58:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYoQ-003p1E-Sd; Tue, 24 Aug 2021 15:58:08 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i28so46588413lfl.2;
 Tue, 24 Aug 2021 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pebXoQmUWBzlSnu9s+ZDsnyoaDKmmttwsIKNnt3weIE=;
 b=Q9jhvSUqhX4lkX2eoeELlFAvl6kH+1JR7rYZ70PDorFWAptKs27wemZX6u7svTpdNi
 CQZNEsfniIV6d6WzPb8J7yhbOdzMtA5DOYaA5EKxM1vJhU8ZsxUmndRdY+EzVlKU+W8w
 Rm9Lbcsw3p1hnRA996p40sb5DwjklycrpqSZ/b+oVZ0KHu3GYiUBBRFs5mK+Gcg0B8g0
 9JaskRUdVbEFtWMRx2qwC8zni6l0aLf8bq8hynPFCSg9xduGOuSe5DWyLiR4DIkf3ECP
 1VDS3ZeN449pq3V8mdMrBV2QsqSrBloBUL2lZQlmqzPi7XtP1aCEQTe+EGu6mBW507dU
 Rs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pebXoQmUWBzlSnu9s+ZDsnyoaDKmmttwsIKNnt3weIE=;
 b=WgLi2zrLLtkJ786tlgJLc8z2kGZV8iL2HCVu3mVVj3EpHrG3H2avLjU5qBNPtlnR7D
 0/ZqVyLGAVzVpAaNbkGv6LQutWiUkgpsc62Rp1+OtmCIqyo6PAND35XOHc1sqhiFUU+p
 B9zQO3O0rJezdj3qaOxfbVaBkgJwfmoNAGu6oywic1txUwEuHVIdXuaxB/zWTc41XcO8
 YOUgkKjltldfhFL6mpy7Chv+hu+6FH+UbnnVMkx7ArhieYzLQ+fTLLLTHMbWhoG/L12F
 Da00s1Y9LkaIX7ubmO8O/Fbdf/bBiJT4nJTstdqnLcUT3t9bmI4vcJVemwno7BVpQk3E
 77ng==
X-Gm-Message-State: AOAM532PeAStY/yEvehnM4IFxjeONDvugSHtCJ2K4VvIPaEQkU8UpiQg
 zDTjcNgfzR1gzG9B0ZxAz/WetfIic0n9c369whQ=
X-Google-Smtp-Source: ABdhPJweeFB0/46GdTiQUi5WpATivrTK3DsqcsNXnsmBkdTL+2KZ4sgT2Ov+HDFZhbevcaMt0c1LJEJaFOfF4svpZsM=
X-Received: by 2002:a05:6512:3f8e:: with SMTP id
 x14mr28533152lfa.389.1629820684972; 
 Tue, 24 Aug 2021 08:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210824055509.1316124-1-dqfext@gmail.com>
 <YSUQV3jhfbhbf5Ct@sashalap>
In-Reply-To: <YSUQV3jhfbhbf5Ct@sashalap>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 24 Aug 2021 23:57:53 +0800
Message-ID: <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_085806_967598_DF54D516 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Sasha,

On Tue, Aug 24, 2021 at 11:29 PM Sasha Levin <sashal@kernel.org> wrote:
> What's the reasoning behind:
>
> 1. Backporting this patch?

Standalone ports should have address learning disabled, according to
the documentation:
https://www.kernel.org/doc/html/v5.14-rc7/networking/dsa/dsa.html#bridge-layer
dsa_switch_ops on 5.10 or earlier does not have .port_bridge_flags
function so it has to be done differently.

I've identified an issue related to this.

> 2. A partial backport of this patch?

The other part does not actually fix anything.

>
> --
> Thanks,
> Sasha

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
