Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DD5C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 05:00:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C1565005
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 05:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8C1565005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VpNNOgA/GD9lQ7h3sMhTHyeEFVChxJ0eJ6+t9kUaDro=; b=prMMusEtvB2lzvrzYAOnF9YWK
	H0rLh0nwR5WJe5ciiKOsONqL3qz8LHnPs4YJuaJNMX1bAWLJh08M6CnNj0et31S4cQFO83VqM2zAv
	PGn2PIT36Vc0AM5b6vrzllJg7/LJEgwdKHjt76Avg77KfEJjflNctSSeywtnonTH2bSxTPT5WAC9R
	3ZIKThKuvnzsJiV9Hl6+E7jLZEXvNP1I0gWmmC4uuGwYFY5nxL2Gd87GQtl8Jlp+Jh5ZNsXQnzaPo
	NW6DbxLmx1d7sGUIiWrDo2FXHAoGTvtmd8r3HH9u0yiBU5IGi8TC0ALF0unRCBYttlmn0Whotgf6i
	kzPvOWLFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI2ZJ-00CcEj-JW; Fri, 05 Mar 2021 05:00:05 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI2Z4-00Cc8h-Od; Fri, 05 Mar 2021 04:59:52 +0000
Received: by mail-ot1-x329.google.com with SMTP id b8so640062oti.7;
 Thu, 04 Mar 2021 20:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0Mk72avpHdhSJAjqBV5Yll3WvB1xqe8t3SVT3h8H5k=;
 b=CI9w0x4SKtGImgBFfj3etYWLTG9vsxvaMEKVO9F8GmvkuYUUwkJyLXahEl/PpwnIXX
 4orQ0SHxLHw0+CtH2+vJNdD3np6x0FAywYPKM1jiusFpC546N3cofuwUlLOM9kE84lYo
 Sm01CW3imaRgyg4tN8HZExpfGfII5+itgs396aV88zF7D5dnHC20Kaels8rsA05eIvJL
 ehSUBPHrO9v85hNGXlmVS6rzOpaU90fOcjdNsbiUBDL+SopPnNDkKKPUkD39fAf/ReOv
 Sn3yv17JytDJ0bmDx3osG8r3vL4gCAXNrMD7zra1z4Fz0Ams2upy8kGO/eQ3Tcy4WJxa
 GIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0Mk72avpHdhSJAjqBV5Yll3WvB1xqe8t3SVT3h8H5k=;
 b=BcRtw0IqmTDJtVPGeJSVYL45qwDeRvOcTPjsUA0xsqaJnPS7W3nijg+hG24lZUbT/U
 dGdZzlPKlgz/1/ssvL/wELSBQ+MoS+84rMF2jcUVbyMLYWDjhpS54CxOggtYftrOfCHT
 /zE/0stirw7D+6bShvzKRBM2IKNIFsC3fTY7n6dIPV4VbWezFS1zqdezGvKCdEAGzlVU
 9qBkhJS2b49VB1lah+ZOkdTygkrMU2UbNIK1m7RgQPxNbKvFdF5nagt951No61bBXp/3
 5x6AQ7HwzNZIGaratrvU6oPWw4gF0bBhwz4l4Aw/mysRfSXpVY61lqTWjkesTYMQv8Af
 F5Qg==
X-Gm-Message-State: AOAM531hmE4G5qY1RIjRZ6ilkMwaRAMNh0n14Vp0MUN7Uh4roDmiOKHk
 ngLhiUe9sAi5lzJyXhqpjhOwZ4WcH9b8SYZy/dI=
X-Google-Smtp-Source: ABdhPJw9g001D7R/evptKBtMKwJyyDDxQePDW9srrI1add9OteIESjKLHzaOl6RFJ9mLGuVmNoOrcNNMMRCBhZST/Oc=
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr6552620otr.74.1614920387915;
 Thu, 04 Mar 2021 20:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20210305034931.3237558-1-weiyongjun1@huawei.com>
In-Reply-To: <20210305034931.3237558-1-weiyongjun1@huawei.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 5 Mar 2021 05:59:36 +0100
Message-ID: <CAMhs-H_0wPa+sFSs4hEx+52e3gMYm=xDVjOEnv2A6v6nSs-JUg@mail.gmail.com>
Subject: Re: [PATCH -next] phy: ralink: phy-mt7621-pci: fix return value check
 in mt7621_pci_phy_probe()
To: "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Hulk Robot <hulkci@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_045950_950951_0CB7D757 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, Mar 5, 2021 at 4:40 AM 'Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Fix the return value check which testing the wrong variable
> in mt7621_pci_phy_probe().
>
> Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
