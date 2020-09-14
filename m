Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E14C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4BF20665
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRK7tIVs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw0rY+eY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4BF20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZPyo5hnZI4x73cXet+rkcsP04lTzK8mc3Fu+3IMrbjA=; b=CRK7tIVsI2vBfysfqnbvVNnf2
	1Z1AeAztDl8fXG8H765cD6whEtieqphMNQJTCSwfMQ5aa09R+lyjGG1a7F2k5Xwf43+oI1KdKb+Pu
	Y2GvH7qefSbE96Xtnx3mrcuUfbevaLeP7HBKRXHCbf7+66QA2mDvbU7WLy86Hg8/agSUL/qglLVNN
	L/7QR7X3pQPqQ41atj3McUo1mDVKMa5I1dBKvqB0/wWG79jpycbDysr+9CkG4G7nZ+n5Ot1EtiPb4
	I4KboxmD6kOV0K8GDSMXKnwGSHVZMOxUbNly3R411QRZpxRpAMg6YsayzGh2MuCNxs8sF2/9xrpPI
	LoP9Y63Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHkk1-0004QJ-Sx; Mon, 14 Sep 2020 09:25:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHkjz-0004Pw-L5
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 09:25:40 +0000
Received: by mail-wr1-x442.google.com with SMTP id k15so17866676wrn.10
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1dIPQoWyftPmIiGZ7bnGzVMHwKLifufczvlCSX3EG1w=;
 b=jw0rY+eY22uu18XCKudon3U6qaDho8rSQASPXbM1kk+uiI/Ym5Vp9eYIxzx8KX+QAT
 SMqS4LqpAm1a+bqfONdmKttchrdKwbUELxMvuObXuxSmNxn3onhYhAfAlUlR+3XNBFGv
 cDkJ2Hb0WwEQaEIfFUHFZMq3TPY8FI4La+beet5Tu51LRrcgVKZOLJf5VN+o8J8fuM6E
 TkXvcCe+SfIzu2VaVVUn+OJDr499M08gFdPwJgKnKcJU7zDtsyM0LvjVlxWo2fgbAiHM
 gx39WMCroNvj3O4xZZ1ShVyqPrw8Ko1HV0ryCiaAJ72XRoBk6jrxH7ZZzMu022Avlsy4
 J38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1dIPQoWyftPmIiGZ7bnGzVMHwKLifufczvlCSX3EG1w=;
 b=NrpagXtKVSD5Lmr9x7gyPr3MHoweSGQlwQ2fiumL6S0S9FVjlue3x5myILAz3i5dTD
 Qr0QnQ6xosISTS91093erebwn+OSCdrRnHxtcchmEqh9fVc3twxeNSWVKdzHjb8fhN7S
 wouYksRQAAp2rMSbQOFyc2AmDhyNU5lNHNyJNOmBEg19H0p+hNKx6VEl7330BUi2lHS0
 xi7IQDTntKhUPVbJwbk/O68BUK7u3cTgUZ0fc88q/pY+RSN+Fup6kVjEEvfgD6pcN+kU
 tkHvdj2lr9MHo0KI2KjI2Icxy6lzRYX/EnFPgkJe0VpqJrpPNEL1MJ3SVJoti3jocDCz
 bxnw==
X-Gm-Message-State: AOAM531iQjh2zfgHhJEKbPwBKdteOFJnvgR0U9M9h8wZC2Ye1llYIsHs
 qtMBzv0gBI+dlGlWj/Bc0GI=
X-Google-Smtp-Source: ABdhPJzp1mmUX8nlci/vOl0gLyKDPoBLlS4rVJjGZY5jj/3T55L4YK892bTlqiJPPr47dPxF7D7ubA==
X-Received: by 2002:adf:f78c:: with SMTP id q12mr15217468wrp.6.1600075538591; 
 Mon, 14 Sep 2020 02:25:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id x24sm19633590wrd.53.2020.09.14.02.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 02:25:38 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
Date: Mon, 14 Sep 2020 11:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_052539_758927_34D94979 
X-CRM114-Status: GOOD (  21.93  )
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
Cc: Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/09/2020 07:31, Lukas Bulwahn wrote:
> Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> support") does not mention that linux-mediatek@lists.infradead.org is
> moderated for non-subscribers, but the other eight entries for
> linux-mediatek@lists.infradead.org do.
> 
> Adjust this entry to be consistent with all others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Maybe rephrase the commit message to something like:
"Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe host 
controller entry, as the list actually is moderated."

Anyway:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Ryder, please ack.
> 
> Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-mediatek is moderated or
> not. I have not subscribed to linux-mediatek and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer, it
> is moderated, and hence, validating the patch.

I can affirm the list is moderated :)

> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e6e36542c62..83c83d7ef2a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13485,7 +13485,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
>   PCIE DRIVER FOR MEDIATEK
>   M:	Ryder Lee <ryder.lee@mediatek.com>
>   L:	linux-pci@vger.kernel.org
> -L:	linux-mediatek@lists.infradead.org
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/pci/mediatek*
>   F:	drivers/pci/controller/*mediatek*
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
